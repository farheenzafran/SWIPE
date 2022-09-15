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
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:intl/intl.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:swipeapp/Controller/AddNewPlan.dart';
import 'package:swipeapp/Controller/ManageAccount.dart';
import 'package:swipeapp/Controller/Request/SaveBankDataRequest.dart';
import 'package:swipeapp/Controller/Request/SaveGoalBankdataRequest.dart';
import 'package:swipeapp/Controller/Response/GoalBankDataResponse.dart';
import '../Model Helper.dart';
import 'AddMember.dart';
import 'BankData.dart';
import 'Chart.dart';
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
  String dollar = " \$";
  late String name;
  late String a_associate;
  late String amount;
  late String goaldate;
  late Future<List<getGoalResult>> datalist ;

  Future<List<getGoalResult>> goalGetBankData() async {
    UserDetail tempuserdetail = await Constants.getUserDetail();
    String accessToken = tempuserdetail.accessToken.toString();
    final response2 = await http.get(Uri.parse('${Constants.baseUrl2}/Goal/GetBankData'),
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
      throw Exception('Failed to call user getgoalchilduserid .');
    }
  }


  LabelLayoutStrategy? xContainerLabelLayoutStrategy;
  late ChartData chartData;
  late double tValue = 0;
  ChartOptions chartOptions = const ChartOptions(
    labelCommonOptions: MyLabelCommonOptions(),

  );

  late var verticalBarChartContainer = VerticalBarChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy);

  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
    chartData = ChartData(
    //   dataRows:  [
    //     debitGraphdata,
    //     creditGraphdata,
    //   ],
    //   xUserLabels: graphbankname,

      dataRows: const [
        [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
        [0, 0, 0, 0, 0, -1800.0],
      ],
        xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
      dataRowsLegends: const ['Values', 'Values 2'],
      dataRowsColors: const [
        Colors.green,
        Colors.red,
      ],

      chartOptions: chartOptions,

    );
    verticalBarChartContainer = VerticalBarChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
    );
    datalist = goalGetBankData();

  }
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.white,
            child: SingleChildScrollView(
        child: Container(
           child:
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    addAccountHeader(),
                  //  savePlanList(),
                    showuserData(),
                    addButton(),
                   // dcButton(),


                  ]
                ),
        ),
            )
        )

      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
  addAccountHeader() {
    return   Flexible(
 child:Container(

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
                            color: const Color(0x54ecdcff)
                        ),
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
            // Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       Column(
            //         children: [
            //
            //           Text(
            //          "$dollar",
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //                 fontWeight: FontWeight.w700,
            //                 fontSize: 18, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
            //                 color: Colors.white, //font color
            //                 fontStyle: FontStyle.italic
            //             ),
            //
            //           ),
            //
            //           Text(
            //             'SAVING',
            //             style: TextStyle(
            //               fontWeight: FontWeight.w300,
            //               fontSize: 14,
            //               color: Colors.white,
            //             ),
            //             textAlign: TextAlign.left,
            //           ),
            //         ],
            //       ),
            //       Column(
            //         children: [
            //
            //           Text(
            //            "$dollar",
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //                 fontWeight: FontWeight.w700,
            //                 fontSize: 18, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
            //                 color: Colors.white, //font color
            //                 fontStyle: FontStyle.italic
            //             ),
            //
            //           ),
            //
            //           Text(
            //             'TO GO',
            //             style: TextStyle(
            //               fontWeight: FontWeight.w300,
            //               fontSize: 14,
            //               color: Colors.white,
            //             ),
            //             textAlign: TextAlign.left,
            //           ),
            //         ],
            //       ),
            //
            //       Column(
            //         children: [
            //           Text(
            //             dollar  ,
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               fontSize: 18, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
            //               color: Colors.white, //font color
            //               fontStyle: FontStyle.italic,
            //               fontWeight: FontWeight.w700,
            //
            //             ),
            //
            //           ),
            //
            //           Text(
            //             'TOTAL',
            //             style: TextStyle(
            //               fontWeight: FontWeight.w300,
            //               fontSize: 14,
            //               color: Colors.white,
            //             ),
            //             textAlign: TextAlign.left,
            //           ),
            //         ],
            //       ),
            //     ]),

            Container(
              //width: 80,
              child:
              ExpandableNotifier(  // <-- Provides ExpandableController to its children
                child: Column(
                  children: [
                    Expandable(           // <-- Driven by ExpandableController from ExpandableNotifier
                      collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
                        child: //Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,),
                        Image.asset(
                          "asset/images/down.png", // width: 300,
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                        ),

                      ),
                      expanded: Column(
                          children: [
                            //Text("Backjdsgcygdsucudshiodhycoe"),
                            SizedBox(
                                width: 400,
                                height: 350,
                                child: FittedBox(child: Column(
                                  children: [
                                    //  addAccountHeader(),
                                    Container(
                                      // color: Colors.yellow,
                                      height: 300,
                                      width: 350,
                                      child:
                                      //Column(
                                      // children: [
                                      //  addAccountHeader(),
                                      VerticalBarChart(
                                        painter: VerticalBarChartPainter(
                                          verticalBarChartContainer: verticalBarChartContainer,
                                        ),
                                      ),

                                    )
                                  ],
                                ))
                            ),
                            ExpandableButton(
                              child:  Image.asset(
                                "asset/images/up.png", // width: 300,
                                height: 20,
                                width: 20,
                                alignment: Alignment.center,
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )


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
  savePlanList() {
    return

      Container(
      height: 300,
        margin: EdgeInsets.all(8),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffECDCFF)),
      child:
        Column(
          children: [
            Row(
              children: [
                Text("Tesla model 3",
        style: TextStyle(
        fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Colors.black,
        ),
                ),
                Text("before jan 1",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),


              ],
            ),
            Text("jan saving",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text("feb saving ",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text("march saving",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],

        )

    );
  }

  showuserData()
  {
    return
    Column(
      children: [
      Container(
      height: 300,
      margin:  EdgeInsets.only(
        bottom: 5.0,top: 5 , ),
      child:
      FutureBuilder<List<getGoalResult>>(
          future: datalist,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    var item = snapshot.data![i];
                    amount =item.goaldate.toString(); //DateTime.parse(currentdate);
                   // final DateFormat formatter = DateFormat('yyyy-MM-dd');
                    var startdate = DateTime.parse(item.goaldate.toString());
                    String  dateformat = DateFormat('yyyy-MM-dd').format(startdate);
                    return
                      Container(
                         // height: 220,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 12),
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0x85dadada)),
                          child:
                          Column(
                            children: [
                              Padding(padding: EdgeInsets.only(bottom: 15),
                                child:   Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item.name.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),


                                    Text("Before "+ dateformat,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),


                                  ],
                                ),
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Feb 2022 saving",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(dollar+ tValue.toStringAsFixed(2),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),


                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Mar 2022 saving",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(dollar+tValue.toStringAsFixed(2),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),


                                ],
                              ),

                              Align(
                                  alignment: Alignment.bottomRight,
                                  child:
                                  Padding(padding: EdgeInsets.only(top: 15),
                                    child:   Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                                        // Text("$dollar${item.totalamount} of ",
                                        //   style: TextStyle(
                                        //     fontWeight: FontWeight.w700,
                                        //     fontSize: 17,
                                        //     color: const Color(0xFFA781D3),
                                        //   ),
                                        // ),
                                        Text(dollar+item.totalamount.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17,
                                            color: const Color(0xFFA781D3),

                                          ),
                                        ),

                                      ],


                                    ),
                                  )
                              )


                            ],

                          )

                      );

                  });
            }
            else
            {
              return Container(
                //color: Colors.red,
                  child:
                  Center(
                    child:
                    CircularProgressIndicator(),
                  )
              );
            }
            // if (snapshot.data == null) {
            //return Text("first return>>>>>>");
            // }
            // else {
            //   return
            //     ListView.builder(
            //         shrinkWrap: true,
            //         scrollDirection: Axis.vertical,
            //         itemCount: snapshot.data!.length,
            //         itemBuilder: (context, posxition) {
            //           return
            //             ListTile(
            //               title: Text(
            //                 snapshot.data![i].lastName.toString(),
            //                 style: TextStyle(
            //                     color: Colors.red,
            //                     fontSize: 11,
            //                     fontWeight:
            //                     FontWeight.w500),
            //               ),
            //             );
            //         });
            // }
          }
      ),
    ),
      ],
    );


  }

