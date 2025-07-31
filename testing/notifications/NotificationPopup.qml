import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications

Rectangle {
  id: root

  signal dismissed

  implicitWidth: 300
  implicitHeight: 100
  radius: 20
  color: "#333333"
  property Notification notification

  ColumnLayout {
    anchors.centerIn: parent
    Text {
      id: summary
      text: qsTr(root.notification.summary)
      // font: ""
    }
    Text {
      id: body
      text: qsTr("text")
    }
  }

  MouseArea {
    id: mousearea
    anchors.fill: parent
    drag.target: parent
    drag.maximumX: 30
    drag.minimumX: -30
    drag.axis: Drag.XAxis
  }
}
