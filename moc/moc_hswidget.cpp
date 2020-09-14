/****************************************************************************
** Meta object code from reading C++ file 'hswidget.h'
**
** Created: Mon 6. Jan 21:02:09 2014
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../hswidget.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'hswidget.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_HSWidget[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      18,   10,    9,    9, 0x0a,
      77,   51,    9,    9, 0x0a,

 // methods: signature, parameters, type, tag, flags
     126,    9,    9,    9, 0x02,
     143,    9,    9,    9, 0x02,
     159,    9,    9,    9, 0x02,
     185,  174,    9,    9, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_HSWidget[] = {
    "HSWidget\0\0,aEvent\0handleEvent(QHSWidget*,QHSEvent)\0"
    ",aTemplateItemName,aEvent\0"
    "handleItemEvent(QHSWidget*,QString,QHSItemEvent)\0"
    "registerWidget()\0publishWidget()\0"
    "removeWidget()\0icon,nRow1\0"
    "updateWidget(QString,QString)\0"
};

const QMetaObject HSWidget::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_HSWidget,
      qt_meta_data_HSWidget, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &HSWidget::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *HSWidget::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *HSWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_HSWidget))
        return static_cast<void*>(const_cast< HSWidget*>(this));
    return QObject::qt_metacast(_clname);
}

int HSWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: handleEvent((*reinterpret_cast< QHSWidget*(*)>(_a[1])),(*reinterpret_cast< QHSEvent(*)>(_a[2]))); break;
        case 1: handleItemEvent((*reinterpret_cast< QHSWidget*(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QHSItemEvent(*)>(_a[3]))); break;
        case 2: registerWidget(); break;
        case 3: publishWidget(); break;
        case 4: removeWidget(); break;
        case 5: updateWidget((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        default: ;
        }
        _id -= 6;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
