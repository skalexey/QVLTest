import QtQuick
import QtQuick.Window
import QVLTestUI 1.0

Window {
	width: 640
	height: 480
	visible: true

	QVLTestUI {
		id: uiRoot
		width: root.width
		height: root.height
	}
}
