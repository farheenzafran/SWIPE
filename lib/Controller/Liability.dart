// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:intl/intl.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../Model Helper.dart';
import 'BankData.dart';
import 'Request/AccessTokenRequest.dart';
import 'Request/InstitutionRequest.dart';
import 'Request/LiabilityRequest.dart';
import 'Request/TokenResquest.dart';
import 'Response/AccessTokenResponse.dart';
import 'Response/InstitutionResponse.dart';
import 'Response/LiabilityResponse.dart';
import 'Response/LinkTokenResponse.dart';


class Liability extends StatefulWidget {
 // final ValueChanged<String> update;
 // Liability({required this.update});
  //Liability({Key? key, required this.text}) : super(key: key);

  @override
  _MyAppStates createState() => _MyAppStates();
}

class _MyAppStates extends State<Liability> {
  @override
  late List wordlist; // declare your list

  late Future<List<BankData>> creditbankdatalist = [] as Future<List<BankData>>;
  // List<BankData> bankdatalist = [];
  BankData bankDataobj = BankData();
  late LegacyLinkConfiguration creditpublicKeyConfiguration;
  late LinkTokenConfiguration creditlinkTokenConfiguration;
  String s = " \$";
  double _value = 20;
  Liabilities liabilitylist = new Liabilities();
  List<Student> stdlist = [];
  List<Credit> crdlist = [];
  List<Mortgage> mrtlist = [];
  final children = <Widget>[];
  String dollar = " \$";
  bool viewVisible = false;
  bool viewVisible2 = false;
  bool viewVisible3 = false;
  double s_minrange = 0.0;
  double s_maxrange = 10.0;
  double sloanmaxvalue = 0;
  num sbalanceamount = 0;
  double s_saveamount = 0;
  int height = 200;
  double _mortgagevalue = 0.0;
  double m_save = 0;
  double m_minrange = 0.0;
  double m_maxrange = 30.0;
  double mloanmaxvalue = 0;
  num mbalanceamount = 0;
  double m_saveamount = 0;
  double _mloanyearvalues = 0.0;
  double _loanyearvalues = 0.0;
  double topContainer = 0;
  late final SnackBar snackBar;
  var _scrollController;
  void hideWidget() {
    setState(() {
      viewVisible = false;
      viewVisible2 = false;
      viewVisible3 = false;
    });
  }
  final scrollController = ScrollController();
  // ScrollController _controller = ScrollController(initialScrollOffset: itemHeight * index)

  void initState() {
    super.initState();
    creditpublicKeyConfiguration = LegacyLinkConfiguration(
      clientName: Constants.ClientId,
      publicKey: "PUBLIC_KEY",
      environment: LinkEnvironment.sandbox,
      products: <LinkProduct>[
        LinkProduct.liabilities,
      ],
      language: "en",
      countryCodes: ['US'],
      userLegalName: "John Appleseed",
      userEmailAddress: "jappleseed@youapp.com",
      userPhoneNumber: "+1 (512) 555-1234",
    );
    PlaidLink.onSuccess(creditonSuccessCallback);
    PlaidLink.onEvent(creditonEventCallback);
    PlaidLink.onExit(creditonExitCallback);
    creditbankdatalist = creditgetBankData();// as List<BankData>;
    var creditlinktoken = creditlinktokenResponse();
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  void creditonSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
    //  print("onSuccess222: $publicToken, metadata: ${metadata.description()}");
    bankDataobj.publictoken = publicToken;
    bankDataobj.accesstoken = accesstoken;
    creditsaveBankData(metadata);
  }

  void creditonEventCallback(String event, LinkEventMetadata metadata) {
    //print("onEvent123: $event, metadata: ${metadata.description()}");
  }

  void creditonExitCallback(LinkError? error, LinkExitMetadata metadata) {
    // print("onExit metadata: ${metadata.description()}");

    if (error != null) {
      //  print("onExit error: ${error.description()}");
    }
  }

  void creditsaveBankData(LinkSuccessMetadata metadata) async {
    for (int i = 0; i < metadata.accounts.length; i++) {
      bankDataobj.accountid = metadata.accounts[i].id;
      bankDataobj.accountname = metadata.accounts[i].name;
      bankDataobj.mask = metadata.accounts[i].mask;
    }
    if (metadata.institution.id != "") {
      var insres = await creditinstitutionResponse(metadata.institution.id);
      bankDataobj.banklogo = insres.institution?.logo;
      bankDataobj.bankthemecolor = insres.institution?.primaryColor;
      bankDataobj.bankname = insres.institution?.name;
      var accesstokenres =
      await creditaccessTokenResponse2(bankDataobj.publictoken.toString());
      bankDataobj.accesstoken = accesstokenres.accessToken;
      List<BankData> templstbankdata = await creditbankdatalist;
      // print(templstbankdata.length);
      //print(jsonEncode(bankDataobj));
      templstbankdata.add(bankDataobj);
      // print('#######***^^%^%###@@@@@@@');
      // print(templstbankdata.length);
      await Constants.save(libKey, jsonEncode(templstbankdata));
      ;
      setState(() {
        creditbankdatalist = creditgetBankData();
      });


      // print('---calling end accessTokenResponse---');
    }
  }

  Future<List<BankData>>creditgetBankData() async {
    List<BankData> bankdatalist = [];
    try {
      String bdata = await Constants.read(libKey);
      if (bdata != "") {
        List<dynamic> dicData = jsonDecode(bdata);
        bankdatalist =
            List<BankData>.from(dicData.map((i) => BankData.fromJson(i))).toList();

      }
      // print('&&&&&&&&');
      // print(bankdatalist.length);
      // print(bdata);
      return bankdatalist ;
    } catch (Excepetion) {
      throw Exception('Failed to load album');
      return bankdatalist;
    }
  }

