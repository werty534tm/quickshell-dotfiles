import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications

Rectangle {
  id: root

  signal dismissed

  anchors.right: parent.right
  anchors.left: parent.left
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
    anchors.fill: parent
    onClicked: e => {
      root.x = root.x - 300;
      root.dismissed();
    }
  }
}
