#ifndef ROBOT_H
#define ROBOT_H

#include <QObject>
#include <QString>
#include <QtQml>
#include <QSerialPort>
class Robot : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double l1 READ l1 WRITE setL1 NOTIFY l1Changed)
    Q_PROPERTY(double l2 READ l2 WRITE setL2 NOTIFY l2Changed)
    Q_PROPERTY(double l3 READ l3 WRITE setL3 NOTIFY l3Changed)
    QML_ELEMENT
public:
    explicit Robot(QObject *parent = nullptr,double l1=0,double l2=0,double l3=0);
    double l1();
    void setL1(double l1);

    double l2();
    void setL2(double l2);

    double l3();
    void setL3(double l3);

    Q_INVOKABLE void home();
    Q_INVOKABLE void khongGianKhop(float q1, float q2, float q3, float q4,QObject* curAngle,QObject *curPosition);
    Q_INVOKABLE void khongGianThaoTac(float a, float b, float c, QObject* curAngle, QObject* curPosition);
    // Q_INVOKABLE void writeToSerialPort(const QByteArray &data);
    // Q_INVOKABLE void readFromSerialPort();
    // Q_INVOKABLE void closeSerialPort();
    Q_INVOKABLE ~Robot();
signals:
    void l1Changed();
    void l2Changed();
    void l3Changed();
private:
    double m_l1;
    double m_l2;
    double m_l3;
    // QSerialPort serialPort;
};

#endif // ROBOT_H
