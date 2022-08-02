import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants{
  static  String ClientId = "5e79fae37ba2dd00148a46f9";
  static  String Secret = "6f659b9485ddf6eb85054997ed4091";
  static  String URL = "https://sandbox.plaid.com";
  static String baseUrl = "https://breakbulkdevservices.azurewebsites.net/api";
  static  String baseUrl2 = "http://swipe-test.us-east-1.elasticbeanstalk.com/api";
  static String LoginKey = "LoginSession";
  static String DevicName = "DeviceName";
  static String DeviceToken = "DeviceToken";
  static String UserObject = "UserObject";
  static String CountryCode = "CountryCode";


  static read( String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? "";
    print('read: $value');
    return value;
  }

  static save(String key , String value) async {
    print(key);
    print(value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    print('saved $value');
  }
  static getBankdata<BankData>(String Key)
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var val = jsonEncode(BankData);
    print('printbankjsondata $val' );
    prefs.setString(Key, val);
  }

  static delete(String key, String value ) async {
    print(key);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // tdata.add(bankDataobj);
    prefs.remove(key);
    await prefs.setString(key,value);


  }
  static  Amortization(int? loanAmount, double intRate, double years , int yearpassed) {
    num timeData = years;
    num interestData = intRate;
    num principalData = loanAmount as num;
    num resultData = principalData * (1 + ((timeData / 100) * interestData));
    return resultData;

  }
  static  mAmortization(int? loanAmount, double intRate, double years , int yearpassed) {
    num timeData = years;
    num interestData = intRate;
    num principalData = loanAmount as num;
    num resultData = principalData * (1 + ((timeData / 100) * interestData));
    return resultData;

  }

}

