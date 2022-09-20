import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipeapp/Controller/Dashboard.dart';
import 'Controller/LoginScreen.dart';
import 'Model Helper.dart';
import 'dart:async';
import 'Controller/Test.dart';

void main() async{


  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),

      home: MyApp()));
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );

  }
}

class MyHomePage extends StatefulWidget {
  String LoginKey = "LoginKey";
  String LoginKey2 = "LoginKey2";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
late String existinguserid;
late String authenticated;
late String userauthenticated;
late String deviceName;
late String deviceToken;
late String countryCode;

class _MyHomePageState extends State<MyHomePage> {
  get color => null;
  @override
  void initState() {
    super.initState();
    _loadPf();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                landingPage(),
            )
        )
    );

  }

  _loadPf() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      authenticated = (prefs.getString(Constants.LoginKey) ?? "");
      userauthenticated = (prefs.getString(Constants.LoginKey) ?? "");
      //existinguserid = (prefs.(Constants.existinguserid) ?? "");
      deviceName = (prefs.getString(Constants.DevicName) ?? "");
      deviceToken = (prefs.getString(Constants.DeviceToken) ?? "");
      countryCode = (prefs.getString(Constants.CountryCode) ?? "");
    });
  }

  Widget landingPage(){
   // final value = Constants.read(Constants.LoginKey);
    if (authenticated != "") {
      print('llllllllllllllllllllllllllllllllllllllllllll');
      print(authenticated);
      return Dashboard();
    } else {
      return LoginScreen();//change to login again
    }
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