import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipeapp/Controller/Dashboard.dart';
import 'Controller/LoginScreen.dart';
import 'dart:async';


void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MyHomePage()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'Splash Screen',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  get color => null;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white
        //  gradient: LinearGradient(colors: [Color(0xffb46fea), Color(0xff9E3D57) ,Color(0xff9F60D0)])

      ),
     child: Align(
        alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
       // child: Text('SWIPE', style: TextStyle( foreground: Paint()..shader = linearGradient, fontSize: 25.0),),
       child: Image(
         image: AssetImage("asset/images/Swipe.png"),
         width: 100,
         height: 80,
       ),
      ),








    );

  }
}
final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xffb46fea), Color(0xff9E3D57) ,Color(0xff9F60D0)  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));