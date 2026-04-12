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
	//color: "#1f1f1d"

	Rectangle {
		color: "#1f1f1d"
		anchors.fill: parent
		border.width: 2
		border.color: "#cd73fd"
	}

	//Main Layout
	RowLayout {
		anchors.fill: parent
		anchors.verticalCenter: parent

		RowLayout {
			//Create as many buttons as existing workspaces
			Repeater {
				model: Hyprland.workspaces.values.length
				
				Rectangle {
					id: workspaceButton
					color: "#1f1f1d"
					implicitHeight: 20
					implicitWidth: 40
					border.width: 1
					border.color: workspaceButtonInteract.containsMouse ? "#cd73fd" : "#b9b9b9"

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
						color: isActive ? "#cd73fd" : "#b9b9b9"
						font { pixelSize: 14 }

					}
				}
			}
		}

		Item { Layout.fillWidth: true }

		//Clock
		Rectangle {
			//anchors.left: parent
			implicitHeight: 20
			color: "#1f1f1d"

			Text {
				SystemClock {precision: SystemClock.Minutes; id: clock }
				text: Qt.formatDateTime(clock.date, "hh:mm - yyyy-MM-dd")
				color: "#b9b9b9"
				font { pixelSize: 14 }
			}
		}

		Item { Layout.fillWidth: true }

		//System info buttons
		RowLayout {

			//Battery
			Rectangle {
				id: batteryText
				color: "#1f1f1d"
				implicitHeight: 20
				implicitWidth: 30
				property var battery: UPower.displayDevice
				visible: battery.isLaptopBattery ? true : false

				Text {
					anchors.centerIn: parent
					id: batteryPercentage
					text: batteryText.battery.ready ? Math.round(batteryText.battery.percentage) + "%" : "..."
					color: batteryText.battery < 15 ? "#f7768e" : "#b9b9b9"
					anchors.verticalCenter: parent.verticalCenter
					font { pixelSize: 14 }
				}
			}
		}
	}
}
