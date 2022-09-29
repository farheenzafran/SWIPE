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
import 'dart:math';
import 'dart:ui';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:swipeapp/Controller/AddNewPlan.dart';
import 'package:swipeapp/Controller/Dashboard.dart';
import 'package:swipeapp/Controller/SpendNewBudget.dart';
import '../Model Helper.dart';
import 'AddMember.dart';
import 'BankData.dart';
import 'Request/AccessTokenRequest.dart';
import 'Request/InstitutionRequest.dart';
import 'Request/LiabilityRequest.dart';
import 'Request/TokenResquest.dart';
import 'Request/TransactionRequest.dart';
import 'Response/AccessTokenResponse.dart';
import 'Response/GetBankDataResponse.dart';
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

class Spend extends StatefulWidget {
  final String text;
  final String text2;
Spend(   {Key? key,  required  this.text, required  this.text2, }) : super(key: key);

@override
  State<StatefulWidget> createState() => spendacountState();

}

class spendacountState extends State<Spend> {
  @override
  String dollar = " \$";

  //  late String todos = widget.text;
  //late final List<String> t =  widget.text as List<String>;

  late int selectedIndex;
  List<Transactions> transactionlist = [];
  late Future<Transactions> datalist;
  String accesstoken = "";
  String accountid = "";
  int cmonth = 0;
  bool viewVisible1 = true;
  List<String> array = ["0", "1", "2", "3"];

  Color randomColor() =>
      Color.fromARGB(255, Random().nextInt(255), Random().nextInt(100),
          Random().nextInt(200));

  void initState() {
    super.initState();
    fetchBankData(Constants.debitcardValue);

    // load();
    //debitBuildExpandableContent(accesstoken.toString(), accountid.toString(), cmonth);

  }

