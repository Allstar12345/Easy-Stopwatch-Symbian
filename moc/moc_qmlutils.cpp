/****************************************************************************
** Meta object code from reading C++ file 'qmlutils.h'
**
** Created: Mon 14. Sep 20:12:07 2020
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../qmlutils.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'qmlutils.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_QMLUtils[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      15,   10,    9,    9, 0x02,
      40,    9,    9,    9, 0x02,
      54,    9,    9,    9, 0x02,
      67,    9,    9,    9, 0x02,
      86,    9,    9,    9, 0x02,
     113,   99,    9,    9, 0x02,
     147,    9,  139,    9, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_QMLUtils[] = {
    "QMLUtils\0\0text\0copyToClipboard(QString)\0"
    "minimizeApp()\0blinkLight()\0"
    "blinkLightOneBut()\0restartApp()\0"
    "title,content\0caKnLong(QString,QString)\0"
    "QString\0getFile()\0"
};

const QMetaObject QMLUtils::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_QMLUtils,
      qt_meta_data_QMLUtils, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &QMLUtils::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *QMLUtils::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *QMLUtils::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_QMLUtils))
        return static_cast<void*>(const_cast< QMLUtils*>(this));
    return QObject::qt_metacast(_clname);
}

int QMLUtils::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: copyToClipboard((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: minimizeApp(); break;
        case 2: blinkLight(); break;
        case 3: blinkLightOneBut(); break;
        case 4: restartApp(); break;
        case 5: caKnLong((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 6: { QString _r = getFile();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        default: ;
        }
        _id -= 7;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
