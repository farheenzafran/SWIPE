import 'dart:async';
import 'dart:ui';
//import 'package:country_list_pick/country_list_pick.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:swipeapp/Controller/SignUp.dart';
import 'VerifyLogin.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen() : super();

  final String title = "Carousel Demo";

  @override
  CarouselDemoState createState() => CarouselDemoState();
}
class CarouselDemoState extends State<LoginScreen> {
  late CarouselSlider carouselSlider;
  int _current = 0;
  //List imageList<String> = [
  final List<String> imageList = [
        'asset/images/loginm1.png',
        'asset/images/loginm2.png',
        'asset/images/loginm3.png',
    //   'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ];

  // List<String> imageNames = [
  //  AssetImage('asset/images/Swipe.png'),
  //   Image(image: AssetImage('asset/images/Swipe.png')),
  //   Image(image: AssetImage('asset/images/Swipe.png')),
  //
  //   'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  //   'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  //   'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  // ];

  static get image => null;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
   return Material(
        type: MaterialType.transparency,
     child: Expanded(
      child:Container(
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
//-------------------

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Container(
            margin: EdgeInsets.all(15),
            child: CarouselSlider.builder(
              itemCount: imageList.length,
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 300,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                reverse: false,
                aspectRatio: 5.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),

              itemBuilder: (context, i, id){
                //for onTap to redirect to another screen
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white,)
                    ),
                    //ClipRRect for image border radius

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(image: AssetImage(imageList[i]),),
                    ),
                  ),
                  onTap: (){
                    var url = imageList[i];
                    _current = i;
                    print("@@@@@@@@@@@@@@#############&&&&&&&&&&&&&&&&&&&&&&&R%&&%%&##%");
                    print(url.toString());
                  },
                );
              },

            ),

          ),
    SizedBox(
    height: 20,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: map<Widget>(imageList, (index, url) {
    return Container(
    width: 10.0,
    height: 10.0,
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: _current == index ? Colors.grey : Colors.purple ,
    ),
    );
    }),
    ),
//-------------------

      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
      //  Text('Swipe'),
          Image(
            image: AssetImage("asset/images/swipelogin.png"),
            width: 100,
            height: 80,

          ),
      Padding(
        padding: const EdgeInsets.all(15.0),
     child: Column(
      children: <Widget>[
        Text('Welcome to the new generation of '
            'financial management app',style:  TextStyle(fontWeight: FontWeight.w400,
          fontSize: 13, foreground: Paint()..shader = linearGradient,
        ),textAlign: TextAlign.center,),
        Padding(
        padding: const EdgeInsets.only(top:50.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

          RaisedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerifyLogin()),
              );
            },child: Text("Login"),color: Colors.grey,
              padding: const EdgeInsets.only(right: 5),
            ),



            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                 gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xffb46fea), Color(0xb59e3d57) ,Color(0xff9f60d0)]),
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text(
                    'Signup',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )

          ],
        )
        ),

]
      ),
      ),
      ],
      ),
        ],
      ),
      ),
    )
    );
  }



}
final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xffb46fea), Color(0xff9E3D57) ,Color(0xff9F60D0)  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));