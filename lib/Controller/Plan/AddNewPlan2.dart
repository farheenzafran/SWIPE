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
import 'package:swipeapp/Controller/Plan/SavingPlan3.dart';
import '../../Model Helper.dart';
import '../Account/AddMember.dart';
import '../PlaidData/BankData.dart';
import '../Request/AccessTokenRequest.dart';
import '../Request/InstitutionRequest.dart';
import '../Request/LiabilityRequest.dart';
import '../Request/TokenResquest.dart';
import '../Request/TransactionRequest.dart';
import '../Response/AccessTokenResponse.dart';
import '../Response/InstitutionResponse.dart';
import '../Response/LiabilityResponse.dart';
import '../Response/LinkTokenResponse.dart';
import '../Response/TransactionResponse.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import '../PlaidData/creditBankdata.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddNewplan2 extends StatefulWidget {

  @override
  newplanState createState() => newplanState();
}

class newplanState extends State<AddNewplan2> {
 // final tController = TextEditingController();
  final tController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
           // children: [
           child:   Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  addAccountHeader(),
                  emailVerify(),
                addButton(),

              //  ],
             // ),
            ],

          )
          ),
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
  addAccountHeader() {
    return
      Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/background.png"),
              fit: BoxFit.cover,
            )),

        padding: EdgeInsets.only(top: 20, left: 15, bottom: 10),
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
            padding: const EdgeInsets.only(top: 20.0,left: 8 ),
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 15),

            child: SizedBox(
              child: Text(
                'I want to save for',
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.grey

                ),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 15 , right: 15),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: TextField(
              style: TextStyle(fontSize: 22.0,  color: Colors.black , fontWeight: FontWeight.normal),
              controller: tController,
  keyboardType: TextInputType.text,
  textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                errorText: _validate ? 'Value Can\'t Be Empty' : null,

                // border: OutlineInputBorder(),
              ),

            ) ,
          ),


        ],
      );

  }

  addButton() {
    return
      Align(
    child:  Container(
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
          tController.text.isEmpty ? _validate = true : _validate = false;
          //   tController.value.text.toString();
         // Navigator.push(context, MaterialPageRoute(builder: (context) => SavingPlan()),);
          if( _validate == false  )
          {

            _sendDataToSecondScreen(context);
          }
          else
          {
            print("all filled");
          }

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
      ),
    );
  }

  void _sendDataToSecondScreen(BuildContext context) {

    Navigator.push(context, MaterialPageRoute(builder: (context) => SavingPlan3(nameholder: tController.text),));
    print(tController.text);
    print(tController);
    print("<<<<<Last Btracket >>>>>>>>>>");
  }
//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
