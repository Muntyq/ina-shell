import Quickshell
import QtQuick
import QtQuick.Layouts
import "../widgets"

Item {
	PanelWindow {
		anchors.top: true
		anchors.left: true
		anchors.right: true
		exclusiveZone: 30
		implicitHeight: 30

		RowLayout {
			anchors.fill: parent

			Item {
				Layout.fillWidth: true
				Workspaces {}
			}

			Item {
				Layout.fillWidth: true
				Clock {
					anchors.centerIn: parent
				}

			}

			Item {
				Layout.fillWidth: true

			}
		}
	}
}
