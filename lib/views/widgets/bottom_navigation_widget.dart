import 'package:flutter/material.dart';


class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return  NavigationBar(
      destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          selectedIndex=index;
        });
        // Handle a tap on a tab.
      },
    );
  }
}
