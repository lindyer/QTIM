import QtQuick 2.7
import QtQuick.Controls 2.2

Item {
    id: root
    width: row.width
    height: 30
    property alias indicatorFont: indicator.font
    property alias font: content.font
    property alias text: content.text
    property bool checked: false
    property alias spacing: row.spacing
    Row {
        id: row
        spacing: 4
        Text {
            id: indicator
            height: root.height
            verticalAlignment: Text.AlignVCenter
            text: root.checked ? "\ue661" : "\ue64a"
            font.family: "iconfont"
            font.pixelSize: 16
            color: "#098cbc"
        }

        Text {
            id: content
            height: root.height
            color: "#333"
            font.pixelSize: 13
            text: "TRB"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            checked = !checked
        }
    }

}
