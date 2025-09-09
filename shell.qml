//@ pragma UseQApplication

import QtQuick
import Quickshell
import "modules/bar"
import "modules/notifications"
import "modules/popups"

ShellRoot {
  Bar {}
  NotificationController {}
  VolumePopup {}
}
