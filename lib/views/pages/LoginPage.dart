
import 'package:flutter/material.dart';

import '../widget_tree.dart';
import '../widgets/TextStyledWidget.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailEditingController;
  late final TextEditingController passEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailEditingController= TextEditingController();
    passEditingController= TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEditingController.dispose();
    passEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          leading: Icon(Icons.login, color: Colors.white),

          backgroundColor: Colors.purple,
        ),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: emailEditingController,
                decoration: InputDecoration(
                hintText: "Enter Email",
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                )
          ),
                onEditingComplete: (){
                  setState(() {
                  });
                },
              ),
              SizedBox(height: 8),
              TextField(
                controller: passEditingController,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)
                  )
                ),
              ),
              SizedBox(height: 8),
              FilledButton(onPressed: (){
                if(emailEditingController.text.isEmpty||passEditingController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all fields"))
                  );
                }else{
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return WidgetTree();
                    },
                  ));
                }


              }, child: Text("Login" ,style: TextStyledWidget.titleTextStyleWhite),
                  style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity,40.0)
                  ))
            ],
          ),),
    );
  }
}
