import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/services.dart';

import 'Dashboard.dart';


void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: EmailSignup()));
}

class EmailSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appTitle = 'Form Validation Demo';
    return Scaffold(
      // backgroundColor: const Color(0xff2a2a2a),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   titleSpacing: 10.0,
      //   centerTitle: true,
      //   leading: InkWell(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Container(
                height: 60,
                width: double.infinity,
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xdeb46fea), Color(0xb59e3d57) ,Color(
                          0xff9f60d0)]),
                ),

                padding: EdgeInsets.only(top: 20, left: 15, bottom: 20),
                child: Wrap(
                  spacing: 120,
                  children: <Widget>[
                    // Container(
                    // alignment: Alignment.center,
                    //  child:
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Icons.arrow_left;
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    // ),
                    Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.white,
                        // fontFamily: 'Ubuntu',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 15 , top: 20),
                child: Text(
                  'Forget password？Get a login link',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // ),
              Padding(
                padding: EdgeInsets.only(top: 10 , left: 15 , right: 15 , bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter valid mail id as abc@gmail.com'
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    top: 15,  bottom: 5.0, left: 15, right: 15),// Will take 50% of screen space
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xdeb46fea), Color(0xb59e3d57) ,Color(
                                0xff9f60d0)]),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )

              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, bottom: 15.0, left: 15, right: 15),
                child: Image(
                  image: AssetImage("asset/images/orline.png"),
                ),
                // Text('-     0r     -',
                //   style: TextStyle(color: Colors.purpleAccent,
                //        fontWeight: FontWeight.w500),),
              ),
              FlatButton(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 15, right: 15),
                onPressed: () {

                },
                child: Image(
                  image: AssetImage("asset/images/apple.png"),
                ),
              ),
              FlatButton(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 15, right: 15),
                onPressed: () {},
                child: Image(
                  image: AssetImage("asset/images/google.png"),
                ),
              ),
              FlatButton(
                padding: const EdgeInsets.only(
                    bottom: 10.0, left: 15, right: 15),
                onPressed: () {},
                child: Image(
                  image: AssetImage("asset/images/fb.png"),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
