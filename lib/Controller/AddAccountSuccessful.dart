
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
class AddAccountSuccessful extends StatefulWidget {

  @override
  addacountState createState() => addacountState();
}

class addacountState extends State<AddAccountSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
          //  children: [
              child:Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  addAccountHeader(),
                  buttonsuccesful(),
                  textAccount(),
                  paymentButton(),
                ],
              ),
            //],

          )
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
  paymentButton() {
    return
      Container(
        height: 38,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20, bottom: 20.0, left: 25, right: 25),
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

            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()),);
            // ));

          },
          child: Text(
            'Back to profile',
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
  buttonsuccesful()
  {
    return
  Container(
   child: Align(
     // alignment: Alignment.center,
     heightFactor: 2,

      child: Image.asset('asset/images/accadd.png', width: 300.0, height: 150.0),
    ),


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
  textAccount()
  {
    return
    Align(
   //   heightFactor: 6,
      child:
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            margin:  EdgeInsets.only(right: 15, left: 15),
            child:

            Text("You have sent the invitation to the account",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: const Color(0xFFA781D3),
              // fontFamily: 'Ubuntu',
            ),),

          ),
          Container(
            padding: EdgeInsets.all(5),
            margin:  EdgeInsets.only(left: 16,right: 16, bottom: 20, top:12),
            child:Text("Once the invited member accept your invitation, you can authorize the certain card for him."
              ,style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.grey,
                // fontFamily: 'Ubuntu',
              ),
            ),
          ),


        ],
      ),
    );

  }



//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>