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
import 'package:swipeapp/Controller/Request/SaveBankDataRequest.dart';
import 'package:swipeapp/Controller/Request/SaveGoalBankdataRequest.dart';
import 'package:swipeapp/Controller/Response/GoalBankDataResponse.dart';
import '../Model Helper.dart';
import 'AddMember.dart';
import 'BankData.dart';
import 'Dashboard.dart';
import 'Request/AccessTokenRequest.dart';
import 'Request/InstitutionRequest.dart';
import 'Request/LiabilityRequest.dart';
import 'Request/TokenResquest.dart';
import 'Request/TransactionRequest.dart';
import 'Response/AccessTokenResponse.dart';
import 'Response/GoalGetBankDataResponse.dart';
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
class PlanAccount extends StatefulWidget {
  const PlanAccount({Key? key}) : super(key: key);

  @override

planacountState createState() => planacountState();
}

class planacountState extends State<PlanAccount> {

  Future<List<getGoalResult>> goalGetBankData() async {
    UserDetail tempuserdetail = await Constants.getUserDetail();
    String accessToken = tempuserdetail.accessToken.toString();
    final response2 = await http.get(Uri.parse(Constants.baseUrl2 + '/Goal/GetBankData'),
        headers: <String, String>{
          'Content-Type': 'application/json', 'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken',});
    print(accessToken);
    print("responseprint>>>>>>>>>>>>>");
    print(response2);
    print("bodyyyyyyyyyyyyyyyyy>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<");
    print(response2.body);
    print(">>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<");
    print(response2.statusCode);
    print(">>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<");

    if (response2.statusCode == 200) {
     // return GoalGetBankdataResponse;
     // return GoalGetBankdataResponse.fromJson(jsonDecode(response2.body));
      GoalGetBankdataResponse getGoalResponse = GoalGetBankdataResponse.fromJson(jsonDecode(response2.body));
       return getGoalResponse.result!;
    }
    else
    {
      throw Exception('Failed to call user childuserid .');
    }
  }

  String dollar = " \$";
  late String name;
  late String a_associate;
  late int tamount;
  late String goaldate;
  late Future<GoalGetBankdataResponse> datalist ;//= [] as Future<List<ChildDataResult>>;
  void initState()  {
    super.initState();

  }
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

                    addButton(),
                   // dcButton(),


                  ]
                ),

            )
        )

      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
  addAccountHeader() {

    return Container(
        height: 120,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        //color: const Color(0xDEB46FEA),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/background.png"),
              fit: BoxFit.cover,
            )),
        //child: Align(alignment: Alignment.center,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children:[
                    Container(
                        margin: EdgeInsets.all(8),
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0x75f5f5f5)),
                        child:
                        // Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        Text(
                          'Admin Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                              color: Colors.white,
                              fontWeight: FontWeight.bold//font color
                          ),


                        )
                      //   ],
                      // )




                    ),

                  ]

              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [

                      Text(
                      "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                            color: Colors.white, //font color
                            fontStyle: FontStyle.italic
                        ),

                      ),

                      Text(
                        'SAVING',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Column(
                    children: [

                      Text(
                        "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                            color: Colors.white, //font color
                            fontStyle: FontStyle.italic
                        ),

                      ),

                      Text(
                        'TO GO',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                          color: Colors.white, //font color
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,

                        ),

                      ),

                      Text(
                        'TOTAL',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ]),
            Image.asset(
              "asset/images/downarrow.png", // width: 300,
              height: 20,
              width: 20,
              alignment: Alignment.center,
            ),

          ],
        )


      //  ),
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

                           // GoalData(name , a_associate,tamount,goaldate)..onError((error, stackTrace) => Future.error(error.toString(), StackTrace.current))
                           //    .then((value) => Navigator.push(context, MaterialPageRoute(
                           //    builder: (_) => AddNewplan()),));
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => AddNewplan()),
                          );
                        },
                        child: Image(
                          image: AssetImage("asset/images/Plus.png"),
                          width: 130,
                          height: 130,
                        ),
                      ),
                      Text('Add a new plan'),

                    ],
                  ));

  }
  dcButton() {
    return Container(
      height: 38,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10, bottom: 20.0, left: 25, right: 25),
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

goalGetBankData();
          setState(() {
          });

         // Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()),);
          // ));

        },
        child: Text(
          'Move to Dashboard',
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
Future<GoalBankdataResponse> GoalData(  String name ,String accountassociate , int totalamount , String goaldate ) async {
  SaveGoallBankdataRequest saveGoallBankdataRequest = SaveGoallBankdataRequest();
  UserDetail tempuserdetail = await Constants.getUserDetail();
  saveGoallBankdataRequest.name = name;
  saveGoallBankdataRequest.accountassociate= accountassociate;
  saveGoallBankdataRequest.totalamount= totalamount;
  saveGoallBankdataRequest.goaldate= goaldate;
  // saveGoallBankdataRequest.id = tempuserdetail.id;
  // saveGoallBankdataRequest.createdon= createdon;
  // saveGoallBankdataRequest.createdby= create;
  print(">>>>>>>>>??????/");
  print("____________??????????????<<<<<<<");
  //------------->>>>>>>>>>.
  String accesstoken = tempuserdetail.accessToken.toString();
  print('<<<<<<<<<<<<<<Request body----->>>>>>>>>>>>: ${jsonEncode(saveGoallBankdataRequest)}');
  final response = await http.post(Uri.parse(Constants.baseUrl2 + '/Goal/SaveGoal'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'Accept': 'application/json',
        'Authorization': 'Bearer $accesstoken',
      },
      body: jsonEncode(saveGoallBankdataRequest));
  print("plannn&&&&&&&&&&??????????????<<<<<<<");
  print(response);
  print(response.body);
  print(response.statusCode);
  print("&&&&&&&&&&??????????????<<<<<<<");
  if (response.statusCode == 200) {
    print('####manage account Response <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${jsonEncode(response)}');

    // return GoalBankdataResponse.fromJson(jsonDecode(response.body));
    GoalBankdataResponse goalResponse = GoalBankdataResponse.fromJson(jsonDecode(response.body));
    return goalResponse;
  } else {
    throw Exception('Failed to call user adduserid .');
  }
}
