/****************************************************************************
** Meta object code from reading C++ file 'utils.h'
**
** Created: Mon 14. Sep 20:12:02 2020
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../utils.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'utils.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Utils[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
       7,    6,    6,    6, 0x05,
      26,    6,    6,    6, 0x05,

 // methods: signature, parameters, type, tag, flags
      42,    6,    6,    6, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_Utils[] = {
    "Utils\0\0restartCountdown()\0muteCountdown()\0"
    "restartDialog()\0"
};

const QMetaObject Utils::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Utils,
      qt_meta_data_Utils, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Utils::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Utils::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Utils::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Utils))
        return static_cast<void*>(const_cast< Utils*>(this));
    return QObject::qt_metacast(_clname);
}

int Utils::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: restartCountdown(); break;
        case 1: muteCountdown(); break;
        case 2: restartDialog(); break;
        default: ;
        }
        _id -= 3;
    }
    return _id;
}

// SIGNAL 0
void Utils::restartCountdown()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void Utils::muteCountdown()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}
QT_END_MOC_NAMESPACE
