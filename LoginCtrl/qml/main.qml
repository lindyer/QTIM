import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.0

import "common" as Commons
import "pages" as Pages
import "frames" as Frames

ApplicationWindow {
    id: appWindow
    visible: true
    width: 500
    height: 500
    property bool isLogined: false
    color: "transparent"
    background: Item{}
    flags: Qt.SubWindow | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    function showMainPanel(){
        appWindow.show()
        appWindow.raise()
        appWindow.requestActivate()
    }

    SystemTrayIcon {
          visible: true
          iconSource: "qrc:/resources/images/qq-pink.png"
          tooltip: "QTIM"
          menu: Menu {
            id: _trayMenu
              MenuItem {
                   text: qsTr("打开主面板")
                   onTriggered: showMainPanel()
              }
              MenuItem {
                   text: qsTr("退出")
                   onTriggered: Qt.quit()
              }
          }

          onActivated: {
              if(reason == SystemTrayIcon.Trigger){
                showMainPanel()
              }
          }
    }

    Frames.LoginFrame {
        anchors.centerIn: parent
    }
}
