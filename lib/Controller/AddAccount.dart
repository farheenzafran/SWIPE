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

class AddAccount extends StatefulWidget {
 // const AddAccount({Key? key}) : super(key: key);
  AddAccount() : super();

  @override
  addacountState createState() => addacountState();
}

class addacountState extends State<AddAccount> {
  late String countryCode;
  late String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: ListView(
        children: [
          // child:
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              addAccountHeader(),
              addButton(),
            ],
          ),
        ],
      )),
    );
  }

//<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
  addAccountHeader() {
    return Container(
        height: 200,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        //color: const Color(0xDEB46FEA),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("asset/images/background.png"),
          fit: BoxFit.cover,
        )),
        child: Column(children: [


              Container(
                alignment: Alignment.topRight,
                child:
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Icons.settings;
                  },
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),


       Row(
              mainAxisSize: MainAxisSize.min,
              children:[
                Container(
                    margin: EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffECDCFF)),

                    child:
                    // Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    Text('Admin Account: Hannah',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                          color: Colors.black, //font color
                          fontStyle: FontStyle.italic
                      ),


                    )
                  //   ],
                  // )




                ),

              ]

          ),
          addButton(),

        ])

        //  ),
        );
  }

  addButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAccount()),);
        },
          child: Image.asset('asset/images/addaccount.png',
              width: 50.0, height: 50.0),

      ),

    );
  }

//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
