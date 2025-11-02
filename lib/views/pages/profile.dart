import 'package:flutter/material.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isSsc = false;
  bool isHsc = false;
  bool isBsc = false;
  bool isMsc = false;





  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Enter your name",
                    labelText: "Name",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 8),
              TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                      hintText: "Enter your address",
                      labelText: "Address",
                      border: OutlineInputBorder()
                  )
              ),
              SizedBox(height: 8),
              CheckboxListTile(value: isSsc,
                  title: Text("SSC"),
                  onChanged: (value){
                    setState(() {
                      isSsc=value!;
                    });
                  }),
              SizedBox(height: 4),
              CheckboxListTile(value: isHsc,   title: Text("HSC"), onChanged: (value){
                setState(() {
                  isHsc=value!;
                });
              }),
              SizedBox(height: 4),
              CheckboxListTile(value: isBsc,    title: Text("BSC"),onChanged: (value){
                setState(() {
                  isBsc=value!;
                });
              }),
              SizedBox(height: 4),
              CheckboxListTile(value: isMsc,   title: Text("MSC"), onChanged: (value){
                setState(() {
                  isMsc=value!;
                });
              }),
              OutlinedButton(
                onPressed:(){

                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.teal, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  fixedSize: Size(200, 50),// Text & icon color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),

                ),
                child: Text("Save", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              )
            ],
          ),
    ));

  }
}



