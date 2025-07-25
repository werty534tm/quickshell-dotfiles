import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

Rectangle {
  Layout.topMargin: 3
  Layout.bottomMargin: 3
  Layout.minimumWidth: 100
  Layout.fillWidth: true
  Layout.fillHeight: true

  radius: 15
  color: "#d5c4a1"
  border.color: "#b1628600"
  border.width: 0

  Text {
    anchors.centerIn: parent
    text: UPower.displayDevice.isLaptopBattery ? qsTr((UPower.displayDevice.percentage * 100).toString() + "%") : qsTr("Nodev")
    color: "#3c3836"
  }
}
