import 'package:flutter/material.dart';
import 'package:personal_doctor/selection_screen.dart';
import 'package:personal_doctor/severity_level_screen.dart';
import 'package:provider/provider.dart';

class CurrentIndex extends ChangeNotifier{
  int currentIndex;

  CurrentIndex(){
    currentIndex = 0;
  }

  update(int value){
    currentIndex = value;
    notifyListeners();
  }

}

class SymptomsScreen extends StatefulWidget {
  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {

  List<Widget> _screens = [
    SelectionScreen(0),
    SeverityScreen('Fatigue', ['Able to do most Activities','In Bed Less Than 50% of the day','In Bed more Than 50% of the day'], false,true),
    SeverityScreen('Fatigue', ['Able to do most Activities','In Bed Less Than 50% of the day','In Bed more Than 50% of the day'], true,false),
    SeverityScreen('Vomiting', ['Vomited once during the day','Vomited 2-5 times during the day','Vomited 6 or more times during the day'], true,false)
  ];
  
  @override
  Widget build(BuildContext context) {

    CurrentIndex currentIndex = Provider.of<CurrentIndex>(context);

    return Scaffold(
      body: SafeArea(
        child: _screens[currentIndex.currentIndex],
      ),
      backgroundColor: Color(0xffF8F8F8),
    );
  }
}
