import 'package:flutter/material.dart';
import 'package:test_flutter_001/views/data/notifiers.dart';



class EndDrawerWidget extends StatefulWidget {
  const EndDrawerWidget({super.key});

  @override
  State<EndDrawerWidget> createState() => _EndDrawerWidgetState();
}

class _EndDrawerWidgetState extends State<EndDrawerWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder(valueListenable: pageIndexNotifier,
          builder: (context, int selectedPage, child) {

              return Drawer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Header
                    Container(
                      width: double.infinity,
                      color: Colors.purple,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.person, color: Colors.white, size: 50),
                          SizedBox(height: 8),
                          Text(
                            "Ashikur Rahman",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),

                    Divider(),

                    // 🔹 Menu items
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                      onTap: () {
                        pageIndexNotifier.value=0;
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                      onTap: () {
                        pageIndexNotifier.value=1;
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Settings"),
                      onTap: () {
                        pageIndexNotifier.value=2;
                        Navigator.pop(context);
                      },
                    ),


                    Spacer(),

                    // 🔹 Bottom section
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Logout"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "App Version 1.0.0",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              );
          }),
    );
  }
}
