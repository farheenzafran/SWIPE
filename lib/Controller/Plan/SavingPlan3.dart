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
import 'package:swipeapp/Controller/Plan/AddNewPlan2.dart';
import 'package:swipeapp/Controller/Plan/PlanGoal4.dart';
import 'package:swipeapp/Controller/Spend/SpendNewBudget.dart';
import '../../Model Helper.dart';
import '../Account/AddMember.dart';
import '../PlaidData/BankData.dart';
import '../Request/AccessTokenRequest.dart';
import '../Request/InstitutionRequest.dart';
import '../Request/LiabilityRequest.dart';
import '../Request/SaveGoalBankdataRequest.dart';
import '../Request/TokenResquest.dart';
import '../Request/TransactionRequest.dart';
import '../Response/AccessTokenResponse.dart';
import '../Response/GoalBankDataResponse.dart';
import '../Response/InstitutionResponse.dart';
import '../Response/LiabilityResponse.dart';
import '../Response/LinkTokenResponse.dart';
import '../Response/TransactionResponse.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import '../Response/UserDeatail.dart';
import '../PlaidData/creditBankdata.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class SavingPlan3 extends StatefulWidget {
 var nameholder;
  SavingPlan3({Key? key, required  this.nameholder}) : super(key: key);
  @override
  savingplanState createState() => savingplanState();
}

class savingplanState extends State<SavingPlan3> {

  final amountinput = TextEditingController();
  final  dateInput = TextEditingController();
  late LinkTokenConfiguration _linkTokenConfiguration;
  void initState() {
    dateInput.text = ""; //set tshe initial value of text field
    super.initState();
    main();
  }
  String dollar = " \$";
  late String a_associate;
  late int tamount;
  late String goaldate;
  bool _validate = false;
  bool _validate1 = false;
  late String dateformat;
  late String nowformattedDates;
  late String formattedDate;
  late String f;
  late double calculate =0.0;
  late double enteredNumber =0.0;
  late double calculate2;
  double result = 0.0;
  final numberFormat = NumberFormat("#,##0.00", "en_US");

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
        height: 70,
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
            child:
            Container(
          color: const Color(0xffF7F6FA ),
  padding: EdgeInsets.all(0),
  margin: const EdgeInsets.only( left:20,top: 15,right: 10),
  alignment: Alignment.topRight,
  height: 50,
  width: 160,
  child: TextField(
  controller: amountinput,
  style: TextStyle(fontSize: 16.0,  color: Colors.black , fontWeight: FontWeight.w600),
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
  decoration: InputDecoration(

  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  // border: OutlineInputBorder(),
   labelText: dollar,
    errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                color: const Color(0xffF7F6FA ),
                padding: EdgeInsets.all(0),
                margin: const EdgeInsets.only( left:20,top: 15,right: 10),
                height:  55,//MediaQuery.of(context).size.width / 3,
                width: 180,
              //  child: Center(
                    child: TextField(
                      controller: dateInput,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Date", //label text of field
                        errorText: _validate1 ? 'Value Can\'t Be Empty' : null,
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
                          formattedDate = DateFormat('MMM-dd-yy').format(pickedDate);
                          dateformat = DateFormat('yyyy-MM-dd').format(pickedDate);
                          final date1 = DateTime.now();
                          final date2 = dateformat;
                          final date3 = DateTime.parse(date2);
                          final difference = date3.difference(date1);
                          final  monthDiff = (difference.inDays / 30).floor();
                           enteredNumber = double.tryParse(amountinput.text)!;
                          final cal = (enteredNumber/monthDiff) ;
                          // calculate = cal;
                          if(monthDiff== 0)
                            {
                              calculate = enteredNumber;
                            }
                          else {
                            calculate = cal;
                          }
                          print('monthDiff $monthDiff');
                          print(difference);
                          print(calculate);
                          print("print>>>>>>>>>qwqwqwq");
                          print(dateformat);
                          print(pickedDate);
                          print("print>>>>>>>>>");
                         // now = DateTime.now() as String;
                         // calculate = now+dateformat;

                          setState(() {
                            dateInput.text = dateformat; //set output date to TextField value.
                          });



                        } else {}
                      },
                    ))),
        //  ),



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

    child:
  Text(dollar+ numberFormat.format(calculate),
    //Text(dollar + calculate.toStringAsFixed(2),
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
          color:  amountinput.text.isEmpty && dateInput.text.isEmpty
              ? Colors.grey
              : const Color(0xFFA781D3),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            //color: const Color(0xFFA781D3),
          )),
      child: TextButton(
        style: TextButton.styleFrom(

        //  backgroundColor: const Color(0xFFA781D3),
          padding: const EdgeInsets.all(5),
        ),

        onPressed: () {
          setState(() {
            amountinput.text.isEmpty ? _validate = true : _validate = false;
            dateInput.text.isEmpty ? _validate1 = true : _validate1 = false;
          });

         tamount =  amountinput.value.text.length;
         goaldate = dateInput.value.text.toString();
         // GoalData(name, a_associate, tamount, goaldate);


          if( _validate == false && _validate1 == false )
          {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => PlanGoal()),
            // );
            _sendDataToSecondScreen2(context);
          }
          else
          {
            print("all filled");
          }


          // GoalData(name , a_associate,tamount,goaldate)..onError((error, stackTrace) => Future.error(error.toString(), StackTrace.current))
          //    .then((value) => Navigator.push(context, MaterialPageRoute(
          //    builder: (_) => PlanGoal()),));
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

  void _sendDataToSecondScreen2(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlanGoal4(
                 pamount: amountinput.text,
                 pdate : dateformat,
                 pname: widget.nameholder,




            ))
    );
    print(amountinput);
    print(dateInput);
    print(widget.nameholder);
    print("saving#############");

  }

  void main() {
  }

//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
