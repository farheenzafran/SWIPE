import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipeapp/Controller/Request/MobileRequest.dart';
import 'package:swipeapp/Controller/Response/MobileResponse.dart';
import 'package:swipeapp/main.dart';

import '../Model Helper.dart';
import 'Dashboard.dart';
import 'package:http/http.dart' as http;
void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins')));
}
class PhoneSignup extends StatelessWidget {
   String phoneNumber;
   String countryCode;
   late String otpno;

   PhoneSignup(this.phoneNumber, this.countryCode);

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();


   @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/images/background.png"),
                      fit: BoxFit.cover,
                    )),

                padding: EdgeInsets.only(top: 20, left: 15, bottom: 25),
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
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.white,
                       // fontFamily: 'Ubuntu',
                      ),
                    ),
                  ],
                ),
               // color: Colors.purpleAccent,
              ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, left: 15),

                     // child: Center(
                        child: Container(
                          child: Text(
                            'Enter Verification Code',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Ubuntu',
                            ),
                            textAlign: TextAlign.left,
                          ),
                          // padding: new EdgeInsets.all(15.0),
                        ),
                      ),
                   // ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,left: 15 , bottom: 8
                      ),
                      // child: Center(
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     child: Text('Please enter 4 digit number sent to you 569019838' ,
                      //       style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.black ,),),
                      //    // padding: new EdgeInsets.all(15.0),
                      //   ),
                      child: SizedBox(
                        width: 230,
                        child: Text(
                          'Enter the 6-digital code we sent overSMS to 123-456-789',
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,

                          ),
                        ),
                      ),
                    ),

              Padding(
                padding: EdgeInsets.only(top: 5,left: 15 , right: 15),
                child: TextField(
                  controller: otpController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Code',
                    hintText: 'Enter Code',
                  ),
                ) ,
              ),
              Container(
                  width: double.infinity,

                  margin: const EdgeInsets.only(
                      top: 15,  bottom: 5.0, left: 15, right: 15),

                  // Will take 50% of screen space
                  child: RaisedButton(
                    onPressed: () {
                      otpno = otpController.value.text.toString();

                       otpLogin(phoneNumber, this.countryCode, otpno)
                           .onError((error, stackTrace) => Future.error(error.toString(), StackTrace.empty))
                       .then((value) => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                       ));
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
                          'Continue',
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





              // FlatButton(
                    //   padding: EdgeInsets.zero,
                    //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //   height: 15,
                    //   minWidth: 15,
                    //   onPressed: (){
                    //   },
                    //   child: Text(
                    //     'Time:',
                    //     style: TextStyle(color: Colors.black, fontSize: 13 , fontWeight: FontWeight.w700),
                    //     textAlign: TextAlign.center,
                    //
                    //   ),
                    //
                    // ),
                 // ]),
                //),
             // ),
            ],
          ),
        ),

    );
  }
}
Future<MobileResponse> otpLogin( String mobilenumber, String countryCode,
    String otp) async {
  MobileRequest loginRequest = MobileRequest();
  loginRequest.countryCode = countryCode;
  loginRequest.mobileNumber = mobilenumber;
  loginRequest.deviceName = deviceName;
  loginRequest.deviceToken = deviceToken;
  loginRequest.otp = otp ;

  print("^^^^^^^^^^^^^^^Otp input");
  print(mobilenumber);
  print(deviceName);
  print(deviceToken);
  print(otp);
  final response6 = await http.post(Uri.parse(Constants.baseUrl2 + '/User/VerifyUser'),
      headers: <String, String>{'Content-Type': 'application/json', 'Accept': 'application/json',},
      body: jsonEncode(loginRequest));
  print('respose6 body-----: ${jsonEncode(response6.body)}');
  print(jsonEncode(loginRequest));
  print('objectobjectobjectobjectobjectobjectobjectobjectobjectobjectobject');
  print(response6.body);
  if (response6.statusCode == 200) {
    void dispose() {

      // super.dispose();
    }
    return MobileResponse.fromJson(jsonDecode(response6.body));
  } else {
    //void dispose() {
    // Loader.hide();

    // super.dispose();
    //}
    throw Exception('Failed to call opt verification.');
  }
}
//jhvfhkbvhkdfbhujvndfjknvdfhvjkfhd//jhvfhkbvhkdfbhujvndfjknvdfhvjkfhd//jhvfhkbvhkdfbhujvndfjknvdfhvjkfhd