import QtQuick 2.0
import QtQuick.Layouts 1.3
import "../common" as Common

Rectangle {
    anchors.fill: parent
    color: "#EBF2F9"
    signal returned
    Image {
        id: titleImage
        width: parent.width
        source: "qrc:/resources/images/header.png"
    }

    ColumnLayout {
        id: _column
        anchors.top: titleImage.bottom
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        width: parent.width
        height: parent.height - titleImage.height - 10
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 4
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "用TIM手机版扫描二维码登录"
            font.pixelSize: 14
            font.family: "宋体"
        }

        Item {
            id: centerItem
            Layout.fillWidth: true
            Layout.fillHeight: true
            Rectangle {
                id: qrcode
                width: 130
                height: width
                anchors.verticalCenter: centerItem.verticalCenter
                color: "red"
            }
            Rectangle {
                id: tipPic
                width: 150
                height: 180
                color: "blue"
                anchors.verticalCenter: centerItem.verticalCenter
                x: parent.width / 2 + 8
            }

            state: "one"
            states: [
                State {
                    name: "one"
                    AnchorChanges {
                        target: qrcode

                        anchors.horizontalCenter: centerItem.horizontalCenter
                        anchors.right: undefined
                    }
                    PropertyChanges {
                        target: tipPic
                        opacity: 0
                    }
                },
                State {
                    name: "two"
                    AnchorChanges {
                        target: qrcode
                        anchors.horizontalCenter: undefined
                        anchors.right: tipPic.left
                    }
                    PropertyChanges {
                        target: qrcode
                        anchors.rightMargin: 10
                    }
                    PropertyChanges {
                        target: tipPic
                        opacity: 1
                    }
                }
            ]
            transitions: [
                Transition {
                    from: "one"
                    to: "two"
                    SequentialAnimation {
                        AnchorAnimation {
                            duration: 200
                        }
                        PropertyAnimation {
                            target: tipPic
                            property: "opacity"
                            duration: 100
                        }
                    }
                },
                Transition {
                    from: "two"
                    to: "one"
                    SequentialAnimation {
                        PropertyAnimation {
                            target: tipPic
                            property: "opacity"
                            duration: 100
                        }
                        AnchorAnimation {
                            duration: 200
                        }
                    }
                }
            ]
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                onContainsMouseChanged: {
                    if(containsMouse){
                        centerItem.state = "two"
                    }else{
                        centerItem.state = "one"
                    }
                }
            }
        }

        Common.Button {
            width: 180
            height: 30
            text: "返回"
            Layout.alignment: Qt.AlignHCenter
            onClicked: returned()
        }
    }
}
