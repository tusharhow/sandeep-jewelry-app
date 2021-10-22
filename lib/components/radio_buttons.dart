import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
 
void main() {
  runApp(MyApp());
}
//void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyState createState() {
    return _MyState();
  }
}
 
class _MyState extends State<MyApp>
{
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[400],
            title: Text("Flutter RadioButton"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text("Male"),
                leading: Radio(
                  value: 1,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as int;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: Text("Female"),
                leading: Radio(
                  value: 2,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as int;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
            ],
          )
        )
    );
  }
}