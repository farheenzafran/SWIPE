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
import 'package:intl/intl.dart';


class SavingPlan extends StatefulWidget {
  @override
  savingplanState createState() => savingplanState();
}

class savingplanState extends State<SavingPlan> {
  final Controller1 = TextEditingController();
  final Controller2 = TextEditingController();
  final Controller3 = TextEditingController();
  TextEditingController dateInput = TextEditingController();

  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }
  String dollar = " \$";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
          child:
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  addAccountHeader(),
                  emailVerify(),
                  addButton(),

                ],
              ),


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
          spacing: 80,
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
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.grey

                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child:Container(
          color: const Color(0xffF7F6FA ),
  padding: EdgeInsets.all(0),
  margin: const EdgeInsets.only( left:20,top: 15,right: 10),
  alignment: Alignment.topRight,
  height: 40,
  width: 160,
  child: TextField(
  controller: Controller1,
  style: TextStyle(fontSize: 16.0,  color: Colors.black , fontWeight: FontWeight.w600),
  decoration: InputDecoration(
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(13.0),
  ),
  // border: OutlineInputBorder(),
   labelText: dollar,
  //hintText: 'Enter Code',
  ),
  ) ,
  ),
          ),


          Container(
            padding: const EdgeInsets.only(top: 18.0,left: 8 , ),
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 15),

            child: SizedBox(
              child: Text(
                'I need it before',
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.grey

                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child:  Container(
                padding: EdgeInsets.all(15),
                height:  60,//MediaQuery.of(context).size.width / 3,
                width: 200,
                child: Center(
                    child: TextField(
                      controller: dateInput,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Date" //label text of field
                      ),
                      readOnly: true,
                      //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                    ))),
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
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.grey

                ),
              ),
            ),
          ),
Align(
  alignment: Alignment.topRight,
  child:
  Container(

    padding: EdgeInsets.all(0),
    margin: const EdgeInsets.only( left:20, right: 10),
    alignment: Alignment.topRight,
    height: 40,
    width: 160,

    child: Text(dollar+"0000",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          overflow: TextOverflow.ellipsis,
  color: const Color(0xFFA781D3),


      ),

    ) ,
  ),
)


        ],
      );

  }

  addButton() {
    return
      Align(
        heightFactor: 5,
   child:   Container(
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
    ));
  }


//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
