
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipeapp/Controller/Request/MobileRequest.dart';
import 'package:swipeapp/Controller/Response/MobileResponse.dart';
import 'package:swipeapp/Controller/Response/UserDeatail.dart';
import 'package:swipeapp/Controller/Login/navbar.dart';
import 'package:swipeapp/main.dart';
import 'package:flutter/services.dart';
import '../../Model Helper.dart';
import '../PlaidData/Chart.dart';
import '../Dashboard.dart';
import 'package:http/http.dart' as http;
void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins')));
}
class OtpScreen  extends StatelessWidget {
  String phoneNumber;
  String countryCode;
  late String otpno;
  OtpScreen(this.phoneNumber, this.countryCode);
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/images/background.png"),
                    fit: BoxFit.cover,
                  )),

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
                    'Log in',
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
                  top: 20.0,left: 15 , bottom: 8),
              child: SizedBox(
                width: 230,
                child: Text(
                  'Enter the 6-digital code we sent overSMS to ' + phoneNumber,
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
               // keyboardType: TextInputType.number,
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
                child: TextButton(
                  onPressed: () {
                    otpno = otpController.value.text.toString();
                    otpLogin(phoneNumber, this.countryCode, otpno)
                        .onError((error, stackTrace) => Future.error(error.toString(), StackTrace.empty))
                        .then((value) => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => navbar()),
                    ));
                  },
                  style: TextButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),),

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
          ],
        ),
      ),

    );
  }
  //--

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
  print('objectobjectobjectobjectobjectobjectobjectobjectobjectobjectobject');
  print(jsonEncode(loginRequest));
  print(response6.body);
  if (response6.statusCode == 200) {
    UserDetail userDetail = UserDetail();
    var mresponse = MobileResponse.fromJson(jsonDecode(response6.body));
    userDetail.id = mresponse.result?.id;
    userDetail.firstName = mresponse.result?.firstName;
    userDetail.lastName = mresponse.result?.lastName;
    userDetail.email = mresponse.result?.email;
    userDetail.refreshToken = mresponse.result?.refreshToken;
    userDetail.expiration = mresponse.result?.expiration;
    userDetail.accessToken = mresponse.result?.accessToken;
    //saving user detail >>>>>.
    Constants.save(Constants.userDetailKey, jsonEncode(userDetail));

    return MobileResponse.fromJson(jsonDecode(response6.body));
  } else {
    throw Exception('Failed to call otp verification.');
  }
}
