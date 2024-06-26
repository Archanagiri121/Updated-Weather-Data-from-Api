#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "WeatherApi.h"
#include <QQmlEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<WeatherApi>("WeatherApp", 1, 0, "WeatherApi");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/2ndWeather/main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
