import QtQuick
import Quickshell

LazyLoader {
  PanelWindow {
    // Animate the y property. Setting loops to Animation.Infinite makes the
    // animation repeat indefinitely, otherwise it would only run once.
    property int y

    height: y + 300

    SequentialAnimation on y {
      loops: Animation.Infinite

      // Move from minHeight to maxHeight in 300ms, using the OutExpo easing function
      NumberAnimation {
        from: 300
        to: 0
        easing.type: Easing.OutExpo
        duration: 300
      }

      // Then move back to minHeight in 1 second, using the OutBounce easing function
      NumberAnimation {
        from: 0
        to: 300
        easing.type: Easing.OutBounce
        duration: 1000
      }

      // Then pause for 500ms
      PauseAnimation {
        duration: 500
      }
    }
  }
}
