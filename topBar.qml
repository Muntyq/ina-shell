import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
	anchors.top: true
	anchors.right: true
	anchors.left: true
	implicitHeight: 30
	color: "#1f1f1d"

	Text {
		anchors.centerIn: parent
		text: "myFirstBar"
		color: "#a9b1d6"
		font.pixelSize: 14
	}
}
