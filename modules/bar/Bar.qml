import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.UPower
import Quickshell.Services.SystemTray
import "."

PanelWindow {
  id: bar
  implicitHeight: 30
  visible: true
  color: "#00000000"

  property var popupOpen: false
  anchors {
    top: true
    left: true
    right: true
  }

  margins {
    top: 5
    right: 5
    left: 5
  }

  Rectangle {
    anchors.left: parent.left
    anchors.fill: parent
    radius: 8
    color: "#00000000"
    border.color: "#689d6a"
    border.width: 0

    RowLayout {
      id: left

      anchors {
        top: parent.top
        bottom: parent.bottom
        left: parent.left
        leftMargin: 7
        rightMargin: 7
      }

      spacing: 12

      CustomWorkspaces {}
    }

    RowLayout {
      id: right
      anchors {
        top: parent.top
        bottom: parent.bottom
        right: parent.right
        rightMargin: 7
        leftMargin: 7
      }

      spacing: 12

      ListView {
        id: trayList

        Layout.fillHeight: true
        implicitWidth: 100
        layoutDirection: Qt.RightToLeft
        orientation: Qt.Horizontal
        spacing: 10

        // anchors.top: parent.top
        // anchors.bottom: parent.bottom
        // anchors.left: parent.left
        // anchors.right: battery.left

        model: SystemTray.items

        delegate: Rectangle {
          width: 36
          height: 27
          radius: 15

          color: "#fbf1c7"

          Image {
            id: icono
            anchors.centerIn: parent
            width: 32
            height: 24
            source: modelData.icon
            fillMode: Image.PreserveAspectFit
          }

          MouseArea {
            anchors.fill: parent
            onClicked: modelData.display(bar, bar.width - 200, bar.height)
          }
        }
      }

      CustomBattery {
        id: battery
      }

      Clock {
        id: clock
      }
    }
  }
}
