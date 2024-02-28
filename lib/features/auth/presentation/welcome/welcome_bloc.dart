import 'package:flutter/material.dart';
import 'welcome.dart';

abstract class WelcomeBloc extends State<WelcomeScreen> {
  // Fields
  int selectedScreen = 0;
  bool isCheckBox = true;
  String dropdownValue = 'What data we collect?';
  List<String> dropdownMenu = <String>[
    'What data we collect?',
    'Nothing',
    'Connected wallet type',
  ];
}
