import QtQuick 2.0

Text {
    id: root
    font.pixelSize: 13
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            cppExtension.openUrl(baseUrl)
        }
    }
    color: mouseArea.pressed ? "#098cbc": mouseArea.containsMouse ? "#3cc3f5" : "#09a3dc"
}
