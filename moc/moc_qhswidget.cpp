/****************************************************************************
** Meta object code from reading C++ file 'qhswidget.h'
**
** Created: Mon 14. Sep 20:12:02 2020
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../qhswidget.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'qhswidget.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_QHSWidget[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      24,   11,   10,   10, 0x05,
      85,   57,   10,   10, 0x05,

       0        // eod
};

static const char qt_meta_stringdata_QHSWidget[] = {
    "QHSWidget\0\0sender,event\0"
    "handleEvent(QHSWidget*,QHSEvent)\0"
    "sender,WidgetItemName,event\0"
    "handleItemEvent(QHSWidget*,QString,QHSItemEvent)\0"
};

const QMetaObject QHSWidget::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_QHSWidget,
      qt_meta_data_QHSWidget, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &QHSWidget::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *QHSWidget::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *QHSWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_QHSWidget))
        return static_cast<void*>(const_cast< QHSWidget*>(this));
    return QObject::qt_metacast(_clname);
}

int QHSWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: handleEvent((*reinterpret_cast< QHSWidget*(*)>(_a[1])),(*reinterpret_cast< QHSEvent(*)>(_a[2]))); break;
        case 1: handleItemEvent((*reinterpret_cast< QHSWidget*(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QHSItemEvent(*)>(_a[3]))); break;
        default: ;
        }
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void QHSWidget::handleEvent(QHSWidget * _t1, QHSEvent _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void QHSWidget::handleItemEvent(QHSWidget * _t1, QString _t2, QHSItemEvent _t3)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)), const_cast<void*>(reinterpret_cast<const void*>(&_t3)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
