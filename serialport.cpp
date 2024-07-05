#include "serialport.h"
#include <QDebug>
SerialPort::SerialPort(QObject *parent)
    : QObject{parent}
{
    serialPort.setPortName("COM3");
    bool success = serialPort.open(QSerialPort::ReadWrite);
    serialPort.setBaudRate(QSerialPort::Baud9600);
    serialPort.setDataBits(QSerialPort::Data8);
    serialPort.setParity(QSerialPort::NoParity);
    serialPort.setStopBits(QSerialPort::OneStop);
    serialPort.setFlowControl(QSerialPort::NoFlowControl);
    if (success) {
        qDebug() << "Serial port is opened";
    }else{
        qDebug()<<"Serial port is not available";
    }
}
void SerialPort::writeToSerialPort(const QByteArray &data)
{
    serialPort.write(data);
}
void SerialPort::readFromSerialPort()
{
    const QByteArray data = serialPort.readAll();
    qDebug() << "Du lieu doc duoc la" << data;
}
void SerialPort::closeSerialPort()
{
    if (serialPort.isOpen()) {
        serialPort.close();
        qDebug() << "Serial port is closed";
    }
}
