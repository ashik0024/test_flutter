import 'package:flutter/material.dart';
import 'package:test_flutter_001/views/data/notifiers.dart';
import 'package:test_flutter_001/views/pages/home.dart';
import 'package:test_flutter_001/views/pages/profile.dart';
import 'package:test_flutter_001/views/pages/search.dart';
import 'package:test_flutter_001/views/pages/settings.dart';
import 'package:test_flutter_001/views/widgets/bottom_navigation_widget.dart';
import 'package:test_flutter_001/views/widgets/drawer_end_widget.dart';



List<Widget> pages=[HomePage(tittle: "Home Page",),ProfilePage(),SearchPage(tittle: "Search Page")];


class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text(
          "Ashikur Rahman ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        leading: Icon(Icons.account_circle, color: Colors.white),

        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_open, color: Colors.white), // change to any icon
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        backgroundColor: Colors.purple,
      ),
      endDrawer: EndDrawerWidget(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   backgroundColor: Colors.deepPurple,
      //   child: const Icon(Icons.add),
      // ),
      body: ValueListenableBuilder(valueListenable: pageIndexNotifier, builder: (context,int selectedPage,child) {
        return pages.elementAt(selectedPage);
      },),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
