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
import 'package:intl/intl.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:swipeapp/Controller/Account/ManageAccount2.dart';
import 'package:swipeapp/Controller/Request/AddUserRequest.dart';
import 'package:swipeapp/Controller/Response/AddUserResponse.dart';
import 'package:swipeapp/Controller/Response/ChildUserResponse.dart';
import 'package:swipeapp/Controller/Login/navbar.dart';
import '../../Model Helper.dart';
import 'BankData.dart';
import '../Dashboard.dart';
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
import '../Response/UserDeatail.dart';
import 'creditBankdata.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionDetail2 extends StatefulWidget {
 // TransactionDetail2(String payment, String accounttype, String category, String date);
  var text;
  var text2;
  var text3;
  var text4;
  DateTime now = DateTime.now();
  TransactionDetail2({
    Key? key,
    required this.text,
    required this.text2,
    required this.text3,
    required this.text4,

  }) : super(key: key);
  // const AddAccount({Key? key}) : super(key: key);
  @override
  tacountState2 createState() => tacountState2();
}
class tacountState2 extends State<TransactionDetail2> {
  String dollar = " \$";
  late int selectedIndex;
  String  dateformat = "";

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
              Container(
                width: double.infinity,
               // height: 360.0,
                margin: EdgeInsets.only(top: 20 , right: 15, left: 15, bottom: 17),
                child: Column(
                  //child: Column(
                  children: [
                    Text(
                   widget.text
                          .toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight:
                          FontWeight.w700),
                    ),

          Padding(padding: EdgeInsets.only(top: 8, bottom:8 ),
                        child:


                        Text(
                          //DateFormat.MMMMEEEEd().format(DateTime(widget.text2)),

                            widget.text2.toString(),
                          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight:
              FontWeight.w500),
        ),
                    ),
          Padding(padding: EdgeInsets.only( bottom:8 ),
            child:
                    Text(
                      widget.text3
                          .toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight:
                          FontWeight.w600),
                    ),
          ),
                    Text(
                      widget.text4
                          .toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight:
                          FontWeight.w600),
                    ),


                  ],
                ),

              ),
              listBox(),
            ],
          ),
        ),
      ),
    );

  }

  headerView() {
    return
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
              'Transaction Detail',
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

  listBox()
  {
    return
      Container(
        //color: Colors.yellow,
        //height: 420,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading:  Text( "Payment",

                style: TextStyle(
                    color:const Color(0xFFA781D3),
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w600),
              ),
              trailing:
              Text(
                widget.text
                    .toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w600),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            ListTile(
              leading:  Text( "Date",

                style: TextStyle(
                    color:const Color(0xFFA781D3),
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w600),
              ),
              trailing:
              Text(
                widget.text2
                    .toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w600),
              ),
            ),

            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            ListTile(
              leading:  Text( "Category",

                style: TextStyle(
                    color:const Color(0xFFA781D3),
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w700),
              ),
              trailing:
              Text(
                widget.text3
                    .toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w600),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            ListTile(
              leading:  Text( "Notes",

                style: TextStyle(
                    color:const Color(0xFFA781D3),
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w700),
              ),
              trailing:
              Text(
               "Add Notes"
                    .toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w600),
              ),
            ),
          ],

        ),


      );
  }
//-------
}


