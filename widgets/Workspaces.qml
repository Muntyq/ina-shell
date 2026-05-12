import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Item {
	anchors.left: parent.left

	RowLayout {
		anchors.fill: parent

		Repeater {

			model: Hyprland.workspaces.values.length

			delegate: Rectangle {
				implicitHeight: 20
				implicitWidth: 20

				required property int index
				property var workspace: Hyprland.workspaces.values[index]
				property bool isActive: workspace.id == Hyprland.focusedWorkspace.id

				Text {
					anchors.centerIn: parent
					text: workspace.id
				}

				Rectangle {
					anchors.bottom: parent.bottom
					anchors.left: parent.left
					anchors.right: parent.right
					implicitHeight: 7
					visible: isActive
					color: "#000000"
				}
			}
		}
	}
}
