import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:personal_doctor/severity_level_screen.dart';
import 'package:personal_doctor/symptoms_page.dart';
import 'package:provider/provider.dart';

List<bool> selected = [false, false];

class SelectionScreen extends StatefulWidget {

  var currentIndex;
  SelectionScreen(this.currentIndex);

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {

  @override
  Widget build(BuildContext context) {

    final currentIndex = Provider.of<CurrentIndex>(context);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, size: 30,),
                Text("Symptoms",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                SizedBox(width: 0,)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Text("Search & Add Your Symptoms",
                style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Search symptoms",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: FlatButton(
                      child: Text('Check', style: TextStyle(
                        color: (selected[0] || selected[1])
                            ? Color(0xFFFF0270)
                            : Color(0xFFA5B2BE),),),
                      disabledColor: Color(0xFFEAEFF4),
                      color: Color(0xFFFFE9E4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),),
                      onPressed: (selected[0] || selected[1]) ? () {
                        setState(() {
                          if(selected[0]){
                            selected[1]?currentIndex.update(1):currentIndex.update(2);
                          }else{
                            currentIndex.update(3);
                          }
                          selected = [false,false];
                        });
                      } : null,
                    ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 24.0),
              child: Text("Suggested symptoms"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SymptomsLabel('assets/fatigue.png', 'Fatigue', 0, () {
                  setState(() {
                    selected[0] = !selected[0];
                  });
                }),
                SymptomsLabel('assets/vomit.png', 'Vomit', 1, () {
                  setState(() {
                    selected[1] = !selected[1];
                  });
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SymptomsLabel extends StatefulWidget {

  String image, title;
  var index;
  Function onTap;

  SymptomsLabel(this.image, this.title, this.index, this.onTap);

  @override
  _SymptomsLabelState createState() => _SymptomsLabelState();
}

class _SymptomsLabelState extends State<SymptomsLabel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: selected[widget.index] ? Colors.blue.shade300 : Colors
                  .white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(widget.image),
                  Text(widget.title),
                ],
              ),
            )
        ),
      ),
    );
  }
}