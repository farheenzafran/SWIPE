import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:swipeapp/Controller/Liability.dart';
import 'package:swipeapp/Controller/LiabilityWidget.dart';
import '../Model Helper.dart';
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
import 'VerifyLogin.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:http/http.dart' as http;
import 'Dashboard.dart';

class Dashboard extends StatefulWidget {
  @override
  tdashboardState createState() => tdashboardState();
}

class tdashboardState extends State<Dashboard> {

  String value = "0";
  // Pass this method to the child page.
  void _update(String newValue) {
    setState(() => value = newValue);
  }

  late final Logic logic;
  bool viewVisible = false;
  bool viewVisible1 = false;
  bool viewVisible2 = false;
  bool _expanded = false;
  bool active = false;

  void hideWidget() {
    setState(() {
      //  viewVisible = false;
      viewVisible = !viewVisible;
    });
  }

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }
  bool _addNewTax = false;

  var buttonText = 'Click Me!';
  int _value = 0;
  String dollar = " \$";
  bool isFavourite = false;
  bool isFavourite1 = true;
  bool isFavourite2 = true;
  bool isFavourite3 = true;
  late Future<TokenRequest> tokenRequest;
  bool isLoading = false;
  String ExpenseKey = "expensedata";
  String accesstoken = "";
  String accountid = "";
  int cmonth = 0;
  late String _imgString = '';
  late String imagebase64 = '';
  bool _isShown = true;
  String bname = "";
  String acname = "";
  late Future<List<BankData>> bankdatalist = [] as Future<List<BankData>>;
  late Future<List<BankData>> creditbankdatalist = [] as Future<List<BankData>>;

  BankData bankDataobj = BankData();
  List<Transactions> transactionlist = [];
  Future<TransactionResponse>? transactionResponseList;
  late LegacyLinkConfiguration _publicKeyConfiguration;
  late LinkTokenConfiguration _linkTokenConfiguration;
//---liability
  late LegacyLinkConfiguration creditpublicKeyConfiguration;
  late LinkTokenConfiguration creditlinkTokenConfiguration;
  // List<BankData> bankdatalist = [];

  Liabilities liabilitylist = new Liabilities();
  List<Student> stdlist = [];
  List<Credit> crdlist = [];
  List<Mortgage> mrtlist = [];
  final children = <Widget>[];

