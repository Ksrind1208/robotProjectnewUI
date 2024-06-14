#ifndef POSITION_H
#define POSITION_H

#include <QObject>
#include <QString>
#include <QtQml>
#include <QSerialPort>
class Position : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double x READ x WRITE setX NOTIFY xChanged)
    Q_PROPERTY(double y READ y WRITE setY NOTIFY yChanged)
    Q_PROPERTY(double z READ z WRITE setZ NOTIFY zChanged)
    Q_PROPERTY(double q1 READ q1 WRITE setQ1 NOTIFY q1Changed)
    Q_PROPERTY(double q2 READ q2 WRITE setQ2 NOTIFY q2Changed)
    Q_PROPERTY(double q3 READ q3 WRITE setQ3 NOTIFY q3Changed)
    Q_PROPERTY(double q4 READ q4 WRITE setQ4 NOTIFY q4Changed)
    QML_ELEMENT
public:
    explicit Position(QObject *parent = nullptr);
    double x();
    void setX(double x);

    double y();
    void setY(double y);

    double z();
    void setZ(double z);

    double q1();
    void setQ1(double q1);

    double q2();
    void setQ2(double q2);

    double q3();
    void setQ3(double q3);

    double q4();
    void setQ4(double q4);

signals:
    void xChanged();
    void yChanged();
    void zChanged();
    void q1Changed();
    void q2Changed();
    void q3Changed();
    void q4Changed();
public:
    double m_x;
    double m_y;
    double m_z;
    double m_q1;
    double m_q2;
    double m_q3;
    double m_q4;
};

#endif // POSITION_H
