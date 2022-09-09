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
import 'BankData.dart';
import 'Request/AddUserRequest.dart';
import 'Request/TransactionRequest.dart';
import 'Response/AddUserResponse.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'Response/ChildUserResponse.dart';
import 'Response/GetBankDataResponse.dart';
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
  bool viewVisible1 = true;
  bool isLoading = true;
  void initState() {
    super.initState();
    fetchBankData(Constants.debitcardValue);

   // load();
   //debitBuildExpandableContent(accesstoken.toString(), accountid.toString(), cmonth);

  }
  debitTotalValue(List<BankData> debitlistbankdata) async {
    //double totalTransactionValue = 0;
    for (var debitdata in debitlistbankdata) {
     // double debitcardtotalTransactionValue = 0;
      var response = await transactionResponse(debitdata.accesstoken.toString(),
          debitdata.accountid.toString(), cmonth);
      for (var t_transaction in response.transactions!) {
        transactionlist.add(t_transaction);
      }


    }
    setState(() {
      //tDebitValue = totalTransactionValue;
    });
    print(jsonEncode(debitlistbankdata));
    return debitlistbankdata;
  }

   fetchBankData(int type) async {
    UserDetail tempuserdetail = await Constants.getUserDetail();
    String banktoken = tempuserdetail.accessToken.toString();
    final response = await http.get(
        Uri.parse(
            Constants.baseUrl2 + '/Bank/GetBankData?type=' + type.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $banktoken',
        });
    print(response.body);

    List<BankData> tempbankdatalist = <BankData>[];
    if (response.statusCode == 200) {
      GetBankDataResponse bankdataResponse =
      GetBankDataResponse.fromJson(jsonDecode(response.body));
      for (var i in bankdataResponse.result!) {
        BankData bd = new BankData();
        bd.publictoken = i.publictoken;
        bd.bankthemecolor = i.bankthemecolor;
        bd.banklogo = i.banklogo;
        bd.mask = i.mask;
        bd.accountname = i.accountname;
        bd.accesstoken = i.accesstoken;
        bd.bankname = i.bankname;
        bd.accountid = i.accountid;
        tempbankdatalist.add(bd);
      }

      print(jsonEncode(tempbankdatalist));
      print("reposne>>>>>>>");
      // getBankData(tempbankdatalist);
      // return tempbankdatalist ;
      if (type == Constants.debitcardValue) {
        debitTotalValue(tempbankdatalist) ;
      //  return tempbankdatalist;
      }

      // return GetBankDataResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to call user childuserid .');
    }
  }
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
    isLoading = false;

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
        isLoading = false;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child:
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                addAccountHeader(),
                tagBudget(),
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
 margin: const EdgeInsets.only(right: 14, top: 18, bottom: 18),
     child:

        Align(
          alignment: Alignment.topLeft,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
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
                Text(
                  'My Budget',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                      color: Colors.black,
                      //font color
                      fontStyle: FontStyle.italic),
                )
              //   ],
              // )

            ),
          ]),
          // ),
        ),
    );
  }
  budgetList()
  {

              return isLoading ?
              Center(child: CircularProgressIndicator()) :
              Container(
                padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: transactionlist.length,
                            itemBuilder: (context, int index) {
                              return
                            transactionlist.isEmpty ? Center(
                              child: CircularProgressIndicator(),):
                              Card(color: const Color(0xffF3F3F3),
                                child:   Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  margin: const EdgeInsets.only(right: 14, left: 14),
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
                                      // subtitle:
                                      // Text(
                                      //   transactionlist[index]
                                      //       .category
                                      //       .toString(),
                                      //   style: TextStyle(
                                      //       color: Colors.grey,
                                      //       fontSize: 12,
                                      //       fontWeight:
                                      //       FontWeight.w600),
                                      // ),

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


                                              // Text(transactionlist[index].date.toString(),
                                              //
                                              //   style: TextStyle(
                                              //       color: Colors.grey,
                                              //       fontSize: 12,
                                              //       fontWeight:
                                              //       FontWeight.w500),
                                              // ),
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
                      ]

                  ),



              );


            // }
            // else
            // {
            //   return Container();
            // }

          }













//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
