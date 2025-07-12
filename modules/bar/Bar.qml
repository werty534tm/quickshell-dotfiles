import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
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
        color: "#28282800"
        border.color: "#444444"
        border.width: 1

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

            Repeater {
                model: Hyprland.workspaces

                Rectangle {
                    width: 32
                    height: 24
                    radius: 15
                    color: modelData.active ? "#4a9eff" : "#333333"
                    border.color: "#555555"
                    border.width: 2

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Hyprland.dispatch("workspace " + modelData.id)
                    }

                    Text {
                        text: modelData.id
                        anchors.centerIn: parent
                        color: modelData.active ? "#ffffff" : "#cccccc"
                        font.pixelSize: 12
                    }
                    Image {
                        id: imagencita
                        source: "../smolaire-praising.jpg"
                        anchors.fill: parent
                        anchors.centerIn: parent
                        autoTransform: true
                    }
                }
            }
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
                    anchors.fill: parent
                    onClicked: popupOpen = !popupOpen
                }

                PopupWindow {
                    anchor.window: bar
                    anchor.rect.x: parentWindow.width
                    anchor.rect.y: parentWindow.height
                    width: 500
                    height: 200
                    visible: popupOpen
                    Image {
                        id: imagencita2
                        source: "../mclovin.jpg"
                        anchors.fill: parent
                        anchors.centerIn: parent
                        autoTransform: true
                    }
                }
            }
        }
    }
}
