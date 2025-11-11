
import 'package:flutter/cupertino.dart';

class NumberListProvider extends ChangeNotifier{

  List<int> data=[0];

  void addNumber(){
    
    data.add(
        data.elementAt(data.length-1)+1
    );
    notifyListeners();
  }

}