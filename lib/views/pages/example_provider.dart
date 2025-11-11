import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_001/views/data/number_list_provider.dart';
import 'package:test_flutter_001/views/pages/CardItem.dart';

class ExampleProvider extends StatefulWidget {
  const ExampleProvider({super.key});

  @override
  State<ExampleProvider> createState() => _ExampleProviderState();
}

class _ExampleProviderState extends State<ExampleProvider> {
  @override
  Widget build(BuildContext context) {

    return Consumer<NumberListProvider>(

      builder: (BuildContext context, NumberListProvider value, Widget? child) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                  "Provider State Management",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),

                backgroundColor: Colors.purple,
                iconTheme: const IconThemeData(
                  color: Colors.white, // Change back button color here
                )
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                  value.addNumber();
              },
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add,color: Colors.white,),
            ),
            body:   Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
              child: ListView.builder(
                  itemCount: value.data.length,
                  itemBuilder: (context,index){
                    return CardItem(
                      title: "Id: "+value.data.elementAt(index).toString(),
                      description: "Size: "+ value.data.length.toString(),
                    );
                  }),

            )

        );
      }

    );
  }
}
