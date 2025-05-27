import 'dart:math';
import 'package:flutter/material.dart';

// This Function generates a random color, that later will be applied to the background of the screen
Color generateRandomColor({required Color backgroundColor}) {
  backgroundColor = Color(Random().nextInt(0xFFFFFF) | 0xFF000000);
  return backgroundColor;
}
