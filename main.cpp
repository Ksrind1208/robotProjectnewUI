#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQmlContext>
#include<robot.h>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/robotProject2/Main.qml"));

    qmlRegisterType<Robot>("Data",1,0,"Robot");

    double l1 = 6.5;
    double l2 = 8.0;
    double l3 = 8.0;

    Robot myRobot(nullptr,l1,l2,l3);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);


    QQmlContext *rootContext=engine.rootContext();
    rootContext->setContextProperty("myRobot",&myRobot);
    return app.exec();
}