//---liability
  int selectedIndex = -1;

  void initState() {
    super.initState();

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
    bankdatalist = getBankData();
    var linktoken = linktokenResponse();
    //>>>>>>>>>>>>>>>>>>>>>>>>>>
    PlaidLink.onSuccess(creditonSuccessCallback);
    PlaidLink.onEvent(creditonEventCallback);
    PlaidLink.onExit(creditonExitCallback);
    creditbankdatalist = creditgetBankData();// as List<BankData>;
    var creditlinktoken = creditlinktokenResponse();
    //>>>>>>>>>>>>>>>>>>>>>>>>>>
  }
  //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>start>>>>>>>>>>>>>>>>>>>>>>>>
  String libKey = "data";
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
  //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
    print("onSuccess222: $publicToken, metadata: ${metadata.description()}");
    bankDataobj.publictoken = publicToken;
    bankDataobj.accesstoken = accesstoken;
    saveBankData(metadata);
  }

  void _onEventCallback(String event, LinkEventMetadata metadata) {
    print("onEvent123: $event, metadata: ${metadata.description()}");
  }

  void _onExitCallback(LinkError? error, LinkExitMetadata metadata) {
    print("onExit metadata: ${metadata.description()}");

    if (error != null) {
      print("onExit error: ${error.description()}");
    }
    // for(int i=0;i<transactionlist.length;i++){
    //   showQty.add(false);
    // }
  }

  void saveBankData(LinkSuccessMetadata metadata) async {
    for (int i = 0; i < metadata.accounts.length; i++) {
      bankDataobj.accountid = metadata.accounts[i].id;
      bankDataobj.accountname = metadata.accounts[i].name;
      bankDataobj.mask = metadata.accounts[i].mask;
    }
    if (metadata.institution.id != "") {
      var insres = await institutionResponse(metadata.institution.id);
      bankDataobj.banklogo = insres.institution?.logo;
      bankDataobj.bankthemecolor = insres.institution?.primaryColor;
      bankDataobj.bankname = insres.institution?.name;
      var accesstokenres =
      await accessTokenResponse(bankDataobj.publictoken.toString());
      bankDataobj.accesstoken = accesstokenres.accessToken;
      List<BankData> templstbankdata = await bankdatalist;
      // print(templstbankdata.length);
      //print(jsonEncode(bankDataobj));
      templstbankdata.add(bankDataobj);
      // print('#######***^^%^%###@@@@@@@');
      print(templstbankdata.length);
      await Constants.save(ExpenseKey, jsonEncode(templstbankdata));

      setState(() {
        bankdatalist = getBankData();
      });

      // print('---calling end accessTokenResponse---');
    }
  }


  Future<List<BankData>> getBankData() async {
    List<BankData> bankdatalist = [];
    try {
      String bdata = await Constants.read(ExpenseKey);
      if (bdata != "") {
        List<dynamic> dicData = jsonDecode(bdata);
        bankdatalist =
        List<BankData>.from(dicData.map((i) => BankData.fromJson(i)));
      }
      print('&&&&&&&&');
      print(bankdatalist.length);
    } catch (Excepetion) {
      throw Exception('Failed to load bankdata');
    }
    return bankdatalist;
  }


  String tname = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Center(
        // child: SingleChildScrollView(
        child: SafeArea(
          // child: Scrollbar(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //  child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.all(15),
                //color: const Color(0xDEB46FEA),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/images/background.png"),
                      fit: BoxFit.cover,
                    )),
                //child: Align(alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Debit',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Image.asset(
                        "asset/images/downarrow.png", // width: 300,
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Credit',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ]),

                //  ),
              ),
              //--------------
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 30,
                  width: 100,
                  margin: EdgeInsets.only(top: 15, left: 15, bottom: 15),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffECDCFF)),
                  child: Text(
                    'Debit: 0',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                // height: 250.0,
                // color: Colors.yellow,
                  child: Column(
                    children: [
                      Container(
                          height: 35,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              top: 15, left: 15, bottom: 15, right: 15),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xffF7F6FA)),
                          child: Row(
                            children: [
                              FlatButton(
                                padding: const EdgeInsets.all(5),
                                onPressed: () async {
                                  Loader.show(context,
                                      isSafeAreaOverlay: false,
                                      progressIndicator:
                                      CircularProgressIndicator(),
                                      isBottomBarOverlay: false,
                                      overlayFromBottom: 80,
                                      themeData: Theme.of(context)
                                          .copyWith(accentColor: Colors.black),
                                      overlayColor: Color(0x0000ffff));
                                  Future.delayed(Duration(seconds: 4), () {
                                    Loader.hide();
                                  });
                                  var linktoken = await linktokenResponse();
                                  _linkTokenConfiguration = LinkTokenConfiguration(
                                    token: linktoken.linkToken.toString(),
                                  );

                                  PlaidLink.open(
                                      configuration: _linkTokenConfiguration);
                                },
                                child: Image(
                                  image: AssetImage("asset/images/Plus.png"),
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              Text('Connect To Debit Account'),
                            ],
                          )),
                      //-----------------------------------debir////-----------
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        margin: const EdgeInsets.only(bottom: 0, top: 0),
                        color: Colors.white,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            FutureBuilder<List<BankData>>(
                              future: bankdatalist,
                              builder: (context, snapshot) {
                                return ExpansionPanelList(
                                  animationDuration: Duration(milliseconds: 2000),
                                  children: snapshot.data!
                                      .map<ExpansionPanel>((BankData item) {
                                    return ExpansionPanel(
                                      headerBuilder:
                                          (BuildContext context, bool isExpanded) {
                                        return ListTile(
                                          iconColor: Colors.red,
                                          leading: CircleAvatar(
                                            radius: 30,
                                            child: Image.memory(
                                              Base64Codec()
                                                  .decode(item.banklogo.toString()),
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
                                                fontWeight: FontWeight.w600),
                                          ),
                                          trailing: Text(
                                            dollar + item.mask.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          subtitle: Text(
                                            item.accountname.toString(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          selected: false,
                                        );
                                      },
                                      body: SingleChildScrollView(
                                        child: RawScrollbar(
                                          thumbColor: Colors.redAccent,
                                          radius: Radius.circular(20),
                                          thickness: 5,
                                          child: _buildExpandableContent(
                                              item.accesstoken.toString(),
                                              item.accountid.toString(),
                                              cmonth),
                                        ),
                                      ),

                                      //   Scrollbar(
                                      // child: SingleChildScrollView(
                                      // scrollDirection: Axis.vertical,
                                      //  child: _buildExpandableContent(
                                      //       item.accesstoken.toString(),
                                      //       item.accountid.toString(),
                                      //       cmonth),
                                      // )),

                                      // ),
                                      isExpanded: item.isExpaneded,
                                    );
                                  }).toList(),
                                  dividerColor: Colors.grey,
                                  expansionCallback: (int index, bool isExpanded) {
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

                      //--------------------------
                    ],
                  )),

              //------------credit------------------
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 30,
                  width: 100,
                  margin: EdgeInsets.only(top: 15, left: 15, bottom: 15),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffECDCFF)),
                  child: Text(
                    'Credit: 0',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                // height: 250.0,
                  child: Column(
                    children: [
                      Container(
                          height: 35,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              top: 15, left: 15, bottom: 15, right: 15),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xffF7F6FA)),
                          child: Row(
                            children: [
                              FlatButton(
                                padding: const EdgeInsets.all(5),
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
                                ),
                              ),
                              Text('Connect To Credit Account'),
                              //Text('Connect To Credit Account2'),






                            ],
                          )),


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

                      //-----------------------------------debir////-----------

                      // Visibility(
                      //   visible: _addNewTax,
                      //   child: Liability(),
                      //
                      // ),

                      //--------------------------
                    ],
                  )),

              // ------------credit------------------
              //////////////visibility////////////////
              Container(
                height: 38,
                width: double.infinity,
                margin: const EdgeInsets.only(
                    top: 15, bottom: 5.0, left: 25, right: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFA781D3),
                    )),
                child: FlatButton(
                  color: const Color(0xFFA781D3),
                  padding: const EdgeInsets.all(5),
                  onPressed: () {},
                  child: Text(
                    'Make a Payment',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 50,
                padding: const EdgeInsets.all(
                  8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color(0xF5F7F6FA),
                ),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      // icon: Image.asset('assets/images/dashboard.png'),
                      icon: ImageIcon(
                        AssetImage("asset/images/home2.png"),
                        size: 140,
                        color:
                        isFavourite ? const Color(0xFFA781D3) : Colors.grey,
                      ),

                      onPressed: () {
                        setState(() {
                          isFavourite = false;
                          isFavourite1 = true;
                          isFavourite2 = true;
                          isFavourite3 = true;
                        });
                      },
                    ),
                    IconButton(
                      icon: ImageIcon(
                        AssetImage("asset/images/pbox.png"),
                        size: 140,
                        color: isFavourite1
                            ? const Color(0xFFA781D3)
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavourite = true;
                          isFavourite1 = false;
                          isFavourite2 = true;
                          isFavourite3 = true;
                        });
                      },
                    ),
                    IconButton(
                      icon: ImageIcon(
                        AssetImage("asset/images/pmoney.png"),
                        size: 140,
                        color: isFavourite2
                            ? const Color(0xFFA781D3)
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavourite = true;
                          isFavourite1 = true;
                          isFavourite2 = false;
                          isFavourite3 = true;
                        });
                      },
                    ),
                    IconButton(
                      icon: ImageIcon(
                        AssetImage("asset/images/paccount.png"),
                        size: 140,
                        color: isFavourite3
                            ? const Color(0xFFA781D3)
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavourite = true;
                          isFavourite1 = true;
                          isFavourite2 = true;
                          isFavourite3 = false;
                        });
                      },
                    ),
                  ],
                ),
              ),


            ],
          ),

          // )
        ),
      ),
      // ),
    );
  }

  _buildExpandableContent(String accessToken, String accountID, int cmonth) {
    print('+++++++++++++++++}');
    var response = transactionResponse(accessToken, accountID, cmonth);
    print(response);
    if (response == null) {
      return ListTile(
        title: Text(
          'sssee',
          style: TextStyle(color: Colors.black),
        ),
      );
    } else {
      return FutureBuilder<TransactionResponse>(
          future: response,
          builder: (context, snapshot) {
            print('snnnnnnnnapshot');
            print(snapshot.data!.transactions.toString());
            // return ExpansionTile(
            //   title: Text(
            //     'test',),
            //   children: _buildTransactionListView(snapshot.data!),
            // );

            return ListView(
              children: _buildTransactionListView(snapshot.data!),
              shrinkWrap: true,
            );
          });
    }
    ;
  }

  _buildTransactionListView(TransactionResponse tdata) {
    List<Widget> listTiles = [];
    for (var t in tdata.transactions!) {
      var card = (Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 5),
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
                  dollar + t.amount.toString(),
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
          // )

      );

      // var tile = ListTile(
      //        title: Text(
      //          t.name.toString(),
      //          style: TextStyle(fontWeight: FontWeight.w700),
      //        ),
      //      );
      //      listTiles.add(tile);

      listTiles.add(card);
    }
    return listTiles;
  }
}

//--------------------------------------------------------------------------------------------------------
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
  print('>>>>>>>>>>>>>>>>>>>>>>>> Link Token <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
  print(response.body);
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
  print(response2.body);
  if (response2.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON
    return InstitutionResponse.fromJson(jsonDecode(response2.body));
  } else {
    throw Exception('Failed to call institution .');
  }
}

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
  print('respose44 body-----: ${jsonEncode(response4.body)}');
  print(accesstoken);
  print('##########################################'
      '###################################################'
      '##############');
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

//>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
//>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
