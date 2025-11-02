import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.tittle});

  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Image.asset(
          'assets/images/testOne.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Text(tittle),
      ],
    ));
  }
}
