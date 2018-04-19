import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import "../common" as Common
import "../business" as Business

Item {
    anchors.fill: parent

    signal login
    signal switchProxy

    RectangularGlow {
        id: effect
        anchors.fill: root
        glowRadius: 10
        spread: 0.5
        color: "#33333333"
        cornerRadius: root.radius + glowRadius
    }

    Rectangle {
        id: root
        anchors.fill: parent
        anchors.margins: 6
        color: "#ebf2f9"
        radius: 4
        clip: true
        Common.Movable{}

        ColumnLayout {
            anchors.fill: parent
            spacing: 2
            Image {
                antialiasing: true
                smooth: true
                Layout.fillWidth: true
                height: 182
                source: "qrc:/resources/images/cover.PNG"
                Row {
                    anchors.top: parent.top
                    anchors.topMargin: 8
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    spacing: 4
                    Business.NilButton {
                        Common.ToolTip {
                            text: "设置"
                            visible: parent.hovered
                        }
                        onClicked: {
                            switchProxy()
                        }
                    }
                    Business.NilButton {
                        Common.ToolTip {
                            text: "最小化"
                            visible: parent.hovered
                        }
                        onClicked: {
                            appWindow.showMinimized()
                        }
                    }
                    Business.NilButton {
                        Common.ToolTip {
                            text: "关闭"
                            visible: parent.hovered
                        }
                        width: 21
                        onClicked: {
                            Qt.quit()
                        }
                    }
                }
            }
            RowLayout {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 6
                spacing: 4
                Item {
                    width: addAccountText.paintedWidth
                    Layout.fillHeight: true
                    Text {
                        id: addAccountText
                        width: parent.width
                        anchors.bottom: parent.bottom
                        font.family: "iconfont"
                        font.pixelSize: 22
                        text: "\ue697"
                        color: addAccountMouseArea.containsMouse ? "#09a3dc" :"#44333333"
                        Common.ToolTip {
                            text: "多账号登录"
                            visible: addAccountMouseArea.containsMouse
                            }
                        MouseArea {
                            id: addAccountMouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                print("addAccount")
                            }
                        }
                    }
                }
                Item {
                    width: 88
                    Layout.fillHeight: true
                    Business.LoginAvatar {
                        source: "qrc:/resources/images/logo.jpg"
                        width: parent.width
                        height: width
                        anchors.top: parent.top
                    }
                }
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 4
                    ColumnLayout {
                        Layout.fillWidth: true
                        height: 56
                        spacing: -1

                        Business.AccountSelector {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                        }

                        Business.PasswordInput {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                        }
                    }
                    Item {
                        height: 30
                        Layout.fillWidth: true
                        Business.TickRadioButton {
                            id: remeberPwd
                            text: "记住密码"
                            height: 26
                            anchors.left: parent.left
                        }
                        Business.TickRadioButton {
                            id: autoLogin
                            text: "自动登录"
                            height: 26
                            anchors.right: parent.right
                        }
                    }
                    Business.LoginButton {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.bottomMargin: 6
                    }
                }
                Column {
                    Layout.fillHeight: true
                    Item {
                        width: 65
                        height: 28
                        Business.RegisterLinkText {
                            anchors.centerIn: parent
                        }
                    }
                    Item {
                        width: 65
                        height: 28
                        Business.PasswordRetakeLinkText {
                            anchors.centerIn: parent
                        }
                    }
                }
                Item {
                    width: _qrcodeLoginText.paintedWidth
                    Layout.fillHeight: true
                    Text {
                        id: _qrcodeLoginText
                        width: parent.width
                        anchors.bottom: parent.bottom
                        font.family: "iconfont"
                        font.pixelSize: 22
                        text: "\ue642"
                        color: qrcodeloginMouseArea.containsMouse ? "#09a3dc" :"#44333333"
                        MouseArea {
                            id: qrcodeloginMouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                print("qrcode login")
                                loginQRCodePage.visible = true
                            }
                        }
                        Common.ToolTip {
                            text: "二维码登录"
                            visible: qrcodeloginMouseArea.containsMouse
                        }
                    }
                }
            }
        }

        LoginQRCodePage {
            id: loginQRCodePage
            visible: false
            anchors.fill: parent
            onReturned: {
                visible = false
            }
        }
    }
}