//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
// Future<GoalBankdataResponse> GoalData(  String name ,String accountassociate , int totalamount , String goaldate ) async {
//   SaveGoallBankdataRequest saveGoallBankdataRequest = SaveGoallBankdataRequest();
//   UserDetail tempuserdetail = await Constants.getUserDetail();
//   saveGoallBankdataRequest.name = name;
//   saveGoallBankdataRequest.accountassociate= accountassociate;
//   saveGoallBankdataRequest.totalamount= totalamount;
//   saveGoallBankdataRequest.goaldate= goaldate;
//   // saveGoallBankdataRequest.id = tempuserdetail.id;
//   // saveGoallBankdataRequest.createdon= createdon;
//   // saveGoallBankdataRequest.createdby= create;
//   print(">>>>>>>>>??????/");
//   print("____________??????????????<<<<<<<");
//   //------------->>>>>>>>>>.
//   String accesstoken = tempuserdetail.accessToken.toString();
//   print('<<<<<<<<<<<<<<Request body----->>>>>>>>>>>>: ${jsonEncode(saveGoallBankdataRequest)}');
//   final response = await http.post(Uri.parse(Constants.baseUrl2 + '/Goal/SaveGoal'),
//       headers: <String, String>{
//         'Content-Type': 'application/json', 'Accept': 'application/json',
//         'Authorization': 'Bearer $accesstoken',
//       },
//       body: jsonEncode(saveGoallBankdataRequest));
//   print("plannn&&&&&&&&&&??????????????<<<<<<<");
//   print(response);
//   print(response.body);
//   print(response.statusCode);
//   print("&&&&&&&&&&??????????????<<<<<<<");
//   if (response.statusCode == 200) {
//     print('####manage account Response <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${jsonEncode(response)}');
//
//     // return GoalBankdataResponse.fromJson(jsonDecode(response.body));
//     GoalBankdataResponse goalResponse = GoalBankdataResponse.fromJson(jsonDecode(response.body));
//     return goalResponse;
//   } else {
//     throw Exception('Failed to call user adduserid .');
//   }
// }
