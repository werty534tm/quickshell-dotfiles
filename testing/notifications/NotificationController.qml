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

    implicitWidth: 240
    implicitHeight: children.reduce((h, c) => h + c.height, 0)
    spacing: 15
    anchors.right: parent.right
    rightMargin: 10
    topMargin: 10

    model: ScriptModel {
      values: [...root.notifications]
    }

    delegate: NotificationPopup {
      notification: modelData
      onDismissed: () => {
        const index = root.notifications.indexOf(notification);
        if (index > -1) {
          root.notifications.splice(index, 1);
        }
        notification.dismiss();
      }
    }

    remove: Transition {
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
