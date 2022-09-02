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

class TransactionDetail extends StatefulWidget {
  // const AddAccount({Key? key}) : super(key: key);
  @override
  tacountState createState() => tacountState();
}
class tacountState extends State<TransactionDetail> {
  String dollar = " \$";
  @override
  Widget build(BuildContext context) {
 final todo = ModalRoute.of(context)!.settings.arguments as List<Transactions>;
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
                height: 360.0,
                margin: EdgeInsets.only(top: 20 , right: 15, left: 15),
                child: Stack(
                  //child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: todo.length,
                        itemBuilder: (context, int i) {
                          return
                            Card(color: const Color(0xffF7F6FA),
                            child:
                            Container(
                              width: double.infinity,
                              height: 80.0,
                              margin: const EdgeInsets.only(
                                  right: 9, left: 9),

                              child: ListTile(
                                  contentPadding: EdgeInsets.only(
                                      left: 10.0, right: 0.0),
                                  leading: CircleAvatar(
                                    radius: 20,
                                    child: Image(
                                      image: AssetImage("asset/images/cart.png"),
                                      //width: 40,
                                      //color: const Color(0xffECDCFF)
                                    ),
                                  ),
                                  title: Text(
                                    todo[i]
                                        .name
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight:
                                        FontWeight.w600),
                                  ),
                                  subtitle:
                                  Text(
                                    todo[i]
                                        .category
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.w600),
                                  ),

                                  trailing:
                                  Padding(
                                    padding: EdgeInsets.only(top:5),
                                    child:     Column(
                                        children: <Widget>[
                                          Padding(
                                            padding:EdgeInsets.only(top:3, bottom: 3),
                                            child:
                                            Text(dollar+ todo[i].amount.toStringAsFixed(2),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                          ),


                                          Text(  todo[i].date.toString(),

                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.w500),
                                          ),
                                        ]),

                                  )



                              ),


                            ),




                          );
                        }
                      // );
                      // }
                      //},
                    ),
                  ],
                ),
              ),

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


//-------
}


