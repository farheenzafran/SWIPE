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
import 'package:swipeapp/Controller/MakePayment/PaymentAccount2.dart';
import 'package:swipeapp/Controller/Plan/CheckPlans5.dart';
import '../../Model Helper.dart';
import '../Account/AddMember.dart';
import '../Dashboard.dart';
import '../PlaidData/BankData.dart';
import '../Account/ManageAccount2.dart';
import '../Request/AccessTokenRequest.dart';
import '../Request/InstitutionRequest.dart';
import '../Request/LiabilityRequest.dart';
import '../Request/SaveBankDataRequest.dart';
import '../Request/SaveGoalBankdataRequest.dart';
import '../Request/TokenResquest.dart';
import '../Request/TransactionRequest.dart';
import '../Response/AccessTokenResponse.dart';
import '../Response/GetBankDataResponse.dart';
import '../Response/GoalBankDataResponse.dart';
import '../Response/InstitutionResponse.dart';
import '../Response/LiabilityResponse.dart';
import '../Response/LinkTokenResponse.dart';
import '../Response/SaveBankDataResponse.dart';
import '../Response/TransactionResponse.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import '../Response/UserDeatail.dart';
import '../PlaidData/creditBankdata.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class MakePayment1 extends StatefulWidget {

  @override
  paymentState createState() => paymentState();
}

class paymentState extends State<MakePayment1> {
//
  int _selectedIndex = 0;
  late String cname = "";
  late String cimage = "";
  final amountinput = TextEditingController();
  //
  BankData bankDataobj = BankData();
  late Future<List<BankData>> bankdatalist = [] as Future<List<BankData>>;
  late Future<List<BankData>> creditbankdatalist = [] as Future<List<BankData>>;

  List<Transactions> transactionlist = [];
  Future<TransactionResponse>? transactionResponseList;
  late LegacyLinkConfiguration _publicKeyConfiguration;
  late LinkTokenConfiguration _linkTokenConfiguration;
  late Future<TokenRequest> tokenRequest;
  String ExpenseKey = "expensedata";
  String accesstoken = "";
  String accountid = "";
  int cmonth = 0;
  late String _imgString = '';
  late String imagebase64 = '';
  bool _isShown = true;
  String bname = "";
  String acname = "";
  int selectedIndex = -1;
  late double tDebitValue = 0;
  late double tCreditValue = 0;
  bool selected = false;
//<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>

  String dollar = " \$";

  bool isLoading = false;
  bool isLoading1 = true;
  bool isexpanse = true;
  bool viewVisibleTransaction = true;
  bool viewVisible1 = true;

  late String camount = "";



//<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
  late LinkTokenConfiguration creditlinkTokenConfiguration;
  Liabilities liabilitylist = new Liabilities();
  List<Student> stdlist = [];
  List<Credit> crdlist = [];
  List<Mortgage> mrtlist = [];
  bool viewVisible = false;
  bool viewVisible2 = false;
  bool viewVisible3 = false;

  void hideWidget() {
    setState(() {
      viewVisible = false;
      viewVisible2 = false;
      viewVisible3 = false;
    });
  }
  bool _expanded = false;
  late ScrollController _scrollController;

  //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>


  void initState() {

    _publicKeyConfiguration = LegacyLinkConfiguration(
      clientName: Constants.ClientId,
      publicKey: "PUBLIC_KEY",
      environment: LinkEnvironment.sandbox,
      products: <LinkProduct>[
        LinkProduct.auth,
        LinkProduct.transactions,
      ],
      language: "en",
      countryCodes: ['US'],
      userLegalName: "John Appleseed",
      userEmailAddress: "jappleseed@youapp.com",
      userPhoneNumber: "+1 (512) 555-1234",
    );
    PlaidLink.onSuccess(_onSuccessCallback);
    PlaidLink.onEvent(_onEventCallback);
    PlaidLink.onExit(_onExitCallback);
    bankdatalist = fetchBankData(Constants.debitcardValue);
    var linktoken = linktokenResponse();
    //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
    creditbankdatalist = fetchBankData(Constants
        .creditcardValue); // as Future<List<creditBankData>>;// as List<BankData>;
    var creditlinktoken = creditlinktokenResponse();
    //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>

    _scrollController = ScrollController();


    // var verticalBarChart = VerticalBarChart(
    //   painter: VerticalBarChartPainter(
    //     verticalBarChartContainer: verticalBarChartContainer,
    //   ),
    // );
  }