  var f = NumberFormat("#,##0.00", "en_US");
  late Future<TokenRequest> tokenRequest;
  bool isLoading = false;
  String libKey = "data";
  String accesstoken = "";
  String accountid = "";
  late String _imgString = '';
  late String imagebase64 = '';
  bool _isShown = true;
  String bname = "";
  String acname = "";
  String std1 = "";
  String save = "";
  late final cardselectedIndex;
  //-------------------------------

  //-------------------------------

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final mq = MediaQueryData.fromWindow(window);
    var _val;
    var chidern;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      Center(
        //child: SafeArea(
          //child: SafeArea(
            child: Column(
              children: <Widget>[
                Text("hvohfdvhodfhvouhfdvh",  style: TextStyle(
                    color: Colors.red,
                    fontSize: 33,
                    fontWeight: FontWeight.w400),),
                Container(
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  height: 35.0,
                 // color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: FlatButton(
                    onPressed: () async {
                      Loader.show(context,
                          isSafeAreaOverlay: false,
                          progressIndicator: CircularProgressIndicator(),
                          isBottomBarOverlay: false,
                          overlayFromBottom: 80,
                          themeData: Theme.of(context)
                              .copyWith(accentColor: Colors.black),
                          overlayColor: Color(0x0000ffff));
                      Future.delayed(Duration(seconds: 4), () {
                        Loader.hide();
                      });
                      var creditlinktoken = await creditlinktokenResponse();
                      creditlinkTokenConfiguration = LinkTokenConfiguration(
                        token: creditlinktoken.linkToken.toString(),
                      );

                      PlaidLink.open(configuration: creditlinkTokenConfiguration);
                    },
                    child: Image(
                        image: AssetImage("asset/images/Plus.png"),
                        width: 100,
                        height: 100,
                        alignment: Alignment.center),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150.0,
                  margin: const EdgeInsets.only(bottom: 0, top: 0),
                  color: Colors.white,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      FutureBuilder<List<BankData>>(
                        future: creditbankdatalist,
                        builder: (context, snapshot) {
                          return ExpansionPanelList(
                            animationDuration:
                            Duration(milliseconds: 2000),
                            children: snapshot.data!
                                .map<ExpansionPanel>((BankData item) {
                              return ExpansionPanel(
                                headerBuilder: (BuildContext context,
                                    bool isExpanded) {


                                  return ListTile(
                                    iconColor: Colors.red,
                                    leading: CircleAvatar(
                                      radius: 30,
                                      child: Image.memory(
                                        Base64Codec().decode(
                                            item.banklogo.toString()),
                                        // height: 30,
                                        // width: 30,
                                        // backgroundImage: new AssetImage(
                                        // Base64Codec().decode(snapshot.data![i].banklogo.toString()),
                                      ),
                                    ),
                                    title: Text(
                                      item.bankname.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.w600),
                                    ),
                                    trailing: Text(
                                      dollar + item.mask.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.w500),
                                    ),
                                    subtitle: Text(
                                      item.accountname.toString(),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.w500),
                                    ),
                                    selected: false,
                                  );
                                },
                                body: //status(),
                               Text("hvohfdvhodfhvouhfdvh",  style: TextStyle(
                                   color: Colors.red,
                                   fontSize: 33,
                                   fontWeight: FontWeight.w400),),
                               // _buildExpandableContent(item.accesstoken.toString(), item.accountid.toString(), cmonth),
                                isExpanded: item.isExpaneded,
                              );
                            }).toList(),
                            dividerColor: Colors.grey,
                            expansionCallback:
                                (int index, bool isExpanded) {
                              setState(() {
                                snapshot.data![index].isExpaneded =
                                !isExpanded;
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),


                if (viewVisible)
                  Container(
                    width: double.infinity,
                    //  height: d,
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        for (var i in stdlist)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 40,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      bname,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      acname,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 270,
                                margin:
                                const EdgeInsets.only(right: 15, left: 15),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0)),
                                  color: const Color(0xffEFF4F8),
                                ),
                                child: ListView(
                                  children: <Widget>[
                                    Text(
                                      "STUDENT LOAN",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("LAST PAYMENT AMOUNT",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                dollar +
                                                    i.lastPaymentAmount!
                                                        .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          ),
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("LAST PAYMENT",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                i.lastPaymentDate.toString()
                                                , style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)
                                            ),),


                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[

                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("LOAN TYPE ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(i.loanName.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500)
                                            ),
                                          ),
                                        ]),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("EXPECT PAY",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child:
                                            Text(
                                                i.expectedPayoffDate.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          ),
                                        ]),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("ORIGATION DATE",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                i.originationDate.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          ),
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("MINIMUM PAYMENT",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                dollar +
                                                    i.minimumPaymentAmount!
                                                        .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500)
                                            ),
                                          ),
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("PAYMENT DUE DATE ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child:
                                            Text(
                                                i.nextPaymentDueDate.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          ),
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("OUTSTANDING INTEREST",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                i.outstandingInterestAmount
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          ),
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[

                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("INTEREST RATE",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                i.interestRatePercentage
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          ),
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[

                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("GUARANTER",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(i.guarantor.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          ),
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                                "PAYMENT REFERENCE NUMBER ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                i.paymentReferenceNumber
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          ),
                                        ]),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("YTD INTEREST PAID",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                dollar +
                                                    i.ytdInterestPaid!
                                                        .toStringAsFixed(2)
                                                , style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)
                                            ),
                                          ),
                                        ]),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("YTD PRINCIPAL PAID ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                dollar +
                                                    i.ytdPrincipalPaid!
                                                        .toStringAsFixed(2)
                                                , style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)
                                            ),
                                          ),
                                        ]),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("SEQUENCE NUMBER",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                i.sequenceNumber.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          ),
                                        ]),
                                    Row(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("TOTAL AMOUNT",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(dollar+
                                                i.lastPaymentAmount!
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          ),

                                        ]),

                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: <Widget>[
                                          Text(
                                            'SAVE AS MUCH AS YOU CAN',
                                            style: TextStyle(fontSize: 14.0,
                                                fontWeight: FontWeight.w500),
                                          ),

                                          Text(
                                            "Check your saving using below tool",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 13.0),
                                          ),

                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment
                                          //       .center,
                                          //   crossAxisAlignment: CrossAxisAlignment
                                          //       .baseline,
                                          //   textBaseline: TextBaseline
                                          //       .alphabetic,
                                          //   children: <Widget>[
                                          //     Text(
                                          //       height.toString(),
                                          //       style: TextStyle(fontSize: 12.0,
                                          //           fontWeight: FontWeight
                                          //               .w900),
                                          //     ),
                                          //
                                          //   ],
                                          // ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    Text(s_minrange.toString(),
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          fontWeight: FontWeight
                                                              .w900),),
                                                    Spacer(),
                                                    Text(s_maxrange.toString() ,
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          fontWeight: FontWeight
                                                              .w900),
                                                    ),
                                                  ],

                                                ),
                                                Slider(
                                                  value: _loanyearvalues,
                                                  min: double.parse(s_minrange.toStringAsFixed(0),),
                                                  max: double.parse(s_maxrange.toStringAsFixed(0),),
                                                  divisions: 10,
                                                  activeColor: Colors.green,
                                                  inactiveColor: Colors.orange,
                                                  label: _loanyearvalues.toStringAsFixed(0),
                                                  onChanged: (double newValue) {
                                                    setState(() {
                                                      _loanyearvalues = newValue;
                                                      //   print(s_saveamount);
                                                    });
                                                    //setStudentLoanContainer( i, newValue);
                                                    setStudentLoanContainer( i, _loanyearvalues );
                                                    displayStudentloan();

                                                  },
                                                  // semanticFormatterCallback: (double newValue) {
                                                  //   return '${newValue.round()} dollars';
                                                  // }
                                                ),




                                              ],


                                            ),
                                          ),
                                          Text("Total Loan years "+ _loanyearvalues.toStringAsFixed(0),
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight
                                                    .w900),),

                                          Row(
                                            children: [
                                              Text("YOU CAN SAVE",
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight
                                                        .w900),
                                              ),
                                              Spacer(),
                                              // Text(dollar+s_saveamount.toStringAsFixed(2) ,
                                              Text(dollar+f.format(s_saveamount),
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight
                                                        .w900),
                                              )
                                            ],

                                          ),

                                          // Text("Just slide the Flutter Slider to change value")
                                        ],
                                      ),),


                                  ],
                                ),
                                //),
                              ),
                            ],
                            //),

                            // ],
                          ),
                        //  Text("Last payment Amount"+ i.lastPaymentAmount.toString()),
                      ],
                    ),
                  ),


                if (viewVisible2)
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        for (var i in mrtlist)
                        // ListView(
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 40.0,
                                // padding: const EdgeInsets.only( top: 5, bottom: 5),
                                child: Column(
                                  children: [
                                    Text(
                                      bname,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      acname,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 250,
                                margin: const EdgeInsets.only(
                                    right: 20, left: 20),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0)),
                                  color: const Color(0xffEFF4F8),
                                ),
                                child: ListView
                                  (children: [
                                  Text(
                                    "MORTGAGE", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "LAST PAYMENT AMOUNT",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            i.lastPaymentDate.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "LAST PAYMENT",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            dollar +
                                                i.lastPaymentAmount!
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[

                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "LOAN TYPE ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            i.loanTypeDescription.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "LOAN TERM ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            i.loanTerm.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "ORIGATION DATE",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            i.originationDate.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "YTD PRINICIPAL PAID ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            dollar +
                                                i.ytdPrincipalPaid!
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[

                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "CURRENT LATE FEE",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            dollar +
                                                i.currentLateFee!
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "NEXT MONTH PAYMENT",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            i.nextPaymentDueDate.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "YTD INTEREST PAID",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            dollar +
                                                i.ytdInterestPaid!
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "MATURITY DATE ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            i.maturityDate.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "ESCROW BALANCE",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            dollar +
                                                i.escrowBalance.toStringAsFixed(
                                                    2),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "DUE AMOUNT ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            dollar +
                                                i.pastDueAmount!
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "PAST DUE DATE",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            i.nextPaymentDueDate.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "TOTAL AMOUNT",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 10),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              dollar + f.format(
                                                  i.originationPrincipalAmount),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),),

                                          ),
                                        ),

                                      ]

                                  ),

                                  Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: <Widget>[
                                        Text(
                                          'SAVE AS MUCH AS YOU CAN',
                                          style: TextStyle(fontSize: 14.0,
                                              fontWeight: FontWeight.w500),
                                        ),

                                        Text(
                                          "Check your saving using below tool",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 12.0),
                                        ),

                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment
                                        //       .center,
                                        //   crossAxisAlignment: CrossAxisAlignment
                                        //       .baseline,
                                        //   textBaseline: TextBaseline
                                        //       .alphabetic,
                                        //   children: <Widget>[
                                        //     Text(
                                        //       height.toString(),
                                        //       style: TextStyle(fontSize: 12.0,
                                        //           fontWeight: FontWeight
                                        //               .w900),
                                        //     ),
                                        //
                                        //   ],
                                        // ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Text(m_minrange.toStringAsFixed(0),
                                                    style: TextStyle(
                                                        fontSize: 13.0,
                                                        fontWeight: FontWeight
                                                            .w900),),
                                                  Spacer(),
                                                  Text(m_maxrange.toStringAsFixed(0),
                                                    style: TextStyle(
                                                        fontSize: 13.0,
                                                        fontWeight: FontWeight
                                                            .w900),
                                                  ),
                                                ],

                                              ),
                                              Slider(
                                                value: _mloanyearvalues,
                                                min: double.parse(m_minrange.toString()),
                                                max: double.parse(m_maxrange.toString()),
                                                divisions: 10,
                                                activeColor: Colors.green,
                                                inactiveColor: Colors.orange,
                                                label: _mloanyearvalues.toStringAsFixed(0),
                                                onChanged: (double newmValue) {
                                                  setState(() {
                                                    _mloanyearvalues = newmValue;
                                                    // print(m_saveamount);
                                                  });
                                                  setMortgage( i, _mloanyearvalues);
                                                  displayMortgage();
                                                },
                                                // semanticFormatterCallback: (double newValue) {
                                                //   return '${newValue.round()} dollars';
                                                // }
                                              ),




                                            ],


                                          ),
                                        ),
                                        Text("Total Loan years "+ _mloanyearvalues.toStringAsFixed(0),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight
                                                  .w900),),

                                        Row(
                                          children: [
                                            Text("YOU CAN SAVE",
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight
                                                      .w900),
                                            ),
                                            Spacer(),
                                            // Text(dollar+s_saveamount.toStringAsFixed(2) ,
                                            Text(dollar+f.format(m_saveamount),
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight
                                                      .w900),
                                            )
                                          ],

                                        ),

                                        // Text("Just slide the Flutter Slider to change value")
                                      ],
                                    ),),
                                ]

                                ),
                              ),

                              //888****
                            ],
                          ),
                      ],
                    ),
                  ),
                if (viewVisible3)
                  Container(
                    width: double.infinity,
                    //  margin:const EdgeInsets.only(right: 15, left: 15),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        for (var i in crdlist)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // use whichever suits your need
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 40.0,
                                child: Column(
                                  children: [
                                    Text(
                                      bname,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      acname,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  margin: const EdgeInsets.only(
                                      right: 15, left: 15),
                                  padding: const EdgeInsets.all(10),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0)),
                                    color: const Color(0xffEFF4F8),
                                  ),
                                  child: ListView(
                                      children: [
                                        Text(
                                          "CREDIT", textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Row(children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("LAST PAYMENT DATE",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              dollar +
                                                  i.lastPaymentAmount
                                                      .toStringAsFixed(2),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ]),
                                        Row(children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("LAST STATEMENT",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              dollar +
                                                  i.lastPaymentAmount
                                                      .toStringAsFixed(2),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ]),
                                        Row(children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("DUE DATE ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                i.nextPaymentDueDate.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w500),
                                              )),
                                        ]),
                                        Row(children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("MINIMUM PAYMENT",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                dollar +
                                                    i.minimumPaymentAmount!
                                                        .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w500),
                                              )),
                                        ]),
                                        Row(children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("LAST PAYMENT",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ),
                                          Spacer(),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                dollar +
                                                    i.lastPaymentAmount
                                                        .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight
                                                        .w500),
                                              )),
                                        ]),
                                      ])),
                            ],
                          ),
                      ],
                      //),

                      // ],
                    ),
                  ),

                //--------------------



    ],
            )
          //         ),
       // ),
      ),
      //),
    );

  }


  void setStudentLoanContainer(Student student, double sliderValue) {
    var currentdate =  new DateTime.now();//DateTime.parse(currentdate);
    var startdate = DateTime.parse(student.disbursementDates!.first);
    var enddate = DateTime.parse(student.expectedPayoffDate.toString());
    int yearpassed = (currentdate.year - startdate.year);
    //num i = yearpassed.();
    // num yearpassed = (currentdate.year - startdate.year);
    //int endyear = (enddate.year - currentdate.year)
    // ;
    int endyear = enddate.year - startdate.year ;
    // print(yearpassed.toString());
    // print(endyear.toString());
    // print(student.disbursementDates!.first);
    // print(student.expectedPayoffDate);
    // print(_loanyearvalues.toString());
    s_minrange =  double.parse(yearpassed.toString());//yearpassed as double ;
    s_maxrange =  double.parse(endyear.toString()); //endyear as double   ;
    double stdint =  s_maxrange ;
    //  print("###3333####33hvcudfyhvuyfuyvuy");
    if(sliderValue != 0)
    {
      stdint = sliderValue;
    }

    if(_loanyearvalues <s_minrange)
    {
      _loanyearvalues = s_maxrange;
      //  print("abcsdddd");

    }
    sbalanceamount = Constants.Amortization(student.originationPrincipalAmount,
        student.interestRatePercentage!, stdint , yearpassed.toInt() );
    //sloanmaxvalue = sbalanceamount.toDouble();
    s_saveamount = sloanmaxvalue - sbalanceamount;
  }
  void displayStudentloan()
  {
    s_saveamount = sloanmaxvalue - sbalanceamount;
  }

  void setMortgage(Mortgage mortgage, double mtgsliderValue) {

    // var currentdate =  new DateTime.now();//DateTime.parse(currentdate);
    // var startdate = DateTime.parse(mortgage.maturityDate!);
    // var enddate = DateTime.parse(mortgage.originationDate!);
    // int myearpassed = (currentdate.year - startdate.year);
    // int mendyear = enddate.year - startdate.year ;
    // print(myearpassed.toString());
    // print(mendyear.toString());
    // print(_mloanyearvalues.toString());
    // m_minrange =  double.parse(myearpassed.toString()); ;
    // m_maxrange =double.parse(mendyear.toString());   ;
    // double mtgint =  m_maxrange  ;
    // print("###3333####33hvcudfyhvuyfuyvuy");
    // if(mtgsliderValue != 0)
    // {
    //   mtgint = mtgsliderValue ;
    // }
    // if(_mloanyearvalues <m_minrange) {
    //   _mloanyearvalues = m_maxrange;
    // }
    // mbalanceamount = Constants.mAmortization(mortgage.originationPrincipalAmount,
    //     mortgage.interestRate!.percentage as double, mtgint , myearpassed.toInt() );
    // m_saveamount = mloanmaxvalue - mbalanceamount;
    var currentdate =  new DateTime.now();//DateTime.parse(currentdate);
    var enddate  = DateTime.parse(mortgage.maturityDate!);
    var startdate = DateTime.parse(mortgage.originationDate.toString());
    int yearpassed = (currentdate.year - startdate.year);
    int endyear = enddate.year - startdate.year ;
    // print(yearpassed.toString());
    // print(endyear.toString());
    // print(mortgage.maturityDate);
    // print(mortgage.originationDate);
    // print(_mloanyearvalues.toString());
    m_minrange =  double.parse(yearpassed.toString());//yearpassed as double ;
    m_maxrange = double.parse(endyear.toString()); //endyear as double   ;
    double mtdint =  m_maxrange ;
    // print("###3333####33hvcudfyhvuyfuyvuy");
    if(mtgsliderValue != 0)
    {
      mtdint = mtgsliderValue;
    }

    if(_mloanyearvalues <m_minrange)
    {
      _mloanyearvalues = m_maxrange;
      //   print("abcsdddd");

    }
    mbalanceamount = Constants.Amortization(mortgage.originationPrincipalAmount,
        mortgage.interestRate!.percentage as double, mtdint , yearpassed.toInt() );
    //sloanmaxvalue = sbalanceamount.toDouble();
    m_saveamount = mloanmaxvalue - mbalanceamount;
  }
  void displayMortgage()
  {
    m_saveamount = mloanmaxvalue - mbalanceamount;
  }
  void status() {
    if (liabilitylist.student != null) {
      stdlist = liabilitylist.student!;
      viewVisible = true;
      //  print("student");
      setStudentLoanContainer(
          liabilitylist.student!.first, 0);
    }
    if (liabilitylist.mortgage != null) {
      mrtlist = liabilitylist.mortgage!;
      viewVisible2 = true;
      //  print("mortgage");
      setMortgage(
          liabilitylist.mortgage!.first, 0);
    }
    if (liabilitylist.credit != null) {
      crdlist = liabilitylist.credit!;
      viewVisible3 = true;
      //  print("credit");
    }

  }


}



