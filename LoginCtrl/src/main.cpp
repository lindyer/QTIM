//customize
#include "cppextension.h"

//Qt
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFontDatabase>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    int fid1 = QFontDatabase::addApplicationFont(":/resources/fonts/fontawesome-webfont.ttf");
    int fid2 = QFontDatabase::addApplicationFont(":/resources/fonts/iconfont.ttf");
    QStringList fontFamilies1 = QFontDatabase::applicationFontFamilies(fid1);
    QStringList fontFamilies2 = QFontDatabase::applicationFontFamilies(fid2);
    qDebug() << fontFamilies1 << fontFamilies2;
    app.setFont(QFont("宋体"));
    CppExtension cppExtension;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("cppExtension",&cppExtension);
    engine.load(QUrl(QLatin1String("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