  //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>start>>>>>>>>>>>>>>>>>>>>>>>>
  String libKey = "data";
  late int selectedcard = 0;
  //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
    // print("onSuccess222: $publicToken, metadata: ${metadata.description()}");
    bankDataobj.publictoken = publicToken;
    bankDataobj.accesstoken = accesstoken;
    savingBankData(metadata);
  }

  void _onEventCallback(String event, LinkEventMetadata metadata) {
    // print("onEvent123: $event, metadata: ${metadata.description()}");
  }

  void _onExitCallback(LinkError? error, LinkExitMetadata metadata) {
    // print("onExit metadata: ${metadata.description()}");

    if (error != null) {
      // print("onExit error: ${error.description()}");
    }
  }

  void savingBankData(LinkSuccessMetadata metadata) async {
    for (int i = 0; i < metadata.accounts.length; i++) {
      bankDataobj.accountid = metadata.accounts[i].id;
      bankDataobj.accountname = metadata.accounts[i].name;
      bankDataobj.mask = metadata.accounts[i].mask;
    }
    if (metadata.institution.id != "") {
      var insres = await institutionResponse(metadata.institution.id);
      bankDataobj.banklogo = insres.institution?.logo;
      // print("logooooooooo");
      // print(bankDataobj.banklogo);
      // print("logooooooooo");
      bankDataobj.bankthemecolor = insres.institution?.primaryColor;
      bankDataobj.bankname = insres.institution?.name;
      var accesstokenres =
      await accessTokenResponse(bankDataobj.publictoken.toString());
      bankDataobj.accesstoken = accesstokenres.accessToken;

      //  if (isexpanse) {
      // saveBankdataResponse();
      // List<BankData> templstbankdata = await bankdatalist;
      //templstbankdata.add(bankDataobj);
      //await Constants.save(ExpenseKey, jsonEncode(templstbankdata));
      //  } else {
      // List<BankData> templstbankdata = await creditbankdatalist;
      // templstbankdata.add(bankDataobj);
      // await Constants.save(libKey, jsonEncode(templstbankdata));
      // }

      //   setState(() {
      saveBankdataResponse();
      //  });

      // print('---calling end accessTokenResponse---');
    }
  }

  //--
  Future<List<BankData>> appendElements(
      Future<List<BankData>> listFuture, List<BankData> elementsToAdd) async {
    // final list = await listFuture;
    // int count = list.length;
    // for(int i = count; i>0; i-- )
    //   {
    //     list.remove(list[i]);
    //   }
    // List<BankData>
    // list.addAll(elementsToAdd);
    return elementsToAdd;
  }

  //--

  Future<List<BankData>> getBankData(List<BankData> bankresultList) async {
    // print("frfgr<<<<<<>>>>>>");

    try {
      // var bankdatalist1 =  [] as Future<List<BankData>>;
      // setState(() {
      bankdatalist = appendElements(bankdatalist, bankresultList);
      //});
      //    print("<<<<<<>>>>>>");

    //  bankdatalist = debitTotalValue(bankresultList);
    } catch (Excepetion) {
      throw Exception('Failed to load debitbankdata');
    }
    return bankdatalist;
  }

  Future<List<BankData>> getCreditBankData(
      List<BankData> bankresultList) async {
    try {
      //creditbankdatalist =  [] as Future<List<BankData>>;
//
      // setState(() {
      creditbankdatalist = appendElements(creditbankdatalist, bankresultList);
      // });

      creditTotalValue(bankresultList);
    } catch (Excepetion) {
      throw Exception('Failed to load creditbankdata');
    }
    return creditbankdatalist;
  }
  creditTotalValue(List<BankData> creditlistbankdata) async {
    double totalLiabilityValue = 0;
    for (var cdata in creditlistbankdata) {
      double creditcardtotalLiabilityValue = 0;

      var libilityresponse = await liabilityData(
          cdata.accesstoken.toString(), cdata.accountid.toString());
      liabilitylist = libilityresponse.liabilities as Liabilities;
      if (liabilitylist.student != null) {
        for (var t_liability in liabilitylist.student!) {
          totalLiabilityValue += t_liability.lastPaymentAmount!;
          creditcardtotalLiabilityValue += t_liability.lastPaymentAmount!;
        }
      }
      if (liabilitylist.mortgage != null) {
        for (var s_liability in liabilitylist.mortgage!) {
          totalLiabilityValue += s_liability.lastPaymentAmount!;
          creditcardtotalLiabilityValue += s_liability.lastPaymentAmount!;
        }
      }
      if (liabilitylist.credit != null) {
        for (var c_liability in liabilitylist.credit!) {
          totalLiabilityValue += c_liability.lastPaymentAmount!;
          creditcardtotalLiabilityValue += c_liability.lastPaymentAmount!;
        }
      }
      // print("||||||||||total creditttttttt"+ totalLiabilityValue.toString());
      cdata.totalamount = creditcardtotalLiabilityValue;
      // debitGraphdata.add(0);
      // graphbankname.add(cdata.bankname.toString());
      // creditGraphdata.add(creditcardtotalLiabilityValue);
    }
    // print("||||||||||total creditttttttt value"+ totalLiabilityValue.toString());

    setState(() {
      tCreditValue = totalLiabilityValue;
    });
    return creditlistbankdata;
  }
  Future<List<BankData>> fetchBankData(int type) async {
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
    // print(response.body);

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

      // print(jsonEncode(tempbankdatalist));
      // print("reposne>>>>>>>");
      // getBankData(tempbankdatalist);
      // return tempbankdatalist ;
      if (type == Constants.debitcardValue) {
        tempbankdatalist = getBankData(tempbankdatalist) as List<BankData>;
        return tempbankdatalist;
      } else {
        getCreditBankData(tempbankdatalist);
        return tempbankdatalist;
      }

      // return GetBankDataResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to call user childuserid .');
    }
  }

  Future<SaveBankDataResponse> saveBankdataResponse() async {
    SaveBankDataRequest saveBankDataRequest = SaveBankDataRequest();
    UserDetail tempuserdetail = await Constants.getUserDetail();
    String accounttoken = tempuserdetail.accessToken.toString();
    saveBankDataRequest.id = 0;
    saveBankDataRequest.accountid = bankDataobj.accountid;
    saveBankDataRequest.accesstoken = bankDataobj.accesstoken;
    saveBankDataRequest.accountname = bankDataobj.accountname;
    saveBankDataRequest.mask = bankDataobj.mask;
    saveBankDataRequest.bankname = bankDataobj.bankname;
    saveBankDataRequest.banklogo = bankDataobj.banklogo;
    // print("banklogooooooooo>>>>>>>>");
    // print(bankDataobj.banklogo?.length.toString());
    // print(bankDataobj.banklogo);
    // print("banklogooooooooo>>>>>>>>");
    saveBankDataRequest.bankthemecolor = bankDataobj.bankthemecolor;
    saveBankDataRequest.publictoken = bankDataobj.publictoken;

    if (isexpanse) {
      saveBankDataRequest.type = Constants.debitcardValue;
    } else {
      saveBankDataRequest.type = Constants.creditcardValue;
    }
    //print('/////////request <<<<<<<<<<<<<<<<<<<<<<<<<');
    //print(jsonEncode(saveBankDataRequest));
    //print('/////////.request <<<<<<<<<<<<<<<<<<<<<<<<<');

    final savebankresponse =
    await http.post(Uri.parse(Constants.baseUrl2 + '/Bank/SaveBankData'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accounttoken',
        },
        body: jsonEncode(saveBankDataRequest));
    // print('/////////.svaebankdata <<<<<<<<<<<<<<<<<<<<<<<<<');
    // print(accounttoken);
    // print(saveBankDataRequest);
    // print(savebankresponse);
    // print(savebankresponse.body);
    // print(savebankresponse.statusCode);
    // print('/////////<<<<svaebankdata<<<<<<<<<<<<<<<<<<<<<');

    if (savebankresponse.statusCode == 200) {
      fetchBankData(saveBankDataRequest.type!);

      return SaveBankDataResponse.fromJson(jsonDecode(savebankresponse.body));
    } else {
      throw Exception('Failed to call plaid save bank data.');
    }
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
                textHeader(),
                creditLiability(),
                totalCreditAmount(),
                paymentButton(),





              ],
            ),


          )
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>

  textHeader(){
    return
      Container(
        margin: EdgeInsets.only(top: 15 , left: 5, bottom: 15, right: 5),
        child: Text("Select from the your past due account to make the payment", style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 15,
          color: Colors.black,
        ),
          textAlign: TextAlign.center,),
      );

  }

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
        margin: EdgeInsets.only(bottom: 10, ),
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
              'Make a Payment',
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


  creditLiability() {
    return
      Container(
          margin: EdgeInsets.only(bottom: 10,top: 10 ),
        // height: 250.0,
        // color: Colors.yellow,
          child: Column(
            children: [
              //-----------------------------------debir////-----------
              Container(
                width: double.infinity,
              //  height: 200.0,
                margin: const EdgeInsets.only(bottom: 4, top: 8),
                color: Colors.white,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    FutureBuilder<List<BankData>>(
                      future: creditbankdatalist,
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: Text("Loading..."),
                          );
                        }else {
                          return
                            ListView.builder(
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) {
                                var item = snapshot.data![i];
                                // amount = item.totalamount!;
                                return

                                 // Container(
                                 //    margin: EdgeInsets.only(top:10,right: 15, left: 15),
                                 //    // color: mycolor,
                                 //     decoration: BoxDecoration(
                                 //       borderRadius: BorderRadius.circular(10),
                                 //         border: Border.all(
                                 //           //color: mycolor,
                                 //           width: 1,
                                 //         )
                                 //       //color: const Color(0x75f5f5f5)
                                 //     ),

                                     // color: Colors.grey,
                                    // child:
                                  Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(11.0),
                                      ),
                                     child: ListTile(

                                        iconColor: Colors.red,
                                        leading: CircleAvatar(
                                          radius: 30,
                                          child:
                                          // Image.memory(Base64Codec().decode(item.banklogo.toString()),),
                                    Image.network(item.banklogo.toString()),
                                        ),
                                        title: Text(
                                          cname =    item.bankname.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        trailing:
                                          //  Text(camount = item.totalamount.toString()),

                                          item.totalamount ==null?
                                        Text(dollar+'0',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ):
                                       Text(camount = '${item.totalamount!.toStringAsFixed(2)}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),

                                        subtitle: Text(
                                          item.accountname.toString(),
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),



                                        selected: false,
                                         tileColor: _selectedIndex == i ? Colors.blue : null,
                                        onTap: () {
                                          setState(() {
                                            _selectedIndex = i;
                                          });
                                          if( _selectedIndex == i)
                                          {
                                            selected = true;
                                            //  goTobudgetScreen(context);
                                          }
                                          else
                                          {
                                            selected = false;
                                          }
                                        },

                                      )
                                 //)
                                  
                                   
                                );
                              },
                            );

                        }
                      },
                    ),
                  ],
                ),
              ),

              //--------------------------
            ],
          ));

  }
  totalCreditAmount()
  {
    return
      Align(
        alignment: Alignment.topRight,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
              margin: EdgeInsets.only(top: 15 , bottom: 15, right: 7),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color(0xffECDCFF)),
              child:
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              Text(
            dollar + tCreditValue.toStringAsFixed(2),
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
      );
  }
  void goTobudgetScreen(BuildContext context,  ) async {

    print(cname);
    print("MNMNMNMNNMN");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentAccount2(text: cname, text2:camount),)
    );
  }
  paymentButton() {
    return Container(
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
       //   Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentAccount2()),);
          goTobudgetScreen(context);
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
          if (viewVisibleTransaction) ...[
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
          ] else
            Container(
              child: Text("Loading..."),
            ),
        ],
      );
    //selected: true;
  }

  void goTonextScreen(BuildContext context, i ) async {
   camount=  amountinput.text;

    print(cname);
    print("MNMNMNMNNMN");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentAccount2(text: cname, text2:camount),
      ),
    );
  }
  cardSelect()
  {
    return
      SizedBox(
        height: 40,
        width: 160.0,

        child:
        TextField(
          controller: amountinput,
          style: TextStyle(fontSize: 16.0,  color:
          Colors.black , fontWeight: FontWeight.w600),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21.0),
            ),
            // border: OutlineInputBorder(),
            labelText: dollar,
            // errorText: _validate ? 'Value Can\'t Be Empty' : null,
            //hintText: 'Enter Code',
          ),
        ) ,
      );
  }
