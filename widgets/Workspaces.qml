import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Item {
	RowLayout {
		anchors.fill: parent

		Repeater {
			property var activeWorkspaces: Hyprland.workspaces.values.length - 1
			property var totalWorkspaces: Hyprland.workspaces.values[activeWorkspaces].id
			model: totalWorkspaces

			delegate: Rectangle {
				implicitHeight: 20
				implicitWidth: 20

				required property int index
				property bool isFocused: index + 1 == Hyprland.focusedWorkspace.id
				property bool isActive: Hyprland.workspaces.values.some((wrksp) => wrksp.id === index + 1)

				Text {
					anchors.centerIn: parent
					text: index + 1
					color: isActive ? "#000000" : "#888888"
				}

				Rectangle {
					anchors.bottom: parent.bottom
					anchors.left: parent.left
					anchors.right: parent.right
					implicitHeight: 7
					visible: isFocused
					color: "#000000"
				}
			}
		}
	}
}
