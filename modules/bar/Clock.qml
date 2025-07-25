import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
  Layout.topMargin: 3
  Layout.bottomMargin: 3
  Layout.minimumWidth: 200
  Layout.fillWidth: true
  Layout.fillHeight: true

  radius: 15
  color: "#fbf1c7"
  border.color: "#b1628600"
  border.width: 0

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  Text {
    text: Qt.formatDateTime(clock.date, "hh:mm:ss - yyyy-MM-dd")
    anchors.centerIn: parent
    color: "#3c3836"
  }

  MouseArea {
    id: mousearea
    anchors.fill: parent
  }
}
