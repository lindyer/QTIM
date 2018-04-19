#include "cppextension.h"
#include <QCursor>


CppExtension::CppExtension(QObject *parent) : QObject(parent)
{

}

QPoint CppExtension::globalCursorPos()
{
    return QCursor::pos();
}

void CppExtension::openUrl(const QUrl &url)
{
    QDesktopServices::openUrl(url);
}
