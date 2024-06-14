#include "position.h"

Position::Position(QObject *parent)
    : QObject{parent},m_x(0), m_y(0), m_z(0), m_q1(0), m_q2(0), m_q3(0), m_q4(0)
{

}
double Position::x()
{
    return m_x;
}

void Position::setX(double x)
{
    if (m_x != x) {
        m_x = x;
        emit xChanged();
    }else{
        return;
    }
}

double Position::y()
{
    return m_y;
}

void Position::setY(double y)
{
    if (m_y != y) {
        m_y = y;
        emit yChanged();
    }else{
        return;
    }
}

double Position::z()
{
    return m_z;
}

void Position::setZ(double z)
{
    if (m_z != z) {
        m_z = z;
        emit zChanged();
    }else{
        return;
    }
}

double Position::q1()
{
    return m_q1;
}

void Position::setQ1(double q1)
{
    if (m_q1 != q1) {
        m_q1 = q1;
        emit q1Changed();
    }else{
        return;
    }
}

double Position::q2()
{
    return m_q2;
}

void Position::setQ2(double q2)
{
    if (m_q2 != q2) {
        m_q2 = q2;
        emit q2Changed();
    }else{
        return;
    }
}

double Position::q3()
{
    return m_q3;
}

void Position::setQ3(double q3)
{
    if (m_q3 != q3) {
        m_q3 = q3;
        emit q3Changed();
    }else{
        return;
    }
}

double Position::q4()
{
    return m_q4;
}

void Position::setQ4(double q4)
{
    if (m_q4 != q4) {
        m_q4 = q4;
        emit q4Changed();
    }else{
        return;
    }
}
