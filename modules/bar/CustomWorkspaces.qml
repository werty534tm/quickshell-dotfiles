import QtQuick
import Quickshell.Hyprland

Repeater {
  id: repeater
  model: Hyprland.workspaces

  Rectangle {
    width: 32
    height: 24
    radius: 15
    color: modelData.active ? "#d79921" : "#fbf1c7"
    border.color: modelData.active ? "#b57614" : "00000000"
    border.width: 0

    MouseArea {
      anchors.fill: parent
      onClicked: Hyprland.dispatch("workspace " + modelData.id)
    }

    Text {
      text: modelData.id
      anchors.centerIn: parent
      color: modelData.active ? "#ffffff" : "#3c3836"
      font.pixelSize: 12
    }
  }
}
