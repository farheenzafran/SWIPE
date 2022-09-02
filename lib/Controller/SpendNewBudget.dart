import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:swipeapp/Controller/AddAccountSuccessful.dart';
import 'package:swipeapp/Controller/Dashboard.dart';
import 'package:swipeapp/Controller/Response/UserDeatail.dart';
import 'package:swipeapp/main.dart';
import '../Model Helper.dart';
import 'AddMember.dart';
import 'Request/AddUserRequest.dart';
import 'Request/TransactionRequest.dart';
import 'Response/AddUserResponse.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'Response/ChildUserResponse.dart';
import 'Response/TransactionResponse.dart';
String? select;
class SpendNewBudget extends StatefulWidget {


  @override
  _managebudgetacountState createState() => _managebudgetacountState();
}
class _managebudgetacountState extends State<SpendNewBudget> {
  String dollar = " \$";
  late List<String> datalistx = ["1","2","Third","4"];
  late int selectedIndex;
  List<Transactions> transactionlist = [];
  late Future<Transactions> datalist  ;

  String accesstoken = "";
  String accountid = "";
  int cmonth = 0;
  void initState() {
    super.initState();
    // load();
    debitBuildExpandableContent(accesstoken.toString(), accountid.toString(), cmonth);

  }
 load()
 async {

   TransactionResponse tempresponse2 =
       await transactionResponse(
      accesstoken.toString(),
     accountid.toString(),
       cmonth);

   transactionlist =
   tempresponse2.transactions as List<Transactions>;
 }
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
                tagBudget(),
              //  dcButton(),
               budgetList(),


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

        padding: EdgeInsets.only(top: 20, left: 15, bottom: 25),
        child: Wrap(
          spacing: 70,
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
              'Add new budget',
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
  tagBudget()
  {
    return
    Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffECDCFF)),
        child:
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        Text(
          'My Budgets',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
              color: Colors.black, //font color
              fontStyle: FontStyle.italic
          ),


        )
      //   ],
      // )




    );
  }
  budgetList()
  {
              return
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: transactionlist.length,
                    itemBuilder: (context, int index) {
                      var $;
                      return Card(color: const Color(0xffF7F6FA),
                        child:   Container(
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
                                transactionlist[index]
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
                                transactionlist[index]
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
                                        Text(dollar+transactionlist[index].amount.toStringAsFixed(2),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.w600),
                                        ),
                                      ),


                                      Text(transactionlist[index].date.toString(),

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
                );
            // }
            // else
            // {
            //   return Container();
            // }

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

        onPressed: () async {
          debitBuildExpandableContent(accesstoken.toString(), accountid.toString(), cmonth);
          // TransactionResponse tempresponse2 =
          //     await transactionResponse(
          //     accesstoken.toString(),
          //     accountid.toString(),
          //     cmonth);
          //
          // transactionlist =
          // tempresponse2.transactions as List<Transactions>;
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



  debitBuildExpandableContent(
      String accessToken, String accountID, int cmonth) {
    // print('+++++++++++++++++}');
    var response = transactionResponse(accessToken, accountID, cmonth);
    //
    // print(response);
    if (response == null) {
      return Text(
        'error ',
        style: TextStyle(color: Colors.black),
        //  ),
      );
    } else {
      return //Text("jhbvkjndfkjvnfdv");
        FutureBuilder<TransactionResponse>(
            future: response,
            builder: (context, snapshot) {
              //   print('snnnnnnnnapshot');
              //  print(snapshot.data!.transactions.toString());
              return debitBuildTransactionListView(snapshot.data!);
            });
    }
    ;
  }


  debitBuildTransactionListView(TransactionResponse tdata) {
    //Text("jhbvkjndfkjvnfdv");
    return //Text("credit4444444444444credit");
      Column(
        children: [
          //for (var t in tdata.transactions!)

            Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    for (var t in tdata.transactions!)
                      Column(children: <Widget>[


                        Container(
                          margin: EdgeInsets.only(top:5, left: 13 , right: 13, bottom: 3  ),
                          color: const Color(0xffF5F5F5),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(8),
                            leading: CircleAvatar(
                              radius: 20,
                              child: Image(
                                image: AssetImage("asset/images/cart.png"),
                                //width: 40,
                                //color: const Color(0xffECDCFF)
                              ),
                            ),
                            title: Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 8),
                              child: Text(
                                t.category.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            trailing: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10, top: 5),
                                  child: Text(
                                    dollar + t.amount.toStringAsFixed(2),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    t.date.toString(),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: Text(
                                t.name.toString(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            selected: true,
                          ),

                        )

                      ]),
                  ],
                )),

        ],
      );
    //selected: true;
  }



//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
Future<TransactionResponse> transactionResponse(
    String accesstoken, String accountid, int currentmonth) async {
  String startdate = "";
  String enddate = "";
  var now = new DateTime.now().toString();
  var date = DateTime.parse(now);
  DateTime firstDayOfMonth = new DateTime(date.year, date.month, 1);
  DateTime lastendDayOfMonth = (date.month < 12)
      ? new DateTime(date.year, date.month + 1, 0)
      : new DateTime(date.year + 1, 1, 0);
  var fyear = firstDayOfMonth.year;
  var fmonth = firstDayOfMonth.month.toString().padLeft(2, '0');
  var fday = firstDayOfMonth.day.toString().padLeft(2, '0');
  var firstday = "${fyear}-${fmonth}-${fday}";
  var lyear = lastendDayOfMonth.year;
  var lmonth = lastendDayOfMonth.month.toString().padLeft(2, '0');
  var lday = lastendDayOfMonth.day.toString().padLeft(2, '0');
  var lastday = "${lyear}-${lmonth}-${lday}";
  startdate = firstday;
  enddate = lastday;
  Transactionoptions transactionoptions = Transactionoptions();
  transactionoptions.count = 20;
  transactionoptions.offset = 0;
  transactionoptions.accountIds = [accountid] ;
  TransactionRequest transactionRequest = TransactionRequest();
  transactionRequest.clientId = Constants.ClientId;
  transactionRequest.secret = Constants.Secret;
  transactionRequest.accessToken = accesstoken;
  transactionRequest.options = transactionoptions;
  transactionRequest.startDate = startdate;
  transactionRequest.endDate = enddate;

  final response4 =
  await http.post(Uri.parse(Constants.URL + '/transactions/get'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(transactionRequest));
  print(' Budgetttt REQUESTTTTTTTTTTTTTTTTTTTT: ${jsonEncode(transactionRequest)}');
  print('Budgetttt body-----: ${response4}');
  print(response4.statusCode);
  print(response4);
   print(accesstoken);
   print(accountid);
  print('Budget##########################################');
  if (response4.statusCode == 200) {
    void dispose() {
      Loader.hide();

    }

    return TransactionResponse.fromJson(jsonDecode(response4.body));
  } else {
    //void dispose() {
    Loader.hide();

    // super.dispose();
    //}

    throw Exception('Failed to call transaction .');
  }
}