import QtQuick
import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: bar
    height: 30
    visible: true
    color: "#00000000"

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
        anchors.fill: parent
        radius: 8
        color: "#282828"
        border.color: "#444444"
        border.width: 1
    }
}
