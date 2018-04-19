import QtQuick 2.0
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0

Window {
    id: _root
    width: 430
    height: 330
    flags: Qt.FramelessWindowHint | Qt.Popup
    color: "transparent"
    property real borderWidth: 10
    property Component contentContainer

    property color backgroudColor: "#ebf2f9"

    Item {
        anchors.fill: parent
        RectangularGlow {
            id: effect
            anchors.fill: _contentLoader
            glowRadius: borderWidth
            spread: 0.2
            color: "#22666666"
            cornerRadius: glowRadius + _contentLoader.radius
        }

        Rectangle {
            id: _contentLoader
            anchors.centerIn: parent
            width: parent.width - borderWidth*2
            height: parent.height - borderWidth*2
            color: backgroudColor
            Movable {
                dest: _root
            }

            Loader {
                anchors.fill: parent
                sourceComponent: contentContainer
            }
        }
    }

}
