import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications

Rectangle {
  anchors.right: parent.right
  anchors.left: parent.left
  implicitWidth: 300
  implicitHeight: 100
  color: "#333333"
  property Notification notification

  Text {
    id: eso
    anchors.centerIn: parent
    text: qsTr("text")
  }
}
