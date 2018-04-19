import QtQuick 2.0
import QtQuick.Controls 2.3
//import Qt.labs.platform 1.0
import "../common" as Common

Common.Avatar {
//    property var statusList: [
//        {
//            "color": "lightgreen",
//            "text": "我在线上"
//        },
//        {
//            "color": "orange",
//            "text": "Q我吧"
//        },
//        {
//            "color": "grey",
//            "text": "离开"
//        },
//        {
//            "color": "red",
//            "text": "忙碌"
//        },
//        {
//            "color": "pink",
//            "text": "请勿打扰"
//        },
//        {
//            "color": "blue",
//            "text": "隐身"
//        }
//    ]
    property ListModel listModel: ListModel {
        ListElement {
            clr: "lightgreen"
            description: "我在线上"
        }
        ListElement {
            clr: "red"
            description: "忙碌"
        }
        ListElement {
            clr: "yellow"
            description: "隐身"
        }
    }
    Rectangle {
        width: 16
        height: 16
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: _statusMouseArea.containsMouse ? "#33333333" : "transparent"
        Rectangle {
            id: _statusRect
            anchors.fill: parent
            scale: 0.85
            radius: height / 2
            color: listModel.get(0).clr
            MouseArea {
                id: _statusMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    _popup.open()
                }
            }

            LoginStatusPopup {
                id: _popup
                model: listModel
                onStatusSelected: {
                    close()
                    _statusRect.color = listModel.get(index).clr
                }
            }
        }
    }
}
