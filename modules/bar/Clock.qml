import Quickshell
import QtQuick

Rectangle {
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    Text {
        text: Qt.formatDateTime(clock.date, "hh:mm:ss - yyyy-MM-dd")
        anchors.centerIn: parent
    }
}
