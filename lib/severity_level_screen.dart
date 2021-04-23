import 'package:flutter/material.dart';
import 'package:personal_doctor/network_manager.dart';
import 'package:personal_doctor/symptoms_page.dart';
import 'package:provider/provider.dart';

class SeverityScreen extends StatefulWidget {
  String title;
  List<String> options;
  bool update,next;


  SeverityScreen(this.title, this.options, this.update,this.next);

  @override
  _SeverityScreenState createState() => _SeverityScreenState();
}

enum Severity {FINE,BAD,WORSE}

class _SeverityScreenState extends State<SeverityScreen> {

  Severity _value = Severity.FINE;

  @override
  Widget build(BuildContext context) {

    final currentIndex = Provider.of<CurrentIndex>(context);
    NetworkManager networkManager = new NetworkManager();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    Text(
                      "Symptoms",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 0,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Text(
                    "More About ${widget.title}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(widget.options[0]),
                            leading: Radio<Severity>(
                              value: Severity.FINE,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(widget.options[1]),
                            leading: Radio<Severity>(
                              value: Severity.BAD,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(widget.options[2]),
                            leading: Radio<Severity>(
                              value: Severity.WORSE,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text("Any medication/comments"),
                          SizedBox(height: 16,),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Comment",border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    child: FlatButton(
                      color: Color(0xFFA5B2BE),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.arrow_back,color: Colors.white,),
                        Text("Previous",style: TextStyle(color: Colors.white),),
                      ],),
                      onPressed: (){},
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Container(
                    height: 48,
                    child: FlatButton(
                      color: Color(0xFF51C185),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: Text((widget.next)?"Next":"Update",style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        if(widget.next){
                          currentIndex.update(3);
                        }else{
                          currentIndex.update(0);
                          networkManager.postSymptoms();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}