import 'package:flutter/material.dart';
import 'package:test_flutter_001/views/data/notifiers.dart';


class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(valueListenable: pageIndexNotifier,
        builder: (context, int selectedPage, child) {
            return NavigationBar(
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
                NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
              ],
              selectedIndex: selectedPage,
              onDestinationSelected: (int index) {
                pageIndexNotifier.value=index;
              },
            );
    });
  }
}
