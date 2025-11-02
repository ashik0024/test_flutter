import 'package:flutter/material.dart';



class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.tittle});

  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(tittle));
  }
}
