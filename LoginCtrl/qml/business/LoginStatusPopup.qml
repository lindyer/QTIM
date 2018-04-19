import QtQuick 2.0
import QtQuick.Controls 2.2

Popup {
    id: root
    margins: 0
    padding: 0
    signal statusSelected(int index)
    property int currentIndex
    property alias model: repeater.model
    background: Item {}

    Column {
        spacing: 0
        Repeater {
            id: repeater
            delegate: Rectangle {
                height: 50
                width: 140
                radius: 2
                Rectangle {
                    height: 34
                    width: parent.width - 2
                    anchors.centerIn: parent
                    color: mouseArea.containsMouse  ? "#33333333" : "transparent"
                    Row {
                        anchors.fill: parent
                        Item {
                            height: parent.height
                            width: parent.width * 0.3
                            Rectangle {
                                color: clr
                                width: 14
                                height: 14
                                radius: height / 2
                                anchors.centerIn: parent
                            }
                        }

                        Item {
                            width: parent.width * 0.7
                            height: parent.height
                            Text {
                                text: description
                                font.pixelSize: 15
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            currentIndex = index
                            statusSelected(index)
                        }
                    }
                }
                Rectangle {
                    width: parent.width * 0.7
                    height: 1
                    color: "#eee"
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    visible: index != repeater.count - 1
                }
            }
        }

    }
}
