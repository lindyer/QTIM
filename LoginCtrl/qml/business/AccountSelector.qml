import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ComboBox {
    id: root
    width: 100
    height: 40
    editable: true
    font.pixelSize: 15
    leftPadding: 8
    spacing: 0
    focusPolicy: Qt.StrongFocus
    property int hoverIndex: 0
    signal itemSelected(string account)
    z: hovered ? 2 : 1
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        border.color: root.hovered ? "#098cbc" : "#ccc"
        border.width: 1
        radius: 3
    }

    contentItem: TextField {
        background: Item{}
        height: root.height
        leftPadding: 0
        placeholderText: "QQ号码|手机|邮箱"
        selectByMouse: true
        verticalAlignment: TextInput.AlignVCenter
        text: root.displayText
        font: root.font
    }

    indicator: Item {
        width: 30
        height: root.height
        x: root.width - width
        Text {
            anchors.centerIn: parent
            font.family: "FontAwesome"
            font.pixelSize: 22
            color: hovered ? "#33333333" : "#ccc"
            text: root.down ? "\uf106" : "\uf107"
        }
    }

    model: ListModel {
        ListElement { clr: "lightgreen"; nick: "追风筝的人"; account: "55555555" }
        ListElement { clr: "red"; nick: "追风筝的人"; account: "66666666" }
        ListElement { clr: "orange"; nick: "追风筝的人"; account: "777777777" }
    }

    delegate: Rectangle {
        id: delegateRect
        height: delegateMouseArea.containsMouse ? 45 : (Math.abs(hoverIndex - index) > 1 ? 28 : 35)
        width: root.width
        color: delegateMouseArea.containsMouse ? "#0078D7" : "white"
        Behavior on height {
            NumberAnimation {duration: 200}
        }

        Rectangle {
            id: iconRect
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 2
            height: parent.height - 4
            width: height
            radius: height/2
            color: clr
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: iconRect.right
            anchors.leftMargin: 6
            spacing: 6
            Text {
                visible: delegateMouseArea.containsMouse
                text: nick
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 14
                color: "darkblue"
            }
            Text {
                text: account
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 14
                color: delegateMouseArea.containsMouse ? "white" : "black"
            }
        }

        Text {
            color: "white"
            font.family: "FontAwesome"
            font.pixelSize: 18
            text: "\uf014"
            visible: delegateMouseArea.containsMouse
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
        }

        MouseArea {
            id: delegateMouseArea
            anchors.fill: parent
            hoverEnabled: true
            onContainsMouseChanged: {
                if(containsMouse){
                    hoverIndex = index
                }
            }
            onClicked: {
                currentIndex = index
                itemSelected(account)
                root.popup.close()  //信号提交须在popup close之前，否则会导致model的子项未定义
            }
        }
    }
}
