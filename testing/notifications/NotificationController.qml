pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import Quickshell.Wayland
import "."

PanelWindow {
  id: root

  // property list<Notification> notifications

  implicitWidth: 500
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
    width: 600
    height: 215 * stack.count
  }
  ListView {
    id: stack

    anchors.fill: parent
    spacing: 15
    rightMargin: 10
    leftMargin: 75
    topMargin: 60
    interactive: true

    model: server.trackedNotifications

    delegate: NotificationPopup {
      required property Notification modelData
      notification: modelData
    }

    add: Transition {
      NumberAnimation {
        properties: "x"
        from: 400
        duration: 1000
        easing.type: Easing.OutElastic
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
          duration: 500
          easing.type: Easing.InBack
        }
        NumberAnimation {
          properties: "x"
          to: -200
          duration: 500
          easing.type: Easing.InOutQuad
        }
      }
    }
    removeDisplaced: Transition {
      NumberAnimation {
        properties: "y"
        duration: 500
        easing.type: Easing.InOutQuad
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
