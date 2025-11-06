import 'package:flutter/material.dart';
import 'package:test_flutter_001/views/widgets/TextStyledWidget.dart';
import 'package:test_flutter_001/views/widgets/hero_widget.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.tittle});

  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
            HeroWidget(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("This is tittle",style: TextStyledWidget.titleTextStyle,),
                    Text("This is Description",style: TextStyledWidget.descriptionTextStyle,)
                  ],
                ),
            ),
          ),
        )

      ],
    ));
  }
}
