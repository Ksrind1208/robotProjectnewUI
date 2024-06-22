#include "robot.h"
#include <serialport.h>
#include <QTimer>
Robot::Robot(QObject *parent,double l1,double l2,double l3,SerialPort *serialPort)
    : QObject{parent}
{
    m_l1=l1;
    m_l2=l2;
    m_l3=l3;
    m_serialPort=serialPort;
}
double Robot::l1()
{
    return m_l1;
}

void Robot::setL1(double l1)
{
    if (m_l1 != l1) {
        m_l1 = l1;
        emit l1Changed();
    }else{
        return;
    }
}
double Robot::l2()
{
    return m_l2;
}

void Robot::setL2(double l2)
{
    if (m_l2 != l2) {
        m_l2 = l2;
        emit l2Changed();
    }else{
        return;
    }
}

double Robot::l3()
{
    return m_l3;
}

void Robot::setL3(double l3)
{
    if (m_l3 != l3) {
        m_l3 = l3;
        emit l3Changed();
    }else{
        return;
    }
}
void Robot::home(const QByteArray &data){
    m_serialPort->writeToSerialPort(data);
    qDebug() << "xin chao";

    QTimer::singleShot(2000, this, [this](){

    });
            qDebug() << "da het 2s";
}

void Robot::khongGianKhop(float q1, float q2, float q3, float q4,QObject* curAngle,QObject *curPosition)
{
    curAngle->setProperty("q1",round(q1*100.0)/100.0);
    curAngle->setProperty("q2",round(q2*100.0)/100.0);
    curAngle->setProperty("q3",round(q3*100.0)/100.0);
    curAngle->setProperty("q4",round(q4*100.0)/100.0);
    q2=90-q2;
    q3=-(105+q2-q3);
    float x=(m_l2*cos(q2*3.14/180)+m_l3*cos((q2+q3)*3.14/180))*cos(q1*3.14/180);
    float y=(m_l2*cos(q2*3.14/180)+m_l3*cos((q2+q3)*3.14/180))*sin(q1*3.14/180);
    float z=m_l2*sin(q2*3.14/180)+m_l3*sin((q2+q3)*3.14/180)+6.5;
    curPosition->setProperty("x",round(x*100.0)/100.0);
    curPosition->setProperty("y",round(y*100.0)/100.0);
    curPosition->setProperty("z",round(z*100.0)/100.0);
}

void Robot::khongGianThaoTac(float a, float b, float c, QObject* curAngle, QObject* curPosition)
{
    curPosition->setProperty("x", (round(a * 100.0) / 100.0));
    curPosition->setProperty("y", (round(b * 100.0) / 100.0));
    curPosition->setProperty("z", (round(c * 100.0) / 100.0));
    c=c-6.5;
    float q1 = atan2(b, a);
    float x2 = sqrt(a*a+b*b);
    float r = sqrt(x2 * x2 + c * c);
    float D = (r * r - m_l3 * m_l3 - m_l2 * m_l2) / (2 * m_l3 * m_l2);
    double q3 = -abs(acos(D));
    float q2 = atan(c/ x2) - q3 / 2;
    q1 = q1 * 180 / 3.14;
    q3 = 105 + q2 * 180 / 3.14 + q3 * 180 / 3.14;
    q2 = 90 - q2 * 180 / 3.14;
    curAngle->setProperty("q1", (round(q1*100.0) / 100.0));
    curAngle->setProperty("q2", (round(q2*100.0) / 100.0));
    curAngle->setProperty("q3", (round(q3*100.0) / 100.0));
    curAngle->setProperty("q4", curAngle->property("q4"));
}

// void Robot::writeToSerialPort(const QByteArray &data)
// {
//     serialPort.write(data);
// }
// void Robot::readFromSerialPort()
// {
//     const QByteArray data = serialPort.readAll();
//     qDebug() << "Du lieu doc duoc la" << data;

//     // // Xử lý dữ liệu nhận được ở đây
//     // // Ví dụ: Chuyển đổi thành chuỗi và xử lý
//     // QString dataStr(data);
//     // // Xử lý dữ liệu từ dataStr theo nhu cầu của bạn
//     // qDebug() << "Du lieu sau khi chuyen doi la" << dataStr;
// }
// void Robot::closeSerialPort()
// {
//     if (serialPort.isOpen()) {
//         serialPort.close();
//         qDebug() << "Serial port is closed";
//     }
// }
Robot::~Robot()
{
    qDebug()<<"Doi tuong da huy";
}
