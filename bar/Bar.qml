import Quickshell
import QtQuick
import QtQuick.Layouts
import "../widgets"

Item {
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
