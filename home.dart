import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 10;
  Timer _timer;
  int n = 0;
  String a;

  _ca() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Image.asset("assets/correct.png"),
              title: Text("Correct",
                  style: TextStyle(fontSize: 30, color: Colors.green)),
              elevation: 30.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              actions: <Widget>[
                RaisedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Try Again"),
                )
              ],
            ));
  }

  _ra() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Image.asset("assets/wrong.jpg"),
              title: Text("Wrong !!",
                  style: TextStyle(fontSize: 32, color: Colors.red)),
              elevation: 30.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              actions: <Widget>[
                RaisedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Try Again"),
                )
              ],
            ));
  }

  void _rand() {
    setState(() {
      n = new Random().nextInt(10000);
    });
  }

  void _startTimer() {
    _counter = 10;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    content: Text(
                      "Be faster ...",
                      style: TextStyle(
                          color: Color(0xFF192A56),
                          fontSize: 32,
                          fontStyle: FontStyle.italic),
                    ),
                    title: Text("Stop",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                    elevation: 30.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    actions: <Widget>[
                      RaisedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Try Again"),
                      )
                    ],
                  ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: new Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("assets/mo.jpg"), fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Eng / Mohamed Fawzy Elsaidy ",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 6.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.contact_mail),
                    Text(" mohamedelsaidy819@gmail.com ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 6.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.contact_phone),
                    Text(" 01141311395 ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: new AppBar(
          title: Text(
            "Mind++",
          ),
          backgroundColor: Color(0xFF192A56),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '00:$_counter ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  " $n",
                  style: TextStyle(fontSize: 40, color: Colors.blueGrey),
                ),
                new RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.green,
                    child: new Text(
                      "Start",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      _rand();
                      _startTimer();
                    }),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 40, right: 40, bottom: 10),
                  child: new TextField(
                    onChanged: (v) {
                      a = v;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter the final result (only on digit)",
                      labelText: "Enter your Answer quickly",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                new RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Color(0xFF192A56),
                    child: new Text(
                      "Answer",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    onPressed: () {
                      if (a == (n % 9).toString()) {
                        _ca();
                      } else {
                        _ra();
                      }
                    }),
              ],
            ),
          ],
        ));
  }
}
