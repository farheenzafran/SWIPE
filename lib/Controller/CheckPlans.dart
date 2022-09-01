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
import 'package:swipeapp/Controller/AddNewPlan.dart';
import 'package:swipeapp/Controller/Dashboard.dart';
import 'package:swipeapp/Controller/PlanAccount.dart';
import 'package:swipeapp/Controller/SavingPlan.dart';
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
class CheckPlans extends StatefulWidget {
  @override
  checkplanState createState() => checkplanState();
}

class checkplanState extends State<CheckPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  addAccountHeader(),
                  buttonsuccesful(),
                  textAccount(),
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
  goalText()
  {
    return
      Column(
        children: [
          Container(

            padding: const EdgeInsets.only(top: 20.0,left: 4, right: 4 , bottom: 20),
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 15),

            child: SizedBox(
              child: Text(
                'You are one the way approaching to your goals',
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                      color: const Color(0xFFA781D3),

                    ),




              ),
            ),
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
            MaterialPageRoute(builder: (context) => PlanAccount()),
          );
        },
        child: Text(
          'Check Your plans',
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

              Text("You are on the way approaching to your goal!",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: const Color(0xFFA781D3),
                // fontFamily: 'Ubuntu',
              ),),

            ),
            Container(
              padding: EdgeInsets.all(5),
              margin:  EdgeInsets.only(left: 16,right: 16, bottom: 20, top:12),
              child:Text("You’re set to save  per month in order to reach your goal  by Jan, 2023"
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
  buttonsuccesful()
  {
    return
      Container(
        color: Colors.white,
        child: Align(
          // alignment: Alignment.center,
          heightFactor: 2,
          child: Image.asset('asset/images/plan.png', width: 300.0, height: 150.0),
        ),


      );

  }

//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