//<<<<<Last Btracket >>>>>>>>>>//
}


//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>


//---
Future<LinkTokenResponse> linktokenResponse() async {
  User user = User();
  user.clientUserId = "115";
  TokenRequest tokenRequest = TokenRequest();
  tokenRequest.clientId = Constants.ClientId;
  tokenRequest.secret = Constants.Secret;
  tokenRequest.clientName = "Plaid Test App";
  tokenRequest.user = user;
  tokenRequest.products = ["transactions", "auth"];
  tokenRequest.countryCodes = ['US'];
  tokenRequest.language = "en";
  tokenRequest.webhook = "https://sample-web-hook.com";
  final response =
  await http.post(Uri.parse(Constants.URL + '/link/token/create'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(tokenRequest));
  // prfint(Uri.parse(Constants.URL + '/link/token/create'));
//  print('>>>>>>>>>>>>>>>>>>>>>>>> Link Token <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
  // print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    @override
    void dispose() {
      Loader.hide();
      // super.dispose();
    }

    return LinkTokenResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    @override
    void dispose() {
      Loader.hide();

      // super.dispose();
    }

    throw Exception('Failed to call plaid App linktoken.');
  }
}
//---
Future<TransactionResponse> transactionResponse(
    String accesstoken, String accountid, int currentmonth) async {
  String startdate = "";
  String enddate = "";
  var now = new DateTime.now().toString();
  var date = DateTime.parse(now);
  DateTime firstDayOfMonth = new DateTime(date.year, date.month, 1);
  // var dateObj = new Date;
  // var lmonth = dateObj.getUTCMonth() + 1; //months from 1-12
  // var lday = dateObj.getUTCDate();
  // var lyear = dateObj.getUTCFullYear();
  // var lastendDayOfMonth = lyear + "/" + lmonth + "/" + lday;
  // DateTime lastendDayOfMonth = DateTime(date.year, date.month+1 , 0);
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

  // print(
  //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
  // print(startdate);
  // print(enddate);
  // print(
  //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
  Transactionoptions transactionoptions = Transactionoptions();
  transactionoptions.count = 20;
  transactionoptions.offset = 0;
  TransactionRequest transactionRequest = TransactionRequest();
  transactionRequest.clientId = Constants.ClientId;
  transactionRequest.secret = Constants.Secret;
  transactionRequest.accessToken = accesstoken;
  transactionRequest.options = transactionoptions;
  transactionRequest.startDate = startdate;
  transactionRequest.endDate = enddate;
  // print('Request body4--REQUESTTTTTTTTTTTTTTTTTTTT: ${jsonEncode(transactionRequest)}');
  final response4 =
  await http.post(Uri.parse(Constants.URL + '/transactions/get'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(transactionRequest));
  // print('###########################################################################################################');
  // print('respose44 body-----: ${jsonEncode(response4.body)}');
  // print(accesstoken);
  // print('##########################################'
  //     '###################################################'
  //     '##############');
  if (response4.statusCode == 200) {
    void dispose() {
      Loader.hide();

      // super.dispose();
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
//--
Future<InstitutionResponse> institutionResponse(String InstituteId) async {
  InstituteOptions options = InstituteOptions();
  options.includeOptionalMetadata = true;
  InstitutionResquest institutionResquest = InstitutionResquest();
  institutionResquest.institutionId = InstituteId;
  institutionResquest.clientId = Constants.ClientId;
  institutionResquest.secret = Constants.Secret;
  institutionResquest.countryCodes = ['US'];
  institutionResquest.options = options;
  //print('Request body-----: ${jsonEncode(institutionResquest)}');
  final response2 =
  await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(institutionResquest));
  // print('###########################################################################################################');
  print(
      '>>>>>>>>>>>>>>>>>>>>>>>> institutionResponse <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
  //print(response2.body);
  if (response2.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON
    return InstitutionResponse.fromJson(jsonDecode(response2.body));
  } else {
    throw Exception('Failed to call institution .');
  }
}
//--
Future<AccessTokenResponse> accessTokenResponse(String publicToken) async {
  bool _isLoading = true;
  AccessTokenRequest accessTokenRequest = AccessTokenRequest();
  accessTokenRequest.clientId = Constants.ClientId;
  accessTokenRequest.secret = Constants.Secret;
  accessTokenRequest.publicToken = publicToken;
  // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
  final response3 =
  await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(accessTokenRequest));

  //print('##########################################'
  // '###################################################'
  // '##############');
  print(
      '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  print('respose33 body3-----: ${jsonEncode(response3.body)}');
  // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
  //print(response3.body);
  if (response3.statusCode == 200) {
    bool _isLoading = false;
    return AccessTokenResponse.fromJson(jsonDecode(response3.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    bool _isLoading = false;
    throw Exception('Failed to call accessToken .');
  }
}
Future<LiabilityResponse> liabilityData(
    String accesstoken, String accountid) async {
  bool _isLoading = true;
  LiabilityOptions liabilityOptions = LiabilityOptions();
  liabilityOptions.accountIds = [accountid];
  LiabilityRequest liabilityRequest = LiabilityRequest();
  liabilityRequest.clientId = Constants.ClientId;
  liabilityRequest.secret = Constants.Secret;
  liabilityRequest.accessToken = accesstoken;
  liabilityRequest.options = liabilityOptions;
  // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
  final response4 =
  await http.post(Uri.parse(Constants.URL + '/liabilities/get'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(liabilityRequest));

  // print('##########################################'
  //     '###################################################'
  //     '##############');
  // print('respose44 body44-----: ${jsonEncode(response4.body)}');
  //  print('credit bpdyyyyy');
  //  print(response4.body);
  //  print(response4.statusCode);
  //  print(jsonEncode(liabilityRequest));
  // print('credit bpdyyyyy');

  // print(
  //     '#################################credit##################################################');

  if (response4.statusCode == 200) {
    bool _isLoading = false;

    return LiabilityResponse.fromJson(jsonDecode(response4.body));
  } else {
    bool _isLoading = false;
    throw Exception('Failed to call  .');
  }
}
