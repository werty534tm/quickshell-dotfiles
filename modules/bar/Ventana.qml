import QtQuick
import Quickshell

PanelWindow {
    id: calendario

    implicitWidth: 200
    implicitHeight: 200
    anchors {
        right: true
        top: true
    }

    margins {
        top: 20
        right: 12
    }

    ColorAnimation {
        from: "white"
        to: "black"
        duration: 200
    }
}
