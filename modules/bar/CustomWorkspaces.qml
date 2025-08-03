import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

ListView {
  model: Hyprland.workspaces
  Layout.fillHeight: true
  implicitWidth: 380
  layoutDirection: Qt.LeftToRight
  orientation: Qt.Horizontal
  spacing: 10

  delegate: Rectangle {
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
  add: Transition {
    NumberAnimation {
      properties: "x,y"
      easing.type: Easing.InOutBounce
    }
  }
  remove: Transition {
    ParallelAnimation {
      NumberAnimation {
        property: "opacity"
        to: 0
        duration: 400
        easing.type: Easing.InOutQuad
      }
      NumberAnimation {
        properties: "x,y"
        to: 0
        easing.type: Easing.InBack
      }
    }
  }
  removeDisplaced: Transition {
    NumberAnimation {
      properties: "x,y"
      easing.type: Easing.InBack
    }
  }
}
