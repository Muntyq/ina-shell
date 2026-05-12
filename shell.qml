import Quickshell
import QtQuick
import QtQuick.Layouts
import "bar"

ShellRoot {
	id: shell

	PanelWindow {
		anchors.top: true
		anchors.left: true
		anchors.right: true
		exclusiveZone: 30
		implicitHeight: 30

		Bar {
			anchors.fill: parent

		}
	}
}