  bool isLoading = true;
  bool ontap = true;

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
        debitTotalValue(tempbankdatalist);
        //  return tempbankdatalist;
      }

      // return GetBankDataResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to call user childuserid .');
    }
  }

  Future<TransactionResponse> transactionResponse(String accesstoken,
      String accountid, int currentmonth) async {
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
    transactionoptions.accountIds = [accountid];
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
    print(' Budgetttt REQUESTTTTTTTTTTTTTTTTTTTT: ${jsonEncode(
        transactionRequest)}');
    print('Budgetttt body-----: ${response4}');
    print(response4.statusCode);
    print(response4);
    print(accesstoken);
    print(accountid);
    print('Budget##########################################');
    isLoading = false;

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
                    catogeriesType(),
                    // budgetList(),
                    gridviewlist(),
                    //  getCategory(),
                    Text(widget.text.toString()),
                    Text(widget.text2.toString()),
                    addButton(),
                   // showBudgetData(),

                    Container(
                      height: 230,

                      child:  ListView.builder(
                     //   itemCount: ,
                          itemBuilder: (BuildContext context, int i) {

                            return ListTile(
                              title: Text("kjnkjgdnb",style: TextStyle(
                                fontSize: 18, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                                color: Colors.red, //font color
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,

                              ),),
                              trailing: new Icon(Icons.videocam),

                            );


                          }),

                    ),

                  ],
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
                  children: [
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
                              fontSize: 15,
                              //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                              color: Colors.white,
                              fontWeight: FontWeight.bold //font color
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
                        dollar + "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                            color: Colors.white,
                            //font color
                            fontStyle: FontStyle.italic
                        ),

                      ),

                      Text(
                        'Spend',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),

                  Image.asset(
                    "asset/images/downarrow.png", // width: 300,
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                  ),
                  Column(
                    children: [
                      Text(
                        dollar + "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                          color: Colors.white,
                          //font color
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,

                        ),

                      ),


      GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return
                  Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child:
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 10.0, right: 0.0),
                            title: CircleAvatar(
                              radius: 20,
                              child: Image(
                                image: AssetImage("asset/images/cart.png"),
                                //width: 40,
                                //color: const Color(0xffECDCFF)
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(title: Column(
                              children:[
                                // Text(cname=  transactionlist[index].name.toString(),
                            Text('0000',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight:
                                FontWeight.w600),),

                                Text('Create',
                                  style: TextStyle(
                                      color: const Color(0xFFA781D3),
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.w600),
                                ),
                              ]
                          ),

                            onTap: () {
                             // goTobudgetScreen(context);
                            },
                          ),

                        ],
                      )

                  );


              });
        },
        child:
        Text(
          'Income',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
      ),
                    ],
                  ),
                ]),
          ],
        )


      //  ),
    );
  }

  catogeriesType() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 40,
        width: 150,
        margin: EdgeInsets.only(top: 10, left: 15, bottom: 10),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffECDCFF)),
        child: Text(
          'Top categories',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  budgetList() {
    return
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
                        child: CircularProgressIndicator(),) :
                      Card(color: const Color(0xffF3F3F3),
                        child: Container(
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


                              trailing:
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 3, bottom: 3),
                                        child:
                                        Text(dollar +
                                            transactionlist[index].amount
                                                .toStringAsFixed(2),
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

                              ),




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

  gridviewlist() {
    return isLoading ?
    Center(child: CircularProgressIndicator()) :
    Container(
      //color: Colors.yellow,
      // height: 300,
        child:
        SizedBox(
          height: 80 + 80,
          child: GridView.builder(
              itemCount: transactionlist.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 90 / 256,
                crossAxisCount: 2,),
              itemBuilder: (context, index) {
                return ListView(
                  shrinkWrap: true,

                    children: [
                      ListTile(
                          contentPadding: EdgeInsets.only(
                              left: 5.0, right: 0.0),
                          leading: CircleAvatar(
                            radius: 20,
                            child: Image(
                              image: AssetImage("asset/images/cart.png"),
                            ),
                          ),
                          title:
                          Text(dollar +
                              transactionlist[index].amount.toStringAsFixed(2),
                            style: TextStyle(color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),),
                          subtitle:
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child:
                            Text(transactionlist[index].category.toString(),
                              style: TextStyle(color: Colors.grey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600),
                            ),
                          )


                      ),
                    ]

                  // color: randomColor(), child: Text(array[index])
                );
              }
          ),
        )
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
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SpendNewBudget()),);
                },
                child: Image(
                  image: AssetImage("asset/images/Plus.png"),
                  width: 130,
                  height: 130,
                ),
              ),
              Text('Add a new budget'),

            ],
          ));
  }

  showBudgetData() {
    return
      Column(
        children: [
        Container(
        height: 250,
        margin: EdgeInsets.only(
        bottom: 5.0,top: 5 ,),
    child:

    ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: transactionlist.length,
    itemBuilder: (context, i) {
    var item = transactionlist[i];

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
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(item.name.toString(),
    style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Colors.black,
    ),
    ),


    Text(item.name.toString(),
    style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Colors.black,
    ),
    ),
    ],
    ),
    ),
    Text("cash",
    style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Colors.black,
    ),
    ),

    ],

    )

    );

    }

    )
        )
          ]

    );
  }


// getCategory()
// {
//   // return
//   //   Container(
//   //   height: 230,
//   //
//   // child:  ListView.builder(
//   //     itemCount: text == null ? 0 : text.length,
//   //       itemBuilder: (BuildContext context, int index) {
//   //         return ListTile(
//   //             title: Text(text[index],style: TextStyle(
//   //               fontSize: 18, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//   //               color: Colors.red, //font color
//   //               fontStyle: FontStyle.italic,
//   //               fontWeight: FontWeight.w700,
//   //
//   //             ),),
//   //             trailing: new Icon(Icons.videocam),
//   //
//   //         );
//   //
//   //
//   //       }),
//   //
//   // );
// }
//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
