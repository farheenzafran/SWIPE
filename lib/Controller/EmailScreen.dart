import 'dart:async';
import 'dart:async';
import 'dart:async';
import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:math' as math;
import 'dart:ui';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:swipeapp/Controller/ManageAccount.dart';
import 'package:swipeapp/Controller/Request/AddUserRequest.dart';
import 'package:swipeapp/Controller/Response/AddUserResponse.dart';
import 'package:swipeapp/Controller/Response/ChildUserResponse.dart';
import 'package:swipeapp/Controller/navbar.dart';
import '../Model Helper.dart';
import 'BankData.dart';
import 'Dashboard.dart';
import 'Request/AccessTokenRequest.dart';
import 'Request/InstitutionRequest.dart';
import 'Request/LiabilityRequest.dart';
import 'Request/TokenResquest.dart';
import 'Request/TransactionRequest.dart';
import 'Response/AccessTokenResponse.dart';
import 'Response/InstitutionResponse.dart';
import 'Response/LiabilityResponse.dart';
import 'Response/LinkTokenResponse.dart';
import 'Response/TransactionResponse.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'Response/UserDeatail.dart';
import 'creditBankdata.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  // const AddAccount({Key? key}) : super(key: key);

  @override
  emailacountState createState() => emailacountState();
}

class emailacountState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              headerView(),
              forgetLinkView(),
              textfeildView(),
              buttonloginView(),
              linkaccountButton()
            ],
          ),
        ),
      ),
    );

  }

  headerView() {
    return
      Container(
        height: 60,
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
      );
  }
  forgetLinkView()
  {
    return
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
      );
  }
  textfeildView()
  {
    return
      Padding(
        padding: EdgeInsets.only(top: 10 , left: 15 , right: 15 , bottom: 5),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User Name',
              hintText: 'Enter valid mail id as abc@gmail.com'
          ),
        ),
      );
  }
  buttonloginView()
  {
    return
      Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
              top: 15,  bottom: 5.0, left: 15, right: 15),// Will take 50% of screen space
          child: TextButton(
            // RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => navbar()),
              );
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: const EdgeInsets.all(0.0),
              );
            },

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

      );
  }
  linkaccountButton()
  {
    return
      Column(
        children: [
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
          TextButton(

            onPressed: () {

            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 15, right: 15),
            ),
            child: Image(
              image: AssetImage("asset/images/apple.png"),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 15, right: 15),
            ),
            onPressed: () {},
            child: Image(
              image: AssetImage("asset/images/google.png"),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(

              padding: const EdgeInsets.only(
                  bottom: 10.0, left: 15, right: 15),
            ),
            onPressed: () {},
            child: Image(
              image: AssetImage("asset/images/fb.png"),
            ),
          ),

        ],
      );
  }
//-------
}

