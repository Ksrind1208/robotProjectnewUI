/****************************************************************************
** Meta object code from reading C++ file 'position.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.7.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../position.h"
#include <QtNetwork/QSslPreSharedKeyAuthenticator>
#include <QtNetwork/QSslError>
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'position.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.7.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSPositionENDCLASS_t {};
constexpr auto qt_meta_stringdata_CLASSPositionENDCLASS = QtMocHelpers::stringData(
    "Position",
    "QML.Element",
    "auto",
    "xChanged",
    "",
    "yChanged",
    "zChanged",
    "q1Changed",
    "q2Changed",
    "q3Changed",
    "q4Changed",
    "x",
    "y",
    "z",
    "q1",
    "q2",
    "q3",
    "q4"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSPositionENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       1,   14, // classinfo
       7,   16, // methods
       7,   65, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // classinfo: key, value
       1,    2,

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       3,    0,   58,    4, 0x06,    8 /* Public */,
       5,    0,   59,    4, 0x06,    9 /* Public */,
       6,    0,   60,    4, 0x06,   10 /* Public */,
       7,    0,   61,    4, 0x06,   11 /* Public */,
       8,    0,   62,    4, 0x06,   12 /* Public */,
       9,    0,   63,    4, 0x06,   13 /* Public */,
      10,    0,   64,    4, 0x06,   14 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
      11, QMetaType::Double, 0x00015103, uint(0), 0,
      12, QMetaType::Double, 0x00015103, uint(1), 0,
      13, QMetaType::Double, 0x00015103, uint(2), 0,
      14, QMetaType::Double, 0x00015103, uint(3), 0,
      15, QMetaType::Double, 0x00015103, uint(4), 0,
      16, QMetaType::Double, 0x00015103, uint(5), 0,
      17, QMetaType::Double, 0x00015103, uint(6), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject Position::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSPositionENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSPositionENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_metaTypeArray<
        // property 'x'
        double,
        // property 'y'
        double,
        // property 'z'
        double,
        // property 'q1'
        double,
        // property 'q2'
        double,
        // property 'q3'
        double,
        // property 'q4'
        double,
        // Q_OBJECT / Q_GADGET
        Position,
        // method 'xChanged'
        void,
        // method 'yChanged'
        void,
        // method 'zChanged'
        void,
        // method 'q1Changed'
        void,
        // method 'q2Changed'
        void,
        // method 'q3Changed'
        void,
        // method 'q4Changed'
        void
    >,
    nullptr
} };

void Position::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Position *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->xChanged(); break;
        case 1: _t->yChanged(); break;
        case 2: _t->zChanged(); break;
        case 3: _t->q1Changed(); break;
        case 4: _t->q2Changed(); break;
        case 5: _t->q3Changed(); break;
        case 6: _t->q4Changed(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Position::*)();
            if (_t _q_method = &Position::xChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Position::*)();
            if (_t _q_method = &Position::yChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Position::*)();
            if (_t _q_method = &Position::zChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (Position::*)();
            if (_t _q_method = &Position::q1Changed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (Position::*)();
            if (_t _q_method = &Position::q2Changed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (Position::*)();
            if (_t _q_method = &Position::q3Changed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (Position::*)();
            if (_t _q_method = &Position::q4Changed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 6;
                return;
            }
        }
    } else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Position *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< double*>(_v) = _t->x(); break;
        case 1: *reinterpret_cast< double*>(_v) = _t->y(); break;
        case 2: *reinterpret_cast< double*>(_v) = _t->z(); break;
        case 3: *reinterpret_cast< double*>(_v) = _t->q1(); break;
        case 4: *reinterpret_cast< double*>(_v) = _t->q2(); break;
        case 5: *reinterpret_cast< double*>(_v) = _t->q3(); break;
        case 6: *reinterpret_cast< double*>(_v) = _t->q4(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Position *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setX(*reinterpret_cast< double*>(_v)); break;
        case 1: _t->setY(*reinterpret_cast< double*>(_v)); break;
        case 2: _t->setZ(*reinterpret_cast< double*>(_v)); break;
        case 3: _t->setQ1(*reinterpret_cast< double*>(_v)); break;
        case 4: _t->setQ2(*reinterpret_cast< double*>(_v)); break;
        case 5: _t->setQ3(*reinterpret_cast< double*>(_v)); break;
        case 6: _t->setQ4(*reinterpret_cast< double*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
    (void)_a;
}

const QMetaObject *Position::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Position::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSPositionENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Position::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 7;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    return _id;
}

// SIGNAL 0
void Position::xChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Position::yChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Position::zChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void Position::q1Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void Position::q2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void Position::q3Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void Position::q4Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}
QT_WARNING_POP
