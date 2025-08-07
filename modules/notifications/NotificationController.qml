pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import Quickshell.Wayland
import "."

PanelWindow {
  id: root

  implicitWidth: 375
  implicitHeight: Screen.height
  visible: stack.children.length != 0
  color: "transparent"
  Component.onCompleted: {
    if (this.WlrLayershell != null) {
      this.WlrLayershell.layer = WlrLayer.Top;
    }
  }

  anchors {
    right: true
    top: true
  }

  mask: Region {
    x: stack.x + stack.leftMargin
    y: stack.y + stack.topMargin
    width: 300
    height: 115 * stack.count - 15
  }
  ListView {
    id: stack

    anchors.fill: parent
    spacing: 15
    rightMargin: 0
    leftMargin: 75
    topMargin: 60
    interactive: true

    model: server.trackedNotifications

    delegate: NotificationPopup {
      required property Notification modelData
      notification: modelData

      // notification.expireTimeout: 8
    }

    add: Transition {
      NumberAnimation {
        properties: "x"
        from: 400
        duration: 700
        easing.type: Easing.OutBounce
      }
    }

    addDisplaced: Transition {
      NumberAnimation {
        properties: "x"
        duration: 1000
        easing.type: Easing.OutElastic
      }
    }

    remove: Transition {
      ParallelAnimation {
        NumberAnimation {
          properties: "y"
          to: Screen.height
          duration: 1000
          easing.type: Easing.InQuad
        }
        NumberAnimation {
          properties: "x"
          to: -50
          duration: 1000
          easing.type: Easing.InQuad
        }
        NumberAnimation {
          properties: "rotation"
          to: -45
          duration: 1000
          easing.type: Easing.InQuad
        }
      }
    }
    removeDisplaced: Transition {
      NumberAnimation {
        properties: "y"
        duration: 400
        easing.type: Easing.OutInExpo
      }
    }
  }

  NotificationServer {
    id: server
    onNotification: notification => {
      notification.tracked = true;
    }
  }
}
