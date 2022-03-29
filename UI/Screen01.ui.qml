import QtQuick
import QtQuick.Controls
import QVLTestUI 1.0
import QVL 1.0

Rectangle {
	width: Constants.width
	height: Constants.height

	color: Constants.backgroundColor

	Text {
		anchors.centerIn: parent
		font.family: Constants.font.family
	}

	// Create a ListView of a list
	Row
	{
		ListView {
			height: 200
			width: 100

			model: local.fruitListModel
			delegate: Row {
				width: parent.width;
				height: 20
				Text {
					id: fruitTitle
					text: value.get("title").value
				}

				Item {
					id: spacer
					width: 10
					height: 10
				}

				Rectangle {
					id: fruitColor
					width: 20
					height: 20
					color: value.get("color").value
				}
			}
		}

		// Create a ListView of an object
		ListView {
			height: 200
			width: 100
			model: local.orange.allProps
			delegate: Row {
				width: parent.width;
				height: 20

				Text {
					id: propId
					text: id
				}

				Item {
					id: spacer
					width: 10
					height: 10
				}

				Text {
					id: propValue
					text: valueStr
				}
			}
		}
	}
}

