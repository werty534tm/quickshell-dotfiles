import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications

PanelWindow {
  ColumnLayout {
    Repeater {
      model: NotificationServer.trackedNotifications
    }
  }
}
