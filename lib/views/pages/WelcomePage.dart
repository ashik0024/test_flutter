import 'package:flutter/material.dart';
import 'package:test_flutter_001/views/pages/home.dart';
import 'package:test_flutter_001/views/widget_tree.dart';
import 'package:test_flutter_001/views/widgets/hero_widget.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          HeroWidget(),
          FilledButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WidgetTree();
            },),);
          }, child: Text("Login"))
        ],
      ),
    );
  }
}
