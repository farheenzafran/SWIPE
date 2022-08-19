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
import 'package:swipeapp/Controller/PlanGoal.dart';
import '../Model Helper.dart';
import 'AddMember.dart';
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
class SavingPlan extends StatefulWidget {
  @override
  savingplanState createState() => savingplanState();
}

class savingplanState extends State<SavingPlan> {
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
                  addButton(),

                ],
              ),
            ],

          )
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
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

        padding: EdgeInsets.only(top: 20, left: 15,),
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
            Text(
              'Add a new plan',
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
      );
  }
  emailVerify()
  {
    return
      Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20.0,left: 8 , bottom: 20),
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 15),

            child: SizedBox(
              child: Text(
                'I want to save for',
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
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(right:12),

            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                // labelText: plan,
                //hintText: 'Enter Code',
              ),
            ) ,
          ),

          Container(
            padding: const EdgeInsets.only(top: 20.0,left: 8 , bottom: 20),
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 15),

            child: SizedBox(
              child: Text(
                'I need it before',
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
            margin: const EdgeInsets.only(right: 20, left: 20, top: 20),

            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                // labelText: plan,
                //hintText: 'Enter Code',
              ),
            ) ,
          ),

          Container(
            padding: const EdgeInsets.only(top: 20.0,left: 8 , bottom: 20),
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 15),

            child: SizedBox(
              child: Text(
                'My target monthly saving would be',
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
            margin: const EdgeInsets.only(right: 20, left: 20, top: 20),

            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                // labelText: plan,
                //hintText: 'Enter Code',
              ),
            ) ,
          ),

        ],
      );

  }

  addButton() {
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
            MaterialPageRoute(builder: (context) => PlanGoal()),
          );
        },
        child: Text(
          'Continue',
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


//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
