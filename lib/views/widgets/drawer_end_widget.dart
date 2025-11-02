import 'package:flutter/material.dart';
import 'package:test_flutter_001/views/data/notifiers.dart';

import '../pages/settings.dart';



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
                child: ValueListenableBuilder(valueListenable: darkModeNotifier, builder: (context, bool darkMode, child) {
                  return Column(
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
                        leading: Icon(Icons.search),
                        title: Text("Search"),
                        onTap: () {
                          pageIndexNotifier.value=2;
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Settings"),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return SettingsPage(tittle: "Settings");
                          },),);
                          // pageIndexNotifier.value=2;
                          // Navigator.pop(context);
                        },
                      ),


                      Spacer(),


                      // 🔹 Bottom section
                      ListTile(
                        leading: Icon( darkModeNotifier.value ? Icons.dark_mode : Icons.light_mode,),
                        title: Text( darkModeNotifier.value ? "Dark" : "White",),
                        onTap: () {
                          // darkModeNotifier.value = !darkModeNotifier.value;
                          // Navigator.pop(context);
                        },
                          trailing: Transform.scale(
                            scale: 0.7, // 🔹 increase/decrease size (default = 1.0)
                            child: Switch(
                              value: darkModeNotifier.value,
                              onChanged: (value) {
                                darkModeNotifier.value = value;
                              },
                            ),
                          ),
                      ),
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
                  );
                }),
              );
          }),
    );
  }
}
