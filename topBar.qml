import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
	anchors.top: true
	anchors.right: true
	anchors.left: true
	implicitHeight: 30
	//color: "#1f1f1d"
	Rectangle {
		color: "#1f1f1d"
		anchors.fill: parent
	border.width: 2
	border.color: "#cd73fd"
}

	RowLayout {
		anchors.fill: parent
		anchors.verticalCenter: parent

		Text {
			text: Hi 
		}

		Repeater {
			//Create as many buttons as existing workspaces
			model: Hyprland.workspaces.values.length
			
			Text {
				//Get workspace id, if its active and print with correct color
				property var workspace: Hyprland.workspaces.values[index]
				property bool isActive: Hyprland.focusedWorkspace?.id === workspace.id
				text: "[ " + workspace.id + " ]"
				color: isActive ? "#cd73fd" : "#b9b9b9"
				font { pixelSize: 14; bold: true }

				//Focus workpace on click
				MouseArea {
					anchors.fill: parent
					onClicked: Hyprland.dispatch("workspace " + workspace.id)
				}
			}
		}
		
		//Fill remainding space
		Item { Layout.fillWidth: true }
	}
}
