import QtQuick 2.0
import QtQuick.Controls 2.2

ToolTip {
    id: _root
    font.pixelSize: 13
    contentItem: Text {
        text: _root.text
        font: _root.font
    }
}
