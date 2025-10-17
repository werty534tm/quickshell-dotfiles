import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

// anchors.top: true
// anchors.bottom: true
// anchors.left: true
// anchors.right: true
Rectangle {
  Layout.topMargin: 3
  Layout.bottomMargin: 3
  Layout.minimumWidth: 40
  Layout.fillWidth: true
  Layout.fillHeight: true

  radius: 15
  color: "#fbf1c7"
  border.color: "#b1628600"
  border.width: 0

  LazyLoader {
    id: loader
    loading: true

    PanelWindow {
      id: panel

      Image {
        id: name
        anchors.fill: parent
        source: "../../resources/mclovin.jpg"
        fillMode: Image.PreserveAspectFit
      }

      HyprlandWindow.opacity: 0.8
      color: "#282828"

      Component.onCompleted: {
        if (WlrLayershell != null) {
          WlrLayershell.layer = WlrLayer.Top;
        }
      }
      visible: false
      focusable: false
      anchors.top: top
      anchors.left: left
      margins.left: 7
      implicitHeight: 300
      implicitWidth: 300

      RowLayout {
        Button {
          text: "Día de lujitos"
        }
      }
    }
  }

  MouseArea {
    anchors.fill: parent
    onClicked: loader.item.visible = !loader.item.visible
  }
}
