import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ashik",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          brightness: Brightness.light
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ashikur Rahman ",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),),
          leading: Icon(Icons.person , color: Colors.white),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Row(
                children: const [
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
                  ),
                  SizedBox(width: 6), // small space between text and icon
                  Icon(Icons.logout ,color: Colors.white),
                ],
              ),
            ),
          ],
          backgroundColor: Colors.deepPurple,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar:
        NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
            NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
          ],
          selectedIndex: 0,
          onDestinationSelected: (int index) {
            // Handle a tap on a tab.

          },
        ),
      ),
    );
  }
}