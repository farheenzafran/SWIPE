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
import 'package:swipeapp/Controller/AddAccount.dart';
import 'package:swipeapp/Controller/Dashboard.dart';
import '../Model Helper.dart';
import 'BankData.dart';
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
import 'creditBankdata.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddMember extends StatefulWidget {

  @override
 newmemberState createState() => newmemberState();
}

class newmemberState extends State<AddMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  addAccountHeader(),
                  emailVerify(),
                  paymentButton(),
                ],
              ),
            ],

          )
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
  paymentButton() {
    return Container(
      height: 38,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15, bottom: 20.0, left: 25, right: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            //color: const Color(0xFFA781D3),
          )),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFFA781D3),
          padding: const EdgeInsets.all(5),
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAccount()),
          );
        },
        child: Text(
          'Invite Now',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  emailVerify()
  {
    return
      Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20.0,left: 8 , bottom: 10),
            alignment: Alignment.topLeft,

            child: SizedBox(
              child: Text(
                'Email or Phone Number ',
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black

                ),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 5,left: 8 , right: 15),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20),

            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Member Email or Phone Number ',
                //hintText: 'Enter Code',
              ),
            ) ,
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 20.0,left: 15 , bottom: 10),
            alignment: Alignment.topLeft,
            child: SizedBox(
              child: Text(
                'Name on Account ',
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black

                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5,left: 8 , right: 15),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name ',
                //hintText: 'Enter Code',
              ),
            ) ,
          ),
          Container(
            padding: EdgeInsets.only(top: 5,left: 8 , right: 15),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last Name ',
                //hintText: 'Enter Code',
              ),
            ) ,
          ),

        ],
      );

  }
  addAccountHeader() {
    return
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
            spacing: 100,
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
            // Container(
            //   alignment: Alignment.center,
            //   child:
              Text(
                'Add New Member',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.white,
                  // fontFamily: 'Ubuntu',
                ),
              ),
          //  )

          ],
        ),
        // color: Colors.purpleAccent,
      );
  }



//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
