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
class Spend extends StatefulWidget {
  const Spend({Key? key}) : super(key: key);

  @override
 spendacountState createState() => spendacountState();
}

class spendacountState extends State<Spend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child:
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      addAccountHeader(),
                      catogeriesType(),
                      addButton(),

                    ],
                  ),


              )
          )

      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
  addAccountHeader() {
    return
      Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/background.png"),
              fit: BoxFit.cover,
            )),

        padding: EdgeInsets.only(top: 20, left: 15, bottom: 25),
    child:    Column(
          children: [
            Text('Member', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
                ),
         Wrap(
              spacing: 100,
              children: <Widget>[
                // Container(
                // alignment: Alignment.center,
                //  child:
                Text(
                  'Spend',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white,
                    // fontFamily: 'Ubuntu',
                  ),
                ),
                // ),
                Text(
                  'Income',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white,
                    // fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ],
        )


        // color: Colors.purpleAccent,
      );
  }
  catogeriesType(){
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 40,
        width: 150,
        margin: EdgeInsets.only(top: 10, left: 15, bottom: 10),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffECDCFF)),
        child: Text(
          'Top categories',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  addButton() {
    return

      Container(
          height: 45,
          width: double.infinity,
          margin:
          EdgeInsets.only(top: 5, left: 15, bottom: 10, right: 15),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xffF7F6FA)),
          child: Row(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(5),

                ),
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()),);
                },
                child: Image(
                  image: AssetImage("asset/images/Plus.png"),
                  width: 130,
                  height: 130,
                ),
              ),
              Text('Add a new budget'),

            ],
          ));

  }


//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