class Logic {
  void doSomething() {
    print("doing something");
  }
}
// Widget _loadingWidget (BuildContext context){
//
//   return Scaffold(
//     body:  Center(
//       //child: SafeArea(
//       //child: SafeArea(
//         child: Column(
//           children: <Widget>[
//
//             Container(
//               alignment: Alignment.topRight,
//               width: double.infinity,
//               height: 35.0,
//               // color: Colors.white,
//               margin: const EdgeInsets.only(bottom: 10),
//               child: FlatButton(
//                 onPressed: () async {
//                   Loader.show(context,
//                       isSafeAreaOverlay: false,
//                       progressIndicator: CircularProgressIndicator(),
//                       isBottomBarOverlay: false,
//                       overlayFromBottom: 80,
//                       themeData: Theme.of(context)
//                           .copyWith(accentColor: Colors.black),
//                       overlayColor: Color(0x0000ffff));
//                   Future.delayed(Duration(seconds: 4), () {
//                     Loader.hide();
//                   });
//                   var linktoken = await linktokenResponse();
//                   _linkTokenConfiguration = LinkTokenConfiguration(
//                     token: linktoken.linkToken.toString(),
//                   );
//
//                   PlaidLink.open(configuration: _linkTokenConfiguration);
//                 },
//                 child: Image(
//                     image: AssetImage("asset/images/Plus.png"),
//                     width: 100,
//                     height: 100,
//                     alignment: Alignment.center),
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               height: 150.0,
//               margin: const EdgeInsets.only(bottom: 0, top: 0),
//               color: Colors.white,
//               child: ListView(
//                 shrinkWrap: true,
//                 children: [
//                   FutureBuilder<List<BankData>>(
//                     future: bankdatalist,
//                     builder: (context, snapshot) {
//                       return ExpansionPanelList(
//                         animationDuration:
//                         Duration(milliseconds: 2000),
//                         children: snapshot.data!
//                             .map<ExpansionPanel>((BankData item) {
//                           return ExpansionPanel(
//                             headerBuilder: (BuildContext context,
//                                 bool isExpanded) {
//
//
//                               return ListTile(
//                                 iconColor: Colors.red,
//                                 leading: CircleAvatar(
//                                   radius: 30,
//                                   child: Image.memory(
//                                     Base64Codec().decode(
//                                         item.banklogo.toString()),
//                                     // height: 30,
//                                     // width: 30,
//                                     // backgroundImage: new AssetImage(
//                                     // Base64Codec().decode(snapshot.data![i].banklogo.toString()),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   item.bankname.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                       fontWeight:
//                                       FontWeight.w600),
//                                 ),
//                                 trailing: Text(
//                                   dollar + item.mask.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                       fontWeight:
//                                       FontWeight.w500),
//                                 ),
//                                 subtitle: Text(
//                                   item.accountname.toString(),
//                                   style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                       fontWeight:
//                                       FontWeight.w500),
//                                 ),
//                                 selected: false,
//                               );
//                             },
//                             body: //status(),
//                             Text("hvohfdvhodfhvouhfdvh"),
//                             // _buildExpandableContent(item.accesstoken.toString(), item.accountid.toString(), cmonth),
//                             isExpanded: item.isExpaneded,
//                           );
//                         }).toList(),
//                         dividerColor: Colors.grey,
//                         expansionCallback:
//                             (int index, bool isExpanded) {
//                           setState(() {
//                             snapshot.data![index].isExpaneded =
//                             !isExpanded;
//                           });
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//
//
//             if (viewVisible)
//               Container(
//                 width: double.infinity,
//                 //  height: d,
//                 color: Colors.white,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     for (var i in stdlist)
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Container(
//                             width: double.infinity,
//                             height: 40,
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text(
//                                   bname,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 Text(
//                                   acname,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: double.infinity,
//                             height: 270,
//                             margin:
//                             const EdgeInsets.only(right: 15, left: 15),
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(10.0),
//                                   bottomRight: Radius.circular(10.0),
//                                   topLeft: Radius.circular(10.0),
//                                   bottomLeft: Radius.circular(10.0)),
//                               color: const Color(0xffEFF4F8),
//                             ),
//                             child: ListView(
//                               children: <Widget>[
//                                 Text(
//                                   "STUDENT LOAN",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("LAST PAYMENT AMOUNT",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                             dollar +
//                                                 i.lastPaymentAmount!
//                                                     .toStringAsFixed(2),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight
//                                                     .w500)),
//                                       ),
//                                     ]
//                                 ),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("LAST PAYMENT",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                             i.lastPaymentDate.toString()
//                                             , style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w500)
//                                         ),),
//
//
//                                     ]
//                                 ),
//                                 Row(
//                                     children: <Widget>[
//
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("LOAN TYPE ",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(i.loanName.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w500)
//                                         ),
//                                       ),
//                                     ]),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("EXPECT PAY",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child:
//                                         Text(
//                                             i.expectedPayoffDate.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight
//                                                     .w500)),
//                                       ),
//                                     ]),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("ORIGATION DATE",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                             i.originationDate.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight
//                                                     .w500)),
//                                       ),
//                                     ]
//                                 ),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("MINIMUM PAYMENT",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                             dollar +
//                                                 i.minimumPaymentAmount!
//                                                     .toStringAsFixed(2),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w500)
//                                         ),
//                                       ),
//                                     ]
//                                 ),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("PAYMENT DUE DATE ",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child:
//                                         Text(
//                                             i.nextPaymentDueDate.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight
//                                                     .w500)),
//                                       ),
//                                     ]
//                                 ),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("OUTSTANDING INTEREST",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                             i.outstandingInterestAmount
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight
//                                                     .w500)),
//                                       ),
//                                     ]
//                                 ),
//                                 Row(
//                                     children: <Widget>[
//
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("INTEREST RATE",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                             i.interestRatePercentage
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight
//                                                     .w500)),
//                                       ),
//                                     ]
//                                 ),
//                                 Row(
//                                     children: <Widget>[
//
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("GUARANTER",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(i.guarantor.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight
//                                                     .w500)),
//                                       ),
//                                     ]
//                                 ),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text(
//                                             "PAYMENT REFERENCE NUMBER ",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                             i.paymentReferenceNumber
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight
//                                                     .w500)),
//                                       ),
//                                     ]),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("YTD INTEREST PAID",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                             dollar +
//                                                 i.ytdInterestPaid!
//                                                     .toStringAsFixed(2)
//                                             , style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w500)
//                                         ),
//                                       ),
//                                     ]),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("YTD PRINCIPAL PAID ",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                             dollar +
//                                                 i.ytdPrincipalPaid!
//                                                     .toStringAsFixed(2)
//                                             , style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w500)
//                                         ),
//                                       ),
//                                     ]),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("SEQUENCE NUMBER",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                             i.sequenceNumber.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight
//                                                     .w500)),
//                                       ),
//                                     ]),
//                                 Row(
//                                     children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("TOTAL AMOUNT",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(dollar+
//                                             i.lastPaymentAmount!
//                                                 .toStringAsFixed(2),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight
//                                                     .w500)),
//                                       ),
//
//                                     ]),
//
//                                 Align(
//                                   alignment: Alignment.center,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment
//                                         .center,
//                                     children: <Widget>[
//                                       Text(
//                                         'SAVE AS MUCH AS YOU CAN',
//                                         style: TextStyle(fontSize: 14.0,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//
//                                       Text(
//                                         "Check your saving using below tool",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w900,
//                                             fontSize: 13.0),
//                                       ),
//
//                                       // Row(
//                                       //   mainAxisAlignment: MainAxisAlignment
//                                       //       .center,
//                                       //   crossAxisAlignment: CrossAxisAlignment
//                                       //       .baseline,
//                                       //   textBaseline: TextBaseline
//                                       //       .alphabetic,
//                                       //   children: <Widget>[
//                                       //     Text(
//                                       //       height.toString(),
//                                       //       style: TextStyle(fontSize: 12.0,
//                                       //           fontWeight: FontWeight
//                                       //               .w900),
//                                       //     ),
//                                       //
//                                       //   ],
//                                       // ),
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: Column(
//                                           children: <Widget>[
//                                             Row(
//                                               children: [
//                                                 Text(s_minrange.toString(),
//                                                   style: TextStyle(
//                                                       fontSize: 13.0,
//                                                       fontWeight: FontWeight
//                                                           .w900),),
//                                                 Spacer(),
//                                                 Text(s_maxrange.toString() ,
//                                                   style: TextStyle(
//                                                       fontSize: 13.0,
//                                                       fontWeight: FontWeight
//                                                           .w900),
//                                                 ),
//                                               ],
//
//                                             ),
//                                             Slider(
//                                               value: _loanyearvalues,
//                                               min: double.parse(s_minrange.toStringAsFixed(0),),
//                                               max: double.parse(s_maxrange.toStringAsFixed(0),),
//                                               divisions: 10,
//                                               activeColor: Colors.green,
//                                               inactiveColor: Colors.orange,
//                                               label: _loanyearvalues.toStringAsFixed(0),
//                                               onChanged: (double newValue) {
//                                                 setState(() {
//                                                   _loanyearvalues = newValue;
//                                                   //   print(s_saveamount);
//                                                 });
//                                                 //setStudentLoanContainer( i, newValue);
//                                                 setStudentLoanContainer( i, _loanyearvalues );
//                                                 displayStudentloan();
//
//                                               },
//                                               // semanticFormatterCallback: (double newValue) {
//                                               //   return '${newValue.round()} dollars';
//                                               // }
//                                             ),
//
//
//
//
//                                           ],
//
//
//                                         ),
//                                       ),
//                                       Text("Total Loan years "+ _loanyearvalues.toStringAsFixed(0),
//                                         style: TextStyle(
//                                             fontSize: 12.0,
//                                             fontWeight: FontWeight
//                                                 .w900),),
//
//                                       Row(
//                                         children: [
//                                           Text("YOU CAN SAVE",
//                                             style: TextStyle(
//                                                 fontSize: 12.0,
//                                                 fontWeight: FontWeight
//                                                     .w900),
//                                           ),
//                                           Spacer(),
//                                           // Text(dollar+s_saveamount.toStringAsFixed(2) ,
//                                           Text(dollar+f.format(s_saveamount),
//                                             style: TextStyle(
//                                                 fontSize: 12.0,
//                                                 fontWeight: FontWeight
//                                                     .w900),
//                                           )
//                                         ],
//
//                                       ),
//
//                                       // Text("Just slide the Flutter Slider to change value")
//                                     ],
//                                   ),),
//
//
//                               ],
//                             ),
//                             //),
//                           ),
//                         ],
//                         //),
//
//                         // ],
//                       ),
//                     //  Text("Last payment Amount"+ i.lastPaymentAmount.toString()),
//                   ],
//                 ),
//               ),
//
//
//             if (viewVisible2)
//               Container(
//                 width: double.infinity,
//                 child: Column(
//                   children: <Widget>[
//                     for (var i in mrtlist)
//                     // ListView(
//                       Column(
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             height: 40.0,
//                             // padding: const EdgeInsets.only( top: 5, bottom: 5),
//                             child: Column(
//                               children: [
//                                 Text(
//                                   bname,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 Text(
//                                   acname,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: double.infinity,
//                             height: 250,
//                             margin: const EdgeInsets.only(
//                                 right: 20, left: 20),
//                             padding: const EdgeInsets.all(15),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(10.0),
//                                   bottomRight: Radius.circular(10.0),
//                                   topLeft: Radius.circular(10.0),
//                                   bottomLeft: Radius.circular(10.0)),
//                               color: const Color(0xffEFF4F8),
//                             ),
//                             child: ListView
//                               (children: [
//                               Text(
//                                 "MORTGAGE", textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "LAST PAYMENT AMOUNT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         i.lastPaymentDate.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "LAST PAYMENT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         dollar +
//                                             i.lastPaymentAmount!
//                                                 .toStringAsFixed(2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "LOAN TYPE ",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         i.loanTypeDescription.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "LOAN TERM ",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         i.loanTerm.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "ORIGATION DATE",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         i.originationDate.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "YTD PRINICIPAL PAID ",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         dollar +
//                                             i.ytdPrincipalPaid!
//                                                 .toStringAsFixed(2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "CURRENT LATE FEE",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         dollar +
//                                             i.currentLateFee!
//                                                 .toStringAsFixed(2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "NEXT MONTH PAYMENT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         i.nextPaymentDueDate.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "YTD INTEREST PAID",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         dollar +
//                                             i.ytdInterestPaid!
//                                                 .toStringAsFixed(2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "MATURITY DATE ",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         i.maturityDate.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "ESCROW BALANCE",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         dollar +
//                                             i.escrowBalance.toStringAsFixed(
//                                                 2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "DUE AMOUNT ",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         dollar +
//                                             i.pastDueAmount!
//                                                 .toStringAsFixed(2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "PAST DUE DATE",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         i.nextPaymentDueDate.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                   ]
//                               ),
//                               Row(
//                                   children: <Widget>[
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         "TOTAL AMOUNT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Container(
//                                       margin: const EdgeInsets.only(
//                                           top: 10),
//                                       child: Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                           dollar + f.format(
//                                               i.originationPrincipalAmount),
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500),),
//
//                                       ),
//                                     ),
//
//                                   ]
//
//                               ),
//
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment
//                                       .center,
//                                   children: <Widget>[
//                                     Text(
//                                       'SAVE AS MUCH AS YOU CAN',
//                                       style: TextStyle(fontSize: 14.0,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//
//                                     Text(
//                                       "Check your saving using below tool",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w900,
//                                           fontSize: 12.0),
//                                     ),
//
//                                     // Row(
//                                     //   mainAxisAlignment: MainAxisAlignment
//                                     //       .center,
//                                     //   crossAxisAlignment: CrossAxisAlignment
//                                     //       .baseline,
//                                     //   textBaseline: TextBaseline
//                                     //       .alphabetic,
//                                     //   children: <Widget>[
//                                     //     Text(
//                                     //       height.toString(),
//                                     //       style: TextStyle(fontSize: 12.0,
//                                     //           fontWeight: FontWeight
//                                     //               .w900),
//                                     //     ),
//                                     //
//                                     //   ],
//                                     // ),
//                                     Align(
//                                       alignment: Alignment.center,
//                                       child: Column(
//                                         children: <Widget>[
//                                           Row(
//                                             children: [
//                                               Text(m_minrange.toStringAsFixed(0),
//                                                 style: TextStyle(
//                                                     fontSize: 13.0,
//                                                     fontWeight: FontWeight
//                                                         .w900),),
//                                               Spacer(),
//                                               Text(m_maxrange.toStringAsFixed(0),
//                                                 style: TextStyle(
//                                                     fontSize: 13.0,
//                                                     fontWeight: FontWeight
//                                                         .w900),
//                                               ),
//                                             ],
//
//                                           ),
//                                           Slider(
//                                             value: _mloanyearvalues,
//                                             min: double.parse(m_minrange.toString()),
//                                             max: double.parse(m_maxrange.toString()),
//                                             divisions: 10,
//                                             activeColor: Colors.green,
//                                             inactiveColor: Colors.orange,
//                                             label: _mloanyearvalues.toStringAsFixed(0),
//                                             onChanged: (double newmValue) {
//                                               setState(() {
//                                                 _mloanyearvalues = newmValue;
//                                                 // print(m_saveamount);
//                                               });
//                                               setMortgage( i, _mloanyearvalues);
//                                               displayMortgage();
//                                             },
//                                             // semanticFormatterCallback: (double newValue) {
//                                             //   return '${newValue.round()} dollars';
//                                             // }
//                                           ),
//
//
//
//
//                                         ],
//
//
//                                       ),
//                                     ),
//                                     Text("Total Loan years "+ _mloanyearvalues.toStringAsFixed(0),
//                                       style: TextStyle(
//                                           fontSize: 12.0,
//                                           fontWeight: FontWeight
//                                               .w900),),
//
//                                     Row(
//                                       children: [
//                                         Text("YOU CAN SAVE",
//                                           style: TextStyle(
//                                               fontSize: 12.0,
//                                               fontWeight: FontWeight
//                                                   .w900),
//                                         ),
//                                         Spacer(),
//                                         // Text(dollar+s_saveamount.toStringAsFixed(2) ,
//                                         Text(dollar+f.format(m_saveamount),
//                                           style: TextStyle(
//                                               fontSize: 12.0,
//                                               fontWeight: FontWeight
//                                                   .w900),
//                                         )
//                                       ],
//
//                                     ),
//
//                                     // Text("Just slide the Flutter Slider to change value")
//                                   ],
//                                 ),),
//                             ]
//
//                             ),
//                           ),
//
//                           //888****
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             if (viewVisible3)
//               Container(
//                 width: double.infinity,
//                 //  margin:const EdgeInsets.only(right: 15, left: 15),
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   children: <Widget>[
//                     for (var i in crdlist)
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         // use whichever suits your need
//                         children: <Widget>[
//                           Container(
//                             width: double.infinity,
//                             height: 40.0,
//                             child: Column(
//                               children: [
//                                 Text(
//                                   bname,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 Text(
//                                   acname,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                               width: double.infinity,
//                               height: 200.0,
//                               margin: const EdgeInsets.only(
//                                   right: 15, left: 15),
//                               padding: const EdgeInsets.all(10),
//
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(10.0),
//                                     bottomRight: Radius.circular(10.0),
//                                     topLeft: Radius.circular(10.0),
//                                     bottomLeft: Radius.circular(10.0)),
//                                 color: const Color(0xffEFF4F8),
//                               ),
//                               child: ListView(
//                                   children: [
//                                     Text(
//                                       "CREDIT", textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w700),
//                                     ),
//                                     Row(children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("LAST PAYMENT DATE",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                           dollar +
//                                               i.lastPaymentAmount
//                                                   .toStringAsFixed(2),
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                       ),
//                                     ]),
//                                     Row(children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("LAST STATEMENT",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Text(
//                                           dollar +
//                                               i.lastPaymentAmount
//                                                   .toStringAsFixed(2),
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                       ),
//                                     ]),
//                                     Row(children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("DUE DATE ",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                           alignment: Alignment.topRight,
//                                           child: Text(
//                                             i.nextPaymentDueDate.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w500),
//                                           )),
//                                     ]),
//                                     Row(children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("MINIMUM PAYMENT",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                           alignment: Alignment.topRight,
//                                           child: Text(
//                                             dollar +
//                                                 i.minimumPaymentAmount!
//                                                     .toStringAsFixed(2),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w500),
//                                           )),
//                                     ]),
//                                     Row(children: <Widget>[
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text("LAST PAYMENT",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w700)),
//                                       ),
//                                       Spacer(),
//                                       Align(
//                                           alignment: Alignment.topRight,
//                                           child: Text(
//                                             dollar +
//                                                 i.lastPaymentAmount
//                                                     .toStringAsFixed(2),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight
//                                                     .w500),
//                                           )),
//                                     ]),
//                                   ])),
//                         ],
//                       ),
//                   ],
//                   //),
//
//                   // ],
//                 ),
//               ),
//
//             //--------------------
//
//
//
//           ],
//         )
//       //         ),
//       // ),
//     ),
//   );
// }

//               Visibility(
//   visible: viewVisible1,
//   child: Container(
//     width: double.infinity,
//     height: 150.0,
//     color: Colors.white,
//     child: Stack(
//       //child: Column(
//       children: [
//         ListView.builder(
//             shrinkWrap: true,
//             // scrollDirection: ClampingScrollPhysics,
//             itemCount: transactionlist.length,
//             itemBuilder: (context, int index) {
//               var $;
//               return ListTile(
//                 title: Column(
//                   children: [
//                     Container(
//                       child: Stack(
//                         children: <Widget>[
//                           Container(
//                             width: double.infinity,
//                             height: 80.0,
//                             margin: const EdgeInsets.only(
//                                 right: 5, left: 5),
//                             child: Card(
//                               color: const Color(0xffEFF4F8),
//
//                               shape: RoundedRectangleBorder(
//                                   borderRadius:
//                                   BorderRadius.circular(10)),
//                               //  child: Stack(
//                               child: ListTile(
//                                 contentPadding: EdgeInsets.only(
//                                     left: 10.0, right: 0.0),
//                                 leading: CircleAvatar(
//                                   radius: 20,
//                                   backgroundColor:
//                                   const Color(0xffE2703A),
//                                   child: Image(
//                                     image: AssetImage(
//                                         "assets/images/travel.png"),
//                                     alignment: Alignment.topRight,
//                                     height: 30,
//                                     width: 30,
//                                     color:
//                                     const Color(0xffEFF4F8),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   // transactionlist[index].name.toString(),
//                                   tname = transactionlist[index].name.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight:
//                                       FontWeight.w500),
//                                 ),
//                                 subtitle: Wrap(
//                                     spacing: 25,
//                                     children: <Widget>[
//                                       Text(
//                                         transactionlist[index]
//                                             .date
//                                             .toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 11,
//                                             fontWeight:
//                                             FontWeight.w500),
//                                       ),
//                                       Text(
//
//                                         transactionlist[index]
//                                             .amount
//                                             .toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 11,
//                                             fontWeight:
//                                             FontWeight.w500),
//                                       ),
//                                     ]),
//                                 trailing: Wrap(children: <Widget>[
//
//                                   InkWell(
//                                     onTap: () {
//
//                                     },
//                                     // child: ClipRRect(
//                                     //   borderRadius:
//                                     //   BorderRadius.circular(
//                                     //       20.0),
//                                     //   child: Image.asset(
//                                     //     "assets/images/chevron.png",
//                                     //     width: 30,
//                                     //     height: 40,
//                                     //     color: const Color(
//                                     //         0xffE2703A),
//                                     //   ),
//                                     // ),
//                                   ),
//                                 ]),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//
//             }
//           // );
//           // }
//           //},
//         ),
//       ],
//     ),
//   ),
// ),
