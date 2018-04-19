import QtQuick 2.0

Rectangle {
    id: root
//    implicitWidth: 100
//    implicitHeight: 40
    radius: 4
    color: mouseArea.pressed ? "#098cbc": mouseArea.containsMouse ? "#3cc3f5" : "#09a3dc"
    property string text
    signal clicked

    Text {
        text: root.text
        color: "white"
        font.pixelSize: 14
        font.letterSpacing: 8
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.clicked()
    }
}
