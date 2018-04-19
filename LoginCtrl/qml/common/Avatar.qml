import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    width: 80
    height: width
    property alias source: avatar.source

    Image {
        id: avatar
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    Rectangle {
        id: mask
        anchors.fill: parent
        radius: width / 2
        visible: false
    }

    OpacityMask {
        anchors.fill: avatar
        source: avatar
        maskSource: mask
    }
}
