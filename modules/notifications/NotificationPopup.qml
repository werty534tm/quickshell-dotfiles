import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import "."

Rectangle {
  id: root

  // signal dismissed

  implicitWidth: 300
  implicitHeight: 100
  radius: 20
  color: "transparent"
  property Notification notification

  Image {
    id: cartel
    source: "./notif-cartel.png"
  }
  ColumnLayout {
    anchors.centerIn: parent
    Text {
      id: summary
      text: qsTr(root.notification.summary)
      Layout.preferredWidth: 250
      leftPadding: 30
      font.pixelSize: 16
    }
    Text {
      id: body
      text: qsTr(root.notification.body)
      leftPadding: 30
      Layout.preferredWidth: 250
      wrapMode: Text.Wrap
      maximumLineCount: 3
    }
  }

  MouseArea {
    id: mousearea
    anchors.fill: parent

    onClicked: root.notification.tracked = false
  }
}
