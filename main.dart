import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home.dart';

void main() => runApp(MaterialApp(
      home: F(),
      debugShowCheckedModeBanner: false,
    ));

class F extends StatefulWidget {
  @override
  _fState createState() => _fState();
}

class _fState extends State<F> {
  var pages = [
    PageViewModel(
      title: "U need to refresh your mind before the studying ?",
      body: "I'm producing this app for u ",
      image: Center(
          child: Image.asset(
        "assets/c3.jpg",
        height: 240,
      )),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
          pageColor: Color(0xFF192A56),
          bodyTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 19,
          )),
    ),
    PageViewModel(
      title: "Look !!",
      body: "U just sum the digits until getting only one digit ..",
      image: Center(
          child: Image.asset(
        "assets/c4.jpg",
        height: 230,
        width: 300,
      )),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        pageColor: Color(0xFF192A56),
        bodyTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
    PageViewModel(
      title: "For example ..",
      body:
          "the sum of digits is equal to 22 , so we have to repeat the sum to get 4 ..that's so funny  ",
      image: Center(
          child: Image.asset(
        "assets/c2.jpg",
        height: 240,
        width: 300,
      )),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
          pageColor: Color(0xFF192A56),
          bodyTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 19,
          )),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
        onSkip: () {},
        showSkipButton: false,
        skip: const Icon(Icons.skip_next),
        next: const Icon(Icons.forward),
        done: const Text("Done",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 15)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.blueGrey,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
