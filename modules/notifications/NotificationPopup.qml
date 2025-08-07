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
    source: "./notif-cartel.png"
  }
  ColumnLayout {
    anchors.centerIn: parent
    Text {
      id: summary
      text: qsTr(root.notification.summary)
      // font: ""
    }
    Text {
      id: body
      text: qsTr(root.notification.body)
    }
  }

  MouseArea {
    id: mousearea
    anchors.fill: parent

    onClicked: root.notification.tracked = false

    // drag.target: parent
    // drag.maximumX: 30
    // drag.minimumX: -30
    // drag.axis: Drag.XAxis
  }
}
