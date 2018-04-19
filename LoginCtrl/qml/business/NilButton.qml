import QtQuick 2.0

Rectangle {
    id: root
    width: 22
    height: 22
    color: "transparent"
    border.color: mouseArea.containsMouse ? "#33333333" : "red"
    border.width: mouseArea.containsMouse ? 1 : 0
    property alias hovered: mouseArea.containsMouse
    signal clicked
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.clicked()
    }
}
