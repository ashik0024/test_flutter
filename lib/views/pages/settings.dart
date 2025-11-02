import 'package:flutter/material.dart';



class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.tittle});

  final String tittle;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
  bool swtOne = false;
  bool swtTwo = false;
  bool swtThree = false;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: Text(
              widget.tittle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            leading: Icon(Icons.settings, color: Colors.white),

            backgroundColor: Colors.purple,
          ),
          body:  Center(child: 
        Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child:   Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Setting One"),
                  Switch(
                    value: swtOne,
                    onChanged: (value) {
                      setState(() {
                        swtOne = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Setting Two"),
                  Switch(value: swtTwo, onChanged: (value){
                    setState(() {
                      swtTwo = value;
                    });
                  }),
                ],

              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Setting Three"),
                  Switch(value: swtThree, onChanged: (value){
                    setState(() {
                      swtThree = value;
                    });
                  }),
                ],

              )
            ]

        )),)
      );

  }
}
