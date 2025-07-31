pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import Quickshell.Wayland
import "."

PanelWindow {
  id: root

  property list<Notification> notifications

  implicitWidth: 400
  implicitHeight: 800
  visible: stack.children.length != 0
  color: "#333333aa"
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
    item: stack
  }
  ListView {
    id: stack

    // implicitWidth: 240
    // implicitHeight: children.reduce((h, c) => h + c.height, 0)
    anchors.fill: parent
    spacing: 15
    rightMargin: 10
    leftMargin: 75
    topMargin: 60
    interactive: true

    model: ScriptModel {
      values: [...root.notifications]
    }

    delegate: NotificationPopup {
      required property Notification modelData
      notification: modelData
      onDismissed: () => {
        notification.dismiss();
        const index = root.notifications.indexOf(notification);
        if (index > -1)
          root.notifications.splice(index, 1);
      }
    }

    add: Transition {
      NumberAnimation {
        properties: "x,y"
        easing.type: Easing.InOutQuad
      }
    }
    remove: Transition {
      ParallelAnimation {
        NumberAnimation {
          property: "opacity"
          to: 0
          duration: 1000
        }
        NumberAnimation {
          properties: "y"
          to: 5000
          duration: 1000
        }
      }
    }
    removeDisplaced: Transition {
      NumberAnimation {
        properties: "x,y"
        easing.type: Easing.InOutQuad
      }
    }
  }

  NotificationServer {
    id: server
    onNotification: notification => {
      notification.tracked = true;
      root.notifications = [...root.notifications, notification];
    }
  }
}
