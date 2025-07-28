import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import Quickshell.Wayland
import "."

PanelWindow {
  id: notifLayout

  property list<Notification> notifications

  implicitWidth: 400
  implicitHeight: 800
  visible: stack.children.length != 0
  color: "#00000000"
  Component.onCompleted: {
    if (this.WlrLayershell != null) {
      this.WlrLayershell.layer = WlrLayer.Top;
    }
  }

  anchors {
    right: true
    top: true
    // bottom: true
  }

  mask: Region {
    item: stack
  }
  ListView {
    id: stack
    implicitWidth: 240
    implicitHeight: children.reduce((h, c) => h + c.height, 0)

    model: ScriptModel {
      values: [...notifLayout.notifications]
    }
    delegate: NotificationPopup {
      notification: modelData
    }
    // delegate: Text {
    //   property string name: "sadasdsdgherh"
    //   property string number: "afgf"
    //   text: name + ": " + number
    // }
  }

  NotificationServer {
    id: server
    onNotification: notification => {
      notification.tracked = true;
      notifLayout.notifications = [...notifLayout.notifications, notification];
    }
  }
}
