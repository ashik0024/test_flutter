import 'package:flutter/material.dart';
import 'package:test_flutter_001/views/pages/CardItem.dart';
import 'package:test_flutter_001/views/widgets/TextStyledWidget.dart';
import 'package:test_flutter_001/views/widgets/hero_widget.dart';



class HomePage extends StatelessWidget {
   HomePage({super.key, required this.tittle});

  final String tittle;
   final List<Item> items = [
     Item("News Feed", "Stay updated with trending stories and updates"),
     Item("Explore", "Discover new topics, creators, and communities"),
     Item("Bookmarks", "Save your favorite posts for quick access later"),
     Item("Events", "See upcoming events and local activities"),
     Item("Friends", "View your friend list and recent connections"),
     Item("Groups", "Join discussions and connect with people who share your interests"),
     Item("Marketplace", "Buy, sell, or exchange items in your area"),
     Item("Videos", "Watch recommended clips and live streams"),
     Item("Jobs", "Find work opportunities that match your skills"),
     Item("Settings", "Control notifications, privacy, and preferences"),
   ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(child: Column(
        children: [
              HeroWidget(),
              ...List.generate(items.length, (index){
                return CardItem(title: items.elementAt(index).title, description:items.elementAt(index).description);
              })
      
        ],
      )),
    );
  }
}
