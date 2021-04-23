import 'package:flutter/material.dart';
import 'package:personal_doctor/empty_screen.dart';
import 'package:personal_doctor/symptoms_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  CurrentIndex currentIndex = new CurrentIndex();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrentIndex>(
      create: (_)=>currentIndex,
      child: Consumer<CurrentIndex>(
        builder: (BuildContext context, value, Widget widget){
          return MaterialApp(
            title: 'Symptoms',
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

List<Widget> screens = [
  Empty(),
  SymptomsScreen(),
  Empty(),
  Empty(),
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.medical_services,
                color: Colors.black,
              ),
              title: Text(
                "Symptoms",
                style: TextStyle(color: Colors.black),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              title: Text(
                "Medication",
                style: TextStyle(color: Colors.black),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              title: Text(
                "Reports",
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
    );
  }
}
