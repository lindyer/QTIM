import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    anchors.fill: parent
    color: "orange"
    signal switchLogin
    Column {
        anchors.centerIn: parent
        Button {
            onClicked: switchLogin()
        }
    }
}