Future<LinkTokenResponse> creditlinktokenResponse() async {
  User user = User();
  user.clientUserId = "115";
  TokenRequest tokenRequest = TokenRequest();
  tokenRequest.clientId = Constants.ClientId;
  tokenRequest.secret = Constants.Secret;
  tokenRequest.clientName = "Plaid Test App";
  tokenRequest.user = user;
  tokenRequest.products = ["liabilities"];
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
  // print(Uri.parse(Constants.URL + '/link/token/create'));

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

Future<InstitutionResponse> creditinstitutionResponse(String InstituteId) async {
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
  if (response2.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON
    return InstitutionResponse.fromJson(jsonDecode(response2.body));
  } else {
    throw Exception('Failed to call institution .');
  }
}

Future<AccessTokenResponse> creditaccessTokenResponse2(String publicToken) async {
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
  // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  // print('respose33 body3-----: ${jsonEncode(response3.body)}');
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

Future<LiabilityResponse> liabilityResponse(String accesstoken,
    String accountid) async {
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

  print('##########################################'
      '###################################################'
      '##############');
  print('respose44 body44-----: ${jsonEncode(response4.body)}');
  print('#################################credit##################################################');

  print(response4.body);
  print('#################################credit##################################################');

  if (response4.statusCode == 200) {
    bool _isLoading = false;

    return LiabilityResponse.fromJson(jsonDecode(response4.body));
  } else {
    bool _isLoading = false;
    throw Exception('Failed to call  .');
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

DateTime formatTimeOfDay(int month, int year, int day) {
  final now = new DateTime.now();
  final dt = DateTime(now.year, now.month, now.day);
  return dt;
}



// Column _buildButtonColumn(Color color, IconData icon, String label) {
//   return
//     Column(
//       children: <Widget>[
//         Container(
//           alignment: Alignment.center,
//           margin: const EdgeInsets.only(top: 20),
//           child: Text(
//             'LIABILITY',
//             style: TextStyle(
//                 color: Colors.pinkAccent,
//                 fontSize: 27,
//                 fontWeight: FontWeight.w500),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         Container(
//           alignment: Alignment.topRight,
//           width: double.infinity,
//           height: 35.0,
//           // color: Colors.white,
//           margin: const EdgeInsets.only(bottom: 10),
//           child: FlatButton(
//             onPressed: () async {
//               Loader.show(context,
//                   isSafeAreaOverlay: false,
//                   progressIndicator: CircularProgressIndicator(),
//                   isBottomBarOverlay: false,
//                   overlayFromBottom: 80,
//                   themeData: Theme.of(context)
//                       .copyWith(accentColor: Colors.black),
//                   overlayColor: Color(0x0000ffff));
//               Future.delayed(Duration(seconds: 4), () {
//                 Loader.hide();
//               });
//               var linktoken = await linktokenResponse();
//               _linkTokenConfiguration = LinkTokenConfiguration(
//                 token: linktoken.linkToken.toString(),
//               );
//
//               PlaidLink.open(configuration: _linkTokenConfiguration);
//             },
//             child: Image(
//                 image: AssetImage("asset/images/Plus.png"),
//                 width: 100,
//                 height: 100,
//                 alignment: Alignment.center),
//           ),
//         ),
//         Container(
//           width: double.infinity,
//           height: 150.0,
//           margin: const EdgeInsets.only(bottom: 0, top: 0),
//           color: Colors.white,
//           child: ListView(
//             shrinkWrap: true,
//             children: [
//               FutureBuilder<List<BankData>>(
//                 future: bankdatalist,
//                 builder: (context, snapshot) {
//                   return ExpansionPanelList(
//                     animationDuration:
//                     Duration(milliseconds: 2000),
//                     children: snapshot.data!
//                         .map<ExpansionPanel>((BankData item) {
//                       return ExpansionPanel(
//                         headerBuilder: (BuildContext context,
//                             bool isExpanded) {
//                           return ListTile(
//                             iconColor: Colors.red,
//                             leading: CircleAvatar(
//                               radius: 30,
//                               child: Image.memory(
//                                 Base64Codec().decode(
//                                     item.banklogo.toString()),
//                                 // height: 30,
//                                 // width: 30,
//                                 // backgroundImage: new AssetImage(
//                                 // Base64Codec().decode(snapshot.data![i].banklogo.toString()),
//                               ),
//                             ),
//                             title: Text(
//                               item.bankname.toString(),
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 14,
//                                   fontWeight:
//                                   FontWeight.w600),
//                             ),
//                             trailing: Text(
//                               dollar + item.mask.toString(),
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight:
//                                   FontWeight.w500),
//                             ),
//                             subtitle: Text(
//                               item.accountname.toString(),
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 14,
//                                   fontWeight:
//                                   FontWeight.w500),
//                             ),
//                             selected: false,
//                           );
//                         },
//                         body: //status(),
//                         Text("hvohfdvhodfhvouhfdvh"),
//                         // _buildExpandableContent(item.accesstoken.toString(), item.accountid.toString(), cmonth),
//                         isExpanded: item.isExpaneded,
//                       );
//                     }).toList(),
//                     dividerColor: Colors.grey,
//                     expansionCallback:
//                         (int index, bool isExpanded) {
//                       setState(() {
//                         snapshot.data![index].isExpaneded =
//                         !isExpanded;
//                       });
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//
//
//         if (viewVisible)
//           Container(
//             width: double.infinity,
//             //  height: d,
//             color: Colors.white,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 for (var i in stdlist)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       Container(
//                         width: double.infinity,
//                         height: 40,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               bname,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Text(
//                               acname,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: double.infinity,
//                         height: 270,
//                         margin:
//                         const EdgeInsets.only(right: 15, left: 15),
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(10.0),
//                               bottomRight: Radius.circular(10.0),
//                               topLeft: Radius.circular(10.0),
//                               bottomLeft: Radius.circular(10.0)),
//                           color: const Color(0xffEFF4F8),
//                         ),
//                         child: ListView(
//                           children: <Widget>[
//                             Text(
//                               "STUDENT LOAN",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("LAST PAYMENT AMOUNT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                         dollar +
//                                             i.lastPaymentAmount!
//                                                 .toStringAsFixed(2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight
//                                                 .w500)),
//                                   ),
//                                 ]
//                             ),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("LAST PAYMENT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                         i.lastPaymentDate.toString()
//                                         , style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500)
//                                     ),),
//
//
//                                 ]
//                             ),
//                             Row(
//                                 children: <Widget>[
//
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("LOAN TYPE ",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(i.loanName.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w500)
//                                     ),
//                                   ),
//                                 ]),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("EXPECT PAY",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child:
//                                     Text(
//                                         i.expectedPayoffDate.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight
//                                                 .w500)),
//                                   ),
//                                 ]),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("ORIGATION DATE",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                         i.originationDate.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight
//                                                 .w500)),
//                                   ),
//                                 ]
//                             ),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("MINIMUM PAYMENT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                         dollar +
//                                             i.minimumPaymentAmount!
//                                                 .toStringAsFixed(2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w500)
//                                     ),
//                                   ),
//                                 ]
//                             ),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("PAYMENT DUE DATE ",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child:
//                                     Text(
//                                         i.nextPaymentDueDate.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight
//                                                 .w500)),
//                                   ),
//                                 ]
//                             ),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("OUTSTANDING INTEREST",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                         i.outstandingInterestAmount
//                                             .toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight
//                                                 .w500)),
//                                   ),
//                                 ]
//                             ),
//                             Row(
//                                 children: <Widget>[
//
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("INTEREST RATE",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                         i.interestRatePercentage
//                                             .toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight
//                                                 .w500)),
//                                   ),
//                                 ]
//                             ),
//                             Row(
//                                 children: <Widget>[
//
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("GUARANTER",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(i.guarantor.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight
//                                                 .w500)),
//                                   ),
//                                 ]
//                             ),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                         "PAYMENT REFERENCE NUMBER ",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                         i.paymentReferenceNumber
//                                             .toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight
//                                                 .w500)),
//                                   ),
//                                 ]),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("YTD INTEREST PAID",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                         dollar +
//                                             i.ytdInterestPaid!
//                                                 .toStringAsFixed(2)
//                                         , style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500)
//                                     ),
//                                   ),
//                                 ]),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("YTD PRINCIPAL PAID ",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                         dollar +
//                                             i.ytdPrincipalPaid!
//                                                 .toStringAsFixed(2)
//                                         , style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500)
//                                     ),
//                                   ),
//                                 ]),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("SEQUENCE NUMBER",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                         i.sequenceNumber.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight
//                                                 .w500)),
//                                   ),
//                                 ]),
//                             Row(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("TOTAL AMOUNT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(dollar +
//                                         i.lastPaymentAmount!
//                                             .toStringAsFixed(2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight
//                                                 .w500)),
//                                   ),
//
//                                 ]),
//
//                             Align(
//                               alignment: Alignment.center,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .center,
//                                 children: <Widget>[
//                                   Text(
//                                     'SAVE AS MUCH AS YOU CAN',
//                                     style: TextStyle(fontSize: 14.0,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//
//                                   Text(
//                                     "Check your saving using below tool",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w900,
//                                         fontSize: 13.0),
//                                   ),
//
//                                   // Row(
//                                   //   mainAxisAlignment: MainAxisAlignment
//                                   //       .center,
//                                   //   crossAxisAlignment: CrossAxisAlignment
//                                   //       .baseline,
//                                   //   textBaseline: TextBaseline
//                                   //       .alphabetic,
//                                   //   children: <Widget>[
//                                   //     Text(
//                                   //       height.toString(),
//                                   //       style: TextStyle(fontSize: 12.0,
//                                   //           fontWeight: FontWeight
//                                   //               .w900),
//                                   //     ),
//                                   //
//                                   //   ],
//                                   // ),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Column(
//                                       children: <Widget>[
//                                         Row(
//                                           children: [
//                                             Text(s_minrange.toString(),
//                                               style: TextStyle(
//                                                   fontSize: 13.0,
//                                                   fontWeight: FontWeight
//                                                       .w900),),
//                                             Spacer(),
//                                             Text(s_maxrange.toString(),
//                                               style: TextStyle(
//                                                   fontSize: 13.0,
//                                                   fontWeight: FontWeight
//                                                       .w900),
//                                             ),
//                                           ],
//
//                                         ),
//                                         Slider(
//                                           value: _loanyearvalues,
//                                           min: double.parse(
//                                             s_minrange.toStringAsFixed(0),),
//                                           max: double.parse(
//                                             s_maxrange.toStringAsFixed(0),),
//                                           divisions: 10,
//                                           activeColor: Colors.green,
//                                           inactiveColor: Colors.orange,
//                                           label: _loanyearvalues
//                                               .toStringAsFixed(0),
//                                           onChanged: (double newValue) {
//                                             setState(() {
//                                               _loanyearvalues = newValue;
//                                               //   print(s_saveamount);
//                                             });
//                                             //setStudentLoanContainer( i, newValue);
//                                             setStudentLoanContainer(
//                                                 i, _loanyearvalues);
//                                             displayStudentloan();
//                                           },
//                                           // semanticFormatterCallback: (double newValue) {
//                                           //   return '${newValue.round()} dollars';
//                                           // }
//                                         ),
//
//
//                                       ],
//
//
//                                     ),
//                                   ),
//                                   Text("Total Loan years " +
//                                       _loanyearvalues.toStringAsFixed(0),
//                                     style: TextStyle(
//                                         fontSize: 12.0,
//                                         fontWeight: FontWeight
//                                             .w900),),
//
//                                   Row(
//                                     children: [
//                                       Text("YOU CAN SAVE",
//                                         style: TextStyle(
//                                             fontSize: 12.0,
//                                             fontWeight: FontWeight
//                                                 .w900),
//                                       ),
//                                       Spacer(),
//                                       // Text(dollar+s_saveamount.toStringAsFixed(2) ,
//                                       Text(dollar + f.format(s_saveamount),
//                                         style: TextStyle(
//                                             fontSize: 12.0,
//                                             fontWeight: FontWeight
//                                                 .w900),
//                                       )
//                                     ],
//
//                                   ),
//
//                                   // Text("Just slide the Flutter Slider to change value")
//                                 ],
//                               ),),
//
//
//                           ],
//                         ),
//                         //),
//                       ),
//                     ],
//                     //),
//
//                     // ],
//                   ),
//                 //  Text("Last payment Amount"+ i.lastPaymentAmount.toString()),
//               ],
//             ),
//           ),
//
//
//         if (viewVisible2)
//           Container(
//             width: double.infinity,
//             child: Column(
//               children: <Widget>[
//                 for (var i in mrtlist)
//                 // ListView(
//                   Column(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         height: 40.0,
//                         // padding: const EdgeInsets.only( top: 5, bottom: 5),
//                         child: Column(
//                           children: [
//                             Text(
//                               bname,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Text(
//                               acname,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: double.infinity,
//                         height: 250,
//                         margin: const EdgeInsets.only(
//                             right: 20, left: 20),
//                         padding: const EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(10.0),
//                               bottomRight: Radius.circular(10.0),
//                               topLeft: Radius.circular(10.0),
//                               bottomLeft: Radius.circular(10.0)),
//                           color: const Color(0xffEFF4F8),
//                         ),
//                         child: ListView
//                           (children: [
//                           Text(
//                             "MORTGAGE", textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "LAST PAYMENT AMOUNT",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     i.lastPaymentDate.toString(),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "LAST PAYMENT",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount!
//                                             .toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "LOAN TYPE ",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     i.loanTypeDescription.toString(),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "LOAN TERM ",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     i.loanTerm.toString(),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "ORIGATION DATE",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     i.originationDate.toString(),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "YTD PRINICIPAL PAID ",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.ytdPrincipalPaid!
//                                             .toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "CURRENT LATE FEE",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.currentLateFee!
//                                             .toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "NEXT MONTH PAYMENT",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     i.nextPaymentDueDate.toString(),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "YTD INTEREST PAID",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.ytdInterestPaid!
//                                             .toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "MATURITY DATE ",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     i.maturityDate.toString(),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "ESCROW BALANCE",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.escrowBalance.toStringAsFixed(
//                                             2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "DUE AMOUNT ",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.pastDueAmount!
//                                             .toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "PAST DUE DATE",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     i.nextPaymentDueDate.toString(),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]
//                           ),
//                           Row(
//                               children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     "TOTAL AMOUNT",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Container(
//                                   margin: const EdgeInsets.only(
//                                       top: 10),
//                                   child: Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar + f.format(
//                                           i.originationPrincipalAmount),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500),),
//
//                                   ),
//                                 ),
//
//                               ]
//
//                           ),
//
//                           Align(
//                             alignment: Alignment.center,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment
//                                   .center,
//                               children: <Widget>[
//                                 Text(
//                                   'SAVE AS MUCH AS YOU CAN',
//                                   style: TextStyle(fontSize: 14.0,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//
//                                 Text(
//                                   "Check your saving using below tool",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w900,
//                                       fontSize: 12.0),
//                                 ),
//
//                                 // Row(
//                                 //   mainAxisAlignment: MainAxisAlignment
//                                 //       .center,
//                                 //   crossAxisAlignment: CrossAxisAlignment
//                                 //       .baseline,
//                                 //   textBaseline: TextBaseline
//                                 //       .alphabetic,
//                                 //   children: <Widget>[
//                                 //     Text(
//                                 //       height.toString(),
//                                 //       style: TextStyle(fontSize: 12.0,
//                                 //           fontWeight: FontWeight
//                                 //               .w900),
//                                 //     ),
//                                 //
//                                 //   ],
//                                 // ),
//                                 Align(
//                                   alignment: Alignment.center,
//                                   child: Column(
//                                     children: <Widget>[
//                                       Row(
//                                         children: [
//                                           Text(m_minrange.toStringAsFixed(0),
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontWeight: FontWeight
//                                                     .w900),),
//                                           Spacer(),
//                                           Text(m_maxrange.toStringAsFixed(0),
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontWeight: FontWeight
//                                                     .w900),
//                                           ),
//                                         ],
//
//                                       ),
//                                       Slider(
//                                         value: _mloanyearvalues,
//                                         min: double.parse(
//                                             m_minrange.toString()),
//                                         max: double.parse(
//                                             m_maxrange.toString()),
//                                         divisions: 10,
//                                         activeColor: Colors.green,
//                                         inactiveColor: Colors.orange,
//                                         label: _mloanyearvalues.toStringAsFixed(
//                                             0),
//                                         onChanged: (double newmValue) {
//                                           setState(() {
//                                             _mloanyearvalues = newmValue;
//                                             // print(m_saveamount);
//                                           });
//                                           setMortgage(i, _mloanyearvalues);
//                                           displayMortgage();
//                                         },
//                                         // semanticFormatterCallback: (double newValue) {
//                                         //   return '${newValue.round()} dollars';
//                                         // }
//                                       ),
//
//
//                                     ],
//
//
//                                   ),
//                                 ),
//                                 Text("Total Loan years " +
//                                     _mloanyearvalues.toStringAsFixed(0),
//                                   style: TextStyle(
//                                       fontSize: 12.0,
//                                       fontWeight: FontWeight
//                                           .w900),),
//
//                                 Row(
//                                   children: [
//                                     Text("YOU CAN SAVE",
//                                       style: TextStyle(
//                                           fontSize: 12.0,
//                                           fontWeight: FontWeight
//                                               .w900),
//                                     ),
//                                     Spacer(),
//                                     // Text(dollar+s_saveamount.toStringAsFixed(2) ,
//                                     Text(dollar + f.format(m_saveamount),
//                                       style: TextStyle(
//                                           fontSize: 12.0,
//                                           fontWeight: FontWeight
//                                               .w900),
//                                     )
//                                   ],
//
//                                 ),
//
//                                 // Text("Just slide the Flutter Slider to change value")
//                               ],
//                             ),),
//                         ]
//
//                         ),
//                       ),
//
//                       //888****
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         if (viewVisible3)
//           Container(
//             width: double.infinity,
//             //  margin:const EdgeInsets.only(right: 15, left: 15),
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               children: <Widget>[
//                 for (var i in crdlist)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     // use whichever suits your need
//                     children: <Widget>[
//                       Container(
//                         width: double.infinity,
//                         height: 40.0,
//                         child: Column(
//                           children: [
//                             Text(
//                               bname,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Text(
//                               acname,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                           width: double.infinity,
//                           height: 200.0,
//                           margin: const EdgeInsets.only(
//                               right: 15, left: 15),
//                           padding: const EdgeInsets.all(10),
//
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(10.0),
//                                 bottomRight: Radius.circular(10.0),
//                                 topLeft: Radius.circular(10.0),
//                                 bottomLeft: Radius.circular(10.0)),
//                             color: const Color(0xffEFF4F8),
//                           ),
//                           child: ListView(
//                               children: [
//                                 Text(
//                                   "CREDIT", textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 Row(children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("LAST PAYMENT DATE",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                 ]),
//                                 Row(children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("LAST STATEMENT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                 ]),
//                                 Row(children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("DUE DATE ",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         i.nextPaymentDueDate.toString(),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w500),
//                                       )),
//                                 ]),
//                                 Row(children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("MINIMUM PAYMENT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         dollar +
//                                             i.minimumPaymentAmount!
//                                                 .toStringAsFixed(2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w500),
//                                       )),
//                                 ]),
//                                 Row(children: <Widget>[
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text("LAST PAYMENT",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w700)),
//                                   ),
//                                   Spacer(),
//                                   Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         dollar +
//                                             i.lastPaymentAmount
//                                                 .toStringAsFixed(2),
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight
//                                                 .w500),
//                                       )),
//                                 ]),
//                               ])),
//                     ],
//                   ),
//               ],
//               //),
//
//               // ],
//             ),
//           ),
//
//         //--------------------
//
//
//       ],
//     )
// }
