import QtQuick
import QVLTestUI 1.0
// Import QVL
import QVL 1.0

Item {
	width: Constants.width
	height: Constants.height

	property var contentModel: null
	property var typesModel: null
	property var orange: null
	property var fruitListModel: null

	property var test: function () {
		// Create a variable
		contentModel = dmbModel.contentModel;
		typesModel = dmbModel.typesModel;
		orange = dmbModel.createObject();
		var fruit = dmbModel.createObject();
		var fruitList = dmbModel.createList();
		var color = dmbModel.createFromData("green");
		var size = dmbModel.createFromData(2.4);

		// Set a property
		fruit.set("isFruit", true);
		fruit.set("color", color);
		fruit.set("size", size);
		fruit.set("title", "Fruit");

		// Register a type
		fruit = dmbModel.typesModel.set("fruit", fruit);

		// Set a prototype
		var pear = dmbModel.createObject();
		pear.setPrototype(fruit);
		orange.setPrototype("fruit");

		// Override a property
		pear.set("color", "yellow");
		pear.set("size", 3.2);
		pear.set("title", "Pear");
		orange.set("title", "Orange");
		orange.set("color", "orange");
		orange.set("size", "4.1");

		// Add to a list
		fruit = fruitList.add(fruit);
		pear = fruitList.add(pear);
		orange = fruitList.add(orange);

		// Add to the content
		fruitList = contentModel.set("fruitList", fruitList);
		fruitListModel = fruitList.listModel

		// Get a property
		var color = fruit.get("color").value;
		console.log("Fruit color: " + color
					+ ", size: " + fruit.get("size").value);

		console.log("Pear color: " + pear.get("color").value
					+ ", size: " + pear.get("size").value
					+ ", is fruit? " + (pear.get("isFruit").value ? "yes" : "no")
				);

		// Store a database
		if (dmbModel.store("database.json"))
			console.log("Database successfully stored")
		else
			console.log("Error! Can’t store the model");

		// Load a database
		if (dmbModel.load("database.json"))
			console.log("Database successfully loaded")
		else
			console.log("Error! Can’t load the model");

		// Update local variables after reload the model
		contentModel = dmbModel.contentModel;
		typesModel = dmbModel.typesModel;
		fruitList = contentModel.get("fruitList");
		fruitListModel = fruitList.listModel;
		orange = fruitList.at(2);
		screen.update();
	}

	DMBModel {
		id: dmbModel
	}

	Component.onCompleted: function() {
		test();
	}

	Screen01 {
		id: screen
	}

}

