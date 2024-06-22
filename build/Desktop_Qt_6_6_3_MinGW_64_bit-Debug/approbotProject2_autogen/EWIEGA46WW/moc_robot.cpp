/****************************************************************************
** Meta object code from reading C++ file 'robot.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.6.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../robot.h"
#include <QtNetwork/QSslPreSharedKeyAuthenticator>
#include <QtNetwork/QSslError>
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'robot.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.6.3. It"
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
struct qt_meta_stringdata_CLASSRobotENDCLASS_t {};
constexpr auto qt_meta_stringdata_CLASSRobotENDCLASS = QtMocHelpers::stringData(
    "Robot",
    "QML.Element",
    "auto",
    "l1Changed",
    "",
    "l2Changed",
    "l3Changed",
    "home",
    "data",
    "khongGianKhop",
    "q1",
    "q2",
    "q3",
    "q4",
    "curAngle",
    "curPosition",
    "khongGianThaoTac",
    "a",
    "b",
    "c",
    "l1",
    "l2",
    "l3"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSRobotENDCLASS_t {
    uint offsetsAndSizes[46];
    char stringdata0[6];
    char stringdata1[12];
    char stringdata2[5];
    char stringdata3[10];
    char stringdata4[1];
    char stringdata5[10];
    char stringdata6[10];
    char stringdata7[5];
    char stringdata8[5];
    char stringdata9[14];
    char stringdata10[3];
    char stringdata11[3];
    char stringdata12[3];
    char stringdata13[3];
    char stringdata14[9];
    char stringdata15[12];
    char stringdata16[17];
    char stringdata17[2];
    char stringdata18[2];
    char stringdata19[2];
    char stringdata20[3];
    char stringdata21[3];
    char stringdata22[3];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSRobotENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSRobotENDCLASS_t qt_meta_stringdata_CLASSRobotENDCLASS = {
    {
        QT_MOC_LITERAL(0, 5),  // "Robot"
        QT_MOC_LITERAL(6, 11),  // "QML.Element"
        QT_MOC_LITERAL(18, 4),  // "auto"
        QT_MOC_LITERAL(23, 9),  // "l1Changed"
        QT_MOC_LITERAL(33, 0),  // ""
        QT_MOC_LITERAL(34, 9),  // "l2Changed"
        QT_MOC_LITERAL(44, 9),  // "l3Changed"
        QT_MOC_LITERAL(54, 4),  // "home"
        QT_MOC_LITERAL(59, 4),  // "data"
        QT_MOC_LITERAL(64, 13),  // "khongGianKhop"
        QT_MOC_LITERAL(78, 2),  // "q1"
        QT_MOC_LITERAL(81, 2),  // "q2"
        QT_MOC_LITERAL(84, 2),  // "q3"
        QT_MOC_LITERAL(87, 2),  // "q4"
        QT_MOC_LITERAL(90, 8),  // "curAngle"
        QT_MOC_LITERAL(99, 11),  // "curPosition"
        QT_MOC_LITERAL(111, 16),  // "khongGianThaoTac"
        QT_MOC_LITERAL(128, 1),  // "a"
        QT_MOC_LITERAL(130, 1),  // "b"
        QT_MOC_LITERAL(132, 1),  // "c"
        QT_MOC_LITERAL(134, 2),  // "l1"
        QT_MOC_LITERAL(137, 2),  // "l2"
        QT_MOC_LITERAL(140, 2)   // "l3"
    },
    "Robot",
    "QML.Element",
    "auto",
    "l1Changed",
    "",
    "l2Changed",
    "l3Changed",
    "home",
    "data",
    "khongGianKhop",
    "q1",
    "q2",
    "q3",
    "q4",
    "curAngle",
    "curPosition",
    "khongGianThaoTac",
    "a",
    "b",
    "c",
    "l1",
    "l2",
    "l3"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSRobotENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       1,   14, // classinfo
       6,   16, // methods
       3,   82, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // classinfo: key, value
       1,    2,

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       3,    0,   52,    4, 0x06,    4 /* Public */,
       5,    0,   53,    4, 0x06,    5 /* Public */,
       6,    0,   54,    4, 0x06,    6 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       7,    1,   55,    4, 0x02,    7 /* Public */,
       9,    6,   58,    4, 0x02,    9 /* Public */,
      16,    5,   71,    4, 0x02,   16 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::QByteArray,    8,
    QMetaType::Void, QMetaType::Float, QMetaType::Float, QMetaType::Float, QMetaType::Float, QMetaType::QObjectStar, QMetaType::QObjectStar,   10,   11,   12,   13,   14,   15,
    QMetaType::Void, QMetaType::Float, QMetaType::Float, QMetaType::Float, QMetaType::QObjectStar, QMetaType::QObjectStar,   17,   18,   19,   14,   15,

 // properties: name, type, flags
      20, QMetaType::Double, 0x00015103, uint(0), 0,
      21, QMetaType::Double, 0x00015103, uint(1), 0,
      22, QMetaType::Double, 0x00015103, uint(2), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject Robot::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSRobotENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSRobotENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_metaTypeArray<
        // property 'l1'
        double,
        // property 'l2'
        double,
        // property 'l3'
        double,
        // Q_OBJECT / Q_GADGET
        Robot,
        // method 'l1Changed'
        void,
        // method 'l2Changed'
        void,
        // method 'l3Changed'
        void,
        // method 'home'
        void,
        const QByteArray &,
        // method 'khongGianKhop'
        void,
        float,
        float,
        float,
        float,
        QObject *,
        QObject *,
        // method 'khongGianThaoTac'
        void,
        float,
        float,
        float,
        QObject *,
        QObject *
    >,
    nullptr
} };

void Robot::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Robot *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->l1Changed(); break;
        case 1: _t->l2Changed(); break;
        case 2: _t->l3Changed(); break;
        case 3: _t->home((*reinterpret_cast< std::add_pointer_t<QByteArray>>(_a[1]))); break;
        case 4: _t->khongGianKhop((*reinterpret_cast< std::add_pointer_t<float>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<float>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<float>>(_a[3])),(*reinterpret_cast< std::add_pointer_t<float>>(_a[4])),(*reinterpret_cast< std::add_pointer_t<QObject*>>(_a[5])),(*reinterpret_cast< std::add_pointer_t<QObject*>>(_a[6]))); break;
        case 5: _t->khongGianThaoTac((*reinterpret_cast< std::add_pointer_t<float>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<float>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<float>>(_a[3])),(*reinterpret_cast< std::add_pointer_t<QObject*>>(_a[4])),(*reinterpret_cast< std::add_pointer_t<QObject*>>(_a[5]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Robot::*)();
            if (_t _q_method = &Robot::l1Changed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Robot::*)();
            if (_t _q_method = &Robot::l2Changed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Robot::*)();
            if (_t _q_method = &Robot::l3Changed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
    } else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Robot *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< double*>(_v) = _t->l1(); break;
        case 1: *reinterpret_cast< double*>(_v) = _t->l2(); break;
        case 2: *reinterpret_cast< double*>(_v) = _t->l3(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Robot *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setL1(*reinterpret_cast< double*>(_v)); break;
        case 1: _t->setL2(*reinterpret_cast< double*>(_v)); break;
        case 2: _t->setL3(*reinterpret_cast< double*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *Robot::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Robot::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSRobotENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Robot::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 6;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}

// SIGNAL 0
void Robot::l1Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Robot::l2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Robot::l3Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}
QT_WARNING_POP
