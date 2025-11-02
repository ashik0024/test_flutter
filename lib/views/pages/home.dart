import 'package:flutter/material.dart';
import 'package:test_flutter_001/views/widgets/hero_widget.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.tittle});

  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
            HeroWidget(),
        Text(tittle),
      ],
    ));
  }
}
