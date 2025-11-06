import 'package:flutter/material.dart';
import 'package:test_flutter_001/views/pages/home.dart';
import 'package:test_flutter_001/views/widget_tree.dart';
import 'package:test_flutter_001/views/widgets/TextStyledWidget.dart';
import 'package:test_flutter_001/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'LoginPage.dart';




class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Lottie.asset(
                'assets/lottie/FlutterLogo.json',
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30,right: 20,left: 20),
            child: Column(
              children: [
                FilledButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return WidgetTree();
                      },
                    ));
                  },
                  child: Text("Register"),
                  style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 40.0)
                  ),
                ),
                SizedBox(height: 10,),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ));
                  },
                  child: Text("Login",style: TextStyledWidget.titleTextStyle,),
                  style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 40.0)
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ],
      )
      ,
    );
  }
}
