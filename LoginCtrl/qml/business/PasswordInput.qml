import QtQuick 2.0
import QtQuick.Controls 2.2

TextField {
    id: root
    width: 100
    height: 30
    echoMode: TextInput.Password
    passwordMaskDelay: 500
    leftPadding: 6
    rightPadding: 6
    placeholderText: "密码"
    selectByMouse: true
    font.pixelSize: 15
    verticalAlignment: TextInput.AlignVCenter
    z: hovered ? 2 : 1
    background: Rectangle {
        border.color: root.hovered ? "#098cbc" : "#ccc"
        border.width: 1
        radius: 3
    }
}
