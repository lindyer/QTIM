import QtQuick 2.0
import QtGraphicalEffects 1.0
import "../pages" as Pages
import "../common" as Common


Flipable {
    id: flipable
    width: 443
    height: 343
    anchors.centerIn: parent
    property bool flipped: false

    front: Pages.LoginPage {
        onLogin: {
            //验证账号密码成功后调用主程序
        }
        onSwitchProxy: {
            flipable.flipped = !flipable.flipped
        }
    }

    back: Pages.ProxyPage{
        onSwitchLogin: {
            flipable.flipped = !flipable.flipped
        }
    }
    transform: Rotation {
        id: rotation
        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
        angle: 0    // the default angle
    }

    states: State {
        name: "back"
        PropertyChanges { target: rotation; angle: 180 }
        when: flipable.flipped
    }

    transitions: Transition {
        SequentialAnimation{
            ParallelAnimation {
                NumberAnimation { target: rotation; property: "angle"; duration: 500 }
                SequentialAnimation {
                    NumberAnimation { target: flipable; property: "scale"; to: 0.7; duration: 250 }
                    NumberAnimation { target: flipable; property: "scale"; to: 1.0; duration: 250 }
                }
            }
        }
    }
}



