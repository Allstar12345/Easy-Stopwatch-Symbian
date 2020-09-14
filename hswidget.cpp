#include "hswidget.h"
#include <QDebug>
#include <apgtask.h>
#include <eikenv.h>

const QString sw_type = "onerow";
const QString sw_name = "Easy StopWatch";
const QString sw_id = "0x2006c2f0"; //can be any unique string
const QString sw_image ("image");
const QString row1 ("text");
HSWidget::HSWidget(QObject *parent) :
    QObject(parent)
{

    widget = QHSWidget::create(sw_type, sw_name, sw_id, this);
    connect(widget, SIGNAL(handleEvent(QHSWidget*, QHSEvent)), this, SLOT(handleEvent(QHSWidget*, QHSEvent) ));
    connect(widget, SIGNAL(handleItemEvent(QHSWidget*, QString, QHSItemEvent)), this, SLOT(handleItemEvent(QHSWidget*, QString, QHSItemEvent)));
}
void HSWidget::registerWidget()
{
    widget->RegisterWidget();

}
void HSWidget::publishWidget()
{
    try {
        widget->PublishWidget();
    }
    catch (...) {
    }
}
void HSWidget::removeWidget()
{
    widget->RemoveWidget();
}
void HSWidget::handleEvent( QHSWidget* /*aSender*/, QHSEvent aEvent )
{
    switch(aEvent)
                    {
                    case EActivate:
                    case EResume:
                            {
                            publishWidget();
                            }
                            break;
                    default:
                            break;
                    }

}

void HSWidget::handleItemEvent( QHSWidget* /*aSender*/, QString aTemplateItemName,
    QHSItemEvent aEvent)
{
    if(aTemplateItemName.compare(sw_image)==0)
                    {
                    publishWidget();
                    }
            else
                    {
                        this->bringToFront();
                    }
}

void HSWidget::bringToFront()
{
    TApaTask task( CEikonEnv::Static()->WsSession() );
    task.SetWgId(CEikonEnv::Static()->RootWin().Identifier());
    task.BringToForeground();
}
void HSWidget::updateWidget( QString icon, QString nRow1)
{
    widget->SetItem(sw_image, icon);
    widget->SetItem(row1, nRow1);
    publishWidget();
}

