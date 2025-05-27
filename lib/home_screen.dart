import 'package:flutter/material.dart';
import 'utils/color_generator.dart';
import 'widgets/color_picker_dialog.dart';
import 'widgets/custom_circular_button.dart';

// Home Screen of the app, where the magic happens!
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Color _backgroundColor = Colors.white;
  Color _fontColor = Colors.black;

  bool _isMenuOpen = false;

  late AnimationController _controller;
  late Animation<Offset> _offset1;
  late Animation<Offset> _offset2;

  // Change the background color to a randomly generated one. If the generated color is black, change font color to white automatically for contrast
  void changeBackgroundColor() {
    setState(() {
      _backgroundColor = generateRandomColor(backgroundColor: _backgroundColor);
      _backgroundColor == Colors.black ? _fontColor = Colors.white : null;
    });
  }

  // Opens the custom color picker dialog and updates the background color. Also adjusts the font color automatically needed.
  void pickBackgroundColor() {
    showCustomColorPicker(
      context: context,
      currentColor: _backgroundColor,
      onColorSelected: (Color selectedColor) {
        setState(() {
          _backgroundColor = selectedColor;
          _backgroundColor == Colors.black ? _fontColor = Colors.white : null;
        });
      },
    );
  }

  // Toggle font color between black and white manually
  void changeFontColor() {
    setState(() {
      _fontColor = _fontColor == Colors.black ? Colors.white : Colors.black;
    });
  }

  // Open or close the floating menu
  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;

      _isMenuOpen ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    // Animation controller for the floating menu buttons
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // First and second buttons slide vertically
    _offset1 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.5),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _offset2 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -1.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeBackgroundColor,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Stack(
          children: [
            // Centered greeting text
            Center(
              child: Text(
                'Hello there!',
                style: TextStyle(fontSize: 24, color: _fontColor),
              ),
            ),
            // First floating button to change the font color
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: _isMenuOpen ? 145 : 20,
              right: 28,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isMenuOpen ? 1.0 : 0.0,
                child: CustomCircularButton(
                  icon: Icons.font_download,
                  size: 40,
                  onPressed: changeFontColor,
                ),
              ),
            ),
            // Second floating button to open color picker
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: _isMenuOpen ? 90 : 20,
              right: 28,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isMenuOpen ? 1.0 : 0.0,
                child: CustomCircularButton(
                  icon: Icons.color_lens,
                  size: 40,
                  onPressed: pickBackgroundColor,
                ),
              ),
            ),

            // Menu button to toggle floating options
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: CustomCircularButton(
                  icon: Icons.menu,
                  onPressed: _toggleMenu,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
