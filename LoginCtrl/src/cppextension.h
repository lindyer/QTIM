#ifndef CPPEXTENSION_H
#define CPPEXTENSION_H

#include <QObject>
#include <QDesktopServices>
#include <QPoint>

class CppExtension : public QObject
{
    Q_OBJECT
public:
    explicit CppExtension(QObject *parent = nullptr);
    Q_INVOKABLE QPoint globalCursorPos();
    Q_INVOKABLE void openUrl(const QUrl &url);
signals:

public slots:
};

#endif // CPPEXTENSION_H
