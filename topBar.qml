import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

PanelWindow {
	anchors.top: true
	anchors.right: true
	anchors.left: true
	implicitHeight: 30

	//define colors
	property var lightPurple: "#cd73fd"
	property var lightGray: "#b9b9b9"
	property var darkGray: "#1f1f1f"
	property var red: "#f7768e"

	Rectangle {
		color: darkGray
		anchors.fill: parent
		border.width: 2
		border.color: lightPurple
	}

	RowLayout {
		anchors.left: parent.left
		anchors.verticalCenter: parent.verticalCenter
		anchors.leftMargin: 6

		//Create as many buttons as existing workspaces
		Repeater {
			model: Hyprland.workspaces.values.length
			
			Rectangle {
				id: workspaceButton
				color: darkGray
				implicitHeight: 20
				implicitWidth: 40
				border.width: 1
				border.color: workspaceButtonInteract.containsMouse ? lightPurple : lightGray

				property var workspace: Hyprland.workspaces.values[index]
				property bool isActive: Hyprland.focusedWorkspace?.id === workspace.id

				MouseArea {
					id: workspaceButtonInteract
					anchors.fill: parent
					hoverEnabled: true	
					onClicked: Hyprland.dispatch("workspace " + workspace.id)

				}

				Text {
					anchors.centerIn: parent
					//Get workspace id, if its active and print with correct color
					//property var workspace: Hyprland.workspaces.values[index]
					//property bool isActive: Hyprland.focusedWorkspace?.id === workspace.id
					text: "[  " + workspace.id + "  ]"
					color: isActive ? lightPurple : lightGray
					font { pixelSize: 14 }

				}
			}
		}
	}

	//Item { Layout.fillWidth: true }

	//Clock
	Rectangle {
		anchors.centerIn: parent
		anchors.verticalCenter: parent.verticalCenter
		implicitHeight: 20
		implicitWidth: 140
		color: darkGray
		border.width: 1
		border.color: lightGray

		SystemClock { id:clock; precision: SystemClock.Minutes }

		Text {
			anchors.centerIn: parent
			text: Qt.formatDateTime(clock.date, "hh:mm | yyyy-MM-dd")
			color: lightGray
			font { pixelSize: 14 }
		}
	}

	//Item { Layout.fillWidth: true }

	//System info buttons
	RowLayout {
		anchors.right: parent.right
		anchors.verticalCenter: parent.verticalCenter
		anchors.rightMargin: 6

		//Battery
		Rectangle {
			id: batteryText
			color: darkGray
			implicitHeight: 20
			implicitWidth: 45
			border.width: 1
			border.color: lightGray
			property var battery: UPower.displayDevice
			//visible: battery.isLaptopBattery ? true : false

			Text {
				anchors.centerIn: parent
				id: batteryPercentage
				text: batteryText.battery.ready ? Math.round(batteryText.battery.percentage) + "%" : "..."
				color: batteryText.battery.percentage < 15 ? red : lightPurple
				anchors.verticalCenter: parent.verticalCenter
				font { pixelSize: 14 }
			}
		}
	}
}
