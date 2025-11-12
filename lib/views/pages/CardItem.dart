
import 'package:flutter/material.dart';
import '../widgets/TextStyledWidget.dart';


class CardItem extends StatelessWidget {
  final dynamic title;

  final dynamic description;

  const CardItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Card(
          margin: EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(title))
                );
              },
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyledWidget.titleTextStyle,),
                  Text(description,style: TextStyledWidget.descriptionTextStyle,)
                ],
              ),
            ),
          ),

        ),
      );
  }
}
