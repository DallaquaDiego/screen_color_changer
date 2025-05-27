import 'package:flutter/material.dart';

// This widget creates a dialog box that displays 35 options of color for the user to choose. After selection, the chosen color is applied to the background of the screen via the provided callback.
Future<void> showCustomColorPicker({
  required BuildContext context,
  required Color currentColor,
  required Function(Color) onColorSelected,
}) async {
  // List of 35 predefined color options, organized by hue
  final List<Color> colorOptions = [
    Colors.white,
    Colors.grey.shade300,
    Colors.grey.shade700,
    Colors.black,
    Colors.yellowAccent,
    Colors.yellow,
    Colors.amberAccent,
    Colors.amber,
    Colors.orangeAccent,
    Colors.orange,
    Colors.deepOrange,
    Colors.redAccent,
    Colors.red,
    Colors.pinkAccent,
    Colors.pink,
    Colors.purpleAccent,
    Colors.purple,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.blueAccent,
    Colors.blue,
    Colors.indigoAccent,
    Colors.indigo,
    Colors.blueGrey,
    Colors.lightGreenAccent,
    Colors.lightGreen,
    Colors.greenAccent,
    Colors.green,
    Colors.lime,
    Colors.cyanAccent,
    Colors.cyan,
    Colors.tealAccent,
    Colors.teal,
    Colors.brown.shade300,
    Colors.brown,
  ];

  // Show the color picker dialog
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          'Select your own color!',
          style: TextStyle(
            color: Color(0xFFD84315),
          ),
        ),
        // Centralized grid of color options
        content: SingleChildScrollView(
          child: Center(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: colorOptions.map((color) {
                return GestureDetector(
                  onTap: () {
                    // Close the dialog and return the selected color
                    Navigator.of(context).pop();
                    onColorSelected(color);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: currentColor == color
                            ? Colors.black
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      );
    },
  );
}
