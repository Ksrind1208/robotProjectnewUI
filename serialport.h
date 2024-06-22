#ifndef SERIALPORT_H
#define SERIALPORT_H

#include <QObject>
#include<QSerialPort>
class SerialPort : public QObject
{
    Q_OBJECT
public:
    explicit SerialPort(QObject *parent = nullptr);
    Q_INVOKABLE void writeToSerialPort(const QByteArray &data);
    Q_INVOKABLE void readFromSerialPort();
    Q_INVOKABLE void closeSerialPort();
signals:
private:
    QSerialPort serialPort;
};


#endif // SERIALPORT_H
