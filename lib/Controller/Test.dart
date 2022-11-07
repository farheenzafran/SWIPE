// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:math' as math;
// import 'dart:ui';
// import 'dart:ui';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_charts/flutter_charts.dart';
// import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
// import 'package:plaid_flutter/plaid_flutter.dart';
//
// import 'package:swipeapp/Controller/Request/SaveBankDataRequest.dart';
// import 'package:swipeapp/Controller/Request/RefreshTokenRequest.dart';
// import 'package:swipeapp/Controller/Response/GetBankDataResponse.dart';
// import 'package:swipeapp/Controller/Response/RefreshTokenResponse.dart';
// import 'package:swipeapp/Controller/Response/SaveBankDataResponse.dart';
//
// import '../Model Helper.dart';
//
// import 'Account/AddAccount1.dart';
// import 'PlaidData/BankData.dart';
// import 'PlaidData/TransactionDetail.dart';
// import 'Plan/PlanAccount1.dart';
// import 'Request/AccessTokenRequest.dart';
// import 'Request/InstitutionRequest.dart';
// import 'Request/LiabilityRequest.dart';
// import 'Request/TokenResquest.dart';
// import 'Request/TransactionRequest.dart';
// import 'Response/AccessTokenResponse.dart';
// import 'Response/InstitutionResponse.dart';
// import 'Response/LiabilityResponse.dart';
// import 'Response/LinkTokenResponse.dart';
// import 'Response/TransactionResponse.dart';
// import 'package:flutter/services.dart';
// import 'dart:math' as math;
// import 'Response/UserDeatail.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       // title: 'Kindacode.com',
//       home: Dashboard2(),
//     );
//   }
// }
//
// class Dashboard2 extends StatefulWidget {
//   const Dashboard2({Key? key}) : super(key: key);
//
//   // final Function callback;
//   //const Dashboard(this.callback);
//   @override
//   tdashboardState createState() => tdashboardState();
// }
//
// class tdashboardState extends State<Dashboard2> {
//   BankData bankDataobj = BankData();
//
//   //creditBankData creditbankDataobj = creditBankData();
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//   late Future<List<BankData>> bankdatalist = [] as Future<List<BankData>>;
//   late Future<List<BankData>> creditbankdatalist = [] as Future<List<BankData>>;
//   List<Transactions> transactionlist = [];
//
//   List<double> debitGraphdata = [];
//   List<double> creditGraphdata = [];
//   List<String> graphbankname = [];
//
//   Future<TransactionResponse>? transactionResponseList;
//   late LegacyLinkConfiguration _publicKeyConfiguration;
//   late LinkTokenConfiguration _linkTokenConfiguration;
//   late Future<TokenRequest> tokenRequest;
//   String ExpenseKey = "expensedata";
//   String accesstoken = "";
//   String accountid = "";
//   int cmonth = 0;
//   late String _imgString = '';
//   late String imagebase64 = '';
//   bool _isShown = true;
//   String bname = "";
//   String acname = "";
//   int selectedIndex = -1;
//   late double tDebitValue = 0;
//   late double tCreditValue = 0;
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//
//   String dollar = " \$";
//   bool isFavourite = false;
//   bool isFavourite1 = true;
//   bool isFavourite2 = true;
//   bool isFavourite3 = true;
//   bool isLoading = false;
//   bool isLoading1 = true;
//   bool isexpanse = true;
//   bool viewVisibleTransaction = true;
//   bool viewVisible1 = true;
//
//   void hideWidget1() {
//     setState(() {
//       viewVisible1 = !viewVisible1;
//       viewVisible1 = false;
//     });
//   }
//
//   void showWidget() {
//     setState(() {
//       viewVisible = true;
//     });
//   }
//
// //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   late LinkTokenConfiguration creditlinkTokenConfiguration;
//   Liabilities liabilitylist = new Liabilities();
//   List<Student> stdlist = [];
//   List<Credit> crdlist = [];
//   List<Mortgage> mrtlist = [];
//   bool viewVisible = false;
//   bool viewVisible2 = false;
//   bool viewVisible3 = false;
//
//   void hideWidget() {
//     setState(() {
//       viewVisible = false;
//       viewVisible2 = false;
//       viewVisible3 = false;
//     });
//   }
//   bool _expanded = false;
//   late ScrollController _scrollController;
//
//   //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//   late ChartData chartData;
//   ChartOptions chartOptions = const ChartOptions(
//     labelCommonOptions: MyLabelCommonOptions(),
//
//   );
//
//   late var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy);
//
//   void initState() {
//     // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
//     //super.initState();
//     chartData = ChartData(
//       dataRows:  [
//         debitGraphdata,
//         creditGraphdata,
//       ],
//       xUserLabels: graphbankname,
//
//       // dataRows: const [
//       //   [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//       //   [0, 0, 0, 0, 0, -1800.0],
//       // ],
//       //   xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const ['Values', 'Values 2'],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//
//       chartOptions: chartOptions,
//
//     );
//     verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//     _publicKeyConfiguration = LegacyLinkConfiguration(
//       clientName: Constants.ClientId,
//       publicKey: "PUBLIC_KEY",
//       environment: LinkEnvironment.sandbox,
//       products: <LinkProduct>[
//         LinkProduct.auth,
//         LinkProduct.transactions,
//       ],
//       language: "en",
//       countryCodes: ['US'],
//       userLegalName: "John Appleseed",
//       userEmailAddress: "jappleseed@youapp.com",
//       userPhoneNumber: "+1 (512) 555-1234",
//     );
//     PlaidLink.onSuccess(_onSuccessCallback);
//     PlaidLink.onEvent(_onEventCallback);
//     PlaidLink.onExit(_onExitCallback);
//     bankdatalist = fetchBankData(Constants.debitcardValue);
//     var linktoken = linktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//     creditbankdatalist = fetchBankData(Constants
//         .creditcardValue); // as Future<List<creditBankData>>;// as List<BankData>;
//     var creditlinktoken = creditlinktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//     _scrollController = ScrollController();
//
//
//     // var verticalBarChart = VerticalBarChart(
//     //   painter: VerticalBarChartPainter(
//     //     verticalBarChartContainer: verticalBarChartContainer,
//     //   ),
//     // );
//   }
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>start>>>>>>>>>>>>>>>>>>>>>>>>
//   String libKey = "data";
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
//     // print("onSuccess222: $publicToken, metadata: ${metadata.description()}");
//     bankDataobj.publictoken = publicToken;
//     bankDataobj.accesstoken = accesstoken;
//     savingBankData(metadata);
//   }
//
//   void _onEventCallback(String event, LinkEventMetadata metadata) {
//     // print("onEvent123: $event, metadata: ${metadata.description()}");
//   }
//
//   void _onExitCallback(LinkError? error, LinkExitMetadata metadata) {
//     // print("onExit metadata: ${metadata.description()}");
//
//     if (error != null) {
//       // print("onExit error: ${error.description()}");
//     }
//   }
//
//   void savingBankData(LinkSuccessMetadata metadata) async {
//     for (int i = 0; i < metadata.accounts.length; i++) {
//       bankDataobj.accountid = metadata.accounts[i].id;
//       bankDataobj.accountname = metadata.accounts[i].name;
//       bankDataobj.mask = metadata.accounts[i].mask;
//     }
//     if (metadata.institution.id != "") {
//       var insres = await institutionResponse(metadata.institution.id);
//       bankDataobj.banklogo = insres.institution?.logo;
//       print("logooooooooo");
//       print(bankDataobj.banklogo);
//       print("logooooooooo");
//       bankDataobj.bankthemecolor = insres.institution?.primaryColor;
//       bankDataobj.bankname = insres.institution?.name;
//       var accesstokenres =
//       await accessTokenResponse(bankDataobj.publictoken.toString());
//       bankDataobj.accesstoken = accesstokenres.accessToken;
//
//       //  if (isexpanse) {
//       // saveBankdataResponse();
//       // List<BankData> templstbankdata = await bankdatalist;
//       //templstbankdata.add(bankDataobj);
//       //await Constants.save(ExpenseKey, jsonEncode(templstbankdata));
//       //  } else {
//       // List<BankData> templstbankdata = await creditbankdatalist;
//       // templstbankdata.add(bankDataobj);
//       // await Constants.save(libKey, jsonEncode(templstbankdata));
//       // }
//
//       //   setState(() {
//       saveBankdataResponse();
//       //  });
//
//       // print('---calling end accessTokenResponse---');
//     }
//   }
//
//   //--
//   Future<List<BankData>> appendElements(
//       Future<List<BankData>> listFuture, List<BankData> elementsToAdd) async {
//     // final list = await listFuture;
//     // int count = list.length;
//     // for(int i = count; i>0; i-- )
//     //   {
//     //     list.remove(list[i]);
//     //   }
//     // List<BankData>
//     // list.addAll(elementsToAdd);
//     return elementsToAdd;
//   }
//
//   //--
//
//   Future<List<BankData>> getBankData(List<BankData> bankresultList) async {
//     print("frfgr<<<<<<>>>>>>");
//
//     try {
//       // var bankdatalist1 =  [] as Future<List<BankData>>;
//       // setState(() {
//       bankdatalist = appendElements(bankdatalist, bankresultList);
//       //});
//       print("<<<<<<>>>>>>");
//
//       bankdatalist = debitTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load debitbankdata');
//     }
//     return bankdatalist;
//   }
//
//   Future<List<BankData>> getCreditBankData(
//       List<BankData> bankresultList) async {
//     try {
//       //creditbankdatalist =  [] as Future<List<BankData>>;
// //
//       // setState(() {
//       creditbankdatalist = appendElements(creditbankdatalist, bankresultList);
//       // });
//
//       creditTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load creditbankdata');
//     }
//     return creditbankdatalist;
//   }
//
//   Future<List<BankData>> fetchBankData(int type) async {
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String banktoken = tempuserdetail.accessToken.toString();
//     final response = await http.get(
//         Uri.parse(
//             Constants.baseUrl2 + '/Bank/GetBankData?type=' + type.toString()),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $banktoken',
//         });
//     print(response.body);
//
//     List<BankData> tempbankdatalist = <BankData>[];
//     if (response.statusCode == 200) {
//       GetBankDataResponse bankdataResponse =
//       GetBankDataResponse.fromJson(jsonDecode(response.body));
//       for (var i in bankdataResponse.result!) {
//         BankData bd = new BankData();
//         bd.publictoken = i.publictoken;
//         bd.bankthemecolor = i.bankthemecolor;
//         bd.banklogo = i.banklogo;
//         bd.mask = i.mask;
//         bd.accountname = i.accountname;
//         bd.accesstoken = i.accesstoken;
//         bd.bankname = i.bankname;
//         bd.accountid = i.accountid;
//         tempbankdatalist.add(bd);
//       }
//
//       print(jsonEncode(tempbankdatalist));
//       print("reposne>>>>>>>");
//       // getBankData(tempbankdatalist);
//       // return tempbankdatalist ;
//       if (type == Constants.debitcardValue) {
//         tempbankdatalist = getBankData(tempbankdatalist) as List<BankData>;
//         return tempbankdatalist;
//       } else {
//         getCreditBankData(tempbankdatalist);
//         return tempbankdatalist;
//       }
//
//       // return GetBankDataResponse.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to call user childuserid .');
//     }
//   }
//
//   Future<SaveBankDataResponse> saveBankdataResponse() async {
//     SaveBankDataRequest saveBankDataRequest = SaveBankDataRequest();
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String accounttoken = tempuserdetail.accessToken.toString();
//     saveBankDataRequest.id = 0;
//     saveBankDataRequest.accountid = bankDataobj.accountid;
//     saveBankDataRequest.accesstoken = bankDataobj.accesstoken;
//     saveBankDataRequest.accountname = bankDataobj.accountname;
//     saveBankDataRequest.mask = bankDataobj.mask;
//     saveBankDataRequest.bankname = bankDataobj.bankname;
//     saveBankDataRequest.banklogo = bankDataobj.banklogo;
//     print("banklogooooooooo>>>>>>>>");
//     print(bankDataobj.banklogo?.length.toString());
//     print(bankDataobj.banklogo);
//     print("banklogooooooooo>>>>>>>>");
//     saveBankDataRequest.bankthemecolor = bankDataobj.bankthemecolor;
//     saveBankDataRequest.publictoken = bankDataobj.publictoken;
//
//     if (isexpanse) {
//       saveBankDataRequest.type = Constants.debitcardValue;
//     } else {
//       saveBankDataRequest.type = Constants.creditcardValue;
//     }
//     //print('/////////request <<<<<<<<<<<<<<<<<<<<<<<<<');
//     //print(jsonEncode(saveBankDataRequest));
//     //print('/////////.request <<<<<<<<<<<<<<<<<<<<<<<<<');
//
//     final savebankresponse =
//     await http.post(Uri.parse(Constants.baseUrl2 + '/Bank/SaveBankData'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $accounttoken',
//         },
//         body: jsonEncode(saveBankDataRequest));
//     // print('/////////.svaebankdata <<<<<<<<<<<<<<<<<<<<<<<<<');
//     // print(accounttoken);
//     // print(saveBankDataRequest);
//     // print(savebankresponse);
//     // print(savebankresponse.body);
//     // print(savebankresponse.statusCode);
//     // print('/////////<<<<svaebankdata<<<<<<<<<<<<<<<<<<<<<');
//
//     if (savebankresponse.statusCode == 200) {
//       fetchBankData(saveBankDataRequest.type!);
//
//       return SaveBankDataResponse.fromJson(jsonDecode(savebankresponse.body));
//     } else {
//       throw Exception('Failed to call plaid save bank data.');
//     }
//   }
//
//   late final Function callback;
//
//   final List<String> iconname = [
//     'asset/images/cart.png',
//     'asset/images/at.png',
//     'asset/images/travel.png',
//     'asset/images/movie.png',
//
//     //   'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//   ];
//   List<String> TransactionIconCategory =[
//     "Bank Fees",
//     "Cash Advance",
//     "Community"
//   ];
//
//
//
//
//
//   // const Dashboard(this.callback);
//
//   Future<TransactionResponse> transactionResponse(
//       String accesstoken, String accountid, int currentmonth) async {
//     String startdate = "";
//     String enddate = "";
//     var now = new DateTime.now().toString();
//     var date = DateTime.parse(now);
//     DateTime firstDayOfMonth = new DateTime(date.year, date.month, 1);
//     // var dateObj = new Date;
//     // var lmonth = dateObj.getUTCMonth() + 1; //months from 1-12
//     // var lday = dateObj.getUTCDate();
//     // var lyear = dateObj.getUTCFullYear();
//     // var lastendDayOfMonth = lyear + "/" + lmonth + "/" + lday;
//     // DateTime lastendDayOfMonth = DateTime(date.year, date.month+1 , 0);
//     DateTime lastendDayOfMonth = (date.month < 12)
//         ? new DateTime(date.year, date.month + 1, 0)
//         : new DateTime(date.year + 1, 1, 0);
//     var fyear = firstDayOfMonth.year;
//     var fmonth = firstDayOfMonth.month.toString().padLeft(2, '0');
//     var fday = firstDayOfMonth.day.toString().padLeft(2, '0');
//     var firstday = "${fyear}-${fmonth}-${fday}";
//     var lyear = lastendDayOfMonth.year;
//     var lmonth = lastendDayOfMonth.month.toString().padLeft(2, '0');
//     var lday = lastendDayOfMonth.day.toString().padLeft(2, '0');
//     var lastday = "${lyear}-${lmonth}-${lday}";
//     startdate = firstday;
//     enddate = lastday;
//
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     // print(startdate);
//     // print(enddate);
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     Transactionoptions transactionoptions = Transactionoptions();
//     transactionoptions.count = 20;
//     transactionoptions.offset = 0;
//     transactionoptions.accountIds = [accountid];
//     TransactionRequest transactionRequest = TransactionRequest();
//     transactionRequest.clientId = Constants.ClientId;
//     transactionRequest.secret = Constants.Secret;
//     transactionRequest.accessToken = accesstoken;
//     transactionRequest.options = transactionoptions;
//     transactionRequest.startDate = startdate;
//     transactionRequest.endDate = enddate;
//     isLoading1 = false;
//     print(
//         'dasgboardRequest body4--REQUESTTTTTTTTTTTTTTTTTTTT: ${jsonEncode(transactionRequest)}');
//     final response4 =
//     await http.post(Uri.parse(Constants.URL + '/transactions/get'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(transactionRequest));
//     print(
//         '!!!!!!!!!!!!###########################################################################################################');
//     print('dshrespose44 body-----: ${response4}');
//     print(response4.statusCode);
//     print(response4);
//     // print(accesstoken);
//     print('dash##########################################'
//         '###################################################'
//         '##############');
//     if (response4.statusCode == 200) {
//       void dispose() {
//         Loader.hide();
//         isLoading1 = false;
//         // super.dispose();
//       }
//
//       return TransactionResponse.fromJson(jsonDecode(response4.body));
//     } else {
//       //void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//       //}
//
//       throw Exception('Failed to call transaction .');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     var _val;
//     var chidern;
//     return Scaffold(
//
//
//
//       //  resizeToAvoidBottomInset: false,
//
//       body: SafeArea(
//
//           child:
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 dashboardHeader(),
//                 Column(
//                   children:<Widget>[
//                     debitTransaction(),
//                     creditLiability(),
//                     paymentButton(),
//                     viewtransaction(),
//                     Visibility(
//                       maintainSize: true,
//                       maintainAnimation: true,
//                       maintainState: true,
//                       visible: viewVisible1,
//                       child: Container(
//                         width: double.infinity,
//                         //height: 200.0,
//                         // color: Colors.yellow,
//                         child: Column(
//                           //child: Column(
//                           children: [
//                             isLoading1 ?
//                             Center(child: CircularProgressIndicator()) :
//                             ListView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemCount: transactionlist.length,
//                                 itemBuilder: (context, int index) {
//                                   var $;
//                                   return Card(
//                                     color: const Color(0xffF7F6FA),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 80.0,
//                                       margin:
//                                       const EdgeInsets.only(right: 9, left: 9),
//                                       child: ListTile(
//                                           contentPadding: EdgeInsets.only(
//                                               left: 10.0, right: 0.0),
//                                           leading: CircleAvatar(
//                                             radius: 20,
//                                             child:
//                                             Image(image: AssetImage("asset/images/cart.png"),
//                                               //Image.asset( iconname[index],),
//                                             ),
//                                           ),
//                                           title: Text(
//                                             transactionlist[index].name.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           subtitle: Text(
//                                             transactionlist[index]
//                                                 .category
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing: Padding(
//                                             padding: EdgeInsets.only(top: 5),
//                                             child: Column(children: <Widget>[
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                     top: 3, bottom: 3),
//                                                 child: Text(
//                                                   dollar +
//                                                       transactionlist[index]
//                                                           .amount
//                                                           .toStringAsFixed(2),
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w600),
//                                                 ),
//                                               ),
//                                               Text(
//                                                 transactionlist[index]
//                                                     .date
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w500),
//                                               ),
//                                             ]),
//                                           )),
//                                     ),
//                                   );
//                                 }
//                               // );
//                               // }
//                               //},
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 )
//
//
//
//
//
//
//               ],
//             ),
//           )
//       ),
//
//
//
//
//     );
//   }
//
// //<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   Widget chartToRun() {
//     LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//     ChartData chartData;
//     ChartOptions chartOptions = const ChartOptions();
//     // Example shows a mix of positive and negative data values.
//     chartData = ChartData(
//       dataRows: const [
//         [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//         [0,0,0,0,0, -1800.0],
//       ],
//       xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const [
//         'Values',
//         'Values 2'
//       ],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//       chartOptions: chartOptions,
//     );
//     var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//
//     var verticalBarChart = VerticalBarChart(
//       painter: VerticalBarChartPainter(
//         verticalBarChartContainer: verticalBarChartContainer,
//       ),
//     );
//     return verticalBarChart;
//   }
//   dashboardHeader() {
//     return   Flexible(
//         child: Container(
//           //height: 120,
//             width: double.infinity,
//             padding: EdgeInsets.all(5),
//             //color: const Color(0xDEB46FEA),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("asset/images/background.png"),
//                   fit: BoxFit.cover,
//                 )),
//             //child: Align(alignment: Alignment.center,
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Row(mainAxisSize: MainAxisSize.min, children: [
//                     Container(
//                         margin: EdgeInsets.all(8),
//                         alignment: Alignment.topLeft,
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           //color: const Color(0x75f5f5f5)
//                         ),
//                         child:
//                         // Row(
//                         //   mainAxisSize: MainAxisSize.min,
//                         //   children: [
//                         Text(
//                           'Test Account',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 15,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold //font color
//                           ),
//                         )
//                       //   ],
//                       // )
//
//                     ),
//                   ]),
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tDebitValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 18,
//                                 //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                                 color: Colors.white,
//                                 //font color
//                                 fontStyle: FontStyle.italic),
//                           ),
//                           Text(
//                             'Debit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//
//
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tCreditValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 18,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               //font color
//                               fontStyle: FontStyle.italic,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             'Credit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//                     ]),
//                 Container(
//                   //width: 80,
//                   child:
//                   ExpandableNotifier(  // <-- Provides ExpandableController to its children
//                     child: Column(
//                       children: [
//                         Expandable(           // <-- Driven by ExpandableController from ExpandableNotifier
//                           collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
//                             child: //Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,),
//                             Image.asset(
//                               "asset/images/down.png", // width: 300,
//                               height: 20,
//                               width: 20,
//                               alignment: Alignment.center,
//                             ),
//
//                           ),
//                           expanded: Column(
//                               children: [
//                                 //Text("Backjdsgcygdsucudshiodhycoe"),
//                                 SizedBox(
//                                     width: 400,
//                                     height: 350,
//                                     child: FittedBox(child: Column(
//                                       children: [
//                                         //  addAccountHeader(),
//                                         Container(
//                                           // color: Colors.yellow,
//                                           height: 300,
//                                           width: 350,
//                                           child:
//                                           //Column(
//                                           // children: [
//                                           //  addAccountHeader(),
//                                           VerticalBarChart(
//                                             painter: VerticalBarChartPainter(
//                                               verticalBarChartContainer: verticalBarChartContainer,
//                                             ),
//                                           ),
//
//                                         )
//                                       ],
//                                     ))
//                                 ),
//                                 ExpandableButton(
//                                   child:  Image.asset(
//                                     "asset/images/up.png", // width: 300,
//                                     height: 20,
//                                     width: 20,
//                                     alignment: Alignment.center,
//                                   ),
//                                 ),
//                               ]
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],
//             )
//
//           //  ),
//         ));
//   }
//
//   debitTransaction() {
//     return Scrollbar(
//       child:Column(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Row(mainAxisSize: MainAxisSize.min, children: [
//               Container(
//                   margin: EdgeInsets.all(8),
//                   alignment: Alignment.topLeft,
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: const Color(0xffECDCFF)),
//                   child:
//                   // Row(
//                   //   mainAxisSize: MainAxisSize.min,
//                   //   children: [
//                   Text(
//                     'Debit:' + dollar + tDebitValue.toStringAsFixed(2),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 14,
//                         //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                         color: Colors.black,
//                         //font color
//                         fontStyle: FontStyle.italic),
//                   )
//                 //   ],
//                 // )
//
//               ),
//             ]),
//             // ),
//           ),
//           Container(
//             // height: 250.0,
//             // color: Colors.yellow,
//               child: Column(
//                 children: [
//                   Container(
//                       height: 35,
//                       width: double.infinity,
//                       margin:
//                       EdgeInsets.only(top: 5, left: 15, bottom: 10, right: 15),
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           color: const Color(0xffEDECEE)),
//                       child: Row(
//                         children: [
//                           TextButton(
//                             style: TextButton.styleFrom(
//                               padding: const EdgeInsets.all(5),
//                             ),
//                             onPressed: () async {
//                               isexpanse = true;
//                               Loader.show(context,
//                                   isSafeAreaOverlay: false,
//                                   progressIndicator: CircularProgressIndicator(),
//                                   isBottomBarOverlay: false,
//                                   overlayFromBottom: 80,
//                                   themeData: Theme.of(context)
//                                       .copyWith(accentColor: Colors.black),
//                                   overlayColor: Color(0x0000ffff));
//                               Future.delayed(Duration(seconds: 4), () {
//                                 Loader.hide();
//                               });
//                               var linktoken = await linktokenResponse();
//                               _linkTokenConfiguration = LinkTokenConfiguration(
//                                 token: linktoken.linkToken.toString(),
//                               );
//
//                               PlaidLink.open(configuration: _linkTokenConfiguration);
//                             },
//                             child: Image(
//                               image: AssetImage("asset/images/Plus.png"),
//                               width: 100,
//                               height: 100,
//                             ),
//                           ),
//                           Text('Connect To Debit Account'),
//                         ],
//                       )),
//                   //-----------------------------------debir////-----------
//                   Container(
//                     width: double.infinity,
//                     // height: 150.0,
//                     margin: const EdgeInsets.only(bottom: 4, top: 4),
//                     color: Colors.white,
//                     child: ListView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       children: [
//                         FutureBuilder<List<BankData>>(
//                           future: bankdatalist,
//                           builder: (context, snapshot) {
//                             if(snapshot.hasData)
//                             {
//                               return
//                                 ExpansionPanelList(
//                                   animationDuration: Duration(milliseconds: 2000),
//                                   children:
//                                   snapshot.data!.map<ExpansionPanel>((BankData item) {
//                                     return ExpansionPanel(
//                                       headerBuilder:
//                                           (BuildContext context, bool isExpanded) {
//                                         return ListTile(
//                                           iconColor: Colors.red,
//                                           leading: CircleAvatar(
//                                             radius: 30,
//                                             child:
//                                             // Image.memory(Base64Codec().decode(item.banklogo.toString()),),
//                                             Image.network(item.banklogo.toString()),
//                                           ),
//                                           title: Text(
//                                             item.bankname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing:
//                                           item.totalamount ==null?
//                                           Text(dollar+'0',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ):
//                                           Text('${item.totalamount.toString()}',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ),
//                                           // Text(
//                                           //   dollar + item.totalamount.toString(), "0",
//                                           //
//                                           //   style: TextStyle(
//                                           //       color: Colors.black,
//                                           //       fontSize: 16,
//                                           //       fontWeight: FontWeight.w500),
//                                           //),
//                                           subtitle: Text(
//                                             item.accountname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                           selected: false,
//                                         );
//                                       },
//                                       body:
//                                       // Text("gcdsgchgdsv"),
//                                       debitBuildExpandableContent(
//                                           item.accesstoken.toString(),
//                                           item.accountid.toString(),
//                                           cmonth),
//                                       isExpanded: item.isExpaneded,
//                                     );
//                                   }).toList(),
//                                   dividerColor: Colors.grey,
//                                   expansionCallback: (int index, bool isExpanded) {
//                                     setState(() {
//                                       snapshot.data![index].isExpaneded = !isExpanded;
//                                     });
//                                   },
//                                 );
//                             }
//                             else
//                             {
//                               return Center(
//                                   child: CircularProgressIndicator());
//                             }
//
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
// //chnage heiught to 200
//                   //--------------------------
//                 ],
//               )),
//
//         ],
//       ),
//     );
//   }
//
//   creditLiability() {
//     return Column(children: [
//       Align(
//         alignment: Alignment.topLeft,
//         child: Row(mainAxisSize: MainAxisSize.min, children: [
//           Container(
//               margin: EdgeInsets.all(8),
//               alignment: Alignment.topLeft,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: const Color(0xffECDCFF)),
//               child:
//               // Row(
//               //   mainAxisSize: MainAxisSize.min,
//               //   children: [
//               Text(
//                 'Credit: ' + dollar + tCreditValue.toStringAsFixed(2),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 14,
//                     //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                     color: Colors.black,
//                     //font color
//                     fontStyle: FontStyle.italic),
//               )
//             //   ],
//             // )
//
//           ),
//         ]),
//       ),
//       Container(
//           height: 35,
//           width: double.infinity,
//           margin: EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 15),
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: const Color(0xffEDECEE)),
//           child: Row(
//             children: [
//               TextButton(
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.all(5),
//                 ),
//                 onPressed: () async {
//                   isexpanse = false;
//                   Loader.show(context,
//                       isSafeAreaOverlay: false,
//                       progressIndicator: CircularProgressIndicator(),
//                       isBottomBarOverlay: false,
//                       overlayFromBottom: 80,
//                       themeData:
//                       Theme.of(context).copyWith(accentColor: Colors.black),
//                       overlayColor: Color(0x0000ffff));
//                   Future.delayed(Duration(seconds: 4), () {
//                     Loader.hide();
//                   });
//                   var creditlinktoken = await creditlinktokenResponse();
//                   creditlinkTokenConfiguration = LinkTokenConfiguration(
//                     token: creditlinktoken.linkToken.toString(),
//                   );
//
//                   PlaidLink.open(configuration: creditlinkTokenConfiguration);
//                 },
//                 child: Image(
//                   image: AssetImage("asset/images/Plus.png"),
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//               Text('Connect To Credit Account'),
//               //Text('Connect To Credit Account2'),
//             ],
//           )),
//       Container(
//         width: double.infinity,
//         // height: 150.0,
//         margin: const EdgeInsets.only(bottom: 0, top: 0),
//         color: Colors.white,
//         child: ListView(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//
//           children: [
//             FutureBuilder<List<BankData>>(
//               future: creditbankdatalist,
//               builder: (context, snapshot) {
//                 if(snapshot.hasData)
//                 {
//                   return
//                     ExpansionPanelList(
//                       animationDuration: Duration(milliseconds: 2000),
//                       children: snapshot.data!.map<ExpansionPanel>((BankData item) {
//                         return ExpansionPanel(
//                           headerBuilder: (BuildContext context, bool isExpanded) {
//                             return ListTile(
//                               iconColor: Colors.red,
//                               leading: CircleAvatar(
//                                   radius: 30,
//                                   child:
//                                   //Image.memory(Base64Codec().decode(item.banklogo.toString())),
//
//                                   Image.network(item.banklogo.toString())),
//                               title: Text(
//                                 item.bankname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               trailing:
//                               // Text(
//                               //   dollar + item.totalamount.toString(),
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 16,
//                               //       fontWeight: FontWeight.w500),
//                               // ),
//                               item.totalamount ==null?
//                               Text(dollar+'0',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ):
//                               Text('${item.totalamount!.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 item.accountname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               selected: false,
//                             );
//                           },
//                           body: //Text('hgsdvfghjbvsdjhcgsdh'),
//                           creditBuildExpandableContent(
//                             item.accesstoken.toString(),
//                             item.accountid.toString(),
//                           ),
//                           isExpanded: item.isExpaneded,
//                         );
//                       }).toList(),
//                       dividerColor: Colors.grey,
//                       expansionCallback: (int index, bool isExpanded) async {
//                         setState(() {
//                           snapshot.data![index].isExpaneded = !isExpanded;
//                         });
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // print(index);
//                         // print(isExpanded);
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // TransactionResponse tempresponse2 =
//                         //     await transactionResponse(
//                         //         snapshot.data![index].accesstoken.toString(),
//                         //         snapshot.data![index].accountid.toString(),
//                         //         cmonth);
//                         //
//                         // transactionlist =
//                         //     tempresponse2.transactions as List<Transactions>;
//                         // viewVisible = true;
//                         viewVisibleTransaction = true;
//                         showWidget();
//                         LiabilityResponse tempresponse = await liabilityData(
//                             snapshot.data![index].accesstoken.toString(),
//                             snapshot.data![index].accountid.toString());
//                         liabilitylist = tempresponse.liabilities as Liabilities;
//                         viewVisible = false;
//                         viewVisible2 = false;
//                         viewVisible3 = false;
//                         if (liabilitylist.student != null) {
//                           stdlist = liabilitylist.student!;
//                           viewVisible = true;
//                           //  print("student");
//                           setStudentLoanContainer(liabilitylist.student!.first, 0);
//                         }
//                         if (liabilitylist.mortgage != null) {
//                           mrtlist = liabilitylist.mortgage!;
//                           viewVisible2 = true;
//                           //  print("mortgage");
//                           setMortgage(liabilitylist.mortgage!.first, 0);
//                         }
//                         if (liabilitylist.credit != null) {
//                           crdlist = liabilitylist.credit!;
//                           viewVisible3 = true;
//                           //  print("credit");
//                         }
//                       },
//                     );
//                 }
//                 else
//                 {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//               },
//             ),
//           ],
//         ),
//       ),
//     ]);
//   }
//
//   paymentButton() {
//     return Container(
//       height: 38,
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 15, bottom: 20.0, left: 25, right: 25),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//             //color: const Color(0xFFA781D3),
//           )),
//       child: TextButton(
//         style: TextButton.styleFrom(
//           backgroundColor: const Color(0xFFA781D3),
//           padding: const EdgeInsets.all(5),
//         ),
//         onPressed: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => AddAccount()),
//           // );
//         },
//         child: Text(
//           'Make a Payment',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
//
//   bottomNavBar() {
//     return Container(
//       height: 45,
//       padding: const EdgeInsets.all(
//         8,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(2),
//         color: const Color(0xF5F7F6FA),
//       ),
//       //alignment: Alignment.bottomCenter,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           IconButton(
//             // icon: Image.asset('assets/images/dashboard.png'),
//             icon: ImageIcon(
//               AssetImage("asset/images/home2.png"),
//               size: 140,
//               color: isFavourite ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//
//             onPressed: () {
//               setState(() {
//                 isFavourite = false;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pbox.png"),
//               size: 140,
//               color: isFavourite1 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   //MaterialPageRoute(builder: (context) => Spend(this.)),
//               // );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = false;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pmoney.png"),
//               size: 140,
//               color: isFavourite2 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PlanAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = false;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/paccount.png"),
//               size: 140,
//               color: isFavourite3 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = false;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   viewtransaction() {
//     return Container(
//       child: Row(children: [
//         Container(
//             margin: EdgeInsets.all(8),
//             alignment: Alignment.topLeft,
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: const Color(0xffECDCFF)),
//             child:
//             // Row(
//             //   mainAxisSize: MainAxisSize.min,
//             //   children: [
//             Text(
//               'Recent Transactions',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 14,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: Colors.black,
//                   //font color
//                   fontStyle: FontStyle.italic),
//             )
//           //   ],
//           // )
//
//         ),
//         Spacer(),
//         Container(
//           margin: EdgeInsets.all(8),
//           alignment: Alignment.topRight,
//           child: InkWell(
//             onTap: () async {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TransactionDetail(),
//                   // Pass the arguments as part of the RouteSettings. The
//                   // DetailScreen reads the arguments from these settings.
//                   settings: RouteSettings(
//                     arguments: transactionlist,
//                   ),
//                 ),
//               );
//               setState(() {
//                 //selectedIndex = i;
//               });
//             },
//             child: new Text(
//               "View All",
//               style: TextStyle(
//                   fontSize: 13,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: const Color(0xffA781D3),
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
//
// //   <<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
// //
// // ------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   debitTotalValue(List<BankData> debitlistbankdata) async {
//     double totalTransactionValue = 0;
//     for (var debitdata in debitlistbankdata) {
//       double debitcardtotalTransactionValue = 0;
//       var response = await transactionResponse(debitdata.accesstoken.toString(),
//           debitdata.accountid.toString(), cmonth);
//       for (var t_transaction in response.transactions!) {
//         transactionlist.add(t_transaction);
//         totalTransactionValue += t_transaction.amount;
//         debitcardtotalTransactionValue += t_transaction.amount;
//         print("||||||||||");
//
//         print(t_transaction.amount);
//       }
//       debitdata.totalamount = debitcardtotalTransactionValue;
//       debitGraphdata.add(debitcardtotalTransactionValue);
//       graphbankname.add(debitdata.bankname.toString());
//       creditGraphdata.add(0);
//       print("||||||||||¥¥¥¥¥¥¥¥¥¥¥¥total debitttttttt" +
//           totalTransactionValue.toString());
//       print(debitdata.totalamount);
//       print(debitcardtotalTransactionValue);
//     }
//     setState(() {
//       tDebitValue = totalTransactionValue;
//     });
//     print(jsonEncode(debitlistbankdata));
//     return debitlistbankdata;
//   }
//
//   creditTotalValue(List<BankData> creditlistbankdata) async {
//     double totalLiabilityValue = 0;
//     for (var cdata in creditlistbankdata) {
//       double creditcardtotalLiabilityValue = 0;
//
//       var libilityresponse = await liabilityData(
//           cdata.accesstoken.toString(), cdata.accountid.toString());
//       liabilitylist = libilityresponse.liabilities as Liabilities;
//       if (liabilitylist.student != null) {
//         for (var t_liability in liabilitylist.student!) {
//           totalLiabilityValue += t_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += t_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.mortgage != null) {
//         for (var s_liability in liabilitylist.mortgage!) {
//           totalLiabilityValue += s_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += s_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.credit != null) {
//         for (var c_liability in liabilitylist.credit!) {
//           totalLiabilityValue += c_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += c_liability.lastPaymentAmount!;
//         }
//       }
//       // print("||||||||||total creditttttttt"+ totalLiabilityValue.toString());
//       cdata.totalamount = creditcardtotalLiabilityValue;
//       debitGraphdata.add(0);
//       graphbankname.add(cdata.bankname.toString());
//       creditGraphdata.add(creditcardtotalLiabilityValue);
//     }
//     // print("||||||||||total creditttttttt value"+ totalLiabilityValue.toString());
//
//     setState(() {
//       tCreditValue = totalLiabilityValue;
//     });
//     return creditlistbankdata;
//   }
//
//   debitBuildExpandableContent(
//       String accessToken, String accountID, int cmonth) {
//     // print('+++++++++++++++++}');
//     var response = transactionResponse(accessToken, accountID, cmonth);
//     //
//     // print(response);
//     if (response == null) {
//       return Text(
//         'error ',
//         style: TextStyle(color: Colors.black),
//         //  ),
//       );
//     } else {
//       return //Text("jhbvkjndfkjvnfdv");
//         FutureBuilder<TransactionResponse>(
//             future: response,
//             builder: (context, snapshot) {
//               //   print('snnnnnnnnapshot');
//               //  print(snapshot.data!.transactions.toString());
//               return debitBuildTransactionListView(snapshot.data!);
//             });
//     }
//     ;
//   }
//
//   debitBuildTransactionListView(TransactionResponse tdata) {
//     //Text("jhbvkjndfkjvnfdv");
//     return //Text("credit4444444444444credit");
//       Column(
//         children: [
//           //for (var t in tdata.transactions!)
//           if (viewVisibleTransaction) ...[
//             Container(
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     for (var t in tdata.transactions!)
//                       Column(children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(
//                               top: 5, left: 13, right: 13, bottom: 3),
//                           color: const Color(0xffF5F5F5),
//                           child: ListTile(
//                             contentPadding: EdgeInsets.all(8),
//                             leading: CircleAvatar(
//                               radius: 20,
//                               child: Image(
//                                 image: AssetImage("asset/images/cart.png"),
//                                 //width: 40,
//                                 //color: const Color(0xffECDCFF)
//                               ),
//                             ),
//                             title: Padding(
//                               padding: EdgeInsets.only(top: 5, bottom: 8),
//                               child: Text(
//                                 t.category.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                             trailing: Column(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 10, top: 5),
//                                   child: Text(
//                                     dollar + t.amount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 2),
//                                   child: Text(
//                                     t.date.toString(),
//                                     style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             subtitle: Padding(
//                               padding: EdgeInsets.only(bottom: 2),
//                               child: Text(
//                                 t.name.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             selected: true,
//                           ),
//                         )
//                       ]),
//                   ],
//                 )),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     //selected: true;
//   }
//
// //------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
// //------->>>>>>>>>>>CREDIT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   creditBuildExpandableContent(String accessToken, String accountID) {
//     //print('+++++++++++++++++}');
//     var libilityresponse = liabilityData(accessToken, accountID);
//     print(libilityresponse);
//     // return Text("abcd55555555");
//     if (libilityresponse == null) {
//       // print('2+++++++++++++++++');
//
//       //return ListTile(
//       return Text(
//         'error',
//         style: TextStyle(color: Colors.black),
//       );
//       //  );
//     } else {
//       // return Text("222222222222");
//       return FutureBuilder<LiabilityResponse>(
//           future: libilityresponse,
//           builder: (context, snapshot) {
//             //   print('snnnnnnnnapshot');
//             //  print(snapshot.data!.liabilities.toString());
//             // return Text("233222222222");
//             return creditBuildLiabilityListView(snapshot.data!);
//           });
//     }
//     ;
//   }
//
//   creditBuildLiabilityListView(LiabilityResponse ldata) {
//     return //Text("4444444444444");
//       Column(
//         children: [
//           if (viewVisible) ...[
//             Container(
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   for (var i in stdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 15, left: 15, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             color: const Color(0xffF5F5F5),
//
//                             // color: const Color(0xffEFF4F8),
//                           ),
//                           child: ListView(
//                             children: <Widget>[
//                               // Text(
//                               //   "STUDENT LOAN",
//                               //   textAlign: TextAlign.center,
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 13,
//                               //       fontWeight: FontWeight.w700),
//                               // ),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.lastPaymentDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LOAN TYPE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.loanName.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("EXPECT PAY",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.expectedPayoffDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("ORIGATION DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.originationDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("OUTSTANDING INTEREST",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       i.outstandingInterestAmount.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("INTEREST RATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.interestRatePercentage.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("GUARANTER",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.guarantor.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT REFERENCE NUMBER ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.paymentReferenceNumber.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD INTEREST PAID",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdInterestPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD PRINCIPAL PAID ",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdPrincipalPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("SEQUENCE NUMBER",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(i.sequenceNumber.toString(),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("TOTAL AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                             ],
//                           ),
//                           //),
//                         ),
//                       ],
//                       //),
//
//                       // ],
//                     ),
//                   //  Text("Last payment Amount"+ i.lastPaymentAmount.toString()),
//                 ],
//               ),
//             )
//           ] else if (viewVisible2) ...[
//             Container(
//               width: double.infinity,
//               child: Column(
//                 children: <Widget>[
//                   for (var i in mrtlist)
//                   // ListView(
//                     Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 20, left: 20, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             //  color: const Color(0xffEFF4F8),
//                             color: const Color(0xffF5F5F5),
//                           ),
//                           child: ListView(children: [
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.lastPaymentDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar +
//                                       i.lastPaymentAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TYPE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTypeDescription.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TERM ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTerm.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ORIGATION DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.originationDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD PRINICIPAL PAID ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdPrincipalPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "CURRENT LATE FEE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.currentLateFee!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "NEXT MONTH PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD INTEREST PAID",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdInterestPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "MATURITY DATE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.maturityDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ESCROW BALANCE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.escrowBalance.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "DUE AMOUNT ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.pastDueAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "PAST DUE DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "TOTAL AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               // Container(
//                               //   margin: const EdgeInsets.only(
//                               //       top: 10),
//                               //   child: Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //       dollar + f.format(
//                               //           i.originationPrincipalAmount),
//                               //       style: TextStyle(
//                               //           color: Colors.black,
//                               //           fontSize: 14,
//                               //           fontWeight: FontWeight.w500),),
//                               //
//                               //   ),
//                               // ),
//                             ]),
//                           ]),
//                         ),
//
//                         //888****
//                       ],
//                     ),
//                 ],
//               ),
//             )
//           ] else if (viewVisible3) ...[
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: <Widget>[
//                   for (var i in crdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       // use whichever suits your need
//                       children: <Widget>[
//                         Container(
//                             width: double.infinity,
//                             height: 100.0,
//                             margin: const EdgeInsets.only(right: 15, left: 15),
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(8.0),
//                                   bottomRight: Radius.circular(8.0),
//                                   topLeft: Radius.circular(8.0),
//                                   bottomLeft: Radius.circular(8.0)),
//                               // color: const Color(0xffEFF4F8),
//                               color: const Color(0xffF5F5F5),
//                             ),
//                             child: ListView(children: [
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST STATEMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                             ])),
//                       ],
//                     ),
//                 ],
//                 //),
//
//                 // ],
//               ),
//             ),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     selected:
//     true;
//   }
//
//   void setStudentLoanContainer(Student student, double sliderValue) {
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var startdate = DateTime.parse(student.disbursementDates!.first);
//     var enddate = DateTime.parse(student.expectedPayoffDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     //num i = yearpassed.();
//     // num yearpassed = (currentdate.year - startdate.year);
//     //int endyear = (enddate.year - currentdate.year)
//     // ;
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(student.disbursementDates!.first);
//     // print(student.expectedPayoffDate);
//     // print(_loanyearvalues.toString());
//   }
//
//   void setMortgage(Mortgage mortgage, double mtgsliderValue) {
//     // var currentdate =  new DateTime.now();//DateTime.parse(currentdate);
//     // var startdate = DateTime.parse(mortgage.maturityDate!);
//     // var enddate = DateTime.parse(mortgage.originationDate!);
//     // int myearpassed = (currentdate.year - startdate.year);
//     // int mendyear = enddate.year - startdate.year ;
//     // print(myearpassed.toString());
//     // print(mendyear.toString());
//     // print(_mloanyearvalues.toString());
//     // m_minrange =  double.parse(myearpassed.toString()); ;
//     // m_maxrange =double.parse(mendyear.toString());   ;
//     // double mtgint =  m_maxrange  ;
//     // print("###3333####33hvcudfyhvuyfuyvuy");
//     // if(mtgsliderValue != 0)
//     // {
//     //   mtgint = mtgsliderValue ;
//     // }
//     // if(_mloanyearvalues <m_minrange) {
//     //   _mloanyearvalues = m_maxrange;
//     // }
//     // mbalanceamount = Constants.mAmortization(mortgage.originationPrincipalAmount,
//     //     mortgage.interestRate!.percentage as double, mtgint , myearpassed.toInt() );
//     // m_saveamount = mloanmaxvalue - mbalanceamount;
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var enddate = DateTime.parse(mortgage.maturityDate!);
//     var startdate = DateTime.parse(mortgage.originationDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(mortgage.maturityDate);
//     // print(mortgage.originationDate);
//     // print(_mloanyearvalues.toString());
//   }
//
// //############
// }
//
// //>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
//
// //----3
// Future<RefreshTokenResponse> valueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call redfresh token  .');
//   }
// }
//
// //>>>>>>>>>>>>>>-------------------------tokenAPI's--------------------------------->>>>>>>>>>>>>>>
// Future<LinkTokenResponse> linktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["transactions", "auth"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // prfint(Uri.parse(Constants.URL + '/link/token/create'));
// //  print('>>>>>>>>>>>>>>>>>>>>>>>> Link Token <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   // print(response.body);
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> institutionResponse(String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   print(
//       '>>>>>>>>>>>>>>>>>>>>>>>> institutionResponse <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   //print(response2.body);
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> accessTokenResponse(String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   print(
//       '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
//
// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
//
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }
//
// DateTime formatTimeOfDay(int month, int year, int day) {
//   final now = new DateTime.now();
//   final dt = DateTime(now.year, now.month, now.day);
//   return dt;
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Future<LinkTokenResponse> creditlinktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["liabilities"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // print(Uri.parse(Constants.URL + '/link/token/create'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> creditinstitutionResponse(
//     String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> creditaccessTokenResponse2(
//     String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   // print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
// Future<LiabilityResponse> liabilityData(
//     String accesstoken, String accountid) async {
//   bool _isLoading = true;
//   LiabilityOptions liabilityOptions = LiabilityOptions();
//   liabilityOptions.accountIds = [accountid];
//   LiabilityRequest liabilityRequest = LiabilityRequest();
//   liabilityRequest.clientId = Constants.ClientId;
//   liabilityRequest.secret = Constants.Secret;
//   liabilityRequest.accessToken = accesstoken;
//   liabilityRequest.options = liabilityOptions;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final response4 =
//   await http.post(Uri.parse(Constants.URL + '/liabilities/get'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(liabilityRequest));
//
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(response4.body)}');
//   //  print('credit bpdyyyyy');
//   //  print(response4.body);
//   //  print(response4.statusCode);
//   //  print(jsonEncode(liabilityRequest));
//   // print('credit bpdyyyyy');
//
//   // print(
//   //     '#################################credit##################################################');
//
//   if (response4.statusCode == 200) {
//     bool _isLoading = false;
//
//     return LiabilityResponse.fromJson(jsonDecode(response4.body));
//   } else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //------
// Future<RefreshTokenResponse> refreshValueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
// class MyLabelCommonOptions extends LabelCommonOptions {
//   const MyLabelCommonOptions(
//       ) : super ();
//
//   /// Override [labelTextStyle] with a new font, color, etc.
//   @override
//   // get labelTextStyle => GoogleFonts.comforter(
//   //  style: TextStyle(
//   //   color: Color,
//   //   fontSize: 14.0,
//   //   fontWeight: FontWeight.w400, // Regular
//   //   ),
//   // );
//
//   get labelTextStyle =>
//       const ChartOptions().labelCommonOptions.labelTextStyle.copyWith(
//           color: Colors.white
//       );
//
// }
import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:math' as math;
// import 'dart:ui';
// import 'dart:ui';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_charts/flutter_charts.dart';
// import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
// import 'package:plaid_flutter/plaid_flutter.dart';
//
// import 'package:swipeapp/Controller/Request/SaveBankDataRequest.dart';
// import 'package:swipeapp/Controller/Request/RefreshTokenRequest.dart';
// import 'package:swipeapp/Controller/Response/GetBankDataResponse.dart';
// import 'package:swipeapp/Controller/Response/RefreshTokenResponse.dart';
// import 'package:swipeapp/Controller/Response/SaveBankDataResponse.dart';
//
// import '../Model Helper.dart';
//
// import 'Account/AddAccount1.dart';
// import 'PlaidData/BankData.dart';
// import 'PlaidData/TransactionDetail.dart';
// import 'Plan/PlanAccount1.dart';
// import 'Request/AccessTokenRequest.dart';
// import 'Request/InstitutionRequest.dart';
// import 'Request/LiabilityRequest.dart';
// import 'Request/TokenResquest.dart';
// import 'Request/TransactionRequest.dart';
// import 'Response/AccessTokenResponse.dart';
// import 'Response/InstitutionResponse.dart';
// import 'Response/LiabilityResponse.dart';
// import 'Response/LinkTokenResponse.dart';
// import 'Response/TransactionResponse.dart';
// import 'package:flutter/services.dart';
// import 'dart:math' as math;
// import 'Response/UserDeatail.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       // title: 'Kindacode.com',
//       home: Dashboard2(),
//     );
//   }
// }
//
// class Dashboard2 extends StatefulWidget {
//   const Dashboard2({Key? key}) : super(key: key);
//
//   // final Function callback;
//   //const Dashboard(this.callback);
//   @override
//   tdashboardState createState() => tdashboardState();
// }
//
// class tdashboardState extends State<Dashboard2> {
//   BankData bankDataobj = BankData();
//
//   //creditBankData creditbankDataobj = creditBankData();
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//   late Future<List<BankData>> bankdatalist = [] as Future<List<BankData>>;
//   late Future<List<BankData>> creditbankdatalist = [] as Future<List<BankData>>;
//   List<Transactions> transactionlist = [];
//
//   List<double> debitGraphdata = [];
//   List<double> creditGraphdata = [];
//   List<String> graphbankname = [];
//
//   Future<TransactionResponse>? transactionResponseList;
//   late LegacyLinkConfiguration _publicKeyConfiguration;
//   late LinkTokenConfiguration _linkTokenConfiguration;
//   late Future<TokenRequest> tokenRequest;
//   String ExpenseKey = "expensedata";
//   String accesstoken = "";
//   String accountid = "";
//   int cmonth = 0;
//   late String _imgString = '';
//   late String imagebase64 = '';
//   bool _isShown = true;
//   String bname = "";
//   String acname = "";
//   int selectedIndex = -1;
//   late double tDebitValue = 0;
//   late double tCreditValue = 0;
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//
//   String dollar = " \$";
//   bool isFavourite = false;
//   bool isFavourite1 = true;
//   bool isFavourite2 = true;
//   bool isFavourite3 = true;
//   bool isLoading = false;
//   bool isLoading1 = true;
//   bool isexpanse = true;
//   bool viewVisibleTransaction = true;
//   bool viewVisible1 = true;
//
//   void hideWidget1() {
//     setState(() {
//       viewVisible1 = !viewVisible1;
//       viewVisible1 = false;
//     });
//   }
//
//   void showWidget() {
//     setState(() {
//       viewVisible = true;
//     });
//   }
//
// //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   late LinkTokenConfiguration creditlinkTokenConfiguration;
//   Liabilities liabilitylist = new Liabilities();
//   List<Student> stdlist = [];
//   List<Credit> crdlist = [];
//   List<Mortgage> mrtlist = [];
//   bool viewVisible = false;
//   bool viewVisible2 = false;
//   bool viewVisible3 = false;
//
//   void hideWidget() {
//     setState(() {
//       viewVisible = false;
//       viewVisible2 = false;
//       viewVisible3 = false;
//     });
//   }
//   bool _expanded = false;
//   late ScrollController _scrollController;
//
//   //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//   late ChartData chartData;
//   ChartOptions chartOptions = const ChartOptions(
//     labelCommonOptions: MyLabelCommonOptions(),
//
//   );
//
//   late var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy);
//
//   void initState() {
//     // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
//     //super.initState();
//     chartData = ChartData(
//       dataRows:  [
//         debitGraphdata,
//         creditGraphdata,
//       ],
//       xUserLabels: graphbankname,
//
//       // dataRows: const [
//       //   [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//       //   [0, 0, 0, 0, 0, -1800.0],
//       // ],
//       //   xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const ['Values', 'Values 2'],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//
//       chartOptions: chartOptions,
//
//     );
//     verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//     _publicKeyConfiguration = LegacyLinkConfiguration(
//       clientName: Constants.ClientId,
//       publicKey: "PUBLIC_KEY",
//       environment: LinkEnvironment.sandbox,
//       products: <LinkProduct>[
//         LinkProduct.auth,
//         LinkProduct.transactions,
//       ],
//       language: "en",
//       countryCodes: ['US'],
//       userLegalName: "John Appleseed",
//       userEmailAddress: "jappleseed@youapp.com",
//       userPhoneNumber: "+1 (512) 555-1234",
//     );
//     PlaidLink.onSuccess(_onSuccessCallback);
//     PlaidLink.onEvent(_onEventCallback);
//     PlaidLink.onExit(_onExitCallback);
//     bankdatalist = fetchBankData(Constants.debitcardValue);
//     var linktoken = linktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//     creditbankdatalist = fetchBankData(Constants
//         .creditcardValue); // as Future<List<creditBankData>>;// as List<BankData>;
//     var creditlinktoken = creditlinktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//     _scrollController = ScrollController();
//
//
//     // var verticalBarChart = VerticalBarChart(
//     //   painter: VerticalBarChartPainter(
//     //     verticalBarChartContainer: verticalBarChartContainer,
//     //   ),
//     // );
//   }
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>start>>>>>>>>>>>>>>>>>>>>>>>>
//   String libKey = "data";
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
//     // print("onSuccess222: $publicToken, metadata: ${metadata.description()}");
//     bankDataobj.publictoken = publicToken;
//     bankDataobj.accesstoken = accesstoken;
//     savingBankData(metadata);
//   }
//
//   void _onEventCallback(String event, LinkEventMetadata metadata) {
//     // print("onEvent123: $event, metadata: ${metadata.description()}");
//   }
//
//   void _onExitCallback(LinkError? error, LinkExitMetadata metadata) {
//     // print("onExit metadata: ${metadata.description()}");
//
//     if (error != null) {
//       // print("onExit error: ${error.description()}");
//     }
//   }
//
//   void savingBankData(LinkSuccessMetadata metadata) async {
//     for (int i = 0; i < metadata.accounts.length; i++) {
//       bankDataobj.accountid = metadata.accounts[i].id;
//       bankDataobj.accountname = metadata.accounts[i].name;
//       bankDataobj.mask = metadata.accounts[i].mask;
//     }
//     if (metadata.institution.id != "") {
//       var insres = await institutionResponse(metadata.institution.id);
//       bankDataobj.banklogo = insres.institution?.logo;
//       print("logooooooooo");
//       print(bankDataobj.banklogo);
//       print("logooooooooo");
//       bankDataobj.bankthemecolor = insres.institution?.primaryColor;
//       bankDataobj.bankname = insres.institution?.name;
//       var accesstokenres =
//       await accessTokenResponse(bankDataobj.publictoken.toString());
//       bankDataobj.accesstoken = accesstokenres.accessToken;
//
//       //  if (isexpanse) {
//       // saveBankdataResponse();
//       // List<BankData> templstbankdata = await bankdatalist;
//       //templstbankdata.add(bankDataobj);
//       //await Constants.save(ExpenseKey, jsonEncode(templstbankdata));
//       //  } else {
//       // List<BankData> templstbankdata = await creditbankdatalist;
//       // templstbankdata.add(bankDataobj);
//       // await Constants.save(libKey, jsonEncode(templstbankdata));
//       // }
//
//       //   setState(() {
//       saveBankdataResponse();
//       //  });
//
//       // print('---calling end accessTokenResponse---');
//     }
//   }
//
//   //--
//   Future<List<BankData>> appendElements(
//       Future<List<BankData>> listFuture, List<BankData> elementsToAdd) async {
//     // final list = await listFuture;
//     // int count = list.length;
//     // for(int i = count; i>0; i-- )
//     //   {
//     //     list.remove(list[i]);
//     //   }
//     // List<BankData>
//     // list.addAll(elementsToAdd);
//     return elementsToAdd;
//   }
//
//   //--
//
//   Future<List<BankData>> getBankData(List<BankData> bankresultList) async {
//     print("frfgr<<<<<<>>>>>>");
//
//     try {
//       // var bankdatalist1 =  [] as Future<List<BankData>>;
//       // setState(() {
//       bankdatalist = appendElements(bankdatalist, bankresultList);
//       //});
//       print("<<<<<<>>>>>>");
//
//       bankdatalist = debitTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load debitbankdata');
//     }
//     return bankdatalist;
//   }
//
//   Future<List<BankData>> getCreditBankData(
//       List<BankData> bankresultList) async {
//     try {
//       //creditbankdatalist =  [] as Future<List<BankData>>;
// //
//       // setState(() {
//       creditbankdatalist = appendElements(creditbankdatalist, bankresultList);
//       // });
//
//       creditTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load creditbankdata');
//     }
//     return creditbankdatalist;
//   }
//
//   Future<List<BankData>> fetchBankData(int type) async {
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String banktoken = tempuserdetail.accessToken.toString();
//     final response = await http.get(
//         Uri.parse(
//             Constants.baseUrl2 + '/Bank/GetBankData?type=' + type.toString()),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $banktoken',
//         });
//     print(response.body);
//
//     List<BankData> tempbankdatalist = <BankData>[];
//     if (response.statusCode == 200) {
//       GetBankDataResponse bankdataResponse =
//       GetBankDataResponse.fromJson(jsonDecode(response.body));
//       for (var i in bankdataResponse.result!) {
//         BankData bd = new BankData();
//         bd.publictoken = i.publictoken;
//         bd.bankthemecolor = i.bankthemecolor;
//         bd.banklogo = i.banklogo;
//         bd.mask = i.mask;
//         bd.accountname = i.accountname;
//         bd.accesstoken = i.accesstoken;
//         bd.bankname = i.bankname;
//         bd.accountid = i.accountid;
//         tempbankdatalist.add(bd);
//       }
//
//       print(jsonEncode(tempbankdatalist));
//       print("reposne>>>>>>>");
//       // getBankData(tempbankdatalist);
//       // return tempbankdatalist ;
//       if (type == Constants.debitcardValue) {
//         tempbankdatalist = getBankData(tempbankdatalist) as List<BankData>;
//         return tempbankdatalist;
//       } else {
//         getCreditBankData(tempbankdatalist);
//         return tempbankdatalist;
//       }
//
//       // return GetBankDataResponse.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to call user childuserid .');
//     }
//   }
//
//   Future<SaveBankDataResponse> saveBankdataResponse() async {
//     SaveBankDataRequest saveBankDataRequest = SaveBankDataRequest();
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String accounttoken = tempuserdetail.accessToken.toString();
//     saveBankDataRequest.id = 0;
//     saveBankDataRequest.accountid = bankDataobj.accountid;
//     saveBankDataRequest.accesstoken = bankDataobj.accesstoken;
//     saveBankDataRequest.accountname = bankDataobj.accountname;
//     saveBankDataRequest.mask = bankDataobj.mask;
//     saveBankDataRequest.bankname = bankDataobj.bankname;
//     saveBankDataRequest.banklogo = bankDataobj.banklogo;
//     print("banklogooooooooo>>>>>>>>");
//     print(bankDataobj.banklogo?.length.toString());
//     print(bankDataobj.banklogo);
//     print("banklogooooooooo>>>>>>>>");
//     saveBankDataRequest.bankthemecolor = bankDataobj.bankthemecolor;
//     saveBankDataRequest.publictoken = bankDataobj.publictoken;
//
//     if (isexpanse) {
//       saveBankDataRequest.type = Constants.debitcardValue;
//     } else {
//       saveBankDataRequest.type = Constants.creditcardValue;
//     }
//     //print('/////////request <<<<<<<<<<<<<<<<<<<<<<<<<');
//     //print(jsonEncode(saveBankDataRequest));
//     //print('/////////.request <<<<<<<<<<<<<<<<<<<<<<<<<');
//
//     final savebankresponse =
//     await http.post(Uri.parse(Constants.baseUrl2 + '/Bank/SaveBankData'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $accounttoken',
//         },
//         body: jsonEncode(saveBankDataRequest));
//     // print('/////////.svaebankdata <<<<<<<<<<<<<<<<<<<<<<<<<');
//     // print(accounttoken);
//     // print(saveBankDataRequest);
//     // print(savebankresponse);
//     // print(savebankresponse.body);
//     // print(savebankresponse.statusCode);
//     // print('/////////<<<<svaebankdata<<<<<<<<<<<<<<<<<<<<<');
//
//     if (savebankresponse.statusCode == 200) {
//       fetchBankData(saveBankDataRequest.type!);
//
//       return SaveBankDataResponse.fromJson(jsonDecode(savebankresponse.body));
//     } else {
//       throw Exception('Failed to call plaid save bank data.');
//     }
//   }
//
//   late final Function callback;
//
//   final List<String> iconname = [
//     'asset/images/cart.png',
//     'asset/images/at.png',
//     'asset/images/travel.png',
//     'asset/images/movie.png',
//
//     //   'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//   ];
//   List<String> TransactionIconCategory =[
//     "Bank Fees",
//     "Cash Advance",
//     "Community"
//   ];
//
//
//
//
//
//   // const Dashboard(this.callback);
//
//   Future<TransactionResponse> transactionResponse(
//       String accesstoken, String accountid, int currentmonth) async {
//     String startdate = "";
//     String enddate = "";
//     var now = new DateTime.now().toString();
//     var date = DateTime.parse(now);
//     DateTime firstDayOfMonth = new DateTime(date.year, date.month, 1);
//     // var dateObj = new Date;
//     // var lmonth = dateObj.getUTCMonth() + 1; //months from 1-12
//     // var lday = dateObj.getUTCDate();
//     // var lyear = dateObj.getUTCFullYear();
//     // var lastendDayOfMonth = lyear + "/" + lmonth + "/" + lday;
//     // DateTime lastendDayOfMonth = DateTime(date.year, date.month+1 , 0);
//     DateTime lastendDayOfMonth = (date.month < 12)
//         ? new DateTime(date.year, date.month + 1, 0)
//         : new DateTime(date.year + 1, 1, 0);
//     var fyear = firstDayOfMonth.year;
//     var fmonth = firstDayOfMonth.month.toString().padLeft(2, '0');
//     var fday = firstDayOfMonth.day.toString().padLeft(2, '0');
//     var firstday = "${fyear}-${fmonth}-${fday}";
//     var lyear = lastendDayOfMonth.year;
//     var lmonth = lastendDayOfMonth.month.toString().padLeft(2, '0');
//     var lday = lastendDayOfMonth.day.toString().padLeft(2, '0');
//     var lastday = "${lyear}-${lmonth}-${lday}";
//     startdate = firstday;
//     enddate = lastday;
//
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     // print(startdate);
//     // print(enddate);
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     Transactionoptions transactionoptions = Transactionoptions();
//     transactionoptions.count = 20;
//     transactionoptions.offset = 0;
//     transactionoptions.accountIds = [accountid];
//     TransactionRequest transactionRequest = TransactionRequest();
//     transactionRequest.clientId = Constants.ClientId;
//     transactionRequest.secret = Constants.Secret;
//     transactionRequest.accessToken = accesstoken;
//     transactionRequest.options = transactionoptions;
//     transactionRequest.startDate = startdate;
//     transactionRequest.endDate = enddate;
//     isLoading1 = false;
//     print(
//         'dasgboardRequest body4--REQUESTTTTTTTTTTTTTTTTTTTT: ${jsonEncode(transactionRequest)}');
//     final response4 =
//     await http.post(Uri.parse(Constants.URL + '/transactions/get'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(transactionRequest));
//     print(
//         '!!!!!!!!!!!!###########################################################################################################');
//     print('dshrespose44 body-----: ${response4}');
//     print(response4.statusCode);
//     print(response4);
//     // print(accesstoken);
//     print('dash##########################################'
//         '###################################################'
//         '##############');
//     if (response4.statusCode == 200) {
//       void dispose() {
//         Loader.hide();
//         isLoading1 = false;
//         // super.dispose();
//       }
//
//       return TransactionResponse.fromJson(jsonDecode(response4.body));
//     } else {
//       //void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//       //}
//
//       throw Exception('Failed to call transaction .');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     var _val;
//     var chidern;
//     return Scaffold(
//
//
//
//       //  resizeToAvoidBottomInset: false,
//
//       body: SafeArea(
//
//           child:
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 dashboardHeader(),
//                 Column(
//                   children:<Widget>[
//                     debitTransaction(),
//                     creditLiability(),
//                     paymentButton(),
//                     viewtransaction(),
//                     Visibility(
//                       maintainSize: true,
//                       maintainAnimation: true,
//                       maintainState: true,
//                       visible: viewVisible1,
//                       child: Container(
//                         width: double.infinity,
//                         //height: 200.0,
//                         // color: Colors.yellow,
//                         child: Column(
//                           //child: Column(
//                           children: [
//                             isLoading1 ?
//                             Center(child: CircularProgressIndicator()) :
//                             ListView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemCount: transactionlist.length,
//                                 itemBuilder: (context, int index) {
//                                   var $;
//                                   return Card(
//                                     color: const Color(0xffF7F6FA),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 80.0,
//                                       margin:
//                                       const EdgeInsets.only(right: 9, left: 9),
//                                       child: ListTile(
//                                           contentPadding: EdgeInsets.only(
//                                               left: 10.0, right: 0.0),
//                                           leading: CircleAvatar(
//                                             radius: 20,
//                                             child:
//                                             Image(image: AssetImage("asset/images/cart.png"),
//                                               //Image.asset( iconname[index],),
//                                             ),
//                                           ),
//                                           title: Text(
//                                             transactionlist[index].name.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           subtitle: Text(
//                                             transactionlist[index]
//                                                 .category
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing: Padding(
//                                             padding: EdgeInsets.only(top: 5),
//                                             child: Column(children: <Widget>[
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                     top: 3, bottom: 3),
//                                                 child: Text(
//                                                   dollar +
//                                                       transactionlist[index]
//                                                           .amount
//                                                           .toStringAsFixed(2),
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w600),
//                                                 ),
//                                               ),
//                                               Text(
//                                                 transactionlist[index]
//                                                     .date
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w500),
//                                               ),
//                                             ]),
//                                           )),
//                                     ),
//                                   );
//                                 }
//                               // );
//                               // }
//                               //},
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 )
//
//
//
//
//
//
//               ],
//             ),
//           )
//       ),
//
//
//
//
//     );
//   }
//
// //<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   Widget chartToRun() {
//     LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//     ChartData chartData;
//     ChartOptions chartOptions = const ChartOptions();
//     // Example shows a mix of positive and negative data values.
//     chartData = ChartData(
//       dataRows: const [
//         [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//         [0,0,0,0,0, -1800.0],
//       ],
//       xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const [
//         'Values',
//         'Values 2'
//       ],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//       chartOptions: chartOptions,
//     );
//     var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//
//     var verticalBarChart = VerticalBarChart(
//       painter: VerticalBarChartPainter(
//         verticalBarChartContainer: verticalBarChartContainer,
//       ),
//     );
//     return verticalBarChart;
//   }
//   dashboardHeader() {
//     return   Flexible(
//         child: Container(
//           //height: 120,
//             width: double.infinity,
//             padding: EdgeInsets.all(5),
//             //color: const Color(0xDEB46FEA),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("asset/images/background.png"),
//                   fit: BoxFit.cover,
//                 )),
//             //child: Align(alignment: Alignment.center,
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Row(mainAxisSize: MainAxisSize.min, children: [
//                     Container(
//                         margin: EdgeInsets.all(8),
//                         alignment: Alignment.topLeft,
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           //color: const Color(0x75f5f5f5)
//                         ),
//                         child:
//                         // Row(
//                         //   mainAxisSize: MainAxisSize.min,
//                         //   children: [
//                         Text(
//                           'Test Account',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 15,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold //font color
//                           ),
//                         )
//                       //   ],
//                       // )
//
//                     ),
//                   ]),
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tDebitValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 18,
//                                 //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                                 color: Colors.white,
//                                 //font color
//                                 fontStyle: FontStyle.italic),
//                           ),
//                           Text(
//                             'Debit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//
//
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tCreditValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 18,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               //font color
//                               fontStyle: FontStyle.italic,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             'Credit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//                     ]),
//                 Container(
//                   //width: 80,
//                   child:
//                   ExpandableNotifier(  // <-- Provides ExpandableController to its children
//                     child: Column(
//                       children: [
//                         Expandable(           // <-- Driven by ExpandableController from ExpandableNotifier
//                           collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
//                             child: //Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,),
//                             Image.asset(
//                               "asset/images/down.png", // width: 300,
//                               height: 20,
//                               width: 20,
//                               alignment: Alignment.center,
//                             ),
//
//                           ),
//                           expanded: Column(
//                               children: [
//                                 //Text("Backjdsgcygdsucudshiodhycoe"),
//                                 SizedBox(
//                                     width: 400,
//                                     height: 350,
//                                     child: FittedBox(child: Column(
//                                       children: [
//                                         //  addAccountHeader(),
//                                         Container(
//                                           // color: Colors.yellow,
//                                           height: 300,
//                                           width: 350,
//                                           child:
//                                           //Column(
//                                           // children: [
//                                           //  addAccountHeader(),
//                                           VerticalBarChart(
//                                             painter: VerticalBarChartPainter(
//                                               verticalBarChartContainer: verticalBarChartContainer,
//                                             ),
//                                           ),
//
//                                         )
//                                       ],
//                                     ))
//                                 ),
//                                 ExpandableButton(
//                                   child:  Image.asset(
//                                     "asset/images/up.png", // width: 300,
//                                     height: 20,
//                                     width: 20,
//                                     alignment: Alignment.center,
//                                   ),
//                                 ),
//                               ]
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],
//             )
//
//           //  ),
//         ));
//   }
//
//   debitTransaction() {
//     return Scrollbar(
//       child:Column(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Row(mainAxisSize: MainAxisSize.min, children: [
//               Container(
//                   margin: EdgeInsets.all(8),
//                   alignment: Alignment.topLeft,
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: const Color(0xffECDCFF)),
//                   child:
//                   // Row(
//                   //   mainAxisSize: MainAxisSize.min,
//                   //   children: [
//                   Text(
//                     'Debit:' + dollar + tDebitValue.toStringAsFixed(2),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 14,
//                         //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                         color: Colors.black,
//                         //font color
//                         fontStyle: FontStyle.italic),
//                   )
//                 //   ],
//                 // )
//
//               ),
//             ]),
//             // ),
//           ),
//           Container(
//             // height: 250.0,
//             // color: Colors.yellow,
//               child: Column(
//                 children: [
//                   Container(
//                       height: 35,
//                       width: double.infinity,
//                       margin:
//                       EdgeInsets.only(top: 5, left: 15, bottom: 10, right: 15),
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           color: const Color(0xffEDECEE)),
//                       child: Row(
//                         children: [
//                           TextButton(
//                             style: TextButton.styleFrom(
//                               padding: const EdgeInsets.all(5),
//                             ),
//                             onPressed: () async {
//                               isexpanse = true;
//                               Loader.show(context,
//                                   isSafeAreaOverlay: false,
//                                   progressIndicator: CircularProgressIndicator(),
//                                   isBottomBarOverlay: false,
//                                   overlayFromBottom: 80,
//                                   themeData: Theme.of(context)
//                                       .copyWith(accentColor: Colors.black),
//                                   overlayColor: Color(0x0000ffff));
//                               Future.delayed(Duration(seconds: 4), () {
//                                 Loader.hide();
//                               });
//                               var linktoken = await linktokenResponse();
//                               _linkTokenConfiguration = LinkTokenConfiguration(
//                                 token: linktoken.linkToken.toString(),
//                               );
//
//                               PlaidLink.open(configuration: _linkTokenConfiguration);
//                             },
//                             child: Image(
//                               image: AssetImage("asset/images/Plus.png"),
//                               width: 100,
//                               height: 100,
//                             ),
//                           ),
//                           Text('Connect To Debit Account'),
//                         ],
//                       )),
//                   //-----------------------------------debir////-----------
//                   Container(
//                     width: double.infinity,
//                     // height: 150.0,
//                     margin: const EdgeInsets.only(bottom: 4, top: 4),
//                     color: Colors.white,
//                     child: ListView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       children: [
//                         FutureBuilder<List<BankData>>(
//                           future: bankdatalist,
//                           builder: (context, snapshot) {
//                             if(snapshot.hasData)
//                             {
//                               return
//                                 ExpansionPanelList(
//                                   animationDuration: Duration(milliseconds: 2000),
//                                   children:
//                                   snapshot.data!.map<ExpansionPanel>((BankData item) {
//                                     return ExpansionPanel(
//                                       headerBuilder:
//                                           (BuildContext context, bool isExpanded) {
//                                         return ListTile(
//                                           iconColor: Colors.red,
//                                           leading: CircleAvatar(
//                                             radius: 30,
//                                             child:
//                                             // Image.memory(Base64Codec().decode(item.banklogo.toString()),),
//                                             Image.network(item.banklogo.toString()),
//                                           ),
//                                           title: Text(
//                                             item.bankname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing:
//                                           item.totalamount ==null?
//                                           Text(dollar+'0',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ):
//                                           Text('${item.totalamount.toString()}',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ),
//                                           // Text(
//                                           //   dollar + item.totalamount.toString(), "0",
//                                           //
//                                           //   style: TextStyle(
//                                           //       color: Colors.black,
//                                           //       fontSize: 16,
//                                           //       fontWeight: FontWeight.w500),
//                                           //),
//                                           subtitle: Text(
//                                             item.accountname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                           selected: false,
//                                         );
//                                       },
//                                       body:
//                                       // Text("gcdsgchgdsv"),
//                                       debitBuildExpandableContent(
//                                           item.accesstoken.toString(),
//                                           item.accountid.toString(),
//                                           cmonth),
//                                       isExpanded: item.isExpaneded,
//                                     );
//                                   }).toList(),
//                                   dividerColor: Colors.grey,
//                                   expansionCallback: (int index, bool isExpanded) {
//                                     setState(() {
//                                       snapshot.data![index].isExpaneded = !isExpanded;
//                                     });
//                                   },
//                                 );
//                             }
//                             else
//                             {
//                               return Center(
//                                   child: CircularProgressIndicator());
//                             }
//
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
// //chnage heiught to 200
//                   //--------------------------
//                 ],
//               )),
//
//         ],
//       ),
//     );
//   }
//
//   creditLiability() {
//     return Column(children: [
//       Align(
//         alignment: Alignment.topLeft,
//         child: Row(mainAxisSize: MainAxisSize.min, children: [
//           Container(
//               margin: EdgeInsets.all(8),
//               alignment: Alignment.topLeft,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: const Color(0xffECDCFF)),
//               child:
//               // Row(
//               //   mainAxisSize: MainAxisSize.min,
//               //   children: [
//               Text(
//                 'Credit: ' + dollar + tCreditValue.toStringAsFixed(2),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 14,
//                     //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                     color: Colors.black,
//                     //font color
//                     fontStyle: FontStyle.italic),
//               )
//             //   ],
//             // )
//
//           ),
//         ]),
//       ),
//       Container(
//           height: 35,
//           width: double.infinity,
//           margin: EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 15),
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: const Color(0xffEDECEE)),
//           child: Row(
//             children: [
//               TextButton(
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.all(5),
//                 ),
//                 onPressed: () async {
//                   isexpanse = false;
//                   Loader.show(context,
//                       isSafeAreaOverlay: false,
//                       progressIndicator: CircularProgressIndicator(),
//                       isBottomBarOverlay: false,
//                       overlayFromBottom: 80,
//                       themeData:
//                       Theme.of(context).copyWith(accentColor: Colors.black),
//                       overlayColor: Color(0x0000ffff));
//                   Future.delayed(Duration(seconds: 4), () {
//                     Loader.hide();
//                   });
//                   var creditlinktoken = await creditlinktokenResponse();
//                   creditlinkTokenConfiguration = LinkTokenConfiguration(
//                     token: creditlinktoken.linkToken.toString(),
//                   );
//
//                   PlaidLink.open(configuration: creditlinkTokenConfiguration);
//                 },
//                 child: Image(
//                   image: AssetImage("asset/images/Plus.png"),
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//               Text('Connect To Credit Account'),
//               //Text('Connect To Credit Account2'),
//             ],
//           )),
//       Container(
//         width: double.infinity,
//         // height: 150.0,
//         margin: const EdgeInsets.only(bottom: 0, top: 0),
//         color: Colors.white,
//         child: ListView(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//
//           children: [
//             FutureBuilder<List<BankData>>(
//               future: creditbankdatalist,
//               builder: (context, snapshot) {
//                 if(snapshot.hasData)
//                 {
//                   return
//                     ExpansionPanelList(
//                       animationDuration: Duration(milliseconds: 2000),
//                       children: snapshot.data!.map<ExpansionPanel>((BankData item) {
//                         return ExpansionPanel(
//                           headerBuilder: (BuildContext context, bool isExpanded) {
//                             return ListTile(
//                               iconColor: Colors.red,
//                               leading: CircleAvatar(
//                                   radius: 30,
//                                   child:
//                                   //Image.memory(Base64Codec().decode(item.banklogo.toString())),
//
//                                   Image.network(item.banklogo.toString())),
//                               title: Text(
//                                 item.bankname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               trailing:
//                               // Text(
//                               //   dollar + item.totalamount.toString(),
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 16,
//                               //       fontWeight: FontWeight.w500),
//                               // ),
//                               item.totalamount ==null?
//                               Text(dollar+'0',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ):
//                               Text('${item.totalamount!.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 item.accountname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               selected: false,
//                             );
//                           },
//                           body: //Text('hgsdvfghjbvsdjhcgsdh'),
//                           creditBuildExpandableContent(
//                             item.accesstoken.toString(),
//                             item.accountid.toString(),
//                           ),
//                           isExpanded: item.isExpaneded,
//                         );
//                       }).toList(),
//                       dividerColor: Colors.grey,
//                       expansionCallback: (int index, bool isExpanded) async {
//                         setState(() {
//                           snapshot.data![index].isExpaneded = !isExpanded;
//                         });
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // print(index);
//                         // print(isExpanded);
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // TransactionResponse tempresponse2 =
//                         //     await transactionResponse(
//                         //         snapshot.data![index].accesstoken.toString(),
//                         //         snapshot.data![index].accountid.toString(),
//                         //         cmonth);
//                         //
//                         // transactionlist =
//                         //     tempresponse2.transactions as List<Transactions>;
//                         // viewVisible = true;
//                         viewVisibleTransaction = true;
//                         showWidget();
//                         LiabilityResponse tempresponse = await liabilityData(
//                             snapshot.data![index].accesstoken.toString(),
//                             snapshot.data![index].accountid.toString());
//                         liabilitylist = tempresponse.liabilities as Liabilities;
//                         viewVisible = false;
//                         viewVisible2 = false;
//                         viewVisible3 = false;
//                         if (liabilitylist.student != null) {
//                           stdlist = liabilitylist.student!;
//                           viewVisible = true;
//                           //  print("student");
//                           setStudentLoanContainer(liabilitylist.student!.first, 0);
//                         }
//                         if (liabilitylist.mortgage != null) {
//                           mrtlist = liabilitylist.mortgage!;
//                           viewVisible2 = true;
//                           //  print("mortgage");
//                           setMortgage(liabilitylist.mortgage!.first, 0);
//                         }
//                         if (liabilitylist.credit != null) {
//                           crdlist = liabilitylist.credit!;
//                           viewVisible3 = true;
//                           //  print("credit");
//                         }
//                       },
//                     );
//                 }
//                 else
//                 {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//               },
//             ),
//           ],
//         ),
//       ),
//     ]);
//   }
//
//   paymentButton() {
//     return Container(
//       height: 38,
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 15, bottom: 20.0, left: 25, right: 25),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//             //color: const Color(0xFFA781D3),
//           )),
//       child: TextButton(
//         style: TextButton.styleFrom(
//           backgroundColor: const Color(0xFFA781D3),
//           padding: const EdgeInsets.all(5),
//         ),
//         onPressed: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => AddAccount()),
//           // );
//         },
//         child: Text(
//           'Make a Payment',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
//
//   bottomNavBar() {
//     return Container(
//       height: 45,
//       padding: const EdgeInsets.all(
//         8,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(2),
//         color: const Color(0xF5F7F6FA),
//       ),
//       //alignment: Alignment.bottomCenter,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           IconButton(
//             // icon: Image.asset('assets/images/dashboard.png'),
//             icon: ImageIcon(
//               AssetImage("asset/images/home2.png"),
//               size: 140,
//               color: isFavourite ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//
//             onPressed: () {
//               setState(() {
//                 isFavourite = false;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pbox.png"),
//               size: 140,
//               color: isFavourite1 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   //MaterialPageRoute(builder: (context) => Spend(this.)),
//               // );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = false;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pmoney.png"),
//               size: 140,
//               color: isFavourite2 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PlanAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = false;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/paccount.png"),
//               size: 140,
//               color: isFavourite3 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = false;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   viewtransaction() {
//     return Container(
//       child: Row(children: [
//         Container(
//             margin: EdgeInsets.all(8),
//             alignment: Alignment.topLeft,
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: const Color(0xffECDCFF)),
//             child:
//             // Row(
//             //   mainAxisSize: MainAxisSize.min,
//             //   children: [
//             Text(
//               'Recent Transactions',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 14,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: Colors.black,
//                   //font color
//                   fontStyle: FontStyle.italic),
//             )
//           //   ],
//           // )
//
//         ),
//         Spacer(),
//         Container(
//           margin: EdgeInsets.all(8),
//           alignment: Alignment.topRight,
//           child: InkWell(
//             onTap: () async {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TransactionDetail(),
//                   // Pass the arguments as part of the RouteSettings. The
//                   // DetailScreen reads the arguments from these settings.
//                   settings: RouteSettings(
//                     arguments: transactionlist,
//                   ),
//                 ),
//               );
//               setState(() {
//                 //selectedIndex = i;
//               });
//             },
//             child: new Text(
//               "View All",
//               style: TextStyle(
//                   fontSize: 13,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: const Color(0xffA781D3),
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
//
// //   <<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
// //
// // ------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   debitTotalValue(List<BankData> debitlistbankdata) async {
//     double totalTransactionValue = 0;
//     for (var debitdata in debitlistbankdata) {
//       double debitcardtotalTransactionValue = 0;
//       var response = await transactionResponse(debitdata.accesstoken.toString(),
//           debitdata.accountid.toString(), cmonth);
//       for (var t_transaction in response.transactions!) {
//         transactionlist.add(t_transaction);
//         totalTransactionValue += t_transaction.amount;
//         debitcardtotalTransactionValue += t_transaction.amount;
//         print("||||||||||");
//
//         print(t_transaction.amount);
//       }
//       debitdata.totalamount = debitcardtotalTransactionValue;
//       debitGraphdata.add(debitcardtotalTransactionValue);
//       graphbankname.add(debitdata.bankname.toString());
//       creditGraphdata.add(0);
//       print("||||||||||¥¥¥¥¥¥¥¥¥¥¥¥total debitttttttt" +
//           totalTransactionValue.toString());
//       print(debitdata.totalamount);
//       print(debitcardtotalTransactionValue);
//     }
//     setState(() {
//       tDebitValue = totalTransactionValue;
//     });
//     print(jsonEncode(debitlistbankdata));
//     return debitlistbankdata;
//   }
//
//   creditTotalValue(List<BankData> creditlistbankdata) async {
//     double totalLiabilityValue = 0;
//     for (var cdata in creditlistbankdata) {
//       double creditcardtotalLiabilityValue = 0;
//
//       var libilityresponse = await liabilityData(
//           cdata.accesstoken.toString(), cdata.accountid.toString());
//       liabilitylist = libilityresponse.liabilities as Liabilities;
//       if (liabilitylist.student != null) {
//         for (var t_liability in liabilitylist.student!) {
//           totalLiabilityValue += t_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += t_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.mortgage != null) {
//         for (var s_liability in liabilitylist.mortgage!) {
//           totalLiabilityValue += s_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += s_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.credit != null) {
//         for (var c_liability in liabilitylist.credit!) {
//           totalLiabilityValue += c_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += c_liability.lastPaymentAmount!;
//         }
//       }
//       // print("||||||||||total creditttttttt"+ totalLiabilityValue.toString());
//       cdata.totalamount = creditcardtotalLiabilityValue;
//       debitGraphdata.add(0);
//       graphbankname.add(cdata.bankname.toString());
//       creditGraphdata.add(creditcardtotalLiabilityValue);
//     }
//     // print("||||||||||total creditttttttt value"+ totalLiabilityValue.toString());
//
//     setState(() {
//       tCreditValue = totalLiabilityValue;
//     });
//     return creditlistbankdata;
//   }
//
//   debitBuildExpandableContent(
//       String accessToken, String accountID, int cmonth) {
//     // print('+++++++++++++++++}');
//     var response = transactionResponse(accessToken, accountID, cmonth);
//     //
//     // print(response);
//     if (response == null) {
//       return Text(
//         'error ',
//         style: TextStyle(color: Colors.black),
//         //  ),
//       );
//     } else {
//       return //Text("jhbvkjndfkjvnfdv");
//         FutureBuilder<TransactionResponse>(
//             future: response,
//             builder: (context, snapshot) {
//               //   print('snnnnnnnnapshot');
//               //  print(snapshot.data!.transactions.toString());
//               return debitBuildTransactionListView(snapshot.data!);
//             });
//     }
//     ;
//   }
//
//   debitBuildTransactionListView(TransactionResponse tdata) {
//     //Text("jhbvkjndfkjvnfdv");
//     return //Text("credit4444444444444credit");
//       Column(
//         children: [
//           //for (var t in tdata.transactions!)
//           if (viewVisibleTransaction) ...[
//             Container(
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     for (var t in tdata.transactions!)
//                       Column(children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(
//                               top: 5, left: 13, right: 13, bottom: 3),
//                           color: const Color(0xffF5F5F5),
//                           child: ListTile(
//                             contentPadding: EdgeInsets.all(8),
//                             leading: CircleAvatar(
//                               radius: 20,
//                               child: Image(
//                                 image: AssetImage("asset/images/cart.png"),
//                                 //width: 40,
//                                 //color: const Color(0xffECDCFF)
//                               ),
//                             ),
//                             title: Padding(
//                               padding: EdgeInsets.only(top: 5, bottom: 8),
//                               child: Text(
//                                 t.category.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                             trailing: Column(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 10, top: 5),
//                                   child: Text(
//                                     dollar + t.amount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 2),
//                                   child: Text(
//                                     t.date.toString(),
//                                     style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             subtitle: Padding(
//                               padding: EdgeInsets.only(bottom: 2),
//                               child: Text(
//                                 t.name.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             selected: true,
//                           ),
//                         )
//                       ]),
//                   ],
//                 )),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     //selected: true;
//   }
//
// //------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
// //------->>>>>>>>>>>CREDIT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   creditBuildExpandableContent(String accessToken, String accountID) {
//     //print('+++++++++++++++++}');
//     var libilityresponse = liabilityData(accessToken, accountID);
//     print(libilityresponse);
//     // return Text("abcd55555555");
//     if (libilityresponse == null) {
//       // print('2+++++++++++++++++');
//
//       //return ListTile(
//       return Text(
//         'error',
//         style: TextStyle(color: Colors.black),
//       );
//       //  );
//     } else {
//       // return Text("222222222222");
//       return FutureBuilder<LiabilityResponse>(
//           future: libilityresponse,
//           builder: (context, snapshot) {
//             //   print('snnnnnnnnapshot');
//             //  print(snapshot.data!.liabilities.toString());
//             // return Text("233222222222");
//             return creditBuildLiabilityListView(snapshot.data!);
//           });
//     }
//     ;
//   }
//
//   creditBuildLiabilityListView(LiabilityResponse ldata) {
//     return //Text("4444444444444");
//       Column(
//         children: [
//           if (viewVisible) ...[
//             Container(
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   for (var i in stdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 15, left: 15, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             color: const Color(0xffF5F5F5),
//
//                             // color: const Color(0xffEFF4F8),
//                           ),
//                           child: ListView(
//                             children: <Widget>[
//                               // Text(
//                               //   "STUDENT LOAN",
//                               //   textAlign: TextAlign.center,
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 13,
//                               //       fontWeight: FontWeight.w700),
//                               // ),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.lastPaymentDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LOAN TYPE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.loanName.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("EXPECT PAY",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.expectedPayoffDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("ORIGATION DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.originationDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("OUTSTANDING INTEREST",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       i.outstandingInterestAmount.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("INTEREST RATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.interestRatePercentage.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("GUARANTER",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.guarantor.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT REFERENCE NUMBER ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.paymentReferenceNumber.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD INTEREST PAID",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdInterestPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD PRINCIPAL PAID ",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdPrincipalPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("SEQUENCE NUMBER",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(i.sequenceNumber.toString(),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("TOTAL AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                             ],
//                           ),
//                           //),
//                         ),
//                       ],
//                       //),
//
//                       // ],
//                     ),
//                   //  Text("Last payment Amount"+ i.lastPaymentAmount.toString()),
//                 ],
//               ),
//             )
//           ] else if (viewVisible2) ...[
//             Container(
//               width: double.infinity,
//               child: Column(
//                 children: <Widget>[
//                   for (var i in mrtlist)
//                   // ListView(
//                     Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 20, left: 20, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             //  color: const Color(0xffEFF4F8),
//                             color: const Color(0xffF5F5F5),
//                           ),
//                           child: ListView(children: [
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.lastPaymentDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar +
//                                       i.lastPaymentAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TYPE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTypeDescription.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TERM ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTerm.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ORIGATION DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.originationDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD PRINICIPAL PAID ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdPrincipalPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "CURRENT LATE FEE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.currentLateFee!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "NEXT MONTH PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD INTEREST PAID",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdInterestPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "MATURITY DATE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.maturityDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ESCROW BALANCE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.escrowBalance.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "DUE AMOUNT ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.pastDueAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "PAST DUE DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "TOTAL AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               // Container(
//                               //   margin: const EdgeInsets.only(
//                               //       top: 10),
//                               //   child: Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //       dollar + f.format(
//                               //           i.originationPrincipalAmount),
//                               //       style: TextStyle(
//                               //           color: Colors.black,
//                               //           fontSize: 14,
//                               //           fontWeight: FontWeight.w500),),
//                               //
//                               //   ),
//                               // ),
//                             ]),
//                           ]),
//                         ),
//
//                         //888****
//                       ],
//                     ),
//                 ],
//               ),
//             )
//           ] else if (viewVisible3) ...[
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: <Widget>[
//                   for (var i in crdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       // use whichever suits your need
//                       children: <Widget>[
//                         Container(
//                             width: double.infinity,
//                             height: 100.0,
//                             margin: const EdgeInsets.only(right: 15, left: 15),
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(8.0),
//                                   bottomRight: Radius.circular(8.0),
//                                   topLeft: Radius.circular(8.0),
//                                   bottomLeft: Radius.circular(8.0)),
//                               // color: const Color(0xffEFF4F8),
//                               color: const Color(0xffF5F5F5),
//                             ),
//                             child: ListView(children: [
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST STATEMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                             ])),
//                       ],
//                     ),
//                 ],
//                 //),
//
//                 // ],
//               ),
//             ),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     selected:
//     true;
//   }
//
//   void setStudentLoanContainer(Student student, double sliderValue) {
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var startdate = DateTime.parse(student.disbursementDates!.first);
//     var enddate = DateTime.parse(student.expectedPayoffDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     //num i = yearpassed.();
//     // num yearpassed = (currentdate.year - startdate.year);
//     //int endyear = (enddate.year - currentdate.year)
//     // ;
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(student.disbursementDates!.first);
//     // print(student.expectedPayoffDate);
//     // print(_loanyearvalues.toString());
//   }
//
//   void setMortgage(Mortgage mortgage, double mtgsliderValue) {
//     // var currentdate =  new DateTime.now();//DateTime.parse(currentdate);
//     // var startdate = DateTime.parse(mortgage.maturityDate!);
//     // var enddate = DateTime.parse(mortgage.originationDate!);
//     // int myearpassed = (currentdate.year - startdate.year);
//     // int mendyear = enddate.year - startdate.year ;
//     // print(myearpassed.toString());
//     // print(mendyear.toString());
//     // print(_mloanyearvalues.toString());
//     // m_minrange =  double.parse(myearpassed.toString()); ;
//     // m_maxrange =double.parse(mendyear.toString());   ;
//     // double mtgint =  m_maxrange  ;
//     // print("###3333####33hvcudfyhvuyfuyvuy");
//     // if(mtgsliderValue != 0)
//     // {
//     //   mtgint = mtgsliderValue ;
//     // }
//     // if(_mloanyearvalues <m_minrange) {
//     //   _mloanyearvalues = m_maxrange;
//     // }
//     // mbalanceamount = Constants.mAmortization(mortgage.originationPrincipalAmount,
//     //     mortgage.interestRate!.percentage as double, mtgint , myearpassed.toInt() );
//     // m_saveamount = mloanmaxvalue - mbalanceamount;
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var enddate = DateTime.parse(mortgage.maturityDate!);
//     var startdate = DateTime.parse(mortgage.originationDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(mortgage.maturityDate);
//     // print(mortgage.originationDate);
//     // print(_mloanyearvalues.toString());
//   }
//
// //############
// }
//
// //>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
//
// //----3
// Future<RefreshTokenResponse> valueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call redfresh token  .');
//   }
// }
//
// //>>>>>>>>>>>>>>-------------------------tokenAPI's--------------------------------->>>>>>>>>>>>>>>
// Future<LinkTokenResponse> linktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["transactions", "auth"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // prfint(Uri.parse(Constants.URL + '/link/token/create'));
// //  print('>>>>>>>>>>>>>>>>>>>>>>>> Link Token <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   // print(response.body);
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> institutionResponse(String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   print(
//       '>>>>>>>>>>>>>>>>>>>>>>>> institutionResponse <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   //print(response2.body);
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> accessTokenResponse(String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   print(
//       '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
//
// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
//
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }
//
// DateTime formatTimeOfDay(int month, int year, int day) {
//   final now = new DateTime.now();
//   final dt = DateTime(now.year, now.month, now.day);
//   return dt;
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Future<LinkTokenResponse> creditlinktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["liabilities"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // print(Uri.parse(Constants.URL + '/link/token/create'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> creditinstitutionResponse(
//     String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> creditaccessTokenResponse2(
//     String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   // print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
// Future<LiabilityResponse> liabilityData(
//     String accesstoken, String accountid) async {
//   bool _isLoading = true;
//   LiabilityOptions liabilityOptions = LiabilityOptions();
//   liabilityOptions.accountIds = [accountid];
//   LiabilityRequest liabilityRequest = LiabilityRequest();
//   liabilityRequest.clientId = Constants.ClientId;
//   liabilityRequest.secret = Constants.Secret;
//   liabilityRequest.accessToken = accesstoken;
//   liabilityRequest.options = liabilityOptions;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final response4 =
//   await http.post(Uri.parse(Constants.URL + '/liabilities/get'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(liabilityRequest));
//
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(response4.body)}');
//   //  print('credit bpdyyyyy');
//   //  print(response4.body);
//   //  print(response4.statusCode);
//   //  print(jsonEncode(liabilityRequest));
//   // print('credit bpdyyyyy');
//
//   // print(
//   //     '#################################credit##################################################');
//
//   if (response4.statusCode == 200) {
//     bool _isLoading = false;
//
//     return LiabilityResponse.fromJson(jsonDecode(response4.body));
//   } else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //------
// Future<RefreshTokenResponse> refreshValueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
// class MyLabelCommonOptions extends LabelCommonOptions {
//   const MyLabelCommonOptions(
//       ) : super ();
//
//   /// Override [labelTextStyle] with a new font, color, etc.
//   @override
//   // get labelTextStyle => GoogleFonts.comforter(
//   //  style: TextStyle(
//   //   color: Color,
//   //   fontSize: 14.0,
//   //   fontWeight: FontWeight.w400, // Regular
//   //   ),
//   // );
//
//   get labelTextStyle =>
//       const ChartOptions().labelCommonOptions.labelTextStyle.copyWith(
//           color: Colors.white
//       );
//
// }
//bchb bchsb kjc bjkcsb jkbc j
import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:math' as math;
// import 'dart:ui';
// import 'dart:ui';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_charts/flutter_charts.dart';
// import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
// import 'package:plaid_flutter/plaid_flutter.dart';
//
// import 'package:swipeapp/Controller/Request/SaveBankDataRequest.dart';
// import 'package:swipeapp/Controller/Request/RefreshTokenRequest.dart';
// import 'package:swipeapp/Controller/Response/GetBankDataResponse.dart';
// import 'package:swipeapp/Controller/Response/RefreshTokenResponse.dart';
// import 'package:swipeapp/Controller/Response/SaveBankDataResponse.dart';
//
// import '../Model Helper.dart';
//
// import 'Account/AddAccount1.dart';
// import 'PlaidData/BankData.dart';
// import 'PlaidData/TransactionDetail.dart';
// import 'Plan/PlanAccount1.dart';
// import 'Request/AccessTokenRequest.dart';
// import 'Request/InstitutionRequest.dart';
// import 'Request/LiabilityRequest.dart';
// import 'Request/TokenResquest.dart';
// import 'Request/TransactionRequest.dart';
// import 'Response/AccessTokenResponse.dart';
// import 'Response/InstitutionResponse.dart';
// import 'Response/LiabilityResponse.dart';
// import 'Response/LinkTokenResponse.dart';
// import 'Response/TransactionResponse.dart';
// import 'package:flutter/services.dart';
// import 'dart:math' as math;
// import 'Response/UserDeatail.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       // title: 'Kindacode.com',
//       home: Dashboard2(),
//     );
//   }
// }
//
// class Dashboard2 extends StatefulWidget {
//   const Dashboard2({Key? key}) : super(key: key);
//
//   // final Function callback;
//   //const Dashboard(this.callback);
//   @override
//   tdashboardState createState() => tdashboardState();
// }
//
// class tdashboardState extends State<Dashboard2> {
//   BankData bankDataobj = BankData();
//
//   //creditBankData creditbankDataobj = creditBankData();
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//   late Future<List<BankData>> bankdatalist = [] as Future<List<BankData>>;
//   late Future<List<BankData>> creditbankdatalist = [] as Future<List<BankData>>;
//   List<Transactions> transactionlist = [];
//
//   List<double> debitGraphdata = [];
//   List<double> creditGraphdata = [];
//   List<String> graphbankname = [];
//
//   Future<TransactionResponse>? transactionResponseList;
//   late LegacyLinkConfiguration _publicKeyConfiguration;
//   late LinkTokenConfiguration _linkTokenConfiguration;
//   late Future<TokenRequest> tokenRequest;
//   String ExpenseKey = "expensedata";
//   String accesstoken = "";
//   String accountid = "";
//   int cmonth = 0;
//   late String _imgString = '';
//   late String imagebase64 = '';
//   bool _isShown = true;
//   String bname = "";
//   String acname = "";
//   int selectedIndex = -1;
//   late double tDebitValue = 0;
//   late double tCreditValue = 0;
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//
//   String dollar = " \$";
//   bool isFavourite = false;
//   bool isFavourite1 = true;
//   bool isFavourite2 = true;
//   bool isFavourite3 = true;
//   bool isLoading = false;
//   bool isLoading1 = true;
//   bool isexpanse = true;
//   bool viewVisibleTransaction = true;
//   bool viewVisible1 = true;
//
//   void hideWidget1() {
//     setState(() {
//       viewVisible1 = !viewVisible1;
//       viewVisible1 = false;
//     });
//   }
//
//   void showWidget() {
//     setState(() {
//       viewVisible = true;
//     });
//   }
//
// //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   late LinkTokenConfiguration creditlinkTokenConfiguration;
//   Liabilities liabilitylist = new Liabilities();
//   List<Student> stdlist = [];
//   List<Credit> crdlist = [];
//   List<Mortgage> mrtlist = [];
//   bool viewVisible = false;
//   bool viewVisible2 = false;
//   bool viewVisible3 = false;
//
//   void hideWidget() {
//     setState(() {
//       viewVisible = false;
//       viewVisible2 = false;
//       viewVisible3 = false;
//     });
//   }
//   bool _expanded = false;
//   late ScrollController _scrollController;
//
//   //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//   late ChartData chartData;
//   ChartOptions chartOptions = const ChartOptions(
//     labelCommonOptions: MyLabelCommonOptions(),
//
//   );
//
//   late var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy);
//
//   void initState() {
//     // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
//     //super.initState();
//     chartData = ChartData(
//       dataRows:  [
//         debitGraphdata,
//         creditGraphdata,
//       ],
//       xUserLabels: graphbankname,
//
//       // dataRows: const [
//       //   [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//       //   [0, 0, 0, 0, 0, -1800.0],
//       // ],
//       //   xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const ['Values', 'Values 2'],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//
//       chartOptions: chartOptions,
//
//     );
//     verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//     _publicKeyConfiguration = LegacyLinkConfiguration(
//       clientName: Constants.ClientId,
//       publicKey: "PUBLIC_KEY",
//       environment: LinkEnvironment.sandbox,
//       products: <LinkProduct>[
//         LinkProduct.auth,
//         LinkProduct.transactions,
//       ],
//       language: "en",
//       countryCodes: ['US'],
//       userLegalName: "John Appleseed",
//       userEmailAddress: "jappleseed@youapp.com",
//       userPhoneNumber: "+1 (512) 555-1234",
//     );
//     PlaidLink.onSuccess(_onSuccessCallback);
//     PlaidLink.onEvent(_onEventCallback);
//     PlaidLink.onExit(_onExitCallback);
//     bankdatalist = fetchBankData(Constants.debitcardValue);
//     var linktoken = linktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//     creditbankdatalist = fetchBankData(Constants
//         .creditcardValue); // as Future<List<creditBankData>>;// as List<BankData>;
//     var creditlinktoken = creditlinktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//     _scrollController = ScrollController();
//
//
//     // var verticalBarChart = VerticalBarChart(
//     //   painter: VerticalBarChartPainter(
//     //     verticalBarChartContainer: verticalBarChartContainer,
//     //   ),
//     // );
//   }
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>start>>>>>>>>>>>>>>>>>>>>>>>>
//   String libKey = "data";
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
//     // print("onSuccess222: $publicToken, metadata: ${metadata.description()}");
//     bankDataobj.publictoken = publicToken;
//     bankDataobj.accesstoken = accesstoken;
//     savingBankData(metadata);
//   }
//
//   void _onEventCallback(String event, LinkEventMetadata metadata) {
//     // print("onEvent123: $event, metadata: ${metadata.description()}");
//   }
//
//   void _onExitCallback(LinkError? error, LinkExitMetadata metadata) {
//     // print("onExit metadata: ${metadata.description()}");
//
//     if (error != null) {
//       // print("onExit error: ${error.description()}");
//     }
//   }
//
//   void savingBankData(LinkSuccessMetadata metadata) async {
//     for (int i = 0; i < metadata.accounts.length; i++) {
//       bankDataobj.accountid = metadata.accounts[i].id;
//       bankDataobj.accountname = metadata.accounts[i].name;
//       bankDataobj.mask = metadata.accounts[i].mask;
//     }
//     if (metadata.institution.id != "") {
//       var insres = await institutionResponse(metadata.institution.id);
//       bankDataobj.banklogo = insres.institution?.logo;
//       print("logooooooooo");
//       print(bankDataobj.banklogo);
//       print("logooooooooo");
//       bankDataobj.bankthemecolor = insres.institution?.primaryColor;
//       bankDataobj.bankname = insres.institution?.name;
//       var accesstokenres =
//       await accessTokenResponse(bankDataobj.publictoken.toString());
//       bankDataobj.accesstoken = accesstokenres.accessToken;
//
//       //  if (isexpanse) {
//       // saveBankdataResponse();
//       // List<BankData> templstbankdata = await bankdatalist;
//       //templstbankdata.add(bankDataobj);
//       //await Constants.save(ExpenseKey, jsonEncode(templstbankdata));
//       //  } else {
//       // List<BankData> templstbankdata = await creditbankdatalist;
//       // templstbankdata.add(bankDataobj);
//       // await Constants.save(libKey, jsonEncode(templstbankdata));
//       // }
//
//       //   setState(() {
//       saveBankdataResponse();
//       //  });
//
//       // print('---calling end accessTokenResponse---');
//     }
//   }
//
//   //--
//   Future<List<BankData>> appendElements(
//       Future<List<BankData>> listFuture, List<BankData> elementsToAdd) async {
//     // final list = await listFuture;
//     // int count = list.length;
//     // for(int i = count; i>0; i-- )
//     //   {
//     //     list.remove(list[i]);
//     //   }
//     // List<BankData>
//     // list.addAll(elementsToAdd);
//     return elementsToAdd;
//   }
//
//   //--
//
//   Future<List<BankData>> getBankData(List<BankData> bankresultList) async {
//     print("frfgr<<<<<<>>>>>>");
//
//     try {
//       // var bankdatalist1 =  [] as Future<List<BankData>>;
//       // setState(() {
//       bankdatalist = appendElements(bankdatalist, bankresultList);
//       //});
//       print("<<<<<<>>>>>>");
//
//       bankdatalist = debitTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load debitbankdata');
//     }
//     return bankdatalist;
//   }
//
//   Future<List<BankData>> getCreditBankData(
//       List<BankData> bankresultList) async {
//     try {
//       //creditbankdatalist =  [] as Future<List<BankData>>;
// //
//       // setState(() {
//       creditbankdatalist = appendElements(creditbankdatalist, bankresultList);
//       // });
//
//       creditTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load creditbankdata');
//     }
//     return creditbankdatalist;
//   }
//
//   Future<List<BankData>> fetchBankData(int type) async {
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String banktoken = tempuserdetail.accessToken.toString();
//     final response = await http.get(
//         Uri.parse(
//             Constants.baseUrl2 + '/Bank/GetBankData?type=' + type.toString()),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $banktoken',
//         });
//     print(response.body);
//
//     List<BankData> tempbankdatalist = <BankData>[];
//     if (response.statusCode == 200) {
//       GetBankDataResponse bankdataResponse =
//       GetBankDataResponse.fromJson(jsonDecode(response.body));
//       for (var i in bankdataResponse.result!) {
//         BankData bd = new BankData();
//         bd.publictoken = i.publictoken;
//         bd.bankthemecolor = i.bankthemecolor;
//         bd.banklogo = i.banklogo;
//         bd.mask = i.mask;
//         bd.accountname = i.accountname;
//         bd.accesstoken = i.accesstoken;
//         bd.bankname = i.bankname;
//         bd.accountid = i.accountid;
//         tempbankdatalist.add(bd);
//       }
//
//       print(jsonEncode(tempbankdatalist));
//       print("reposne>>>>>>>");
//       // getBankData(tempbankdatalist);
//       // return tempbankdatalist ;
//       if (type == Constants.debitcardValue) {
//         tempbankdatalist = getBankData(tempbankdatalist) as List<BankData>;
//         return tempbankdatalist;
//       } else {
//         getCreditBankData(tempbankdatalist);
//         return tempbankdatalist;
//       }
//
//       // return GetBankDataResponse.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to call user childuserid .');
//     }
//   }
//
//   Future<SaveBankDataResponse> saveBankdataResponse() async {
//     SaveBankDataRequest saveBankDataRequest = SaveBankDataRequest();
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String accounttoken = tempuserdetail.accessToken.toString();
//     saveBankDataRequest.id = 0;
//     saveBankDataRequest.accountid = bankDataobj.accountid;
//     saveBankDataRequest.accesstoken = bankDataobj.accesstoken;
//     saveBankDataRequest.accountname = bankDataobj.accountname;
//     saveBankDataRequest.mask = bankDataobj.mask;
//     saveBankDataRequest.bankname = bankDataobj.bankname;
//     saveBankDataRequest.banklogo = bankDataobj.banklogo;
//     print("banklogooooooooo>>>>>>>>");
//     print(bankDataobj.banklogo?.length.toString());
//     print(bankDataobj.banklogo);
//     print("banklogooooooooo>>>>>>>>");
//     saveBankDataRequest.bankthemecolor = bankDataobj.bankthemecolor;
//     saveBankDataRequest.publictoken = bankDataobj.publictoken;
//
//     if (isexpanse) {
//       saveBankDataRequest.type = Constants.debitcardValue;
//     } else {
//       saveBankDataRequest.type = Constants.creditcardValue;
//     }
//     //print('/////////request <<<<<<<<<<<<<<<<<<<<<<<<<');
//     //print(jsonEncode(saveBankDataRequest));
//     //print('/////////.request <<<<<<<<<<<<<<<<<<<<<<<<<');
//
//     final savebankresponse =
//     await http.post(Uri.parse(Constants.baseUrl2 + '/Bank/SaveBankData'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $accounttoken',
//         },
//         body: jsonEncode(saveBankDataRequest));
//     // print('/////////.svaebankdata <<<<<<<<<<<<<<<<<<<<<<<<<');
//     // print(accounttoken);
//     // print(saveBankDataRequest);
//     // print(savebankresponse);
//     // print(savebankresponse.body);
//     // print(savebankresponse.statusCode);
//     // print('/////////<<<<svaebankdata<<<<<<<<<<<<<<<<<<<<<');
//
//     if (savebankresponse.statusCode == 200) {
//       fetchBankData(saveBankDataRequest.type!);
//
//       return SaveBankDataResponse.fromJson(jsonDecode(savebankresponse.body));
//     } else {
//       throw Exception('Failed to call plaid save bank data.');
//     }
//   }
//
//   late final Function callback;
//
//   final List<String> iconname = [
//     'asset/images/cart.png',
//     'asset/images/at.png',
//     'asset/images/travel.png',
//     'asset/images/movie.png',
//
//     //   'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//   ];
//   List<String> TransactionIconCategory =[
//     "Bank Fees",
//     "Cash Advance",
//     "Community"
//   ];
//
//
//
//
//
//   // const Dashboard(this.callback);
//
//   Future<TransactionResponse> transactionResponse(
//       String accesstoken, String accountid, int currentmonth) async {
//     String startdate = "";
//     String enddate = "";
//     var now = new DateTime.now().toString();
//     var date = DateTime.parse(now);
//     DateTime firstDayOfMonth = new DateTime(date.year, date.month, 1);
//     // var dateObj = new Date;
//     // var lmonth = dateObj.getUTCMonth() + 1; //months from 1-12
//     // var lday = dateObj.getUTCDate();
//     // var lyear = dateObj.getUTCFullYear();
//     // var lastendDayOfMonth = lyear + "/" + lmonth + "/" + lday;
//     // DateTime lastendDayOfMonth = DateTime(date.year, date.month+1 , 0);
//     DateTime lastendDayOfMonth = (date.month < 12)
//         ? new DateTime(date.year, date.month + 1, 0)
//         : new DateTime(date.year + 1, 1, 0);
//     var fyear = firstDayOfMonth.year;
//     var fmonth = firstDayOfMonth.month.toString().padLeft(2, '0');
//     var fday = firstDayOfMonth.day.toString().padLeft(2, '0');
//     var firstday = "${fyear}-${fmonth}-${fday}";
//     var lyear = lastendDayOfMonth.year;
//     var lmonth = lastendDayOfMonth.month.toString().padLeft(2, '0');
//     var lday = lastendDayOfMonth.day.toString().padLeft(2, '0');
//     var lastday = "${lyear}-${lmonth}-${lday}";
//     startdate = firstday;
//     enddate = lastday;
//
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     // print(startdate);
//     // print(enddate);
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     Transactionoptions transactionoptions = Transactionoptions();
//     transactionoptions.count = 20;
//     transactionoptions.offset = 0;
//     transactionoptions.accountIds = [accountid];
//     TransactionRequest transactionRequest = TransactionRequest();
//     transactionRequest.clientId = Constants.ClientId;
//     transactionRequest.secret = Constants.Secret;
//     transactionRequest.accessToken = accesstoken;
//     transactionRequest.options = transactionoptions;
//     transactionRequest.startDate = startdate;
//     transactionRequest.endDate = enddate;
//     isLoading1 = false;
//     print(
//         'dasgboardRequest body4--REQUESTTTTTTTTTTTTTTTTTTTT: ${jsonEncode(transactionRequest)}');
//     final response4 =
//     await http.post(Uri.parse(Constants.URL + '/transactions/get'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(transactionRequest));
//     print(
//         '!!!!!!!!!!!!###########################################################################################################');
//     print('dshrespose44 body-----: ${response4}');
//     print(response4.statusCode);
//     print(response4);
//     // print(accesstoken);
//     print('dash##########################################'
//         '###################################################'
//         '##############');
//     if (response4.statusCode == 200) {
//       void dispose() {
//         Loader.hide();
//         isLoading1 = false;
//         // super.dispose();
//       }
//
//       return TransactionResponse.fromJson(jsonDecode(response4.body));
//     } else {
//       //void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//       //}
//
//       throw Exception('Failed to call transaction .');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     var _val;
//     var chidern;
//     return Scaffold(
//
//
//
//       //  resizeToAvoidBottomInset: false,
//
//       body: SafeArea(
//
//           child:
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 dashboardHeader(),
//                 Column(
//                   children:<Widget>[
//                     debitTransaction(),
//                     creditLiability(),
//                     paymentButton(),
//                     viewtransaction(),
//                     Visibility(
//                       maintainSize: true,
//                       maintainAnimation: true,
//                       maintainState: true,
//                       visible: viewVisible1,
//                       child: Container(
//                         width: double.infinity,
//                         //height: 200.0,
//                         // color: Colors.yellow,
//                         child: Column(
//                           //child: Column(
//                           children: [
//                             isLoading1 ?
//                             Center(child: CircularProgressIndicator()) :
//                             ListView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemCount: transactionlist.length,
//                                 itemBuilder: (context, int index) {
//                                   var $;
//                                   return Card(
//                                     color: const Color(0xffF7F6FA),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 80.0,
//                                       margin:
//                                       const EdgeInsets.only(right: 9, left: 9),
//                                       child: ListTile(
//                                           contentPadding: EdgeInsets.only(
//                                               left: 10.0, right: 0.0),
//                                           leading: CircleAvatar(
//                                             radius: 20,
//                                             child:
//                                             Image(image: AssetImage("asset/images/cart.png"),
//                                               //Image.asset( iconname[index],),
//                                             ),
//                                           ),
//                                           title: Text(
//                                             transactionlist[index].name.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           subtitle: Text(
//                                             transactionlist[index]
//                                                 .category
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing: Padding(
//                                             padding: EdgeInsets.only(top: 5),
//                                             child: Column(children: <Widget>[
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                     top: 3, bottom: 3),
//                                                 child: Text(
//                                                   dollar +
//                                                       transactionlist[index]
//                                                           .amount
//                                                           .toStringAsFixed(2),
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w600),
//                                                 ),
//                                               ),
//                                               Text(
//                                                 transactionlist[index]
//                                                     .date
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w500),
//                                               ),
//                                             ]),
//                                           )),
//                                     ),
//                                   );
//                                 }
//                               // );
//                               // }
//                               //},
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 )
//
//
//
//
//
//
//               ],
//             ),
//           )
//       ),
//
//
//
//
//     );
//   }
//
// //<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   Widget chartToRun() {
//     LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//     ChartData chartData;
//     ChartOptions chartOptions = const ChartOptions();
//     // Example shows a mix of positive and negative data values.
//     chartData = ChartData(
//       dataRows: const [
//         [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//         [0,0,0,0,0, -1800.0],
//       ],
//       xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const [
//         'Values',
//         'Values 2'
//       ],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//       chartOptions: chartOptions,
//     );
//     var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//
//     var verticalBarChart = VerticalBarChart(
//       painter: VerticalBarChartPainter(
//         verticalBarChartContainer: verticalBarChartContainer,
//       ),
//     );
//     return verticalBarChart;
//   }
//   dashboardHeader() {
//     return   Flexible(
//         child: Container(
//           //height: 120,
//             width: double.infinity,
//             padding: EdgeInsets.all(5),
//             //color: const Color(0xDEB46FEA),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("asset/images/background.png"),
//                   fit: BoxFit.cover,
//                 )),
//             //child: Align(alignment: Alignment.center,
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Row(mainAxisSize: MainAxisSize.min, children: [
//                     Container(
//                         margin: EdgeInsets.all(8),
//                         alignment: Alignment.topLeft,
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           //color: const Color(0x75f5f5f5)
//                         ),
//                         child:
//                         // Row(
//                         //   mainAxisSize: MainAxisSize.min,
//                         //   children: [
//                         Text(
//                           'Test Account',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 15,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold //font color
//                           ),
//                         )
//                       //   ],
//                       // )
//
//                     ),
//                   ]),
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tDebitValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 18,
//                                 //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                                 color: Colors.white,
//                                 //font color
//                                 fontStyle: FontStyle.italic),
//                           ),
//                           Text(
//                             'Debit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//
//
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tCreditValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 18,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               //font color
//                               fontStyle: FontStyle.italic,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             'Credit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//                     ]),
//                 Container(
//                   //width: 80,
//                   child:
//                   ExpandableNotifier(  // <-- Provides ExpandableController to its children
//                     child: Column(
//                       children: [
//                         Expandable(           // <-- Driven by ExpandableController from ExpandableNotifier
//                           collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
//                             child: //Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,),
//                             Image.asset(
//                               "asset/images/down.png", // width: 300,
//                               height: 20,
//                               width: 20,
//                               alignment: Alignment.center,
//                             ),
//
//                           ),
//                           expanded: Column(
//                               children: [
//                                 //Text("Backjdsgcygdsucudshiodhycoe"),
//                                 SizedBox(
//                                     width: 400,
//                                     height: 350,
//                                     child: FittedBox(child: Column(
//                                       children: [
//                                         //  addAccountHeader(),
//                                         Container(
//                                           // color: Colors.yellow,
//                                           height: 300,
//                                           width: 350,
//                                           child:
//                                           //Column(
//                                           // children: [
//                                           //  addAccountHeader(),
//                                           VerticalBarChart(
//                                             painter: VerticalBarChartPainter(
//                                               verticalBarChartContainer: verticalBarChartContainer,
//                                             ),
//                                           ),
//
//                                         )
//                                       ],
//                                     ))
//                                 ),
//                                 ExpandableButton(
//                                   child:  Image.asset(
//                                     "asset/images/up.png", // width: 300,
//                                     height: 20,
//                                     width: 20,
//                                     alignment: Alignment.center,
//                                   ),
//                                 ),
//                               ]
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],
//             )
//
//           //  ),
//         ));
//   }
//
//   debitTransaction() {
//     return Scrollbar(
//       child:Column(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Row(mainAxisSize: MainAxisSize.min, children: [
//               Container(
//                   margin: EdgeInsets.all(8),
//                   alignment: Alignment.topLeft,
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: const Color(0xffECDCFF)),
//                   child:
//                   // Row(
//                   //   mainAxisSize: MainAxisSize.min,
//                   //   children: [
//                   Text(
//                     'Debit:' + dollar + tDebitValue.toStringAsFixed(2),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 14,
//                         //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                         color: Colors.black,
//                         //font color
//                         fontStyle: FontStyle.italic),
//                   )
//                 //   ],
//                 // )
//
//               ),
//             ]),
//             // ),
//           ),
//           Container(
//             // height: 250.0,
//             // color: Colors.yellow,
//               child: Column(
//                 children: [
//                   Container(
//                       height: 35,
//                       width: double.infinity,
//                       margin:
//                       EdgeInsets.only(top: 5, left: 15, bottom: 10, right: 15),
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           color: const Color(0xffEDECEE)),
//                       child: Row(
//                         children: [
//                           TextButton(
//                             style: TextButton.styleFrom(
//                               padding: const EdgeInsets.all(5),
//                             ),
//                             onPressed: () async {
//                               isexpanse = true;
//                               Loader.show(context,
//                                   isSafeAreaOverlay: false,
//                                   progressIndicator: CircularProgressIndicator(),
//                                   isBottomBarOverlay: false,
//                                   overlayFromBottom: 80,
//                                   themeData: Theme.of(context)
//                                       .copyWith(accentColor: Colors.black),
//                                   overlayColor: Color(0x0000ffff));
//                               Future.delayed(Duration(seconds: 4), () {
//                                 Loader.hide();
//                               });
//                               var linktoken = await linktokenResponse();
//                               _linkTokenConfiguration = LinkTokenConfiguration(
//                                 token: linktoken.linkToken.toString(),
//                               );
//
//                               PlaidLink.open(configuration: _linkTokenConfiguration);
//                             },
//                             child: Image(
//                               image: AssetImage("asset/images/Plus.png"),
//                               width: 100,
//                               height: 100,
//                             ),
//                           ),
//                           Text('Connect To Debit Account'),
//                         ],
//                       )),
//                   //-----------------------------------debir////-----------
//                   Container(
//                     width: double.infinity,
//                     // height: 150.0,
//                     margin: const EdgeInsets.only(bottom: 4, top: 4),
//                     color: Colors.white,
//                     child: ListView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       children: [
//                         FutureBuilder<List<BankData>>(
//                           future: bankdatalist,
//                           builder: (context, snapshot) {
//                             if(snapshot.hasData)
//                             {
//                               return
//                                 ExpansionPanelList(
//                                   animationDuration: Duration(milliseconds: 2000),
//                                   children:
//                                   snapshot.data!.map<ExpansionPanel>((BankData item) {
//                                     return ExpansionPanel(
//                                       headerBuilder:
//                                           (BuildContext context, bool isExpanded) {
//                                         return ListTile(
//                                           iconColor: Colors.red,
//                                           leading: CircleAvatar(
//                                             radius: 30,
//                                             child:
//                                             // Image.memory(Base64Codec().decode(item.banklogo.toString()),),
//                                             Image.network(item.banklogo.toString()),
//                                           ),
//                                           title: Text(
//                                             item.bankname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing:
//                                           item.totalamount ==null?
//                                           Text(dollar+'0',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ):
//                                           Text('${item.totalamount.toString()}',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ),
//                                           // Text(
//                                           //   dollar + item.totalamount.toString(), "0",
//                                           //
//                                           //   style: TextStyle(
//                                           //       color: Colors.black,
//                                           //       fontSize: 16,
//                                           //       fontWeight: FontWeight.w500),
//                                           //),
//                                           subtitle: Text(
//                                             item.accountname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                           selected: false,
//                                         );
//                                       },
//                                       body:
//                                       // Text("gcdsgchgdsv"),
//                                       debitBuildExpandableContent(
//                                           item.accesstoken.toString(),
//                                           item.accountid.toString(),
//                                           cmonth),
//                                       isExpanded: item.isExpaneded,
//                                     );
//                                   }).toList(),
//                                   dividerColor: Colors.grey,
//                                   expansionCallback: (int index, bool isExpanded) {
//                                     setState(() {
//                                       snapshot.data![index].isExpaneded = !isExpanded;
//                                     });
//                                   },
//                                 );
//                             }
//                             else
//                             {
//                               return Center(
//                                   child: CircularProgressIndicator());
//                             }
//
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
// //chnage heiught to 200
//                   //--------------------------
//                 ],
//               )),
//
//         ],
//       ),
//     );
//   }
//
//   creditLiability() {
//     return Column(children: [
//       Align(
//         alignment: Alignment.topLeft,
//         child: Row(mainAxisSize: MainAxisSize.min, children: [
//           Container(
//               margin: EdgeInsets.all(8),
//               alignment: Alignment.topLeft,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: const Color(0xffECDCFF)),
//               child:
//               // Row(
//               //   mainAxisSize: MainAxisSize.min,
//               //   children: [
//               Text(
//                 'Credit: ' + dollar + tCreditValue.toStringAsFixed(2),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 14,
//                     //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                     color: Colors.black,
//                     //font color
//                     fontStyle: FontStyle.italic),
//               )
//             //   ],
//             // )
//
//           ),
//         ]),
//       ),
//       Container(
//           height: 35,
//           width: double.infinity,
//           margin: EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 15),
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: const Color(0xffEDECEE)),
//           child: Row(
//             children: [
//               TextButton(
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.all(5),
//                 ),
//                 onPressed: () async {
//                   isexpanse = false;
//                   Loader.show(context,
//                       isSafeAreaOverlay: false,
//                       progressIndicator: CircularProgressIndicator(),
//                       isBottomBarOverlay: false,
//                       overlayFromBottom: 80,
//                       themeData:
//                       Theme.of(context).copyWith(accentColor: Colors.black),
//                       overlayColor: Color(0x0000ffff));
//                   Future.delayed(Duration(seconds: 4), () {
//                     Loader.hide();
//                   });
//                   var creditlinktoken = await creditlinktokenResponse();
//                   creditlinkTokenConfiguration = LinkTokenConfiguration(
//                     token: creditlinktoken.linkToken.toString(),
//                   );
//
//                   PlaidLink.open(configuration: creditlinkTokenConfiguration);
//                 },
//                 child: Image(
//                   image: AssetImage("asset/images/Plus.png"),
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//               Text('Connect To Credit Account'),
//               //Text('Connect To Credit Account2'),
//             ],
//           )),
//       Container(
//         width: double.infinity,
//         // height: 150.0,
//         margin: const EdgeInsets.only(bottom: 0, top: 0),
//         color: Colors.white,
//         child: ListView(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//
//           children: [
//             FutureBuilder<List<BankData>>(
//               future: creditbankdatalist,
//               builder: (context, snapshot) {
//                 if(snapshot.hasData)
//                 {
//                   return
//                     ExpansionPanelList(
//                       animationDuration: Duration(milliseconds: 2000),
//                       children: snapshot.data!.map<ExpansionPanel>((BankData item) {
//                         return ExpansionPanel(
//                           headerBuilder: (BuildContext context, bool isExpanded) {
//                             return ListTile(
//                               iconColor: Colors.red,
//                               leading: CircleAvatar(
//                                   radius: 30,
//                                   child:
//                                   //Image.memory(Base64Codec().decode(item.banklogo.toString())),
//
//                                   Image.network(item.banklogo.toString())),
//                               title: Text(
//                                 item.bankname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               trailing:
//                               // Text(
//                               //   dollar + item.totalamount.toString(),
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 16,
//                               //       fontWeight: FontWeight.w500),
//                               // ),
//                               item.totalamount ==null?
//                               Text(dollar+'0',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ):
//                               Text('${item.totalamount!.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 item.accountname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               selected: false,
//                             );
//                           },
//                           body: //Text('hgsdvfghjbvsdjhcgsdh'),
//                           creditBuildExpandableContent(
//                             item.accesstoken.toString(),
//                             item.accountid.toString(),
//                           ),
//                           isExpanded: item.isExpaneded,
//                         );
//                       }).toList(),
//                       dividerColor: Colors.grey,
//                       expansionCallback: (int index, bool isExpanded) async {
//                         setState(() {
//                           snapshot.data![index].isExpaneded = !isExpanded;
//                         });
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // print(index);
//                         // print(isExpanded);
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // TransactionResponse tempresponse2 =
//                         //     await transactionResponse(
//                         //         snapshot.data![index].accesstoken.toString(),
//                         //         snapshot.data![index].accountid.toString(),
//                         //         cmonth);
//                         //
//                         // transactionlist =
//                         //     tempresponse2.transactions as List<Transactions>;
//                         // viewVisible = true;
//                         viewVisibleTransaction = true;
//                         showWidget();
//                         LiabilityResponse tempresponse = await liabilityData(
//                             snapshot.data![index].accesstoken.toString(),
//                             snapshot.data![index].accountid.toString());
//                         liabilitylist = tempresponse.liabilities as Liabilities;
//                         viewVisible = false;
//                         viewVisible2 = false;
//                         viewVisible3 = false;
//                         if (liabilitylist.student != null) {
//                           stdlist = liabilitylist.student!;
//                           viewVisible = true;
//                           //  print("student");
//                           setStudentLoanContainer(liabilitylist.student!.first, 0);
//                         }
//                         if (liabilitylist.mortgage != null) {
//                           mrtlist = liabilitylist.mortgage!;
//                           viewVisible2 = true;
//                           //  print("mortgage");
//                           setMortgage(liabilitylist.mortgage!.first, 0);
//                         }
//                         if (liabilitylist.credit != null) {
//                           crdlist = liabilitylist.credit!;
//                           viewVisible3 = true;
//                           //  print("credit");
//                         }
//                       },
//                     );
//                 }
//                 else
//                 {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//               },
//             ),
//           ],
//         ),
//       ),
//     ]);
//   }
//
//   paymentButton() {
//     return Container(
//       height: 38,
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 15, bottom: 20.0, left: 25, right: 25),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//             //color: const Color(0xFFA781D3),
//           )),
//       child: TextButton(
//         style: TextButton.styleFrom(
//           backgroundColor: const Color(0xFFA781D3),
//           padding: const EdgeInsets.all(5),
//         ),
//         onPressed: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => AddAccount()),
//           // );
//         },
//         child: Text(
//           'Make a Payment',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
//
//   bottomNavBar() {
//     return Container(
//       height: 45,
//       padding: const EdgeInsets.all(
//         8,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(2),
//         color: const Color(0xF5F7F6FA),
//       ),
//       //alignment: Alignment.bottomCenter,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           IconButton(
//             // icon: Image.asset('assets/images/dashboard.png'),
//             icon: ImageIcon(
//               AssetImage("asset/images/home2.png"),
//               size: 140,
//               color: isFavourite ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//
//             onPressed: () {
//               setState(() {
//                 isFavourite = false;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pbox.png"),
//               size: 140,
//               color: isFavourite1 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   //MaterialPageRoute(builder: (context) => Spend(this.)),
//               // );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = false;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pmoney.png"),
//               size: 140,
//               color: isFavourite2 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PlanAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = false;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/paccount.png"),
//               size: 140,
//               color: isFavourite3 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = false;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   viewtransaction() {
//     return Container(
//       child: Row(children: [
//         Container(
//             margin: EdgeInsets.all(8),
//             alignment: Alignment.topLeft,
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: const Color(0xffECDCFF)),
//             child:
//             // Row(
//             //   mainAxisSize: MainAxisSize.min,
//             //   children: [
//             Text(
//               'Recent Transactions',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 14,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: Colors.black,
//                   //font color
//                   fontStyle: FontStyle.italic),
//             )
//           //   ],
//           // )
//
//         ),
//         Spacer(),
//         Container(
//           margin: EdgeInsets.all(8),
//           alignment: Alignment.topRight,
//           child: InkWell(
//             onTap: () async {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TransactionDetail(),
//                   // Pass the arguments as part of the RouteSettings. The
//                   // DetailScreen reads the arguments from these settings.
//                   settings: RouteSettings(
//                     arguments: transactionlist,
//                   ),
//                 ),
//               );
//               setState(() {
//                 //selectedIndex = i;
//               });
//             },
//             child: new Text(
//               "View All",
//               style: TextStyle(
//                   fontSize: 13,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: const Color(0xffA781D3),
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
//
// //   <<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
// //
// // ------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   debitTotalValue(List<BankData> debitlistbankdata) async {
//     double totalTransactionValue = 0;
//     for (var debitdata in debitlistbankdata) {
//       double debitcardtotalTransactionValue = 0;
//       var response = await transactionResponse(debitdata.accesstoken.toString(),
//           debitdata.accountid.toString(), cmonth);
//       for (var t_transaction in response.transactions!) {
//         transactionlist.add(t_transaction);
//         totalTransactionValue += t_transaction.amount;
//         debitcardtotalTransactionValue += t_transaction.amount;
//         print("||||||||||");
//
//         print(t_transaction.amount);
//       }
//       debitdata.totalamount = debitcardtotalTransactionValue;
//       debitGraphdata.add(debitcardtotalTransactionValue);
//       graphbankname.add(debitdata.bankname.toString());
//       creditGraphdata.add(0);
//       print("||||||||||¥¥¥¥¥¥¥¥¥¥¥¥total debitttttttt" +
//           totalTransactionValue.toString());
//       print(debitdata.totalamount);
//       print(debitcardtotalTransactionValue);
//     }
//     setState(() {
//       tDebitValue = totalTransactionValue;
//     });
//     print(jsonEncode(debitlistbankdata));
//     return debitlistbankdata;
//   }
//
//   creditTotalValue(List<BankData> creditlistbankdata) async {
//     double totalLiabilityValue = 0;
//     for (var cdata in creditlistbankdata) {
//       double creditcardtotalLiabilityValue = 0;
//
//       var libilityresponse = await liabilityData(
//           cdata.accesstoken.toString(), cdata.accountid.toString());
//       liabilitylist = libilityresponse.liabilities as Liabilities;
//       if (liabilitylist.student != null) {
//         for (var t_liability in liabilitylist.student!) {
//           totalLiabilityValue += t_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += t_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.mortgage != null) {
//         for (var s_liability in liabilitylist.mortgage!) {
//           totalLiabilityValue += s_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += s_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.credit != null) {
//         for (var c_liability in liabilitylist.credit!) {
//           totalLiabilityValue += c_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += c_liability.lastPaymentAmount!;
//         }
//       }
//       // print("||||||||||total creditttttttt"+ totalLiabilityValue.toString());
//       cdata.totalamount = creditcardtotalLiabilityValue;
//       debitGraphdata.add(0);
//       graphbankname.add(cdata.bankname.toString());
//       creditGraphdata.add(creditcardtotalLiabilityValue);
//     }
//     // print("||||||||||total creditttttttt value"+ totalLiabilityValue.toString());
//
//     setState(() {
//       tCreditValue = totalLiabilityValue;
//     });
//     return creditlistbankdata;
//   }
//
//   debitBuildExpandableContent(
//       String accessToken, String accountID, int cmonth) {
//     // print('+++++++++++++++++}');
//     var response = transactionResponse(accessToken, accountID, cmonth);
//     //
//     // print(response);
//     if (response == null) {
//       return Text(
//         'error ',
//         style: TextStyle(color: Colors.black),
//         //  ),
//       );
//     } else {
//       return //Text("jhbvkjndfkjvnfdv");
//         FutureBuilder<TransactionResponse>(
//             future: response,
//             builder: (context, snapshot) {
//               //   print('snnnnnnnnapshot');
//               //  print(snapshot.data!.transactions.toString());
//               return debitBuildTransactionListView(snapshot.data!);
//             });
//     }
//     ;
//   }
//
//   debitBuildTransactionListView(TransactionResponse tdata) {
//     //Text("jhbvkjndfkjvnfdv");
//     return //Text("credit4444444444444credit");
//       Column(
//         children: [
//           //for (var t in tdata.transactions!)
//           if (viewVisibleTransaction) ...[
//             Container(
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     for (var t in tdata.transactions!)
//                       Column(children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(
//                               top: 5, left: 13, right: 13, bottom: 3),
//                           color: const Color(0xffF5F5F5),
//                           child: ListTile(
//                             contentPadding: EdgeInsets.all(8),
//                             leading: CircleAvatar(
//                               radius: 20,
//                               child: Image(
//                                 image: AssetImage("asset/images/cart.png"),
//                                 //width: 40,
//                                 //color: const Color(0xffECDCFF)
//                               ),
//                             ),
//                             title: Padding(
//                               padding: EdgeInsets.only(top: 5, bottom: 8),
//                               child: Text(
//                                 t.category.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                             trailing: Column(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 10, top: 5),
//                                   child: Text(
//                                     dollar + t.amount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 2),
//                                   child: Text(
//                                     t.date.toString(),
//                                     style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             subtitle: Padding(
//                               padding: EdgeInsets.only(bottom: 2),
//                               child: Text(
//                                 t.name.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             selected: true,
//                           ),
//                         )
//                       ]),
//                   ],
//                 )),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     //selected: true;
//   }
//
// //------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
// //------->>>>>>>>>>>CREDIT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   creditBuildExpandableContent(String accessToken, String accountID) {
//     //print('+++++++++++++++++}');
//     var libilityresponse = liabilityData(accessToken, accountID);
//     print(libilityresponse);
//     // return Text("abcd55555555");
//     if (libilityresponse == null) {
//       // print('2+++++++++++++++++');
//
//       //return ListTile(
//       return Text(
//         'error',
//         style: TextStyle(color: Colors.black),
//       );
//       //  );
//     } else {
//       // return Text("222222222222");
//       return FutureBuilder<LiabilityResponse>(
//           future: libilityresponse,
//           builder: (context, snapshot) {
//             //   print('snnnnnnnnapshot');
//             //  print(snapshot.data!.liabilities.toString());
//             // return Text("233222222222");
//             return creditBuildLiabilityListView(snapshot.data!);
//           });
//     }
//     ;
//   }
//
//   creditBuildLiabilityListView(LiabilityResponse ldata) {
//     return //Text("4444444444444");
//       Column(
//         children: [
//           if (viewVisible) ...[
//             Container(
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   for (var i in stdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 15, left: 15, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             color: const Color(0xffF5F5F5),
//
//                             // color: const Color(0xffEFF4F8),
//                           ),
//                           child: ListView(
//                             children: <Widget>[
//                               // Text(
//                               //   "STUDENT LOAN",
//                               //   textAlign: TextAlign.center,
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 13,
//                               //       fontWeight: FontWeight.w700),
//                               // ),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.lastPaymentDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LOAN TYPE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.loanName.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("EXPECT PAY",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.expectedPayoffDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("ORIGATION DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.originationDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("OUTSTANDING INTEREST",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       i.outstandingInterestAmount.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("INTEREST RATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.interestRatePercentage.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("GUARANTER",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.guarantor.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT REFERENCE NUMBER ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.paymentReferenceNumber.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD INTEREST PAID",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdInterestPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD PRINCIPAL PAID ",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdPrincipalPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("SEQUENCE NUMBER",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(i.sequenceNumber.toString(),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("TOTAL AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                             ],
//                           ),
//                           //),
//                         ),
//                       ],
//                       //),
//
//                       // ],
//                     ),
//                   //  Text("Last payment Amount"+ i.lastPaymentAmount.toString()),
//                 ],
//               ),
//             )
//           ] else if (viewVisible2) ...[
//             Container(
//               width: double.infinity,
//               child: Column(
//                 children: <Widget>[
//                   for (var i in mrtlist)
//                   // ListView(
//                     Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 20, left: 20, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             //  color: const Color(0xffEFF4F8),
//                             color: const Color(0xffF5F5F5),
//                           ),
//                           child: ListView(children: [
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.lastPaymentDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar +
//                                       i.lastPaymentAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TYPE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTypeDescription.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TERM ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTerm.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ORIGATION DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.originationDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD PRINICIPAL PAID ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdPrincipalPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "CURRENT LATE FEE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.currentLateFee!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "NEXT MONTH PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD INTEREST PAID",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdInterestPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "MATURITY DATE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.maturityDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ESCROW BALANCE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.escrowBalance.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "DUE AMOUNT ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.pastDueAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "PAST DUE DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "TOTAL AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               // Container(
//                               //   margin: const EdgeInsets.only(
//                               //       top: 10),
//                               //   child: Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //       dollar + f.format(
//                               //           i.originationPrincipalAmount),
//                               //       style: TextStyle(
//                               //           color: Colors.black,
//                               //           fontSize: 14,
//                               //           fontWeight: FontWeight.w500),),
//                               //
//                               //   ),
//                               // ),
//                             ]),
//                           ]),
//                         ),
//
//                         //888****
//                       ],
//                     ),
//                 ],
//               ),
//             )
//           ] else if (viewVisible3) ...[
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: <Widget>[
//                   for (var i in crdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       // use whichever suits your need
//                       children: <Widget>[
//                         Container(
//                             width: double.infinity,
//                             height: 100.0,
//                             margin: const EdgeInsets.only(right: 15, left: 15),
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(8.0),
//                                   bottomRight: Radius.circular(8.0),
//                                   topLeft: Radius.circular(8.0),
//                                   bottomLeft: Radius.circular(8.0)),
//                               // color: const Color(0xffEFF4F8),
//                               color: const Color(0xffF5F5F5),
//                             ),
//                             child: ListView(children: [
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST STATEMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                             ])),
//                       ],
//                     ),
//                 ],
//                 //),
//
//                 // ],
//               ),
//             ),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     selected:
//     true;
//   }
//
//   void setStudentLoanContainer(Student student, double sliderValue) {
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var startdate = DateTime.parse(student.disbursementDates!.first);
//     var enddate = DateTime.parse(student.expectedPayoffDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     //num i = yearpassed.();
//     // num yearpassed = (currentdate.year - startdate.year);
//     //int endyear = (enddate.year - currentdate.year)
//     // ;
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(student.disbursementDates!.first);
//     // print(student.expectedPayoffDate);
//     // print(_loanyearvalues.toString());
//   }
//
//   void setMortgage(Mortgage mortgage, double mtgsliderValue) {
//     // var currentdate =  new DateTime.now();//DateTime.parse(currentdate);
//     // var startdate = DateTime.parse(mortgage.maturityDate!);
//     // var enddate = DateTime.parse(mortgage.originationDate!);
//     // int myearpassed = (currentdate.year - startdate.year);
//     // int mendyear = enddate.year - startdate.year ;
//     // print(myearpassed.toString());
//     // print(mendyear.toString());
//     // print(_mloanyearvalues.toString());
//     // m_minrange =  double.parse(myearpassed.toString()); ;
//     // m_maxrange =double.parse(mendyear.toString());   ;
//     // double mtgint =  m_maxrange  ;
//     // print("###3333####33hvcudfyhvuyfuyvuy");
//     // if(mtgsliderValue != 0)
//     // {
//     //   mtgint = mtgsliderValue ;
//     // }
//     // if(_mloanyearvalues <m_minrange) {
//     //   _mloanyearvalues = m_maxrange;
//     // }
//     // mbalanceamount = Constants.mAmortization(mortgage.originationPrincipalAmount,
//     //     mortgage.interestRate!.percentage as double, mtgint , myearpassed.toInt() );
//     // m_saveamount = mloanmaxvalue - mbalanceamount;
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var enddate = DateTime.parse(mortgage.maturityDate!);
//     var startdate = DateTime.parse(mortgage.originationDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(mortgage.maturityDate);
//     // print(mortgage.originationDate);
//     // print(_mloanyearvalues.toString());
//   }
//
// //############
// }
//
// //>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
//
// //----3
// Future<RefreshTokenResponse> valueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call redfresh token  .');
//   }
// }
//
// //>>>>>>>>>>>>>>-------------------------tokenAPI's--------------------------------->>>>>>>>>>>>>>>
// Future<LinkTokenResponse> linktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["transactions", "auth"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // prfint(Uri.parse(Constants.URL + '/link/token/create'));
// //  print('>>>>>>>>>>>>>>>>>>>>>>>> Link Token <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   // print(response.body);
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> institutionResponse(String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   print(
//       '>>>>>>>>>>>>>>>>>>>>>>>> institutionResponse <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   //print(response2.body);
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> accessTokenResponse(String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   print(
//       '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
//
// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
//
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }
//
// DateTime formatTimeOfDay(int month, int year, int day) {
//   final now = new DateTime.now();
//   final dt = DateTime(now.year, now.month, now.day);
//   return dt;
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Future<LinkTokenResponse> creditlinktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["liabilities"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // print(Uri.parse(Constants.URL + '/link/token/create'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> creditinstitutionResponse(
//     String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> creditaccessTokenResponse2(
//     String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   // print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
// Future<LiabilityResponse> liabilityData(
//     String accesstoken, String accountid) async {
//   bool _isLoading = true;
//   LiabilityOptions liabilityOptions = LiabilityOptions();
//   liabilityOptions.accountIds = [accountid];
//   LiabilityRequest liabilityRequest = LiabilityRequest();
//   liabilityRequest.clientId = Constants.ClientId;
//   liabilityRequest.secret = Constants.Secret;
//   liabilityRequest.accessToken = accesstoken;
//   liabilityRequest.options = liabilityOptions;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final response4 =
//   await http.post(Uri.parse(Constants.URL + '/liabilities/get'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(liabilityRequest));
//
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(response4.body)}');
//   //  print('credit bpdyyyyy');
//   //  print(response4.body);
//   //  print(response4.statusCode);
//   //  print(jsonEncode(liabilityRequest));
//   // print('credit bpdyyyyy');
//
//   // print(
//   //     '#################################credit##################################################');
//
//   if (response4.statusCode == 200) {
//     bool _isLoading = false;
//
//     return LiabilityResponse.fromJson(jsonDecode(response4.body));
//   } else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //------
// Future<RefreshTokenResponse> refreshValueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
// class MyLabelCommonOptions extends LabelCommonOptions {
//   const MyLabelCommonOptions(
//       ) : super ();
//
//   /// Override [labelTextStyle] with a new font, color, etc.
//   @override
//   // get labelTextStyle => GoogleFonts.comforter(
//   //  style: TextStyle(
//   //   color: Color,
//   //   fontSize: 14.0,
//   //   fontWeight: FontWeight.w400, // Regular
//   //   ),
//   // );
//
//   get labelTextStyle =>
//       const ChartOptions().labelCommonOptions.labelTextStyle.copyWith(
//           color: Colors.white
//       );
//
// }
///dfkjvhuifdhvuihyvuhhvy///dfkjvhuifdhvuihyvuhhvy// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:math' as math;
// import 'dart:ui';
// import 'dart:ui';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_charts/flutter_charts.dart';
// import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
// import 'package:plaid_flutter/plaid_flutter.dart';
//
// import 'package:swipeapp/Controller/Request/SaveBankDataRequest.dart';
// import 'package:swipeapp/Controller/Request/RefreshTokenRequest.dart';
// import 'package:swipeapp/Controller/Response/GetBankDataResponse.dart';
// import 'package:swipeapp/Controller/Response/RefreshTokenResponse.dart';
// import 'package:swipeapp/Controller/Response/SaveBankDataResponse.dart';
//
// import '../Model Helper.dart';
//
// import 'Account/AddAccount1.dart';
// import 'PlaidData/BankData.dart';
// import 'PlaidData/TransactionDetail.dart';
// import 'Plan/PlanAccount1.dart';
// import 'Request/AccessTokenRequest.dart';
// import 'Request/InstitutionRequest.dart';
// import 'Request/LiabilityRequest.dart';
// import 'Request/TokenResquest.dart';
// import 'Request/TransactionRequest.dart';
// import 'Response/AccessTokenResponse.dart';
// import 'Response/InstitutionResponse.dart';
// import 'Response/LiabilityResponse.dart';
// import 'Response/LinkTokenResponse.dart';
// import 'Response/TransactionResponse.dart';
// import 'package:flutter/services.dart';
// import 'dart:math' as math;
// import 'Response/UserDeatail.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       // title: 'Kindacode.com',
//       home: Dashboard2(),
//     );
//   }
// }
//
// class Dashboard2 extends StatefulWidget {
//   const Dashboard2({Key? key}) : super(key: key);
//
//   // final Function callback;
//   //const Dashboard(this.callback);
//   @override
//   tdashboardState createState() => tdashboardState();
// }
//
// class tdashboardState extends State<Dashboard2> {
//   BankData bankDataobj = BankData();
//
//   //creditBankData creditbankDataobj = creditBankData();
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//   late Future<List<BankData>> bankdatalist = [] as Future<List<BankData>>;
//   late Future<List<BankData>> creditbankdatalist = [] as Future<List<BankData>>;
//   List<Transactions> transactionlist = [];
//
//   List<double> debitGraphdata = [];
//   List<double> creditGraphdata = [];
//   List<String> graphbankname = [];
//
//   Future<TransactionResponse>? transactionResponseList;
//   late LegacyLinkConfiguration _publicKeyConfiguration;
//   late LinkTokenConfiguration _linkTokenConfiguration;
//   late Future<TokenRequest> tokenRequest;
//   String ExpenseKey = "expensedata";
//   String accesstoken = "";
//   String accountid = "";
//   int cmonth = 0;
//   late String _imgString = '';
//   late String imagebase64 = '';
//   bool _isShown = true;
//   String bname = "";
//   String acname = "";
//   int selectedIndex = -1;
//   late double tDebitValue = 0;
//   late double tCreditValue = 0;
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//
//   String dollar = " \$";
//   bool isFavourite = false;
//   bool isFavourite1 = true;
//   bool isFavourite2 = true;
//   bool isFavourite3 = true;
//   bool isLoading = false;
//   bool isLoading1 = true;
//   bool isexpanse = true;
//   bool viewVisibleTransaction = true;
//   bool viewVisible1 = true;
//
//   void hideWidget1() {
//     setState(() {
//       viewVisible1 = !viewVisible1;
//       viewVisible1 = false;
//     });
//   }
//
//   void showWidget() {
//     setState(() {
//       viewVisible = true;
//     });
//   }
//
// //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   late LinkTokenConfiguration creditlinkTokenConfiguration;
//   Liabilities liabilitylist = new Liabilities();
//   List<Student> stdlist = [];
//   List<Credit> crdlist = [];
//   List<Mortgage> mrtlist = [];
//   bool viewVisible = false;
//   bool viewVisible2 = false;
//   bool viewVisible3 = false;
//
//   void hideWidget() {
//     setState(() {
//       viewVisible = false;
//       viewVisible2 = false;
//       viewVisible3 = false;
//     });
//   }
//   bool _expanded = false;
//   late ScrollController _scrollController;
//
//   //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//   late ChartData chartData;
//   ChartOptions chartOptions = const ChartOptions(
//     labelCommonOptions: MyLabelCommonOptions(),
//
//   );
//
//   late var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy);
//
//   void initState() {
//     // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
//     //super.initState();
//     chartData = ChartData(
//       dataRows:  [
//         debitGraphdata,
//         creditGraphdata,
//       ],
//       xUserLabels: graphbankname,
//
//       // dataRows: const [
//       //   [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//       //   [0, 0, 0, 0, 0, -1800.0],
//       // ],
//       //   xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const ['Values', 'Values 2'],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//
//       chartOptions: chartOptions,
//
//     );
//     verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//     _publicKeyConfiguration = LegacyLinkConfiguration(
//       clientName: Constants.ClientId,
//       publicKey: "PUBLIC_KEY",
//       environment: LinkEnvironment.sandbox,
//       products: <LinkProduct>[
//         LinkProduct.auth,
//         LinkProduct.transactions,
//       ],
//       language: "en",
//       countryCodes: ['US'],
//       userLegalName: "John Appleseed",
//       userEmailAddress: "jappleseed@youapp.com",
//       userPhoneNumber: "+1 (512) 555-1234",
//     );
//     PlaidLink.onSuccess(_onSuccessCallback);
//     PlaidLink.onEvent(_onEventCallback);
//     PlaidLink.onExit(_onExitCallback);
//     bankdatalist = fetchBankData(Constants.debitcardValue);
//     var linktoken = linktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//     creditbankdatalist = fetchBankData(Constants
//         .creditcardValue); // as Future<List<creditBankData>>;// as List<BankData>;
//     var creditlinktoken = creditlinktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//     _scrollController = ScrollController();
//
//
//     // var verticalBarChart = VerticalBarChart(
//     //   painter: VerticalBarChartPainter(
//     //     verticalBarChartContainer: verticalBarChartContainer,
//     //   ),
//     // );
//   }
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>start>>>>>>>>>>>>>>>>>>>>>>>>
//   String libKey = "data";
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
//     // print("onSuccess222: $publicToken, metadata: ${metadata.description()}");
//     bankDataobj.publictoken = publicToken;
//     bankDataobj.accesstoken = accesstoken;
//     savingBankData(metadata);
//   }
//
//   void _onEventCallback(String event, LinkEventMetadata metadata) {
//     // print("onEvent123: $event, metadata: ${metadata.description()}");
//   }
//
//   void _onExitCallback(LinkError? error, LinkExitMetadata metadata) {
//     // print("onExit metadata: ${metadata.description()}");
//
//     if (error != null) {
//       // print("onExit error: ${error.description()}");
//     }
//   }
//
//   void savingBankData(LinkSuccessMetadata metadata) async {
//     for (int i = 0; i < metadata.accounts.length; i++) {
//       bankDataobj.accountid = metadata.accounts[i].id;
//       bankDataobj.accountname = metadata.accounts[i].name;
//       bankDataobj.mask = metadata.accounts[i].mask;
//     }
//     if (metadata.institution.id != "") {
//       var insres = await institutionResponse(metadata.institution.id);
//       bankDataobj.banklogo = insres.institution?.logo;
//       print("logooooooooo");
//       print(bankDataobj.banklogo);
//       print("logooooooooo");
//       bankDataobj.bankthemecolor = insres.institution?.primaryColor;
//       bankDataobj.bankname = insres.institution?.name;
//       var accesstokenres =
//       await accessTokenResponse(bankDataobj.publictoken.toString());
//       bankDataobj.accesstoken = accesstokenres.accessToken;
//
//       //  if (isexpanse) {
//       // saveBankdataResponse();
//       // List<BankData> templstbankdata = await bankdatalist;
//       //templstbankdata.add(bankDataobj);
//       //await Constants.save(ExpenseKey, jsonEncode(templstbankdata));
//       //  } else {
//       // List<BankData> templstbankdata = await creditbankdatalist;
//       // templstbankdata.add(bankDataobj);
//       // await Constants.save(libKey, jsonEncode(templstbankdata));
//       // }
//
//       //   setState(() {
//       saveBankdataResponse();
//       //  });
//
//       // print('---calling end accessTokenResponse---');
//     }
//   }
//
//   //--
//   Future<List<BankData>> appendElements(
//       Future<List<BankData>> listFuture, List<BankData> elementsToAdd) async {
//     // final list = await listFuture;
//     // int count = list.length;
//     // for(int i = count; i>0; i-- )
//     //   {
//     //     list.remove(list[i]);
//     //   }
//     // List<BankData>
//     // list.addAll(elementsToAdd);
//     return elementsToAdd;
//   }
//
//   //--
//
//   Future<List<BankData>> getBankData(List<BankData> bankresultList) async {
//     print("frfgr<<<<<<>>>>>>");
//
//     try {
//       // var bankdatalist1 =  [] as Future<List<BankData>>;
//       // setState(() {
//       bankdatalist = appendElements(bankdatalist, bankresultList);
//       //});
//       print("<<<<<<>>>>>>");
//
//       bankdatalist = debitTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load debitbankdata');
//     }
//     return bankdatalist;
//   }
//
//   Future<List<BankData>> getCreditBankData(
//       List<BankData> bankresultList) async {
//     try {
//       //creditbankdatalist =  [] as Future<List<BankData>>;
// //
//       // setState(() {
//       creditbankdatalist = appendElements(creditbankdatalist, bankresultList);
//       // });
//
//       creditTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load creditbankdata');
//     }
//     return creditbankdatalist;
//   }
//
//   Future<List<BankData>> fetchBankData(int type) async {
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String banktoken = tempuserdetail.accessToken.toString();
//     final response = await http.get(
//         Uri.parse(
//             Constants.baseUrl2 + '/Bank/GetBankData?type=' + type.toString()),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $banktoken',
//         });
//     print(response.body);
//
//     List<BankData> tempbankdatalist = <BankData>[];
//     if (response.statusCode == 200) {
//       GetBankDataResponse bankdataResponse =
//       GetBankDataResponse.fromJson(jsonDecode(response.body));
//       for (var i in bankdataResponse.result!) {
//         BankData bd = new BankData();
//         bd.publictoken = i.publictoken;
//         bd.bankthemecolor = i.bankthemecolor;
//         bd.banklogo = i.banklogo;
//         bd.mask = i.mask;
//         bd.accountname = i.accountname;
//         bd.accesstoken = i.accesstoken;
//         bd.bankname = i.bankname;
//         bd.accountid = i.accountid;
//         tempbankdatalist.add(bd);
//       }
//
//       print(jsonEncode(tempbankdatalist));
//       print("reposne>>>>>>>");
//       // getBankData(tempbankdatalist);
//       // return tempbankdatalist ;
//       if (type == Constants.debitcardValue) {
//         tempbankdatalist = getBankData(tempbankdatalist) as List<BankData>;
//         return tempbankdatalist;
//       } else {
//         getCreditBankData(tempbankdatalist);
//         return tempbankdatalist;
//       }
//
//       // return GetBankDataResponse.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to call user childuserid .');
//     }
//   }
//
//   Future<SaveBankDataResponse> saveBankdataResponse() async {
//     SaveBankDataRequest saveBankDataRequest = SaveBankDataRequest();
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String accounttoken = tempuserdetail.accessToken.toString();
//     saveBankDataRequest.id = 0;
//     saveBankDataRequest.accountid = bankDataobj.accountid;
//     saveBankDataRequest.accesstoken = bankDataobj.accesstoken;
//     saveBankDataRequest.accountname = bankDataobj.accountname;
//     saveBankDataRequest.mask = bankDataobj.mask;
//     saveBankDataRequest.bankname = bankDataobj.bankname;
//     saveBankDataRequest.banklogo = bankDataobj.banklogo;
//     print("banklogooooooooo>>>>>>>>");
//     print(bankDataobj.banklogo?.length.toString());
//     print(bankDataobj.banklogo);
//     print("banklogooooooooo>>>>>>>>");
//     saveBankDataRequest.bankthemecolor = bankDataobj.bankthemecolor;
//     saveBankDataRequest.publictoken = bankDataobj.publictoken;
//
//     if (isexpanse) {
//       saveBankDataRequest.type = Constants.debitcardValue;
//     } else {
//       saveBankDataRequest.type = Constants.creditcardValue;
//     }
//     //print('/////////request <<<<<<<<<<<<<<<<<<<<<<<<<');
//     //print(jsonEncode(saveBankDataRequest));
//     //print('/////////.request <<<<<<<<<<<<<<<<<<<<<<<<<');
//
//     final savebankresponse =
//     await http.post(Uri.parse(Constants.baseUrl2 + '/Bank/SaveBankData'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $accounttoken',
//         },
//         body: jsonEncode(saveBankDataRequest));
//     // print('/////////.svaebankdata <<<<<<<<<<<<<<<<<<<<<<<<<');
//     // print(accounttoken);
//     // print(saveBankDataRequest);
//     // print(savebankresponse);
//     // print(savebankresponse.body);
//     // print(savebankresponse.statusCode);
//     // print('/////////<<<<svaebankdata<<<<<<<<<<<<<<<<<<<<<');
//
//     if (savebankresponse.statusCode == 200) {
//       fetchBankData(saveBankDataRequest.type!);
//
//       return SaveBankDataResponse.fromJson(jsonDecode(savebankresponse.body));
//     } else {
//       throw Exception('Failed to call plaid save bank data.');
//     }
//   }
//
//   late final Function callback;
//
//   final List<String> iconname = [
//     'asset/images/cart.png',
//     'asset/images/at.png',
//     'asset/images/travel.png',
//     'asset/images/movie.png',
//
//     //   'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//   ];
//   List<String> TransactionIconCategory =[
//     "Bank Fees",
//     "Cash Advance",
//     "Community"
//   ];
//
//
//
//
//
//   // const Dashboard(this.callback);
//
//   Future<TransactionResponse> transactionResponse(
//       String accesstoken, String accountid, int currentmonth) async {
//     String startdate = "";
//     String enddate = "";
//     var now = new DateTime.now().toString();
//     var date = DateTime.parse(now);
//     DateTime firstDayOfMonth = new DateTime(date.year, date.month, 1);
//     // var dateObj = new Date;
//     // var lmonth = dateObj.getUTCMonth() + 1; //months from 1-12
//     // var lday = dateObj.getUTCDate();
//     // var lyear = dateObj.getUTCFullYear();
//     // var lastendDayOfMonth = lyear + "/" + lmonth + "/" + lday;
//     // DateTime lastendDayOfMonth = DateTime(date.year, date.month+1 , 0);
//     DateTime lastendDayOfMonth = (date.month < 12)
//         ? new DateTime(date.year, date.month + 1, 0)
//         : new DateTime(date.year + 1, 1, 0);
//     var fyear = firstDayOfMonth.year;
//     var fmonth = firstDayOfMonth.month.toString().padLeft(2, '0');
//     var fday = firstDayOfMonth.day.toString().padLeft(2, '0');
//     var firstday = "${fyear}-${fmonth}-${fday}";
//     var lyear = lastendDayOfMonth.year;
//     var lmonth = lastendDayOfMonth.month.toString().padLeft(2, '0');
//     var lday = lastendDayOfMonth.day.toString().padLeft(2, '0');
//     var lastday = "${lyear}-${lmonth}-${lday}";
//     startdate = firstday;
//     enddate = lastday;
//
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     // print(startdate);
//     // print(enddate);
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     Transactionoptions transactionoptions = Transactionoptions();
//     transactionoptions.count = 20;
//     transactionoptions.offset = 0;
//     transactionoptions.accountIds = [accountid];
//     TransactionRequest transactionRequest = TransactionRequest();
//     transactionRequest.clientId = Constants.ClientId;
//     transactionRequest.secret = Constants.Secret;
//     transactionRequest.accessToken = accesstoken;
//     transactionRequest.options = transactionoptions;
//     transactionRequest.startDate = startdate;
//     transactionRequest.endDate = enddate;
//     isLoading1 = false;
//     print(
//         'dasgboardRequest body4--REQUESTTTTTTTTTTTTTTTTTTTT: ${jsonEncode(transactionRequest)}');
//     final response4 =
//     await http.post(Uri.parse(Constants.URL + '/transactions/get'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(transactionRequest));
//     print(
//         '!!!!!!!!!!!!###########################################################################################################');
//     print('dshrespose44 body-----: ${response4}');
//     print(response4.statusCode);
//     print(response4);
//     // print(accesstoken);
//     print('dash##########################################'
//         '###################################################'
//         '##############');
//     if (response4.statusCode == 200) {
//       void dispose() {
//         Loader.hide();
//         isLoading1 = false;
//         // super.dispose();
//       }
//
//       return TransactionResponse.fromJson(jsonDecode(response4.body));
//     } else {
//       //void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//       //}
//
//       throw Exception('Failed to call transaction .');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     var _val;
//     var chidern;
//     return Scaffold(
//
//
//
//       //  resizeToAvoidBottomInset: false,
//
//       body: SafeArea(
//
//           child:
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 dashboardHeader(),
//                 Column(
//                   children:<Widget>[
//                     debitTransaction(),
//                     creditLiability(),
//                     paymentButton(),
//                     viewtransaction(),
//                     Visibility(
//                       maintainSize: true,
//                       maintainAnimation: true,
//                       maintainState: true,
//                       visible: viewVisible1,
//                       child: Container(
//                         width: double.infinity,
//                         //height: 200.0,
//                         // color: Colors.yellow,
//                         child: Column(
//                           //child: Column(
//                           children: [
//                             isLoading1 ?
//                             Center(child: CircularProgressIndicator()) :
//                             ListView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemCount: transactionlist.length,
//                                 itemBuilder: (context, int index) {
//                                   var $;
//                                   return Card(
//                                     color: const Color(0xffF7F6FA),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 80.0,
//                                       margin:
//                                       const EdgeInsets.only(right: 9, left: 9),
//                                       child: ListTile(
//                                           contentPadding: EdgeInsets.only(
//                                               left: 10.0, right: 0.0),
//                                           leading: CircleAvatar(
//                                             radius: 20,
//                                             child:
//                                             Image(image: AssetImage("asset/images/cart.png"),
//                                               //Image.asset( iconname[index],),
//                                             ),
//                                           ),
//                                           title: Text(
//                                             transactionlist[index].name.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           subtitle: Text(
//                                             transactionlist[index]
//                                                 .category
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing: Padding(
//                                             padding: EdgeInsets.only(top: 5),
//                                             child: Column(children: <Widget>[
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                     top: 3, bottom: 3),
//                                                 child: Text(
//                                                   dollar +
//                                                       transactionlist[index]
//                                                           .amount
//                                                           .toStringAsFixed(2),
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w600),
//                                                 ),
//                                               ),
//                                               Text(
//                                                 transactionlist[index]
//                                                     .date
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w500),
//                                               ),
//                                             ]),
//                                           )),
//                                     ),
//                                   );
//                                 }
//                               // );
//                               // }
//                               //},
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 )
//
//
//
//
//
//
//               ],
//             ),
//           )
//       ),
//
//
//
//
//     );
//   }
//
// //<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   Widget chartToRun() {
//     LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//     ChartData chartData;
//     ChartOptions chartOptions = const ChartOptions();
//     // Example shows a mix of positive and negative data values.
//     chartData = ChartData(
//       dataRows: const [
//         [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//         [0,0,0,0,0, -1800.0],
//       ],
//       xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const [
//         'Values',
//         'Values 2'
//       ],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//       chartOptions: chartOptions,
//     );
//     var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//
//     var verticalBarChart = VerticalBarChart(
//       painter: VerticalBarChartPainter(
//         verticalBarChartContainer: verticalBarChartContainer,
//       ),
//     );
//     return verticalBarChart;
//   }
//   dashboardHeader() {
//     return   Flexible(
//         child: Container(
//           //height: 120,
//             width: double.infinity,
//             padding: EdgeInsets.all(5),
//             //color: const Color(0xDEB46FEA),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("asset/images/background.png"),
//                   fit: BoxFit.cover,
//                 )),
//             //child: Align(alignment: Alignment.center,
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Row(mainAxisSize: MainAxisSize.min, children: [
//                     Container(
//                         margin: EdgeInsets.all(8),
//                         alignment: Alignment.topLeft,
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           //color: const Color(0x75f5f5f5)
//                         ),
//                         child:
//                         // Row(
//                         //   mainAxisSize: MainAxisSize.min,
//                         //   children: [
//                         Text(
//                           'Test Account',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 15,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold //font color
//                           ),
//                         )
//                       //   ],
//                       // )
//
//                     ),
//                   ]),
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tDebitValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 18,
//                                 //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                                 color: Colors.white,
//                                 //font color
//                                 fontStyle: FontStyle.italic),
//                           ),
//                           Text(
//                             'Debit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//
//
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tCreditValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 18,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               //font color
//                               fontStyle: FontStyle.italic,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             'Credit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//                     ]),
//                 Container(
//                   //width: 80,
//                   child:
//                   ExpandableNotifier(  // <-- Provides ExpandableController to its children
//                     child: Column(
//                       children: [
//                         Expandable(           // <-- Driven by ExpandableController from ExpandableNotifier
//                           collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
//                             child: //Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,),
//                             Image.asset(
//                               "asset/images/down.png", // width: 300,
//                               height: 20,
//                               width: 20,
//                               alignment: Alignment.center,
//                             ),
//
//                           ),
//                           expanded: Column(
//                               children: [
//                                 //Text("Backjdsgcygdsucudshiodhycoe"),
//                                 SizedBox(
//                                     width: 400,
//                                     height: 350,
//                                     child: FittedBox(child: Column(
//                                       children: [
//                                         //  addAccountHeader(),
//                                         Container(
//                                           // color: Colors.yellow,
//                                           height: 300,
//                                           width: 350,
//                                           child:
//                                           //Column(
//                                           // children: [
//                                           //  addAccountHeader(),
//                                           VerticalBarChart(
//                                             painter: VerticalBarChartPainter(
//                                               verticalBarChartContainer: verticalBarChartContainer,
//                                             ),
//                                           ),
//
//                                         )
//                                       ],
//                                     ))
//                                 ),
//                                 ExpandableButton(
//                                   child:  Image.asset(
//                                     "asset/images/up.png", // width: 300,
//                                     height: 20,
//                                     width: 20,
//                                     alignment: Alignment.center,
//                                   ),
//                                 ),
//                               ]
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],
//             )
//
//           //  ),
//         ));
//   }
//
//   debitTransaction() {
//     return Scrollbar(
//       child:Column(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Row(mainAxisSize: MainAxisSize.min, children: [
//               Container(
//                   margin: EdgeInsets.all(8),
//                   alignment: Alignment.topLeft,
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: const Color(0xffECDCFF)),
//                   child:
//                   // Row(
//                   //   mainAxisSize: MainAxisSize.min,
//                   //   children: [
//                   Text(
//                     'Debit:' + dollar + tDebitValue.toStringAsFixed(2),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 14,
//                         //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                         color: Colors.black,
//                         //font color
//                         fontStyle: FontStyle.italic),
//                   )
//                 //   ],
//                 // )
//
//               ),
//             ]),
//             // ),
//           ),
//           Container(
//             // height: 250.0,
//             // color: Colors.yellow,
//               child: Column(
//                 children: [
//                   Container(
//                       height: 35,
//                       width: double.infinity,
//                       margin:
//                       EdgeInsets.only(top: 5, left: 15, bottom: 10, right: 15),
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           color: const Color(0xffEDECEE)),
//                       child: Row(
//                         children: [
//                           TextButton(
//                             style: TextButton.styleFrom(
//                               padding: const EdgeInsets.all(5),
//                             ),
//                             onPressed: () async {
//                               isexpanse = true;
//                               Loader.show(context,
//                                   isSafeAreaOverlay: false,
//                                   progressIndicator: CircularProgressIndicator(),
//                                   isBottomBarOverlay: false,
//                                   overlayFromBottom: 80,
//                                   themeData: Theme.of(context)
//                                       .copyWith(accentColor: Colors.black),
//                                   overlayColor: Color(0x0000ffff));
//                               Future.delayed(Duration(seconds: 4), () {
//                                 Loader.hide();
//                               });
//                               var linktoken = await linktokenResponse();
//                               _linkTokenConfiguration = LinkTokenConfiguration(
//                                 token: linktoken.linkToken.toString(),
//                               );
//
//                               PlaidLink.open(configuration: _linkTokenConfiguration);
//                             },
//                             child: Image(
//                               image: AssetImage("asset/images/Plus.png"),
//                               width: 100,
//                               height: 100,
//                             ),
//                           ),
//                           Text('Connect To Debit Account'),
//                         ],
//                       )),
//                   //-----------------------------------debir////-----------
//                   Container(
//                     width: double.infinity,
//                     // height: 150.0,
//                     margin: const EdgeInsets.only(bottom: 4, top: 4),
//                     color: Colors.white,
//                     child: ListView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       children: [
//                         FutureBuilder<List<BankData>>(
//                           future: bankdatalist,
//                           builder: (context, snapshot) {
//                             if(snapshot.hasData)
//                             {
//                               return
//                                 ExpansionPanelList(
//                                   animationDuration: Duration(milliseconds: 2000),
//                                   children:
//                                   snapshot.data!.map<ExpansionPanel>((BankData item) {
//                                     return ExpansionPanel(
//                                       headerBuilder:
//                                           (BuildContext context, bool isExpanded) {
//                                         return ListTile(
//                                           iconColor: Colors.red,
//                                           leading: CircleAvatar(
//                                             radius: 30,
//                                             child:
//                                             // Image.memory(Base64Codec().decode(item.banklogo.toString()),),
//                                             Image.network(item.banklogo.toString()),
//                                           ),
//                                           title: Text(
//                                             item.bankname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing:
//                                           item.totalamount ==null?
//                                           Text(dollar+'0',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ):
//                                           Text('${item.totalamount.toString()}',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ),
//                                           // Text(
//                                           //   dollar + item.totalamount.toString(), "0",
//                                           //
//                                           //   style: TextStyle(
//                                           //       color: Colors.black,
//                                           //       fontSize: 16,
//                                           //       fontWeight: FontWeight.w500),
//                                           //),
//                                           subtitle: Text(
//                                             item.accountname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                           selected: false,
//                                         );
//                                       },
//                                       body:
//                                       // Text("gcdsgchgdsv"),
//                                       debitBuildExpandableContent(
//                                           item.accesstoken.toString(),
//                                           item.accountid.toString(),
//                                           cmonth),
//                                       isExpanded: item.isExpaneded,
//                                     );
//                                   }).toList(),
//                                   dividerColor: Colors.grey,
//                                   expansionCallback: (int index, bool isExpanded) {
//                                     setState(() {
//                                       snapshot.data![index].isExpaneded = !isExpanded;
//                                     });
//                                   },
//                                 );
//                             }
//                             else
//                             {
//                               return Center(
//                                   child: CircularProgressIndicator());
//                             }
//
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
// //chnage heiught to 200
//                   //--------------------------
//                 ],
//               )),
//
//         ],
//       ),
//     );
//   }
//
//   creditLiability() {
//     return Column(children: [
//       Align(
//         alignment: Alignment.topLeft,
//         child: Row(mainAxisSize: MainAxisSize.min, children: [
//           Container(
//               margin: EdgeInsets.all(8),
//               alignment: Alignment.topLeft,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: const Color(0xffECDCFF)),
//               child:
//               // Row(
//               //   mainAxisSize: MainAxisSize.min,
//               //   children: [
//               Text(
//                 'Credit: ' + dollar + tCreditValue.toStringAsFixed(2),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 14,
//                     //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                     color: Colors.black,
//                     //font color
//                     fontStyle: FontStyle.italic),
//               )
//             //   ],
//             // )
//
//           ),
//         ]),
//       ),
//       Container(
//           height: 35,
//           width: double.infinity,
//           margin: EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 15),
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: const Color(0xffEDECEE)),
//           child: Row(
//             children: [
//               TextButton(
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.all(5),
//                 ),
//                 onPressed: () async {
//                   isexpanse = false;
//                   Loader.show(context,
//                       isSafeAreaOverlay: false,
//                       progressIndicator: CircularProgressIndicator(),
//                       isBottomBarOverlay: false,
//                       overlayFromBottom: 80,
//                       themeData:
//                       Theme.of(context).copyWith(accentColor: Colors.black),
//                       overlayColor: Color(0x0000ffff));
//                   Future.delayed(Duration(seconds: 4), () {
//                     Loader.hide();
//                   });
//                   var creditlinktoken = await creditlinktokenResponse();
//                   creditlinkTokenConfiguration = LinkTokenConfiguration(
//                     token: creditlinktoken.linkToken.toString(),
//                   );
//
//                   PlaidLink.open(configuration: creditlinkTokenConfiguration);
//                 },
//                 child: Image(
//                   image: AssetImage("asset/images/Plus.png"),
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//               Text('Connect To Credit Account'),
//               //Text('Connect To Credit Account2'),
//             ],
//           )),
//       Container(
//         width: double.infinity,
//         // height: 150.0,
//         margin: const EdgeInsets.only(bottom: 0, top: 0),
//         color: Colors.white,
//         child: ListView(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//
//           children: [
//             FutureBuilder<List<BankData>>(
//               future: creditbankdatalist,
//               builder: (context, snapshot) {
//                 if(snapshot.hasData)
//                 {
//                   return
//                     ExpansionPanelList(
//                       animationDuration: Duration(milliseconds: 2000),
//                       children: snapshot.data!.map<ExpansionPanel>((BankData item) {
//                         return ExpansionPanel(
//                           headerBuilder: (BuildContext context, bool isExpanded) {
//                             return ListTile(
//                               iconColor: Colors.red,
//                               leading: CircleAvatar(
//                                   radius: 30,
//                                   child:
//                                   //Image.memory(Base64Codec().decode(item.banklogo.toString())),
//
//                                   Image.network(item.banklogo.toString())),
//                               title: Text(
//                                 item.bankname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               trailing:
//                               // Text(
//                               //   dollar + item.totalamount.toString(),
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 16,
//                               //       fontWeight: FontWeight.w500),
//                               // ),
//                               item.totalamount ==null?
//                               Text(dollar+'0',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ):
//                               Text('${item.totalamount!.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 item.accountname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               selected: false,
//                             );
//                           },
//                           body: //Text('hgsdvfghjbvsdjhcgsdh'),
//                           creditBuildExpandableContent(
//                             item.accesstoken.toString(),
//                             item.accountid.toString(),
//                           ),
//                           isExpanded: item.isExpaneded,
//                         );
//                       }).toList(),
//                       dividerColor: Colors.grey,
//                       expansionCallback: (int index, bool isExpanded) async {
//                         setState(() {
//                           snapshot.data![index].isExpaneded = !isExpanded;
//                         });
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // print(index);
//                         // print(isExpanded);
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // TransactionResponse tempresponse2 =
//                         //     await transactionResponse(
//                         //         snapshot.data![index].accesstoken.toString(),
//                         //         snapshot.data![index].accountid.toString(),
//                         //         cmonth);
//                         //
//                         // transactionlist =
//                         //     tempresponse2.transactions as List<Transactions>;
//                         // viewVisible = true;
//                         viewVisibleTransaction = true;
//                         showWidget();
//                         LiabilityResponse tempresponse = await liabilityData(
//                             snapshot.data![index].accesstoken.toString(),
//                             snapshot.data![index].accountid.toString());
//                         liabilitylist = tempresponse.liabilities as Liabilities;
//                         viewVisible = false;
//                         viewVisible2 = false;
//                         viewVisible3 = false;
//                         if (liabilitylist.student != null) {
//                           stdlist = liabilitylist.student!;
//                           viewVisible = true;
//                           //  print("student");
//                           setStudentLoanContainer(liabilitylist.student!.first, 0);
//                         }
//                         if (liabilitylist.mortgage != null) {
//                           mrtlist = liabilitylist.mortgage!;
//                           viewVisible2 = true;
//                           //  print("mortgage");
//                           setMortgage(liabilitylist.mortgage!.first, 0);
//                         }
//                         if (liabilitylist.credit != null) {
//                           crdlist = liabilitylist.credit!;
//                           viewVisible3 = true;
//                           //  print("credit");
//                         }
//                       },
//                     );
//                 }
//                 else
//                 {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//               },
//             ),
//           ],
//         ),
//       ),
//     ]);
//   }
//
//   paymentButton() {
//     return Container(
//       height: 38,
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 15, bottom: 20.0, left: 25, right: 25),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//             //color: const Color(0xFFA781D3),
//           )),
//       child: TextButton(
//         style: TextButton.styleFrom(
//           backgroundColor: const Color(0xFFA781D3),
//           padding: const EdgeInsets.all(5),
//         ),
//         onPressed: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => AddAccount()),
//           // );
//         },
//         child: Text(
//           'Make a Payment',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
//
//   bottomNavBar() {
//     return Container(
//       height: 45,
//       padding: const EdgeInsets.all(
//         8,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(2),
//         color: const Color(0xF5F7F6FA),
//       ),
//       //alignment: Alignment.bottomCenter,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           IconButton(
//             // icon: Image.asset('assets/images/dashboard.png'),
//             icon: ImageIcon(
//               AssetImage("asset/images/home2.png"),
//               size: 140,
//               color: isFavourite ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//
//             onPressed: () {
//               setState(() {
//                 isFavourite = false;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pbox.png"),
//               size: 140,
//               color: isFavourite1 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   //MaterialPageRoute(builder: (context) => Spend(this.)),
//               // );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = false;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pmoney.png"),
//               size: 140,
//               color: isFavourite2 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PlanAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = false;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/paccount.png"),
//               size: 140,
//               color: isFavourite3 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = false;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   viewtransaction() {
//     return Container(
//       child: Row(children: [
//         Container(
//             margin: EdgeInsets.all(8),
//             alignment: Alignment.topLeft,
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: const Color(0xffECDCFF)),
//             child:
//             // Row(
//             //   mainAxisSize: MainAxisSize.min,
//             //   children: [
//             Text(
//               'Recent Transactions',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 14,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: Colors.black,
//                   //font color
//                   fontStyle: FontStyle.italic),
//             )
//           //   ],
//           // )
//
//         ),
//         Spacer(),
//         Container(
//           margin: EdgeInsets.all(8),
//           alignment: Alignment.topRight,
//           child: InkWell(
//             onTap: () async {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TransactionDetail(),
//                   // Pass the arguments as part of the RouteSettings. The
//                   // DetailScreen reads the arguments from these settings.
//                   settings: RouteSettings(
//                     arguments: transactionlist,
//                   ),
//                 ),
//               );
//               setState(() {
//                 //selectedIndex = i;
//               });
//             },
//             child: new Text(
//               "View All",
//               style: TextStyle(
//                   fontSize: 13,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: const Color(0xffA781D3),
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
//
// //   <<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
// //
// // ------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   debitTotalValue(List<BankData> debitlistbankdata) async {
//     double totalTransactionValue = 0;
//     for (var debitdata in debitlistbankdata) {
//       double debitcardtotalTransactionValue = 0;
//       var response = await transactionResponse(debitdata.accesstoken.toString(),
//           debitdata.accountid.toString(), cmonth);
//       for (var t_transaction in response.transactions!) {
//         transactionlist.add(t_transaction);
//         totalTransactionValue += t_transaction.amount;
//         debitcardtotalTransactionValue += t_transaction.amount;
//         print("||||||||||");
//
//         print(t_transaction.amount);
//       }
//       debitdata.totalamount = debitcardtotalTransactionValue;
//       debitGraphdata.add(debitcardtotalTransactionValue);
//       graphbankname.add(debitdata.bankname.toString());
//       creditGraphdata.add(0);
//       print("||||||||||¥¥¥¥¥¥¥¥¥¥¥¥total debitttttttt" +
//           totalTransactionValue.toString());
//       print(debitdata.totalamount);
//       print(debitcardtotalTransactionValue);
//     }
//     setState(() {
//       tDebitValue = totalTransactionValue;
//     });
//     print(jsonEncode(debitlistbankdata));
//     return debitlistbankdata;
//   }
//
//   creditTotalValue(List<BankData> creditlistbankdata) async {
//     double totalLiabilityValue = 0;
//     for (var cdata in creditlistbankdata) {
//       double creditcardtotalLiabilityValue = 0;
//
//       var libilityresponse = await liabilityData(
//           cdata.accesstoken.toString(), cdata.accountid.toString());
//       liabilitylist = libilityresponse.liabilities as Liabilities;
//       if (liabilitylist.student != null) {
//         for (var t_liability in liabilitylist.student!) {
//           totalLiabilityValue += t_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += t_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.mortgage != null) {
//         for (var s_liability in liabilitylist.mortgage!) {
//           totalLiabilityValue += s_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += s_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.credit != null) {
//         for (var c_liability in liabilitylist.credit!) {
//           totalLiabilityValue += c_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += c_liability.lastPaymentAmount!;
//         }
//       }
//       // print("||||||||||total creditttttttt"+ totalLiabilityValue.toString());
//       cdata.totalamount = creditcardtotalLiabilityValue;
//       debitGraphdata.add(0);
//       graphbankname.add(cdata.bankname.toString());
//       creditGraphdata.add(creditcardtotalLiabilityValue);
//     }
//     // print("||||||||||total creditttttttt value"+ totalLiabilityValue.toString());
//
//     setState(() {
//       tCreditValue = totalLiabilityValue;
//     });
//     return creditlistbankdata;
//   }
//
//   debitBuildExpandableContent(
//       String accessToken, String accountID, int cmonth) {
//     // print('+++++++++++++++++}');
//     var response = transactionResponse(accessToken, accountID, cmonth);
//     //
//     // print(response);
//     if (response == null) {
//       return Text(
//         'error ',
//         style: TextStyle(color: Colors.black),
//         //  ),
//       );
//     } else {
//       return //Text("jhbvkjndfkjvnfdv");
//         FutureBuilder<TransactionResponse>(
//             future: response,
//             builder: (context, snapshot) {
//               //   print('snnnnnnnnapshot');
//               //  print(snapshot.data!.transactions.toString());
//               return debitBuildTransactionListView(snapshot.data!);
//             });
//     }
//     ;
//   }
//
//   debitBuildTransactionListView(TransactionResponse tdata) {
//     //Text("jhbvkjndfkjvnfdv");
//     return //Text("credit4444444444444credit");
//       Column(
//         children: [
//           //for (var t in tdata.transactions!)
//           if (viewVisibleTransaction) ...[
//             Container(
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     for (var t in tdata.transactions!)
//                       Column(children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(
//                               top: 5, left: 13, right: 13, bottom: 3),
//                           color: const Color(0xffF5F5F5),
//                           child: ListTile(
//                             contentPadding: EdgeInsets.all(8),
//                             leading: CircleAvatar(
//                               radius: 20,
//                               child: Image(
//                                 image: AssetImage("asset/images/cart.png"),
//                                 //width: 40,
//                                 //color: const Color(0xffECDCFF)
//                               ),
//                             ),
//                             title: Padding(
//                               padding: EdgeInsets.only(top: 5, bottom: 8),
//                               child: Text(
//                                 t.category.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                             trailing: Column(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 10, top: 5),
//                                   child: Text(
//                                     dollar + t.amount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 2),
//                                   child: Text(
//                                     t.date.toString(),
//                                     style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             subtitle: Padding(
//                               padding: EdgeInsets.only(bottom: 2),
//                               child: Text(
//                                 t.name.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             selected: true,
//                           ),
//                         )
//                       ]),
//                   ],
//                 )),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     //selected: true;
//   }
//
// //------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
// //------->>>>>>>>>>>CREDIT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   creditBuildExpandableContent(String accessToken, String accountID) {
//     //print('+++++++++++++++++}');
//     var libilityresponse = liabilityData(accessToken, accountID);
//     print(libilityresponse);
//     // return Text("abcd55555555");
//     if (libilityresponse == null) {
//       // print('2+++++++++++++++++');
//
//       //return ListTile(
//       return Text(
//         'error',
//         style: TextStyle(color: Colors.black),
//       );
//       //  );
//     } else {
//       // return Text("222222222222");
//       return FutureBuilder<LiabilityResponse>(
//           future: libilityresponse,
//           builder: (context, snapshot) {
//             //   print('snnnnnnnnapshot');
//             //  print(snapshot.data!.liabilities.toString());
//             // return Text("233222222222");
//             return creditBuildLiabilityListView(snapshot.data!);
//           });
//     }
//     ;
//   }
//
//   creditBuildLiabilityListView(LiabilityResponse ldata) {
//     return //Text("4444444444444");
//       Column(
//         children: [
//           if (viewVisible) ...[
//             Container(
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   for (var i in stdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 15, left: 15, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             color: const Color(0xffF5F5F5),
//
//                             // color: const Color(0xffEFF4F8),
//                           ),
//                           child: ListView(
//                             children: <Widget>[
//                               // Text(
//                               //   "STUDENT LOAN",
//                               //   textAlign: TextAlign.center,
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 13,
//                               //       fontWeight: FontWeight.w700),
//                               // ),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.lastPaymentDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LOAN TYPE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.loanName.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("EXPECT PAY",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.expectedPayoffDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("ORIGATION DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.originationDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("OUTSTANDING INTEREST",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       i.outstandingInterestAmount.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("INTEREST RATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.interestRatePercentage.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("GUARANTER",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.guarantor.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT REFERENCE NUMBER ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.paymentReferenceNumber.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD INTEREST PAID",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdInterestPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD PRINCIPAL PAID ",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdPrincipalPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("SEQUENCE NUMBER",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(i.sequenceNumber.toString(),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("TOTAL AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                             ],
//                           ),
//                           //),
//                         ),
//                       ],
//                       //),
//
//                       // ],
//                     ),
//                   //  Text("Last payment Amount"+ i.lastPaymentAmount.toString()),
//                 ],
//               ),
//             )
//           ] else if (viewVisible2) ...[
//             Container(
//               width: double.infinity,
//               child: Column(
//                 children: <Widget>[
//                   for (var i in mrtlist)
//                   // ListView(
//                     Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 20, left: 20, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             //  color: const Color(0xffEFF4F8),
//                             color: const Color(0xffF5F5F5),
//                           ),
//                           child: ListView(children: [
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.lastPaymentDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar +
//                                       i.lastPaymentAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TYPE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTypeDescription.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TERM ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTerm.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ORIGATION DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.originationDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD PRINICIPAL PAID ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdPrincipalPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "CURRENT LATE FEE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.currentLateFee!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "NEXT MONTH PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD INTEREST PAID",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdInterestPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "MATURITY DATE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.maturityDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ESCROW BALANCE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.escrowBalance.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "DUE AMOUNT ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.pastDueAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "PAST DUE DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "TOTAL AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               // Container(
//                               //   margin: const EdgeInsets.only(
//                               //       top: 10),
//                               //   child: Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //       dollar + f.format(
//                               //           i.originationPrincipalAmount),
//                               //       style: TextStyle(
//                               //           color: Colors.black,
//                               //           fontSize: 14,
//                               //           fontWeight: FontWeight.w500),),
//                               //
//                               //   ),
//                               // ),
//                             ]),
//                           ]),
//                         ),
//
//                         //888****
//                       ],
//                     ),
//                 ],
//               ),
//             )
//           ] else if (viewVisible3) ...[
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: <Widget>[
//                   for (var i in crdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       // use whichever suits your need
//                       children: <Widget>[
//                         Container(
//                             width: double.infinity,
//                             height: 100.0,
//                             margin: const EdgeInsets.only(right: 15, left: 15),
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(8.0),
//                                   bottomRight: Radius.circular(8.0),
//                                   topLeft: Radius.circular(8.0),
//                                   bottomLeft: Radius.circular(8.0)),
//                               // color: const Color(0xffEFF4F8),
//                               color: const Color(0xffF5F5F5),
//                             ),
//                             child: ListView(children: [
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST STATEMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                             ])),
//                       ],
//                     ),
//                 ],
//                 //),
//
//                 // ],
//               ),
//             ),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     selected:
//     true;
//   }
//
//   void setStudentLoanContainer(Student student, double sliderValue) {
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var startdate = DateTime.parse(student.disbursementDates!.first);
//     var enddate = DateTime.parse(student.expectedPayoffDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     //num i = yearpassed.();
//     // num yearpassed = (currentdate.year - startdate.year);
//     //int endyear = (enddate.year - currentdate.year)
//     // ;
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(student.disbursementDates!.first);
//     // print(student.expectedPayoffDate);
//     // print(_loanyearvalues.toString());
//   }
//
//   void setMortgage(Mortgage mortgage, double mtgsliderValue) {
//     // var currentdate =  new DateTime.now();//DateTime.parse(currentdate);
//     // var startdate = DateTime.parse(mortgage.maturityDate!);
//     // var enddate = DateTime.parse(mortgage.originationDate!);
//     // int myearpassed = (currentdate.year - startdate.year);
//     // int mendyear = enddate.year - startdate.year ;
//     // print(myearpassed.toString());
//     // print(mendyear.toString());
//     // print(_mloanyearvalues.toString());
//     // m_minrange =  double.parse(myearpassed.toString()); ;
//     // m_maxrange =double.parse(mendyear.toString());   ;
//     // double mtgint =  m_maxrange  ;
//     // print("###3333####33hvcudfyhvuyfuyvuy");
//     // if(mtgsliderValue != 0)
//     // {
//     //   mtgint = mtgsliderValue ;
//     // }
//     // if(_mloanyearvalues <m_minrange) {
//     //   _mloanyearvalues = m_maxrange;
//     // }
//     // mbalanceamount = Constants.mAmortization(mortgage.originationPrincipalAmount,
//     //     mortgage.interestRate!.percentage as double, mtgint , myearpassed.toInt() );
//     // m_saveamount = mloanmaxvalue - mbalanceamount;
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var enddate = DateTime.parse(mortgage.maturityDate!);
//     var startdate = DateTime.parse(mortgage.originationDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(mortgage.maturityDate);
//     // print(mortgage.originationDate);
//     // print(_mloanyearvalues.toString());
//   }
//
// //############
// }
//
// //>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
//
// //----3
// Future<RefreshTokenResponse> valueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call redfresh token  .');
//   }
// }
//
// //>>>>>>>>>>>>>>-------------------------tokenAPI's--------------------------------->>>>>>>>>>>>>>>
// Future<LinkTokenResponse> linktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["transactions", "auth"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // prfint(Uri.parse(Constants.URL + '/link/token/create'));
// //  print('>>>>>>>>>>>>>>>>>>>>>>>> Link Token <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   // print(response.body);
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> institutionResponse(String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   print(
//       '>>>>>>>>>>>>>>>>>>>>>>>> institutionResponse <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   //print(response2.body);
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> accessTokenResponse(String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   print(
//       '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
//
// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
//
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }
//
// DateTime formatTimeOfDay(int month, int year, int day) {
//   final now = new DateTime.now();
//   final dt = DateTime(now.year, now.month, now.day);
//   return dt;
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Future<LinkTokenResponse> creditlinktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["liabilities"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // print(Uri.parse(Constants.URL + '/link/token/create'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> creditinstitutionResponse(
//     String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> creditaccessTokenResponse2(
//     String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   // print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
// Future<LiabilityResponse> liabilityData(
//     String accesstoken, String accountid) async {
//   bool _isLoading = true;
//   LiabilityOptions liabilityOptions = LiabilityOptions();
//   liabilityOptions.accountIds = [accountid];
//   LiabilityRequest liabilityRequest = LiabilityRequest();
//   liabilityRequest.clientId = Constants.ClientId;
//   liabilityRequest.secret = Constants.Secret;
//   liabilityRequest.accessToken = accesstoken;
//   liabilityRequest.options = liabilityOptions;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final response4 =
//   await http.post(Uri.parse(Constants.URL + '/liabilities/get'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(liabilityRequest));
//
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(response4.body)}');
//   //  print('credit bpdyyyyy');
//   //  print(response4.body);
//   //  print(response4.statusCode);
//   //  print(jsonEncode(liabilityRequest));
//   // print('credit bpdyyyyy');
//
//   // print(
//   //     '#################################credit##################################################');
//
//   if (response4.statusCode == 200) {
//     bool _isLoading = false;
//
//     return LiabilityResponse.fromJson(jsonDecode(response4.body));
//   } else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //------
// Future<RefreshTokenResponse> refreshValueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
// class MyLabelCommonOptions extends LabelCommonOptions {
//   const MyLabelCommonOptions(
//       ) : super ();
//
//   /// Override [labelTextStyle] with a new font, color, etc.
//   @override
//   // get labelTextStyle => GoogleFonts.comforter(
//   //  style: TextStyle(
//   //   color: Color,
//   //   fontSize: 14.0,
//   //   fontWeight: FontWeight.w400, // Regular
//   //   ),
//   // );
//
//   get labelTextStyle =>
//       const ChartOptions().labelCommonOptions.labelTextStyle.copyWith(
//           color: Colors.white
//       );
//
// }
import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:math' as math;
// import 'dart:ui';
// import 'dart:ui';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_charts/flutter_charts.dart';
// import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
// import 'package:plaid_flutter/plaid_flutter.dart';
//
// import 'package:swipeapp/Controller/Request/SaveBankDataRequest.dart';
// import 'package:swipeapp/Controller/Request/RefreshTokenRequest.dart';
// import 'package:swipeapp/Controller/Response/GetBankDataResponse.dart';
// import 'package:swipeapp/Controller/Response/RefreshTokenResponse.dart';
// import 'package:swipeapp/Controller/Response/SaveBankDataResponse.dart';
//
// import '../Model Helper.dart';
//
// import 'Account/AddAccount1.dart';
// import 'PlaidData/BankData.dart';
// import 'PlaidData/TransactionDetail.dart';
// import 'Plan/PlanAccount1.dart';
// import 'Request/AccessTokenRequest.dart';
// import 'Request/InstitutionRequest.dart';
// import 'Request/LiabilityRequest.dart';
// import 'Request/TokenResquest.dart';
// import 'Request/TransactionRequest.dart';
// import 'Response/AccessTokenResponse.dart';
// import 'Response/InstitutionResponse.dart';
// import 'Response/LiabilityResponse.dart';
// import 'Response/LinkTokenResponse.dart';
// import 'Response/TransactionResponse.dart';
// import 'package:flutter/services.dart';
// import 'dart:math' as math;
// import 'Response/UserDeatail.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       // title: 'Kindacode.com',
//       home: Dashboard2(),
//     );
//   }
// }
//
// class Dashboard2 extends StatefulWidget {
//   const Dashboard2({Key? key}) : super(key: key);
//
//   // final Function callback;
//   //const Dashboard(this.callback);
//   @override
//   tdashboardState createState() => tdashboardState();
// }
//
// class tdashboardState extends State<Dashboard2> {
//   BankData bankDataobj = BankData();
//
//   //creditBankData creditbankDataobj = creditBankData();
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//   late Future<List<BankData>> bankdatalist = [] as Future<List<BankData>>;
//   late Future<List<BankData>> creditbankdatalist = [] as Future<List<BankData>>;
//   List<Transactions> transactionlist = [];
//
//   List<double> debitGraphdata = [];
//   List<double> creditGraphdata = [];
//   List<String> graphbankname = [];
//
//   Future<TransactionResponse>? transactionResponseList;
//   late LegacyLinkConfiguration _publicKeyConfiguration;
//   late LinkTokenConfiguration _linkTokenConfiguration;
//   late Future<TokenRequest> tokenRequest;
//   String ExpenseKey = "expensedata";
//   String accesstoken = "";
//   String accountid = "";
//   int cmonth = 0;
//   late String _imgString = '';
//   late String imagebase64 = '';
//   bool _isShown = true;
//   String bname = "";
//   String acname = "";
//   int selectedIndex = -1;
//   late double tDebitValue = 0;
//   late double tCreditValue = 0;
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//
//   String dollar = " \$";
//   bool isFavourite = false;
//   bool isFavourite1 = true;
//   bool isFavourite2 = true;
//   bool isFavourite3 = true;
//   bool isLoading = false;
//   bool isLoading1 = true;
//   bool isexpanse = true;
//   bool viewVisibleTransaction = true;
//   bool viewVisible1 = true;
//
//   void hideWidget1() {
//     setState(() {
//       viewVisible1 = !viewVisible1;
//       viewVisible1 = false;
//     });
//   }
//
//   void showWidget() {
//     setState(() {
//       viewVisible = true;
//     });
//   }
//
// //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   late LinkTokenConfiguration creditlinkTokenConfiguration;
//   Liabilities liabilitylist = new Liabilities();
//   List<Student> stdlist = [];
//   List<Credit> crdlist = [];
//   List<Mortgage> mrtlist = [];
//   bool viewVisible = false;
//   bool viewVisible2 = false;
//   bool viewVisible3 = false;
//
//   void hideWidget() {
//     setState(() {
//       viewVisible = false;
//       viewVisible2 = false;
//       viewVisible3 = false;
//     });
//   }
//   bool _expanded = false;
//   late ScrollController _scrollController;
//
//   //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//   late ChartData chartData;
//   ChartOptions chartOptions = const ChartOptions(
//     labelCommonOptions: MyLabelCommonOptions(),
//
//   );
//
//   late var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy);
//
//   void initState() {
//     // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
//     //super.initState();
//     chartData = ChartData(
//       dataRows:  [
//         debitGraphdata,
//         creditGraphdata,
//       ],
//       xUserLabels: graphbankname,
//
//       // dataRows: const [
//       //   [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//       //   [0, 0, 0, 0, 0, -1800.0],
//       // ],
//       //   xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const ['Values', 'Values 2'],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//
//       chartOptions: chartOptions,
//
//     );
//     verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//     _publicKeyConfiguration = LegacyLinkConfiguration(
//       clientName: Constants.ClientId,
//       publicKey: "PUBLIC_KEY",
//       environment: LinkEnvironment.sandbox,
//       products: <LinkProduct>[
//         LinkProduct.auth,
//         LinkProduct.transactions,
//       ],
//       language: "en",
//       countryCodes: ['US'],
//       userLegalName: "John Appleseed",
//       userEmailAddress: "jappleseed@youapp.com",
//       userPhoneNumber: "+1 (512) 555-1234",
//     );
//     PlaidLink.onSuccess(_onSuccessCallback);
//     PlaidLink.onEvent(_onEventCallback);
//     PlaidLink.onExit(_onExitCallback);
//     bankdatalist = fetchBankData(Constants.debitcardValue);
//     var linktoken = linktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//     creditbankdatalist = fetchBankData(Constants
//         .creditcardValue); // as Future<List<creditBankData>>;// as List<BankData>;
//     var creditlinktoken = creditlinktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//     _scrollController = ScrollController();
//
//
//     // var verticalBarChart = VerticalBarChart(
//     //   painter: VerticalBarChartPainter(
//     //     verticalBarChartContainer: verticalBarChartContainer,
//     //   ),
//     // );
//   }
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>start>>>>>>>>>>>>>>>>>>>>>>>>
//   String libKey = "data";
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
//     // print("onSuccess222: $publicToken, metadata: ${metadata.description()}");
//     bankDataobj.publictoken = publicToken;
//     bankDataobj.accesstoken = accesstoken;
//     savingBankData(metadata);
//   }
//
//   void _onEventCallback(String event, LinkEventMetadata metadata) {
//     // print("onEvent123: $event, metadata: ${metadata.description()}");
//   }
//
//   void _onExitCallback(LinkError? error, LinkExitMetadata metadata) {
//     // print("onExit metadata: ${metadata.description()}");
//
//     if (error != null) {
//       // print("onExit error: ${error.description()}");
//     }
//   }
//
//   void savingBankData(LinkSuccessMetadata metadata) async {
//     for (int i = 0; i < metadata.accounts.length; i++) {
//       bankDataobj.accountid = metadata.accounts[i].id;
//       bankDataobj.accountname = metadata.accounts[i].name;
//       bankDataobj.mask = metadata.accounts[i].mask;
//     }
//     if (metadata.institution.id != "") {
//       var insres = await institutionResponse(metadata.institution.id);
//       bankDataobj.banklogo = insres.institution?.logo;
//       print("logooooooooo");
//       print(bankDataobj.banklogo);
//       print("logooooooooo");
//       bankDataobj.bankthemecolor = insres.institution?.primaryColor;
//       bankDataobj.bankname = insres.institution?.name;
//       var accesstokenres =
//       await accessTokenResponse(bankDataobj.publictoken.toString());
//       bankDataobj.accesstoken = accesstokenres.accessToken;
//
//       //  if (isexpanse) {
//       // saveBankdataResponse();
//       // List<BankData> templstbankdata = await bankdatalist;
//       //templstbankdata.add(bankDataobj);
//       //await Constants.save(ExpenseKey, jsonEncode(templstbankdata));
//       //  } else {
//       // List<BankData> templstbankdata = await creditbankdatalist;
//       // templstbankdata.add(bankDataobj);
//       // await Constants.save(libKey, jsonEncode(templstbankdata));
//       // }
//
//       //   setState(() {
//       saveBankdataResponse();
//       //  });
//
//       // print('---calling end accessTokenResponse---');
//     }
//   }
//
//   //--
//   Future<List<BankData>> appendElements(
//       Future<List<BankData>> listFuture, List<BankData> elementsToAdd) async {
//     // final list = await listFuture;
//     // int count = list.length;
//     // for(int i = count; i>0; i-- )
//     //   {
//     //     list.remove(list[i]);
//     //   }
//     // List<BankData>
//     // list.addAll(elementsToAdd);
//     return elementsToAdd;
//   }
//
//   //--
//
//   Future<List<BankData>> getBankData(List<BankData> bankresultList) async {
//     print("frfgr<<<<<<>>>>>>");
//
//     try {
//       // var bankdatalist1 =  [] as Future<List<BankData>>;
//       // setState(() {
//       bankdatalist = appendElements(bankdatalist, bankresultList);
//       //});
//       print("<<<<<<>>>>>>");
//
//       bankdatalist = debitTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load debitbankdata');
//     }
//     return bankdatalist;
//   }
//
//   Future<List<BankData>> getCreditBankData(
//       List<BankData> bankresultList) async {
//     try {
//       //creditbankdatalist =  [] as Future<List<BankData>>;
// //
//       // setState(() {
//       creditbankdatalist = appendElements(creditbankdatalist, bankresultList);
//       // });
//
//       creditTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load creditbankdata');
//     }
//     return creditbankdatalist;
//   }
//
//   Future<List<BankData>> fetchBankData(int type) async {
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String banktoken = tempuserdetail.accessToken.toString();
//     final response = await http.get(
//         Uri.parse(
//             Constants.baseUrl2 + '/Bank/GetBankData?type=' + type.toString()),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $banktoken',
//         });
//     print(response.body);
//
//     List<BankData> tempbankdatalist = <BankData>[];
//     if (response.statusCode == 200) {
//       GetBankDataResponse bankdataResponse =
//       GetBankDataResponse.fromJson(jsonDecode(response.body));
//       for (var i in bankdataResponse.result!) {
//         BankData bd = new BankData();
//         bd.publictoken = i.publictoken;
//         bd.bankthemecolor = i.bankthemecolor;
//         bd.banklogo = i.banklogo;
//         bd.mask = i.mask;
//         bd.accountname = i.accountname;
//         bd.accesstoken = i.accesstoken;
//         bd.bankname = i.bankname;
//         bd.accountid = i.accountid;
//         tempbankdatalist.add(bd);
//       }
//
//       print(jsonEncode(tempbankdatalist));
//       print("reposne>>>>>>>");
//       // getBankData(tempbankdatalist);
//       // return tempbankdatalist ;
//       if (type == Constants.debitcardValue) {
//         tempbankdatalist = getBankData(tempbankdatalist) as List<BankData>;
//         return tempbankdatalist;
//       } else {
//         getCreditBankData(tempbankdatalist);
//         return tempbankdatalist;
//       }
//
//       // return GetBankDataResponse.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to call user childuserid .');
//     }
//   }
//
//   Future<SaveBankDataResponse> saveBankdataResponse() async {
//     SaveBankDataRequest saveBankDataRequest = SaveBankDataRequest();
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String accounttoken = tempuserdetail.accessToken.toString();
//     saveBankDataRequest.id = 0;
//     saveBankDataRequest.accountid = bankDataobj.accountid;
//     saveBankDataRequest.accesstoken = bankDataobj.accesstoken;
//     saveBankDataRequest.accountname = bankDataobj.accountname;
//     saveBankDataRequest.mask = bankDataobj.mask;
//     saveBankDataRequest.bankname = bankDataobj.bankname;
//     saveBankDataRequest.banklogo = bankDataobj.banklogo;
//     print("banklogooooooooo>>>>>>>>");
//     print(bankDataobj.banklogo?.length.toString());
//     print(bankDataobj.banklogo);
//     print("banklogooooooooo>>>>>>>>");
//     saveBankDataRequest.bankthemecolor = bankDataobj.bankthemecolor;
//     saveBankDataRequest.publictoken = bankDataobj.publictoken;
//
//     if (isexpanse) {
//       saveBankDataRequest.type = Constants.debitcardValue;
//     } else {
//       saveBankDataRequest.type = Constants.creditcardValue;
//     }
//     //print('/////////request <<<<<<<<<<<<<<<<<<<<<<<<<');
//     //print(jsonEncode(saveBankDataRequest));
//     //print('/////////.request <<<<<<<<<<<<<<<<<<<<<<<<<');
//
//     final savebankresponse =
//     await http.post(Uri.parse(Constants.baseUrl2 + '/Bank/SaveBankData'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $accounttoken',
//         },
//         body: jsonEncode(saveBankDataRequest));
//     // print('/////////.svaebankdata <<<<<<<<<<<<<<<<<<<<<<<<<');
//     // print(accounttoken);
//     // print(saveBankDataRequest);
//     // print(savebankresponse);
//     // print(savebankresponse.body);
//     // print(savebankresponse.statusCode);
//     // print('/////////<<<<svaebankdata<<<<<<<<<<<<<<<<<<<<<');
//
//     if (savebankresponse.statusCode == 200) {
//       fetchBankData(saveBankDataRequest.type!);
//
//       return SaveBankDataResponse.fromJson(jsonDecode(savebankresponse.body));
//     } else {
//       throw Exception('Failed to call plaid save bank data.');
//     }
//   }
//
//   late final Function callback;
//
//   final List<String> iconname = [
//     'asset/images/cart.png',
//     'asset/images/at.png',
//     'asset/images/travel.png',
//     'asset/images/movie.png',
//
//     //   'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//   ];
//   List<String> TransactionIconCategory =[
//     "Bank Fees",
//     "Cash Advance",
//     "Community"
//   ];
//
//
//
//
//
//   // const Dashboard(this.callback);
//
//   Future<TransactionResponse> transactionResponse(
//       String accesstoken, String accountid, int currentmonth) async {
//     String startdate = "";
//     String enddate = "";
//     var now = new DateTime.now().toString();
//     var date = DateTime.parse(now);
//     DateTime firstDayOfMonth = new DateTime(date.year, date.month, 1);
//     // var dateObj = new Date;
//     // var lmonth = dateObj.getUTCMonth() + 1; //months from 1-12
//     // var lday = dateObj.getUTCDate();
//     // var lyear = dateObj.getUTCFullYear();
//     // var lastendDayOfMonth = lyear + "/" + lmonth + "/" + lday;
//     // DateTime lastendDayOfMonth = DateTime(date.year, date.month+1 , 0);
//     DateTime lastendDayOfMonth = (date.month < 12)
//         ? new DateTime(date.year, date.month + 1, 0)
//         : new DateTime(date.year + 1, 1, 0);
//     var fyear = firstDayOfMonth.year;
//     var fmonth = firstDayOfMonth.month.toString().padLeft(2, '0');
//     var fday = firstDayOfMonth.day.toString().padLeft(2, '0');
//     var firstday = "${fyear}-${fmonth}-${fday}";
//     var lyear = lastendDayOfMonth.year;
//     var lmonth = lastendDayOfMonth.month.toString().padLeft(2, '0');
//     var lday = lastendDayOfMonth.day.toString().padLeft(2, '0');
//     var lastday = "${lyear}-${lmonth}-${lday}";
//     startdate = firstday;
//     enddate = lastday;
//
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     // print(startdate);
//     // print(enddate);
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     Transactionoptions transactionoptions = Transactionoptions();
//     transactionoptions.count = 20;
//     transactionoptions.offset = 0;
//     transactionoptions.accountIds = [accountid];
//     TransactionRequest transactionRequest = TransactionRequest();
//     transactionRequest.clientId = Constants.ClientId;
//     transactionRequest.secret = Constants.Secret;
//     transactionRequest.accessToken = accesstoken;
//     transactionRequest.options = transactionoptions;
//     transactionRequest.startDate = startdate;
//     transactionRequest.endDate = enddate;
//     isLoading1 = false;
//     print(
//         'dasgboardRequest body4--REQUESTTTTTTTTTTTTTTTTTTTT: ${jsonEncode(transactionRequest)}');
//     final response4 =
//     await http.post(Uri.parse(Constants.URL + '/transactions/get'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(transactionRequest));
//     print(
//         '!!!!!!!!!!!!###########################################################################################################');
//     print('dshrespose44 body-----: ${response4}');
//     print(response4.statusCode);
//     print(response4);
//     // print(accesstoken);
//     print('dash##########################################'
//         '###################################################'
//         '##############');
//     if (response4.statusCode == 200) {
//       void dispose() {
//         Loader.hide();
//         isLoading1 = false;
//         // super.dispose();
//       }
//
//       return TransactionResponse.fromJson(jsonDecode(response4.body));
//     } else {
//       //void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//       //}
//
//       throw Exception('Failed to call transaction .');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     var _val;
//     var chidern;
//     return Scaffold(
//
//
//
//       //  resizeToAvoidBottomInset: false,
//
//       body: SafeArea(
//
//           child:
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 dashboardHeader(),
//                 Column(
//                   children:<Widget>[
//                     debitTransaction(),
//                     creditLiability(),
//                     paymentButton(),
//                     viewtransaction(),
//                     Visibility(
//                       maintainSize: true,
//                       maintainAnimation: true,
//                       maintainState: true,
//                       visible: viewVisible1,
//                       child: Container(
//                         width: double.infinity,
//                         //height: 200.0,
//                         // color: Colors.yellow,
//                         child: Column(
//                           //child: Column(
//                           children: [
//                             isLoading1 ?
//                             Center(child: CircularProgressIndicator()) :
//                             ListView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemCount: transactionlist.length,
//                                 itemBuilder: (context, int index) {
//                                   var $;
//                                   return Card(
//                                     color: const Color(0xffF7F6FA),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 80.0,
//                                       margin:
//                                       const EdgeInsets.only(right: 9, left: 9),
//                                       child: ListTile(
//                                           contentPadding: EdgeInsets.only(
//                                               left: 10.0, right: 0.0),
//                                           leading: CircleAvatar(
//                                             radius: 20,
//                                             child:
//                                             Image(image: AssetImage("asset/images/cart.png"),
//                                               //Image.asset( iconname[index],),
//                                             ),
//                                           ),
//                                           title: Text(
//                                             transactionlist[index].name.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           subtitle: Text(
//                                             transactionlist[index]
//                                                 .category
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing: Padding(
//                                             padding: EdgeInsets.only(top: 5),
//                                             child: Column(children: <Widget>[
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                     top: 3, bottom: 3),
//                                                 child: Text(
//                                                   dollar +
//                                                       transactionlist[index]
//                                                           .amount
//                                                           .toStringAsFixed(2),
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w600),
//                                                 ),
//                                               ),
//                                               Text(
//                                                 transactionlist[index]
//                                                     .date
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w500),
//                                               ),
//                                             ]),
//                                           )),
//                                     ),
//                                   );
//                                 }
//                               // );
//                               // }
//                               //},
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 )
//
//
//
//
//
//
//               ],
//             ),
//           )
//       ),
//
//
//
//
//     );
//   }
//
// //<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   Widget chartToRun() {
//     LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//     ChartData chartData;
//     ChartOptions chartOptions = const ChartOptions();
//     // Example shows a mix of positive and negative data values.
//     chartData = ChartData(
//       dataRows: const [
//         [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//         [0,0,0,0,0, -1800.0],
//       ],
//       xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const [
//         'Values',
//         'Values 2'
//       ],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//       chartOptions: chartOptions,
//     );
//     var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//
//     var verticalBarChart = VerticalBarChart(
//       painter: VerticalBarChartPainter(
//         verticalBarChartContainer: verticalBarChartContainer,
//       ),
//     );
//     return verticalBarChart;
//   }
//   dashboardHeader() {
//     return   Flexible(
//         child: Container(
//           //height: 120,
//             width: double.infinity,
//             padding: EdgeInsets.all(5),
//             //color: const Color(0xDEB46FEA),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("asset/images/background.png"),
//                   fit: BoxFit.cover,
//                 )),
//             //child: Align(alignment: Alignment.center,
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Row(mainAxisSize: MainAxisSize.min, children: [
//                     Container(
//                         margin: EdgeInsets.all(8),
//                         alignment: Alignment.topLeft,
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           //color: const Color(0x75f5f5f5)
//                         ),
//                         child:
//                         // Row(
//                         //   mainAxisSize: MainAxisSize.min,
//                         //   children: [
//                         Text(
//                           'Test Account',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 15,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold //font color
//                           ),
//                         )
//                       //   ],
//                       // )
//
//                     ),
//                   ]),
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tDebitValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 18,
//                                 //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                                 color: Colors.white,
//                                 //font color
//                                 fontStyle: FontStyle.italic),
//                           ),
//                           Text(
//                             'Debit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//
//
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tCreditValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 18,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               //font color
//                               fontStyle: FontStyle.italic,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             'Credit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//                     ]),
//                 Container(
//                   //width: 80,
//                   child:
//                   ExpandableNotifier(  // <-- Provides ExpandableController to its children
//                     child: Column(
//                       children: [
//                         Expandable(           // <-- Driven by ExpandableController from ExpandableNotifier
//                           collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
//                             child: //Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,),
//                             Image.asset(
//                               "asset/images/down.png", // width: 300,
//                               height: 20,
//                               width: 20,
//                               alignment: Alignment.center,
//                             ),
//
//                           ),
//                           expanded: Column(
//                               children: [
//                                 //Text("Backjdsgcygdsucudshiodhycoe"),
//                                 SizedBox(
//                                     width: 400,
//                                     height: 350,
//                                     child: FittedBox(child: Column(
//                                       children: [
//                                         //  addAccountHeader(),
//                                         Container(
//                                           // color: Colors.yellow,
//                                           height: 300,
//                                           width: 350,
//                                           child:
//                                           //Column(
//                                           // children: [
//                                           //  addAccountHeader(),
//                                           VerticalBarChart(
//                                             painter: VerticalBarChartPainter(
//                                               verticalBarChartContainer: verticalBarChartContainer,
//                                             ),
//                                           ),
//
//                                         )
//                                       ],
//                                     ))
//                                 ),
//                                 ExpandableButton(
//                                   child:  Image.asset(
//                                     "asset/images/up.png", // width: 300,
//                                     height: 20,
//                                     width: 20,
//                                     alignment: Alignment.center,
//                                   ),
//                                 ),
//                               ]
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],
//             )
//
//           //  ),
//         ));
//   }
//
//   debitTransaction() {
//     return Scrollbar(
//       child:Column(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Row(mainAxisSize: MainAxisSize.min, children: [
//               Container(
//                   margin: EdgeInsets.all(8),
//                   alignment: Alignment.topLeft,
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: const Color(0xffECDCFF)),
//                   child:
//                   // Row(
//                   //   mainAxisSize: MainAxisSize.min,
//                   //   children: [
//                   Text(
//                     'Debit:' + dollar + tDebitValue.toStringAsFixed(2),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 14,
//                         //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                         color: Colors.black,
//                         //font color
//                         fontStyle: FontStyle.italic),
//                   )
//                 //   ],
//                 // )
//
//               ),
//             ]),
//             // ),
//           ),
//           Container(
//             // height: 250.0,
//             // color: Colors.yellow,
//               child: Column(
//                 children: [
//                   Container(
//                       height: 35,
//                       width: double.infinity,
//                       margin:
//                       EdgeInsets.only(top: 5, left: 15, bottom: 10, right: 15),
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           color: const Color(0xffEDECEE)),
//                       child: Row(
//                         children: [
//                           TextButton(
//                             style: TextButton.styleFrom(
//                               padding: const EdgeInsets.all(5),
//                             ),
//                             onPressed: () async {
//                               isexpanse = true;
//                               Loader.show(context,
//                                   isSafeAreaOverlay: false,
//                                   progressIndicator: CircularProgressIndicator(),
//                                   isBottomBarOverlay: false,
//                                   overlayFromBottom: 80,
//                                   themeData: Theme.of(context)
//                                       .copyWith(accentColor: Colors.black),
//                                   overlayColor: Color(0x0000ffff));
//                               Future.delayed(Duration(seconds: 4), () {
//                                 Loader.hide();
//                               });
//                               var linktoken = await linktokenResponse();
//                               _linkTokenConfiguration = LinkTokenConfiguration(
//                                 token: linktoken.linkToken.toString(),
//                               );
//
//                               PlaidLink.open(configuration: _linkTokenConfiguration);
//                             },
//                             child: Image(
//                               image: AssetImage("asset/images/Plus.png"),
//                               width: 100,
//                               height: 100,
//                             ),
//                           ),
//                           Text('Connect To Debit Account'),
//                         ],
//                       )),
//                   //-----------------------------------debir////-----------
//                   Container(
//                     width: double.infinity,
//                     // height: 150.0,
//                     margin: const EdgeInsets.only(bottom: 4, top: 4),
//                     color: Colors.white,
//                     child: ListView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       children: [
//                         FutureBuilder<List<BankData>>(
//                           future: bankdatalist,
//                           builder: (context, snapshot) {
//                             if(snapshot.hasData)
//                             {
//                               return
//                                 ExpansionPanelList(
//                                   animationDuration: Duration(milliseconds: 2000),
//                                   children:
//                                   snapshot.data!.map<ExpansionPanel>((BankData item) {
//                                     return ExpansionPanel(
//                                       headerBuilder:
//                                           (BuildContext context, bool isExpanded) {
//                                         return ListTile(
//                                           iconColor: Colors.red,
//                                           leading: CircleAvatar(
//                                             radius: 30,
//                                             child:
//                                             // Image.memory(Base64Codec().decode(item.banklogo.toString()),),
//                                             Image.network(item.banklogo.toString()),
//                                           ),
//                                           title: Text(
//                                             item.bankname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing:
//                                           item.totalamount ==null?
//                                           Text(dollar+'0',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ):
//                                           Text('${item.totalamount.toString()}',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ),
//                                           // Text(
//                                           //   dollar + item.totalamount.toString(), "0",
//                                           //
//                                           //   style: TextStyle(
//                                           //       color: Colors.black,
//                                           //       fontSize: 16,
//                                           //       fontWeight: FontWeight.w500),
//                                           //),
//                                           subtitle: Text(
//                                             item.accountname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                           selected: false,
//                                         );
//                                       },
//                                       body:
//                                       // Text("gcdsgchgdsv"),
//                                       debitBuildExpandableContent(
//                                           item.accesstoken.toString(),
//                                           item.accountid.toString(),
//                                           cmonth),
//                                       isExpanded: item.isExpaneded,
//                                     );
//                                   }).toList(),
//                                   dividerColor: Colors.grey,
//                                   expansionCallback: (int index, bool isExpanded) {
//                                     setState(() {
//                                       snapshot.data![index].isExpaneded = !isExpanded;
//                                     });
//                                   },
//                                 );
//                             }
//                             else
//                             {
//                               return Center(
//                                   child: CircularProgressIndicator());
//                             }
//
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
// //chnage heiught to 200
//                   //--------------------------
//                 ],
//               )),
//
//         ],
//       ),
//     );
//   }
//
//   creditLiability() {
//     return Column(children: [
//       Align(
//         alignment: Alignment.topLeft,
//         child: Row(mainAxisSize: MainAxisSize.min, children: [
//           Container(
//               margin: EdgeInsets.all(8),
//               alignment: Alignment.topLeft,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: const Color(0xffECDCFF)),
//               child:
//               // Row(
//               //   mainAxisSize: MainAxisSize.min,
//               //   children: [
//               Text(
//                 'Credit: ' + dollar + tCreditValue.toStringAsFixed(2),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 14,
//                     //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                     color: Colors.black,
//                     //font color
//                     fontStyle: FontStyle.italic),
//               )
//             //   ],
//             // )
//
//           ),
//         ]),
//       ),
//       Container(
//           height: 35,
//           width: double.infinity,
//           margin: EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 15),
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: const Color(0xffEDECEE)),
//           child: Row(
//             children: [
//               TextButton(
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.all(5),
//                 ),
//                 onPressed: () async {
//                   isexpanse = false;
//                   Loader.show(context,
//                       isSafeAreaOverlay: false,
//                       progressIndicator: CircularProgressIndicator(),
//                       isBottomBarOverlay: false,
//                       overlayFromBottom: 80,
//                       themeData:
//                       Theme.of(context).copyWith(accentColor: Colors.black),
//                       overlayColor: Color(0x0000ffff));
//                   Future.delayed(Duration(seconds: 4), () {
//                     Loader.hide();
//                   });
//                   var creditlinktoken = await creditlinktokenResponse();
//                   creditlinkTokenConfiguration = LinkTokenConfiguration(
//                     token: creditlinktoken.linkToken.toString(),
//                   );
//
//                   PlaidLink.open(configuration: creditlinkTokenConfiguration);
//                 },
//                 child: Image(
//                   image: AssetImage("asset/images/Plus.png"),
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//               Text('Connect To Credit Account'),
//               //Text('Connect To Credit Account2'),
//             ],
//           )),
//       Container(
//         width: double.infinity,
//         // height: 150.0,
//         margin: const EdgeInsets.only(bottom: 0, top: 0),
//         color: Colors.white,
//         child: ListView(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//
//           children: [
//             FutureBuilder<List<BankData>>(
//               future: creditbankdatalist,
//               builder: (context, snapshot) {
//                 if(snapshot.hasData)
//                 {
//                   return
//                     ExpansionPanelList(
//                       animationDuration: Duration(milliseconds: 2000),
//                       children: snapshot.data!.map<ExpansionPanel>((BankData item) {
//                         return ExpansionPanel(
//                           headerBuilder: (BuildContext context, bool isExpanded) {
//                             return ListTile(
//                               iconColor: Colors.red,
//                               leading: CircleAvatar(
//                                   radius: 30,
//                                   child:
//                                   //Image.memory(Base64Codec().decode(item.banklogo.toString())),
//
//                                   Image.network(item.banklogo.toString())),
//                               title: Text(
//                                 item.bankname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               trailing:
//                               // Text(
//                               //   dollar + item.totalamount.toString(),
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 16,
//                               //       fontWeight: FontWeight.w500),
//                               // ),
//                               item.totalamount ==null?
//                               Text(dollar+'0',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ):
//                               Text('${item.totalamount!.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 item.accountname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               selected: false,
//                             );
//                           },
//                           body: //Text('hgsdvfghjbvsdjhcgsdh'),
//                           creditBuildExpandableContent(
//                             item.accesstoken.toString(),
//                             item.accountid.toString(),
//                           ),
//                           isExpanded: item.isExpaneded,
//                         );
//                       }).toList(),
//                       dividerColor: Colors.grey,
//                       expansionCallback: (int index, bool isExpanded) async {
//                         setState(() {
//                           snapshot.data![index].isExpaneded = !isExpanded;
//                         });
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // print(index);
//                         // print(isExpanded);
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // TransactionResponse tempresponse2 =
//                         //     await transactionResponse(
//                         //         snapshot.data![index].accesstoken.toString(),
//                         //         snapshot.data![index].accountid.toString(),
//                         //         cmonth);
//                         //
//                         // transactionlist =
//                         //     tempresponse2.transactions as List<Transactions>;
//                         // viewVisible = true;
//                         viewVisibleTransaction = true;
//                         showWidget();
//                         LiabilityResponse tempresponse = await liabilityData(
//                             snapshot.data![index].accesstoken.toString(),
//                             snapshot.data![index].accountid.toString());
//                         liabilitylist = tempresponse.liabilities as Liabilities;
//                         viewVisible = false;
//                         viewVisible2 = false;
//                         viewVisible3 = false;
//                         if (liabilitylist.student != null) {
//                           stdlist = liabilitylist.student!;
//                           viewVisible = true;
//                           //  print("student");
//                           setStudentLoanContainer(liabilitylist.student!.first, 0);
//                         }
//                         if (liabilitylist.mortgage != null) {
//                           mrtlist = liabilitylist.mortgage!;
//                           viewVisible2 = true;
//                           //  print("mortgage");
//                           setMortgage(liabilitylist.mortgage!.first, 0);
//                         }
//                         if (liabilitylist.credit != null) {
//                           crdlist = liabilitylist.credit!;
//                           viewVisible3 = true;
//                           //  print("credit");
//                         }
//                       },
//                     );
//                 }
//                 else
//                 {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//               },
//             ),
//           ],
//         ),
//       ),
//     ]);
//   }
//
//   paymentButton() {
//     return Container(
//       height: 38,
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 15, bottom: 20.0, left: 25, right: 25),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//             //color: const Color(0xFFA781D3),
//           )),
//       child: TextButton(
//         style: TextButton.styleFrom(
//           backgroundColor: const Color(0xFFA781D3),
//           padding: const EdgeInsets.all(5),
//         ),
//         onPressed: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => AddAccount()),
//           // );
//         },
//         child: Text(
//           'Make a Payment',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
//
//   bottomNavBar() {
//     return Container(
//       height: 45,
//       padding: const EdgeInsets.all(
//         8,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(2),
//         color: const Color(0xF5F7F6FA),
//       ),
//       //alignment: Alignment.bottomCenter,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           IconButton(
//             // icon: Image.asset('assets/images/dashboard.png'),
//             icon: ImageIcon(
//               AssetImage("asset/images/home2.png"),
//               size: 140,
//               color: isFavourite ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//
//             onPressed: () {
//               setState(() {
//                 isFavourite = false;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pbox.png"),
//               size: 140,
//               color: isFavourite1 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   //MaterialPageRoute(builder: (context) => Spend(this.)),
//               // );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = false;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pmoney.png"),
//               size: 140,
//               color: isFavourite2 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PlanAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = false;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/paccount.png"),
//               size: 140,
//               color: isFavourite3 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = false;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   viewtransaction() {
//     return Container(
//       child: Row(children: [
//         Container(
//             margin: EdgeInsets.all(8),
//             alignment: Alignment.topLeft,
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: const Color(0xffECDCFF)),
//             child:
//             // Row(
//             //   mainAxisSize: MainAxisSize.min,
//             //   children: [
//             Text(
//               'Recent Transactions',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 14,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: Colors.black,
//                   //font color
//                   fontStyle: FontStyle.italic),
//             )
//           //   ],
//           // )
//
//         ),
//         Spacer(),
//         Container(
//           margin: EdgeInsets.all(8),
//           alignment: Alignment.topRight,
//           child: InkWell(
//             onTap: () async {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TransactionDetail(),
//                   // Pass the arguments as part of the RouteSettings. The
//                   // DetailScreen reads the arguments from these settings.
//                   settings: RouteSettings(
//                     arguments: transactionlist,
//                   ),
//                 ),
//               );
//               setState(() {
//                 //selectedIndex = i;
//               });
//             },
//             child: new Text(
//               "View All",
//               style: TextStyle(
//                   fontSize: 13,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: const Color(0xffA781D3),
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
//
// //   <<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
// //
// // ------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   debitTotalValue(List<BankData> debitlistbankdata) async {
//     double totalTransactionValue = 0;
//     for (var debitdata in debitlistbankdata) {
//       double debitcardtotalTransactionValue = 0;
//       var response = await transactionResponse(debitdata.accesstoken.toString(),
//           debitdata.accountid.toString(), cmonth);
//       for (var t_transaction in response.transactions!) {
//         transactionlist.add(t_transaction);
//         totalTransactionValue += t_transaction.amount;
//         debitcardtotalTransactionValue += t_transaction.amount;
//         print("||||||||||");
//
//         print(t_transaction.amount);
//       }
//       debitdata.totalamount = debitcardtotalTransactionValue;
//       debitGraphdata.add(debitcardtotalTransactionValue);
//       graphbankname.add(debitdata.bankname.toString());
//       creditGraphdata.add(0);
//       print("||||||||||¥¥¥¥¥¥¥¥¥¥¥¥total debitttttttt" +
//           totalTransactionValue.toString());
//       print(debitdata.totalamount);
//       print(debitcardtotalTransactionValue);
//     }
//     setState(() {
//       tDebitValue = totalTransactionValue;
//     });
//     print(jsonEncode(debitlistbankdata));
//     return debitlistbankdata;
//   }
//
//   creditTotalValue(List<BankData> creditlistbankdata) async {
//     double totalLiabilityValue = 0;
//     for (var cdata in creditlistbankdata) {
//       double creditcardtotalLiabilityValue = 0;
//
//       var libilityresponse = await liabilityData(
//           cdata.accesstoken.toString(), cdata.accountid.toString());
//       liabilitylist = libilityresponse.liabilities as Liabilities;
//       if (liabilitylist.student != null) {
//         for (var t_liability in liabilitylist.student!) {
//           totalLiabilityValue += t_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += t_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.mortgage != null) {
//         for (var s_liability in liabilitylist.mortgage!) {
//           totalLiabilityValue += s_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += s_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.credit != null) {
//         for (var c_liability in liabilitylist.credit!) {
//           totalLiabilityValue += c_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += c_liability.lastPaymentAmount!;
//         }
//       }
//       // print("||||||||||total creditttttttt"+ totalLiabilityValue.toString());
//       cdata.totalamount = creditcardtotalLiabilityValue;
//       debitGraphdata.add(0);
//       graphbankname.add(cdata.bankname.toString());
//       creditGraphdata.add(creditcardtotalLiabilityValue);
//     }
//     // print("||||||||||total creditttttttt value"+ totalLiabilityValue.toString());
//
//     setState(() {
//       tCreditValue = totalLiabilityValue;
//     });
//     return creditlistbankdata;
//   }
//
//   debitBuildExpandableContent(
//       String accessToken, String accountID, int cmonth) {
//     // print('+++++++++++++++++}');
//     var response = transactionResponse(accessToken, accountID, cmonth);
//     //
//     // print(response);
//     if (response == null) {
//       return Text(
//         'error ',
//         style: TextStyle(color: Colors.black),
//         //  ),
//       );
//     } else {
//       return //Text("jhbvkjndfkjvnfdv");
//         FutureBuilder<TransactionResponse>(
//             future: response,
//             builder: (context, snapshot) {
//               //   print('snnnnnnnnapshot');
//               //  print(snapshot.data!.transactions.toString());
//               return debitBuildTransactionListView(snapshot.data!);
//             });
//     }
//     ;
//   }
//
//   debitBuildTransactionListView(TransactionResponse tdata) {
//     //Text("jhbvkjndfkjvnfdv");
//     return //Text("credit4444444444444credit");
//       Column(
//         children: [
//           //for (var t in tdata.transactions!)
//           if (viewVisibleTransaction) ...[
//             Container(
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     for (var t in tdata.transactions!)
//                       Column(children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(
//                               top: 5, left: 13, right: 13, bottom: 3),
//                           color: const Color(0xffF5F5F5),
//                           child: ListTile(
//                             contentPadding: EdgeInsets.all(8),
//                             leading: CircleAvatar(
//                               radius: 20,
//                               child: Image(
//                                 image: AssetImage("asset/images/cart.png"),
//                                 //width: 40,
//                                 //color: const Color(0xffECDCFF)
//                               ),
//                             ),
//                             title: Padding(
//                               padding: EdgeInsets.only(top: 5, bottom: 8),
//                               child: Text(
//                                 t.category.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                             trailing: Column(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 10, top: 5),
//                                   child: Text(
//                                     dollar + t.amount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 2),
//                                   child: Text(
//                                     t.date.toString(),
//                                     style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             subtitle: Padding(
//                               padding: EdgeInsets.only(bottom: 2),
//                               child: Text(
//                                 t.name.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             selected: true,
//                           ),
//                         )
//                       ]),
//                   ],
//                 )),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     //selected: true;
//   }
//
// //------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
// //------->>>>>>>>>>>CREDIT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   creditBuildExpandableContent(String accessToken, String accountID) {
//     //print('+++++++++++++++++}');
//     var libilityresponse = liabilityData(accessToken, accountID);
//     print(libilityresponse);
//     // return Text("abcd55555555");
//     if (libilityresponse == null) {
//       // print('2+++++++++++++++++');
//
//       //return ListTile(
//       return Text(
//         'error',
//         style: TextStyle(color: Colors.black),
//       );
//       //  );
//     } else {
//       // return Text("222222222222");
//       return FutureBuilder<LiabilityResponse>(
//           future: libilityresponse,
//           builder: (context, snapshot) {
//             //   print('snnnnnnnnapshot');
//             //  print(snapshot.data!.liabilities.toString());
//             // return Text("233222222222");
//             return creditBuildLiabilityListView(snapshot.data!);
//           });
//     }
//     ;
//   }
//
//   creditBuildLiabilityListView(LiabilityResponse ldata) {
//     return //Text("4444444444444");
//       Column(
//         children: [
//           if (viewVisible) ...[
//             Container(
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   for (var i in stdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 15, left: 15, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             color: const Color(0xffF5F5F5),
//
//                             // color: const Color(0xffEFF4F8),
//                           ),
//                           child: ListView(
//                             children: <Widget>[
//                               // Text(
//                               //   "STUDENT LOAN",
//                               //   textAlign: TextAlign.center,
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 13,
//                               //       fontWeight: FontWeight.w700),
//                               // ),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.lastPaymentDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LOAN TYPE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.loanName.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("EXPECT PAY",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.expectedPayoffDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("ORIGATION DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.originationDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("OUTSTANDING INTEREST",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       i.outstandingInterestAmount.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("INTEREST RATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.interestRatePercentage.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("GUARANTER",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.guarantor.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT REFERENCE NUMBER ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.paymentReferenceNumber.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD INTEREST PAID",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdInterestPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD PRINCIPAL PAID ",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdPrincipalPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("SEQUENCE NUMBER",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(i.sequenceNumber.toString(),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("TOTAL AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                             ],
//                           ),
//                           //),
//                         ),
//                       ],
//                       //),
//
//                       // ],
//                     ),
//                   //  Text("Last payment Amount"+ i.lastPaymentAmount.toString()),
//                 ],
//               ),
//             )
//           ] else if (viewVisible2) ...[
//             Container(
//               width: double.infinity,
//               child: Column(
//                 children: <Widget>[
//                   for (var i in mrtlist)
//                   // ListView(
//                     Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 20, left: 20, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             //  color: const Color(0xffEFF4F8),
//                             color: const Color(0xffF5F5F5),
//                           ),
//                           child: ListView(children: [
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.lastPaymentDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar +
//                                       i.lastPaymentAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TYPE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTypeDescription.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TERM ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTerm.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ORIGATION DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.originationDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD PRINICIPAL PAID ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdPrincipalPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "CURRENT LATE FEE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.currentLateFee!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "NEXT MONTH PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD INTEREST PAID",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdInterestPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "MATURITY DATE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.maturityDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ESCROW BALANCE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.escrowBalance.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "DUE AMOUNT ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.pastDueAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "PAST DUE DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "TOTAL AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               // Container(
//                               //   margin: const EdgeInsets.only(
//                               //       top: 10),
//                               //   child: Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //       dollar + f.format(
//                               //           i.originationPrincipalAmount),
//                               //       style: TextStyle(
//                               //           color: Colors.black,
//                               //           fontSize: 14,
//                               //           fontWeight: FontWeight.w500),),
//                               //
//                               //   ),
//                               // ),
//                             ]),
//                           ]),
//                         ),
//
//                         //888****
//                       ],
//                     ),
//                 ],
//               ),
//             )
//           ] else if (viewVisible3) ...[
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: <Widget>[
//                   for (var i in crdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       // use whichever suits your need
//                       children: <Widget>[
//                         Container(
//                             width: double.infinity,
//                             height: 100.0,
//                             margin: const EdgeInsets.only(right: 15, left: 15),
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(8.0),
//                                   bottomRight: Radius.circular(8.0),
//                                   topLeft: Radius.circular(8.0),
//                                   bottomLeft: Radius.circular(8.0)),
//                               // color: const Color(0xffEFF4F8),
//                               color: const Color(0xffF5F5F5),
//                             ),
//                             child: ListView(children: [
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST STATEMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                             ])),
//                       ],
//                     ),
//                 ],
//                 //),
//
//                 // ],
//               ),
//             ),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     selected:
//     true;
//   }
//
//   void setStudentLoanContainer(Student student, double sliderValue) {
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var startdate = DateTime.parse(student.disbursementDates!.first);
//     var enddate = DateTime.parse(student.expectedPayoffDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     //num i = yearpassed.();
//     // num yearpassed = (currentdate.year - startdate.year);
//     //int endyear = (enddate.year - currentdate.year)
//     // ;
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(student.disbursementDates!.first);
//     // print(student.expectedPayoffDate);
//     // print(_loanyearvalues.toString());
//   }
//
//   void setMortgage(Mortgage mortgage, double mtgsliderValue) {
//     // var currentdate =  new DateTime.now();//DateTime.parse(currentdate);
//     // var startdate = DateTime.parse(mortgage.maturityDate!);
//     // var enddate = DateTime.parse(mortgage.originationDate!);
//     // int myearpassed = (currentdate.year - startdate.year);
//     // int mendyear = enddate.year - startdate.year ;
//     // print(myearpassed.toString());
//     // print(mendyear.toString());
//     // print(_mloanyearvalues.toString());
//     // m_minrange =  double.parse(myearpassed.toString()); ;
//     // m_maxrange =double.parse(mendyear.toString());   ;
//     // double mtgint =  m_maxrange  ;
//     // print("###3333####33hvcudfyhvuyfuyvuy");
//     // if(mtgsliderValue != 0)
//     // {
//     //   mtgint = mtgsliderValue ;
//     // }
//     // if(_mloanyearvalues <m_minrange) {
//     //   _mloanyearvalues = m_maxrange;
//     // }
//     // mbalanceamount = Constants.mAmortization(mortgage.originationPrincipalAmount,
//     //     mortgage.interestRate!.percentage as double, mtgint , myearpassed.toInt() );
//     // m_saveamount = mloanmaxvalue - mbalanceamount;
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var enddate = DateTime.parse(mortgage.maturityDate!);
//     var startdate = DateTime.parse(mortgage.originationDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(mortgage.maturityDate);
//     // print(mortgage.originationDate);
//     // print(_mloanyearvalues.toString());
//   }
//
// //############
// }
//
// //>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
//
// //----3
// Future<RefreshTokenResponse> valueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call redfresh token  .');
//   }
// }
//
// //>>>>>>>>>>>>>>-------------------------tokenAPI's--------------------------------->>>>>>>>>>>>>>>
// Future<LinkTokenResponse> linktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["transactions", "auth"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // prfint(Uri.parse(Constants.URL + '/link/token/create'));
// //  print('>>>>>>>>>>>>>>>>>>>>>>>> Link Token <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   // print(response.body);
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> institutionResponse(String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   print(
//       '>>>>>>>>>>>>>>>>>>>>>>>> institutionResponse <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   //print(response2.body);
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> accessTokenResponse(String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   print(
//       '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
//
// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
//
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }
//
// DateTime formatTimeOfDay(int month, int year, int day) {
//   final now = new DateTime.now();
//   final dt = DateTime(now.year, now.month, now.day);
//   return dt;
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Future<LinkTokenResponse> creditlinktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["liabilities"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // print(Uri.parse(Constants.URL + '/link/token/create'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> creditinstitutionResponse(
//     String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> creditaccessTokenResponse2(
//     String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   // print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
// Future<LiabilityResponse> liabilityData(
//     String accesstoken, String accountid) async {
//   bool _isLoading = true;
//   LiabilityOptions liabilityOptions = LiabilityOptions();
//   liabilityOptions.accountIds = [accountid];
//   LiabilityRequest liabilityRequest = LiabilityRequest();
//   liabilityRequest.clientId = Constants.ClientId;
//   liabilityRequest.secret = Constants.Secret;
//   liabilityRequest.accessToken = accesstoken;
//   liabilityRequest.options = liabilityOptions;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final response4 =
//   await http.post(Uri.parse(Constants.URL + '/liabilities/get'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(liabilityRequest));
//
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(response4.body)}');
//   //  print('credit bpdyyyyy');
//   //  print(response4.body);
//   //  print(response4.statusCode);
//   //  print(jsonEncode(liabilityRequest));
//   // print('credit bpdyyyyy');
//
//   // print(
//   //     '#################################credit##################################################');
//
//   if (response4.statusCode == 200) {
//     bool _isLoading = false;
//
//     return LiabilityResponse.fromJson(jsonDecode(response4.body));
//   } else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //------
// Future<RefreshTokenResponse> refreshValueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
// class MyLabelCommonOptions extends LabelCommonOptions {
//   const MyLabelCommonOptions(
//       ) : super ();
//
//   /// Override [labelTextStyle] with a new font, color, etc.
//   @override
//   // get labelTextStyle => GoogleFonts.comforter(
//   //  style: TextStyle(
//   //   color: Color,
//   //   fontSize: 14.0,
//   //   fontWeight: FontWeight.w400, // Regular
//   //   ),
//   // );
//
//   get labelTextStyle =>
//       const ChartOptions().labelCommonOptions.labelTextStyle.copyWith(
//           color: Colors.white
//       );
//
// }
//bchb bchsb kjc bjkcsb jkbc j
import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:core';
// import 'dart:math' as math;
// import 'dart:ui';
// import 'dart:ui';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_charts/flutter_charts.dart';
// import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
// import 'package:plaid_flutter/plaid_flutter.dart';
//
// import 'package:swipeapp/Controller/Request/SaveBankDataRequest.dart';
// import 'package:swipeapp/Controller/Request/RefreshTokenRequest.dart';
// import 'package:swipeapp/Controller/Response/GetBankDataResponse.dart';
// import 'package:swipeapp/Controller/Response/RefreshTokenResponse.dart';
// import 'package:swipeapp/Controller/Response/SaveBankDataResponse.dart';
//
// import '../Model Helper.dart';
//
// import 'Account/AddAccount1.dart';
// import 'PlaidData/BankData.dart';
// import 'PlaidData/TransactionDetail.dart';
// import 'Plan/PlanAccount1.dart';
// import 'Request/AccessTokenRequest.dart';
// import 'Request/InstitutionRequest.dart';
// import 'Request/LiabilityRequest.dart';
// import 'Request/TokenResquest.dart';
// import 'Request/TransactionRequest.dart';
// import 'Response/AccessTokenResponse.dart';
// import 'Response/InstitutionResponse.dart';
// import 'Response/LiabilityResponse.dart';
// import 'Response/LinkTokenResponse.dart';
// import 'Response/TransactionResponse.dart';
// import 'package:flutter/services.dart';
// import 'dart:math' as math;
// import 'Response/UserDeatail.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       // title: 'Kindacode.com',
//       home: Dashboard2(),
//     );
//   }
// }
//
// class Dashboard2 extends StatefulWidget {
//   const Dashboard2({Key? key}) : super(key: key);
//
//   // final Function callback;
//   //const Dashboard(this.callback);
//   @override
//   tdashboardState createState() => tdashboardState();
// }
//
// class tdashboardState extends State<Dashboard2> {
//   BankData bankDataobj = BankData();
//
//   //creditBankData creditbankDataobj = creditBankData();
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//   late Future<List<BankData>> bankdatalist = [] as Future<List<BankData>>;
//   late Future<List<BankData>> creditbankdatalist = [] as Future<List<BankData>>;
//   List<Transactions> transactionlist = [];
//
//   List<double> debitGraphdata = [];
//   List<double> creditGraphdata = [];
//   List<String> graphbankname = [];
//
//   Future<TransactionResponse>? transactionResponseList;
//   late LegacyLinkConfiguration _publicKeyConfiguration;
//   late LinkTokenConfiguration _linkTokenConfiguration;
//   late Future<TokenRequest> tokenRequest;
//   String ExpenseKey = "expensedata";
//   String accesstoken = "";
//   String accountid = "";
//   int cmonth = 0;
//   late String _imgString = '';
//   late String imagebase64 = '';
//   bool _isShown = true;
//   String bname = "";
//   String acname = "";
//   int selectedIndex = -1;
//   late double tDebitValue = 0;
//   late double tCreditValue = 0;
//
// //<<<<<<<<<<<<<<<<Debit>>>>>>>>>>>>>>>>>>>>
//
//   String dollar = " \$";
//   bool isFavourite = false;
//   bool isFavourite1 = true;
//   bool isFavourite2 = true;
//   bool isFavourite3 = true;
//   bool isLoading = false;
//   bool isLoading1 = true;
//   bool isexpanse = true;
//   bool viewVisibleTransaction = true;
//   bool viewVisible1 = true;
//
//   void hideWidget1() {
//     setState(() {
//       viewVisible1 = !viewVisible1;
//       viewVisible1 = false;
//     });
//   }
//
//   void showWidget() {
//     setState(() {
//       viewVisible = true;
//     });
//   }
//
// //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   late LinkTokenConfiguration creditlinkTokenConfiguration;
//   Liabilities liabilitylist = new Liabilities();
//   List<Student> stdlist = [];
//   List<Credit> crdlist = [];
//   List<Mortgage> mrtlist = [];
//   bool viewVisible = false;
//   bool viewVisible2 = false;
//   bool viewVisible3 = false;
//
//   void hideWidget() {
//     setState(() {
//       viewVisible = false;
//       viewVisible2 = false;
//       viewVisible3 = false;
//     });
//   }
//   bool _expanded = false;
//   late ScrollController _scrollController;
//
//   //<<<<<<<<<<<<<<<<Credit>>>>>>>>>>>>>>>>>>>>
//   LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//   late ChartData chartData;
//   ChartOptions chartOptions = const ChartOptions(
//     labelCommonOptions: MyLabelCommonOptions(),
//
//   );
//
//   late var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy);
//
//   void initState() {
//     // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
//     //super.initState();
//     chartData = ChartData(
//       dataRows:  [
//         debitGraphdata,
//         creditGraphdata,
//       ],
//       xUserLabels: graphbankname,
//
//       // dataRows: const [
//       //   [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//       //   [0, 0, 0, 0, 0, -1800.0],
//       // ],
//       //   xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const ['Values', 'Values 2'],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//
//       chartOptions: chartOptions,
//
//     );
//     verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//     _publicKeyConfiguration = LegacyLinkConfiguration(
//       clientName: Constants.ClientId,
//       publicKey: "PUBLIC_KEY",
//       environment: LinkEnvironment.sandbox,
//       products: <LinkProduct>[
//         LinkProduct.auth,
//         LinkProduct.transactions,
//       ],
//       language: "en",
//       countryCodes: ['US'],
//       userLegalName: "John Appleseed",
//       userEmailAddress: "jappleseed@youapp.com",
//       userPhoneNumber: "+1 (512) 555-1234",
//     );
//     PlaidLink.onSuccess(_onSuccessCallback);
//     PlaidLink.onEvent(_onEventCallback);
//     PlaidLink.onExit(_onExitCallback);
//     bankdatalist = fetchBankData(Constants.debitcardValue);
//     var linktoken = linktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//     creditbankdatalist = fetchBankData(Constants
//         .creditcardValue); // as Future<List<creditBankData>>;// as List<BankData>;
//     var creditlinktoken = creditlinktokenResponse();
//     //<<<<<<<<<<<<<<<<<credit>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//     _scrollController = ScrollController();
//
//
//     // var verticalBarChart = VerticalBarChart(
//     //   painter: VerticalBarChartPainter(
//     //     verticalBarChartContainer: verticalBarChartContainer,
//     //   ),
//     // );
//   }
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>start>>>>>>>>>>>>>>>>>>>>>>>>
//   String libKey = "data";
//
//   //--------------libility>>>>>>>>>>>>>>>>>>>>>>>>>>>>end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
//     // print("onSuccess222: $publicToken, metadata: ${metadata.description()}");
//     bankDataobj.publictoken = publicToken;
//     bankDataobj.accesstoken = accesstoken;
//     savingBankData(metadata);
//   }
//
//   void _onEventCallback(String event, LinkEventMetadata metadata) {
//     // print("onEvent123: $event, metadata: ${metadata.description()}");
//   }
//
//   void _onExitCallback(LinkError? error, LinkExitMetadata metadata) {
//     // print("onExit metadata: ${metadata.description()}");
//
//     if (error != null) {
//       // print("onExit error: ${error.description()}");
//     }
//   }
//
//   void savingBankData(LinkSuccessMetadata metadata) async {
//     for (int i = 0; i < metadata.accounts.length; i++) {
//       bankDataobj.accountid = metadata.accounts[i].id;
//       bankDataobj.accountname = metadata.accounts[i].name;
//       bankDataobj.mask = metadata.accounts[i].mask;
//     }
//     if (metadata.institution.id != "") {
//       var insres = await institutionResponse(metadata.institution.id);
//       bankDataobj.banklogo = insres.institution?.logo;
//       print("logooooooooo");
//       print(bankDataobj.banklogo);
//       print("logooooooooo");
//       bankDataobj.bankthemecolor = insres.institution?.primaryColor;
//       bankDataobj.bankname = insres.institution?.name;
//       var accesstokenres =
//       await accessTokenResponse(bankDataobj.publictoken.toString());
//       bankDataobj.accesstoken = accesstokenres.accessToken;
//
//       //  if (isexpanse) {
//       // saveBankdataResponse();
//       // List<BankData> templstbankdata = await bankdatalist;
//       //templstbankdata.add(bankDataobj);
//       //await Constants.save(ExpenseKey, jsonEncode(templstbankdata));
//       //  } else {
//       // List<BankData> templstbankdata = await creditbankdatalist;
//       // templstbankdata.add(bankDataobj);
//       // await Constants.save(libKey, jsonEncode(templstbankdata));
//       // }
//
//       //   setState(() {
//       saveBankdataResponse();
//       //  });
//
//       // print('---calling end accessTokenResponse---');
//     }
//   }
//
//   //--
//   Future<List<BankData>> appendElements(
//       Future<List<BankData>> listFuture, List<BankData> elementsToAdd) async {
//     // final list = await listFuture;
//     // int count = list.length;
//     // for(int i = count; i>0; i-- )
//     //   {
//     //     list.remove(list[i]);
//     //   }
//     // List<BankData>
//     // list.addAll(elementsToAdd);
//     return elementsToAdd;
//   }
//
//   //--
//
//   Future<List<BankData>> getBankData(List<BankData> bankresultList) async {
//     print("frfgr<<<<<<>>>>>>");
//
//     try {
//       // var bankdatalist1 =  [] as Future<List<BankData>>;
//       // setState(() {
//       bankdatalist = appendElements(bankdatalist, bankresultList);
//       //});
//       print("<<<<<<>>>>>>");
//
//       bankdatalist = debitTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load debitbankdata');
//     }
//     return bankdatalist;
//   }
//
//   Future<List<BankData>> getCreditBankData(
//       List<BankData> bankresultList) async {
//     try {
//       //creditbankdatalist =  [] as Future<List<BankData>>;
// //
//       // setState(() {
//       creditbankdatalist = appendElements(creditbankdatalist, bankresultList);
//       // });
//
//       creditTotalValue(bankresultList);
//     } catch (Excepetion) {
//       throw Exception('Failed to load creditbankdata');
//     }
//     return creditbankdatalist;
//   }
//
//   Future<List<BankData>> fetchBankData(int type) async {
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String banktoken = tempuserdetail.accessToken.toString();
//     final response = await http.get(
//         Uri.parse(
//             Constants.baseUrl2 + '/Bank/GetBankData?type=' + type.toString()),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $banktoken',
//         });
//     print(response.body);
//
//     List<BankData> tempbankdatalist = <BankData>[];
//     if (response.statusCode == 200) {
//       GetBankDataResponse bankdataResponse =
//       GetBankDataResponse.fromJson(jsonDecode(response.body));
//       for (var i in bankdataResponse.result!) {
//         BankData bd = new BankData();
//         bd.publictoken = i.publictoken;
//         bd.bankthemecolor = i.bankthemecolor;
//         bd.banklogo = i.banklogo;
//         bd.mask = i.mask;
//         bd.accountname = i.accountname;
//         bd.accesstoken = i.accesstoken;
//         bd.bankname = i.bankname;
//         bd.accountid = i.accountid;
//         tempbankdatalist.add(bd);
//       }
//
//       print(jsonEncode(tempbankdatalist));
//       print("reposne>>>>>>>");
//       // getBankData(tempbankdatalist);
//       // return tempbankdatalist ;
//       if (type == Constants.debitcardValue) {
//         tempbankdatalist = getBankData(tempbankdatalist) as List<BankData>;
//         return tempbankdatalist;
//       } else {
//         getCreditBankData(tempbankdatalist);
//         return tempbankdatalist;
//       }
//
//       // return GetBankDataResponse.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to call user childuserid .');
//     }
//   }
//
//   Future<SaveBankDataResponse> saveBankdataResponse() async {
//     SaveBankDataRequest saveBankDataRequest = SaveBankDataRequest();
//     UserDetail tempuserdetail = await Constants.getUserDetail();
//     String accounttoken = tempuserdetail.accessToken.toString();
//     saveBankDataRequest.id = 0;
//     saveBankDataRequest.accountid = bankDataobj.accountid;
//     saveBankDataRequest.accesstoken = bankDataobj.accesstoken;
//     saveBankDataRequest.accountname = bankDataobj.accountname;
//     saveBankDataRequest.mask = bankDataobj.mask;
//     saveBankDataRequest.bankname = bankDataobj.bankname;
//     saveBankDataRequest.banklogo = bankDataobj.banklogo;
//     print("banklogooooooooo>>>>>>>>");
//     print(bankDataobj.banklogo?.length.toString());
//     print(bankDataobj.banklogo);
//     print("banklogooooooooo>>>>>>>>");
//     saveBankDataRequest.bankthemecolor = bankDataobj.bankthemecolor;
//     saveBankDataRequest.publictoken = bankDataobj.publictoken;
//
//     if (isexpanse) {
//       saveBankDataRequest.type = Constants.debitcardValue;
//     } else {
//       saveBankDataRequest.type = Constants.creditcardValue;
//     }
//     //print('/////////request <<<<<<<<<<<<<<<<<<<<<<<<<');
//     //print(jsonEncode(saveBankDataRequest));
//     //print('/////////.request <<<<<<<<<<<<<<<<<<<<<<<<<');
//
//     final savebankresponse =
//     await http.post(Uri.parse(Constants.baseUrl2 + '/Bank/SaveBankData'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $accounttoken',
//         },
//         body: jsonEncode(saveBankDataRequest));
//     // print('/////////.svaebankdata <<<<<<<<<<<<<<<<<<<<<<<<<');
//     // print(accounttoken);
//     // print(saveBankDataRequest);
//     // print(savebankresponse);
//     // print(savebankresponse.body);
//     // print(savebankresponse.statusCode);
//     // print('/////////<<<<svaebankdata<<<<<<<<<<<<<<<<<<<<<');
//
//     if (savebankresponse.statusCode == 200) {
//       fetchBankData(saveBankDataRequest.type!);
//
//       return SaveBankDataResponse.fromJson(jsonDecode(savebankresponse.body));
//     } else {
//       throw Exception('Failed to call plaid save bank data.');
//     }
//   }
//
//   late final Function callback;
//
//   final List<String> iconname = [
//     'asset/images/cart.png',
//     'asset/images/at.png',
//     'asset/images/travel.png',
//     'asset/images/movie.png',
//
//     //   'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//   ];
//   List<String> TransactionIconCategory =[
//     "Bank Fees",
//     "Cash Advance",
//     "Community"
//   ];
//
//
//
//
//
//   // const Dashboard(this.callback);
//
//   Future<TransactionResponse> transactionResponse(
//       String accesstoken, String accountid, int currentmonth) async {
//     String startdate = "";
//     String enddate = "";
//     var now = new DateTime.now().toString();
//     var date = DateTime.parse(now);
//     DateTime firstDayOfMonth = new DateTime(date.year, date.month, 1);
//     // var dateObj = new Date;
//     // var lmonth = dateObj.getUTCMonth() + 1; //months from 1-12
//     // var lday = dateObj.getUTCDate();
//     // var lyear = dateObj.getUTCFullYear();
//     // var lastendDayOfMonth = lyear + "/" + lmonth + "/" + lday;
//     // DateTime lastendDayOfMonth = DateTime(date.year, date.month+1 , 0);
//     DateTime lastendDayOfMonth = (date.month < 12)
//         ? new DateTime(date.year, date.month + 1, 0)
//         : new DateTime(date.year + 1, 1, 0);
//     var fyear = firstDayOfMonth.year;
//     var fmonth = firstDayOfMonth.month.toString().padLeft(2, '0');
//     var fday = firstDayOfMonth.day.toString().padLeft(2, '0');
//     var firstday = "${fyear}-${fmonth}-${fday}";
//     var lyear = lastendDayOfMonth.year;
//     var lmonth = lastendDayOfMonth.month.toString().padLeft(2, '0');
//     var lday = lastendDayOfMonth.day.toString().padLeft(2, '0');
//     var lastday = "${lyear}-${lmonth}-${lday}";
//     startdate = firstday;
//     enddate = lastday;
//
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     // print(startdate);
//     // print(enddate);
//     // print(
//     //     '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
//     Transactionoptions transactionoptions = Transactionoptions();
//     transactionoptions.count = 20;
//     transactionoptions.offset = 0;
//     transactionoptions.accountIds = [accountid];
//     TransactionRequest transactionRequest = TransactionRequest();
//     transactionRequest.clientId = Constants.ClientId;
//     transactionRequest.secret = Constants.Secret;
//     transactionRequest.accessToken = accesstoken;
//     transactionRequest.options = transactionoptions;
//     transactionRequest.startDate = startdate;
//     transactionRequest.endDate = enddate;
//     isLoading1 = false;
//     print(
//         'dasgboardRequest body4--REQUESTTTTTTTTTTTTTTTTTTTT: ${jsonEncode(transactionRequest)}');
//     final response4 =
//     await http.post(Uri.parse(Constants.URL + '/transactions/get'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(transactionRequest));
//     print(
//         '!!!!!!!!!!!!###########################################################################################################');
//     print('dshrespose44 body-----: ${response4}');
//     print(response4.statusCode);
//     print(response4);
//     // print(accesstoken);
//     print('dash##########################################'
//         '###################################################'
//         '##############');
//     if (response4.statusCode == 200) {
//       void dispose() {
//         Loader.hide();
//         isLoading1 = false;
//         // super.dispose();
//       }
//
//       return TransactionResponse.fromJson(jsonDecode(response4.body));
//     } else {
//       //void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//       //}
//
//       throw Exception('Failed to call transaction .');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     var _val;
//     var chidern;
//     return Scaffold(
//
//
//
//       //  resizeToAvoidBottomInset: false,
//
//       body: SafeArea(
//
//           child:
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 dashboardHeader(),
//                 Column(
//                   children:<Widget>[
//                     debitTransaction(),
//                     creditLiability(),
//                     paymentButton(),
//                     viewtransaction(),
//                     Visibility(
//                       maintainSize: true,
//                       maintainAnimation: true,
//                       maintainState: true,
//                       visible: viewVisible1,
//                       child: Container(
//                         width: double.infinity,
//                         //height: 200.0,
//                         // color: Colors.yellow,
//                         child: Column(
//                           //child: Column(
//                           children: [
//                             isLoading1 ?
//                             Center(child: CircularProgressIndicator()) :
//                             ListView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemCount: transactionlist.length,
//                                 itemBuilder: (context, int index) {
//                                   var $;
//                                   return Card(
//                                     color: const Color(0xffF7F6FA),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 80.0,
//                                       margin:
//                                       const EdgeInsets.only(right: 9, left: 9),
//                                       child: ListTile(
//                                           contentPadding: EdgeInsets.only(
//                                               left: 10.0, right: 0.0),
//                                           leading: CircleAvatar(
//                                             radius: 20,
//                                             child:
//                                             Image(image: AssetImage("asset/images/cart.png"),
//                                               //Image.asset( iconname[index],),
//                                             ),
//                                           ),
//                                           title: Text(
//                                             transactionlist[index].name.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           subtitle: Text(
//                                             transactionlist[index]
//                                                 .category
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing: Padding(
//                                             padding: EdgeInsets.only(top: 5),
//                                             child: Column(children: <Widget>[
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                     top: 3, bottom: 3),
//                                                 child: Text(
//                                                   dollar +
//                                                       transactionlist[index]
//                                                           .amount
//                                                           .toStringAsFixed(2),
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w600),
//                                                 ),
//                                               ),
//                                               Text(
//                                                 transactionlist[index]
//                                                     .date
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w500),
//                                               ),
//                                             ]),
//                                           )),
//                                     ),
//                                   );
//                                 }
//                               // );
//                               // }
//                               //},
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 )
//
//
//
//
//
//
//               ],
//             ),
//           )
//       ),
//
//
//
//
//     );
//   }
//
// //<<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//   Widget chartToRun() {
//     LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//     ChartData chartData;
//     ChartOptions chartOptions = const ChartOptions();
//     // Example shows a mix of positive and negative data values.
//     chartData = ChartData(
//       dataRows: const [
//         [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
//         [0,0,0,0,0, -1800.0],
//       ],
//       xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
//       dataRowsLegends: const [
//         'Values',
//         'Values 2'
//       ],
//       dataRowsColors: const [
//         Colors.green,
//         Colors.red,
//       ],
//       chartOptions: chartOptions,
//     );
//     var verticalBarChartContainer = VerticalBarChartTopContainer(
//       chartData: chartData,
//       xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//     );
//
//     var verticalBarChart = VerticalBarChart(
//       painter: VerticalBarChartPainter(
//         verticalBarChartContainer: verticalBarChartContainer,
//       ),
//     );
//     return verticalBarChart;
//   }
//   dashboardHeader() {
//     return   Flexible(
//         child: Container(
//           //height: 120,
//             width: double.infinity,
//             padding: EdgeInsets.all(5),
//             //color: const Color(0xDEB46FEA),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("asset/images/background.png"),
//                   fit: BoxFit.cover,
//                 )),
//             //child: Align(alignment: Alignment.center,
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Row(mainAxisSize: MainAxisSize.min, children: [
//                     Container(
//                         margin: EdgeInsets.all(8),
//                         alignment: Alignment.topLeft,
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           //color: const Color(0x75f5f5f5)
//                         ),
//                         child:
//                         // Row(
//                         //   mainAxisSize: MainAxisSize.min,
//                         //   children: [
//                         Text(
//                           'Test Account',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 15,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold //font color
//                           ),
//                         )
//                       //   ],
//                       // )
//
//                     ),
//                   ]),
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tDebitValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 18,
//                                 //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                                 color: Colors.white,
//                                 //font color
//                                 fontStyle: FontStyle.italic),
//                           ),
//                           Text(
//                             'Debit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//
//
//                       Column(
//                         children: [
//                           Text(
//                             dollar + tCreditValue.toStringAsFixed(2),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 18,
//                               //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                               color: Colors.white,
//                               //font color
//                               fontStyle: FontStyle.italic,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             'Credit',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//                     ]),
//                 Container(
//                   //width: 80,
//                   child:
//                   ExpandableNotifier(  // <-- Provides ExpandableController to its children
//                     child: Column(
//                       children: [
//                         Expandable(           // <-- Driven by ExpandableController from ExpandableNotifier
//                           collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
//                             child: //Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,),
//                             Image.asset(
//                               "asset/images/down.png", // width: 300,
//                               height: 20,
//                               width: 20,
//                               alignment: Alignment.center,
//                             ),
//
//                           ),
//                           expanded: Column(
//                               children: [
//                                 //Text("Backjdsgcygdsucudshiodhycoe"),
//                                 SizedBox(
//                                     width: 400,
//                                     height: 350,
//                                     child: FittedBox(child: Column(
//                                       children: [
//                                         //  addAccountHeader(),
//                                         Container(
//                                           // color: Colors.yellow,
//                                           height: 300,
//                                           width: 350,
//                                           child:
//                                           //Column(
//                                           // children: [
//                                           //  addAccountHeader(),
//                                           VerticalBarChart(
//                                             painter: VerticalBarChartPainter(
//                                               verticalBarChartContainer: verticalBarChartContainer,
//                                             ),
//                                           ),
//
//                                         )
//                                       ],
//                                     ))
//                                 ),
//                                 ExpandableButton(
//                                   child:  Image.asset(
//                                     "asset/images/up.png", // width: 300,
//                                     height: 20,
//                                     width: 20,
//                                     alignment: Alignment.center,
//                                   ),
//                                 ),
//                               ]
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],
//             )
//
//           //  ),
//         ));
//   }
//
//   debitTransaction() {
//     return Scrollbar(
//       child:Column(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Row(mainAxisSize: MainAxisSize.min, children: [
//               Container(
//                   margin: EdgeInsets.all(8),
//                   alignment: Alignment.topLeft,
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: const Color(0xffECDCFF)),
//                   child:
//                   // Row(
//                   //   mainAxisSize: MainAxisSize.min,
//                   //   children: [
//                   Text(
//                     'Debit:' + dollar + tDebitValue.toStringAsFixed(2),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 14,
//                         //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                         color: Colors.black,
//                         //font color
//                         fontStyle: FontStyle.italic),
//                   )
//                 //   ],
//                 // )
//
//               ),
//             ]),
//             // ),
//           ),
//           Container(
//             // height: 250.0,
//             // color: Colors.yellow,
//               child: Column(
//                 children: [
//                   Container(
//                       height: 35,
//                       width: double.infinity,
//                       margin:
//                       EdgeInsets.only(top: 5, left: 15, bottom: 10, right: 15),
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           color: const Color(0xffEDECEE)),
//                       child: Row(
//                         children: [
//                           TextButton(
//                             style: TextButton.styleFrom(
//                               padding: const EdgeInsets.all(5),
//                             ),
//                             onPressed: () async {
//                               isexpanse = true;
//                               Loader.show(context,
//                                   isSafeAreaOverlay: false,
//                                   progressIndicator: CircularProgressIndicator(),
//                                   isBottomBarOverlay: false,
//                                   overlayFromBottom: 80,
//                                   themeData: Theme.of(context)
//                                       .copyWith(accentColor: Colors.black),
//                                   overlayColor: Color(0x0000ffff));
//                               Future.delayed(Duration(seconds: 4), () {
//                                 Loader.hide();
//                               });
//                               var linktoken = await linktokenResponse();
//                               _linkTokenConfiguration = LinkTokenConfiguration(
//                                 token: linktoken.linkToken.toString(),
//                               );
//
//                               PlaidLink.open(configuration: _linkTokenConfiguration);
//                             },
//                             child: Image(
//                               image: AssetImage("asset/images/Plus.png"),
//                               width: 100,
//                               height: 100,
//                             ),
//                           ),
//                           Text('Connect To Debit Account'),
//                         ],
//                       )),
//                   //-----------------------------------debir////-----------
//                   Container(
//                     width: double.infinity,
//                     // height: 150.0,
//                     margin: const EdgeInsets.only(bottom: 4, top: 4),
//                     color: Colors.white,
//                     child: ListView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       children: [
//                         FutureBuilder<List<BankData>>(
//                           future: bankdatalist,
//                           builder: (context, snapshot) {
//                             if(snapshot.hasData)
//                             {
//                               return
//                                 ExpansionPanelList(
//                                   animationDuration: Duration(milliseconds: 2000),
//                                   children:
//                                   snapshot.data!.map<ExpansionPanel>((BankData item) {
//                                     return ExpansionPanel(
//                                       headerBuilder:
//                                           (BuildContext context, bool isExpanded) {
//                                         return ListTile(
//                                           iconColor: Colors.red,
//                                           leading: CircleAvatar(
//                                             radius: 30,
//                                             child:
//                                             // Image.memory(Base64Codec().decode(item.banklogo.toString()),),
//                                             Image.network(item.banklogo.toString()),
//                                           ),
//                                           title: Text(
//                                             item.bankname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                           trailing:
//                                           item.totalamount ==null?
//                                           Text(dollar+'0',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ):
//                                           Text('${item.totalamount.toString()}',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500
//                                             ),
//                                           ),
//                                           // Text(
//                                           //   dollar + item.totalamount.toString(), "0",
//                                           //
//                                           //   style: TextStyle(
//                                           //       color: Colors.black,
//                                           //       fontSize: 16,
//                                           //       fontWeight: FontWeight.w500),
//                                           //),
//                                           subtitle: Text(
//                                             item.accountname.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                           selected: false,
//                                         );
//                                       },
//                                       body:
//                                       // Text("gcdsgchgdsv"),
//                                       debitBuildExpandableContent(
//                                           item.accesstoken.toString(),
//                                           item.accountid.toString(),
//                                           cmonth),
//                                       isExpanded: item.isExpaneded,
//                                     );
//                                   }).toList(),
//                                   dividerColor: Colors.grey,
//                                   expansionCallback: (int index, bool isExpanded) {
//                                     setState(() {
//                                       snapshot.data![index].isExpaneded = !isExpanded;
//                                     });
//                                   },
//                                 );
//                             }
//                             else
//                             {
//                               return Center(
//                                   child: CircularProgressIndicator());
//                             }
//
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
// //chnage heiught to 200
//                   //--------------------------
//                 ],
//               )),
//
//         ],
//       ),
//     );
//   }
//
//   creditLiability() {
//     return Column(children: [
//       Align(
//         alignment: Alignment.topLeft,
//         child: Row(mainAxisSize: MainAxisSize.min, children: [
//           Container(
//               margin: EdgeInsets.all(8),
//               alignment: Alignment.topLeft,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: const Color(0xffECDCFF)),
//               child:
//               // Row(
//               //   mainAxisSize: MainAxisSize.min,
//               //   children: [
//               Text(
//                 'Credit: ' + dollar + tCreditValue.toStringAsFixed(2),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 14,
//                     //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                     color: Colors.black,
//                     //font color
//                     fontStyle: FontStyle.italic),
//               )
//             //   ],
//             // )
//
//           ),
//         ]),
//       ),
//       Container(
//           height: 35,
//           width: double.infinity,
//           margin: EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 15),
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: const Color(0xffEDECEE)),
//           child: Row(
//             children: [
//               TextButton(
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.all(5),
//                 ),
//                 onPressed: () async {
//                   isexpanse = false;
//                   Loader.show(context,
//                       isSafeAreaOverlay: false,
//                       progressIndicator: CircularProgressIndicator(),
//                       isBottomBarOverlay: false,
//                       overlayFromBottom: 80,
//                       themeData:
//                       Theme.of(context).copyWith(accentColor: Colors.black),
//                       overlayColor: Color(0x0000ffff));
//                   Future.delayed(Duration(seconds: 4), () {
//                     Loader.hide();
//                   });
//                   var creditlinktoken = await creditlinktokenResponse();
//                   creditlinkTokenConfiguration = LinkTokenConfiguration(
//                     token: creditlinktoken.linkToken.toString(),
//                   );
//
//                   PlaidLink.open(configuration: creditlinkTokenConfiguration);
//                 },
//                 child: Image(
//                   image: AssetImage("asset/images/Plus.png"),
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//               Text('Connect To Credit Account'),
//               //Text('Connect To Credit Account2'),
//             ],
//           )),
//       Container(
//         width: double.infinity,
//         // height: 150.0,
//         margin: const EdgeInsets.only(bottom: 0, top: 0),
//         color: Colors.white,
//         child: ListView(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//
//           children: [
//             FutureBuilder<List<BankData>>(
//               future: creditbankdatalist,
//               builder: (context, snapshot) {
//                 if(snapshot.hasData)
//                 {
//                   return
//                     ExpansionPanelList(
//                       animationDuration: Duration(milliseconds: 2000),
//                       children: snapshot.data!.map<ExpansionPanel>((BankData item) {
//                         return ExpansionPanel(
//                           headerBuilder: (BuildContext context, bool isExpanded) {
//                             return ListTile(
//                               iconColor: Colors.red,
//                               leading: CircleAvatar(
//                                   radius: 30,
//                                   child:
//                                   //Image.memory(Base64Codec().decode(item.banklogo.toString())),
//
//                                   Image.network(item.banklogo.toString())),
//                               title: Text(
//                                 item.bankname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               trailing:
//                               // Text(
//                               //   dollar + item.totalamount.toString(),
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 16,
//                               //       fontWeight: FontWeight.w500),
//                               // ),
//                               item.totalamount ==null?
//                               Text(dollar+'0',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ):
//                               Text('${item.totalamount!.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 item.accountname.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               selected: false,
//                             );
//                           },
//                           body: //Text('hgsdvfghjbvsdjhcgsdh'),
//                           creditBuildExpandableContent(
//                             item.accesstoken.toString(),
//                             item.accountid.toString(),
//                           ),
//                           isExpanded: item.isExpaneded,
//                         );
//                       }).toList(),
//                       dividerColor: Colors.grey,
//                       expansionCallback: (int index, bool isExpanded) async {
//                         setState(() {
//                           snapshot.data![index].isExpaneded = !isExpanded;
//                         });
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // print(index);
//                         // print(isExpanded);
//                         // print(">>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<");
//                         // TransactionResponse tempresponse2 =
//                         //     await transactionResponse(
//                         //         snapshot.data![index].accesstoken.toString(),
//                         //         snapshot.data![index].accountid.toString(),
//                         //         cmonth);
//                         //
//                         // transactionlist =
//                         //     tempresponse2.transactions as List<Transactions>;
//                         // viewVisible = true;
//                         viewVisibleTransaction = true;
//                         showWidget();
//                         LiabilityResponse tempresponse = await liabilityData(
//                             snapshot.data![index].accesstoken.toString(),
//                             snapshot.data![index].accountid.toString());
//                         liabilitylist = tempresponse.liabilities as Liabilities;
//                         viewVisible = false;
//                         viewVisible2 = false;
//                         viewVisible3 = false;
//                         if (liabilitylist.student != null) {
//                           stdlist = liabilitylist.student!;
//                           viewVisible = true;
//                           //  print("student");
//                           setStudentLoanContainer(liabilitylist.student!.first, 0);
//                         }
//                         if (liabilitylist.mortgage != null) {
//                           mrtlist = liabilitylist.mortgage!;
//                           viewVisible2 = true;
//                           //  print("mortgage");
//                           setMortgage(liabilitylist.mortgage!.first, 0);
//                         }
//                         if (liabilitylist.credit != null) {
//                           crdlist = liabilitylist.credit!;
//                           viewVisible3 = true;
//                           //  print("credit");
//                         }
//                       },
//                     );
//                 }
//                 else
//                 {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//               },
//             ),
//           ],
//         ),
//       ),
//     ]);
//   }
//
//   paymentButton() {
//     return Container(
//       height: 38,
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 15, bottom: 20.0, left: 25, right: 25),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//             //color: const Color(0xFFA781D3),
//           )),
//       child: TextButton(
//         style: TextButton.styleFrom(
//           backgroundColor: const Color(0xFFA781D3),
//           padding: const EdgeInsets.all(5),
//         ),
//         onPressed: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => AddAccount()),
//           // );
//         },
//         child: Text(
//           'Make a Payment',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
//
//   bottomNavBar() {
//     return Container(
//       height: 45,
//       padding: const EdgeInsets.all(
//         8,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(2),
//         color: const Color(0xF5F7F6FA),
//       ),
//       //alignment: Alignment.bottomCenter,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           IconButton(
//             // icon: Image.asset('assets/images/dashboard.png'),
//             icon: ImageIcon(
//               AssetImage("asset/images/home2.png"),
//               size: 140,
//               color: isFavourite ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//
//             onPressed: () {
//               setState(() {
//                 isFavourite = false;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pbox.png"),
//               size: 140,
//               color: isFavourite1 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   //MaterialPageRoute(builder: (context) => Spend(this.)),
//               // );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = false;
//                 isFavourite2 = true;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/pmoney.png"),
//               size: 140,
//               color: isFavourite2 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PlanAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = false;
//                 isFavourite3 = true;
//               });
//             },
//           ),
//           IconButton(
//             icon: ImageIcon(
//               AssetImage("asset/images/paccount.png"),
//               size: 140,
//               color: isFavourite3 ? const Color(0xFFA781D3) : Colors.grey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddAccount1()),
//               );
//               setState(() {
//                 isFavourite = true;
//                 isFavourite1 = true;
//                 isFavourite2 = true;
//                 isFavourite3 = false;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   viewtransaction() {
//     return Container(
//       child: Row(children: [
//         Container(
//             margin: EdgeInsets.all(8),
//             alignment: Alignment.topLeft,
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: const Color(0xffECDCFF)),
//             child:
//             // Row(
//             //   mainAxisSize: MainAxisSize.min,
//             //   children: [
//             Text(
//               'Recent Transactions',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 14,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: Colors.black,
//                   //font color
//                   fontStyle: FontStyle.italic),
//             )
//           //   ],
//           // )
//
//         ),
//         Spacer(),
//         Container(
//           margin: EdgeInsets.all(8),
//           alignment: Alignment.topRight,
//           child: InkWell(
//             onTap: () async {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TransactionDetail(),
//                   // Pass the arguments as part of the RouteSettings. The
//                   // DetailScreen reads the arguments from these settings.
//                   settings: RouteSettings(
//                     arguments: transactionlist,
//                   ),
//                 ),
//               );
//               setState(() {
//                 //selectedIndex = i;
//               });
//             },
//             child: new Text(
//               "View All",
//               style: TextStyle(
//                   fontSize: 13,
//                   //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
//                   color: const Color(0xffA781D3),
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
//
// //   <<<<<<<<<<<<<<<<<<<UI DashboardView>>>>>>>>>>>>>>>>>>>>>>>>>>
// //
// // ------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   debitTotalValue(List<BankData> debitlistbankdata) async {
//     double totalTransactionValue = 0;
//     for (var debitdata in debitlistbankdata) {
//       double debitcardtotalTransactionValue = 0;
//       var response = await transactionResponse(debitdata.accesstoken.toString(),
//           debitdata.accountid.toString(), cmonth);
//       for (var t_transaction in response.transactions!) {
//         transactionlist.add(t_transaction);
//         totalTransactionValue += t_transaction.amount;
//         debitcardtotalTransactionValue += t_transaction.amount;
//         print("||||||||||");
//
//         print(t_transaction.amount);
//       }
//       debitdata.totalamount = debitcardtotalTransactionValue;
//       debitGraphdata.add(debitcardtotalTransactionValue);
//       graphbankname.add(debitdata.bankname.toString());
//       creditGraphdata.add(0);
//       print("||||||||||¥¥¥¥¥¥¥¥¥¥¥¥total debitttttttt" +
//           totalTransactionValue.toString());
//       print(debitdata.totalamount);
//       print(debitcardtotalTransactionValue);
//     }
//     setState(() {
//       tDebitValue = totalTransactionValue;
//     });
//     print(jsonEncode(debitlistbankdata));
//     return debitlistbankdata;
//   }
//
//   creditTotalValue(List<BankData> creditlistbankdata) async {
//     double totalLiabilityValue = 0;
//     for (var cdata in creditlistbankdata) {
//       double creditcardtotalLiabilityValue = 0;
//
//       var libilityresponse = await liabilityData(
//           cdata.accesstoken.toString(), cdata.accountid.toString());
//       liabilitylist = libilityresponse.liabilities as Liabilities;
//       if (liabilitylist.student != null) {
//         for (var t_liability in liabilitylist.student!) {
//           totalLiabilityValue += t_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += t_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.mortgage != null) {
//         for (var s_liability in liabilitylist.mortgage!) {
//           totalLiabilityValue += s_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += s_liability.lastPaymentAmount!;
//         }
//       }
//       if (liabilitylist.credit != null) {
//         for (var c_liability in liabilitylist.credit!) {
//           totalLiabilityValue += c_liability.lastPaymentAmount!;
//           creditcardtotalLiabilityValue += c_liability.lastPaymentAmount!;
//         }
//       }
//       // print("||||||||||total creditttttttt"+ totalLiabilityValue.toString());
//       cdata.totalamount = creditcardtotalLiabilityValue;
//       debitGraphdata.add(0);
//       graphbankname.add(cdata.bankname.toString());
//       creditGraphdata.add(creditcardtotalLiabilityValue);
//     }
//     // print("||||||||||total creditttttttt value"+ totalLiabilityValue.toString());
//
//     setState(() {
//       tCreditValue = totalLiabilityValue;
//     });
//     return creditlistbankdata;
//   }
//
//   debitBuildExpandableContent(
//       String accessToken, String accountID, int cmonth) {
//     // print('+++++++++++++++++}');
//     var response = transactionResponse(accessToken, accountID, cmonth);
//     //
//     // print(response);
//     if (response == null) {
//       return Text(
//         'error ',
//         style: TextStyle(color: Colors.black),
//         //  ),
//       );
//     } else {
//       return //Text("jhbvkjndfkjvnfdv");
//         FutureBuilder<TransactionResponse>(
//             future: response,
//             builder: (context, snapshot) {
//               //   print('snnnnnnnnapshot');
//               //  print(snapshot.data!.transactions.toString());
//               return debitBuildTransactionListView(snapshot.data!);
//             });
//     }
//     ;
//   }
//
//   debitBuildTransactionListView(TransactionResponse tdata) {
//     //Text("jhbvkjndfkjvnfdv");
//     return //Text("credit4444444444444credit");
//       Column(
//         children: [
//           //for (var t in tdata.transactions!)
//           if (viewVisibleTransaction) ...[
//             Container(
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     for (var t in tdata.transactions!)
//                       Column(children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(
//                               top: 5, left: 13, right: 13, bottom: 3),
//                           color: const Color(0xffF5F5F5),
//                           child: ListTile(
//                             contentPadding: EdgeInsets.all(8),
//                             leading: CircleAvatar(
//                               radius: 20,
//                               child: Image(
//                                 image: AssetImage("asset/images/cart.png"),
//                                 //width: 40,
//                                 //color: const Color(0xffECDCFF)
//                               ),
//                             ),
//                             title: Padding(
//                               padding: EdgeInsets.only(top: 5, bottom: 8),
//                               child: Text(
//                                 t.category.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                             trailing: Column(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 10, top: 5),
//                                   child: Text(
//                                     dollar + t.amount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(bottom: 2),
//                                   child: Text(
//                                     t.date.toString(),
//                                     style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             subtitle: Padding(
//                               padding: EdgeInsets.only(bottom: 2),
//                               child: Text(
//                                 t.name.toString(),
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             selected: true,
//                           ),
//                         )
//                       ]),
//                   ],
//                 )),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     //selected: true;
//   }
//
// //------->>>>>>>>>>>Debit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
// //------->>>>>>>>>>>CREDIT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//   creditBuildExpandableContent(String accessToken, String accountID) {
//     //print('+++++++++++++++++}');
//     var libilityresponse = liabilityData(accessToken, accountID);
//     print(libilityresponse);
//     // return Text("abcd55555555");
//     if (libilityresponse == null) {
//       // print('2+++++++++++++++++');
//
//       //return ListTile(
//       return Text(
//         'error',
//         style: TextStyle(color: Colors.black),
//       );
//       //  );
//     } else {
//       // return Text("222222222222");
//       return FutureBuilder<LiabilityResponse>(
//           future: libilityresponse,
//           builder: (context, snapshot) {
//             //   print('snnnnnnnnapshot');
//             //  print(snapshot.data!.liabilities.toString());
//             // return Text("233222222222");
//             return creditBuildLiabilityListView(snapshot.data!);
//           });
//     }
//     ;
//   }
//
//   creditBuildLiabilityListView(LiabilityResponse ldata) {
//     return //Text("4444444444444");
//       Column(
//         children: [
//           if (viewVisible) ...[
//             Container(
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   for (var i in stdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 15, left: 15, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             color: const Color(0xffF5F5F5),
//
//                             // color: const Color(0xffEFF4F8),
//                           ),
//                           child: ListView(
//                             children: <Widget>[
//                               // Text(
//                               //   "STUDENT LOAN",
//                               //   textAlign: TextAlign.center,
//                               //   style: TextStyle(
//                               //       color: Colors.black,
//                               //       fontSize: 13,
//                               //       fontWeight: FontWeight.w700),
//                               // ),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.lastPaymentDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LOAN TYPE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.loanName.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("EXPECT PAY",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.expectedPayoffDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("ORIGATION DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.originationDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("OUTSTANDING INTEREST",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       i.outstandingInterestAmount.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("INTEREST RATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.interestRatePercentage.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("GUARANTER",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.guarantor.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("PAYMENT REFERENCE NUMBER ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(i.paymentReferenceNumber.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD INTEREST PAID",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdInterestPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("YTD PRINCIPAL PAID ",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //         dollar +
//                               //             i.ytdPrincipalPaid!.toStringAsFixed(2),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               // Row(children: <Widget>[
//                               //   Align(
//                               //     alignment: Alignment.topLeft,
//                               //     child: Text("SEQUENCE NUMBER",
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 13,
//                               //             fontWeight: FontWeight.w700)),
//                               //   ),
//                               //   Spacer(),
//                               //   Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(i.sequenceNumber.toString(),
//                               //         style: TextStyle(
//                               //             color: Colors.black,
//                               //             fontSize: 11,
//                               //             fontWeight: FontWeight.w500)),
//                               //   ),
//                               // ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("TOTAL AMOUNT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount!.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500)),
//                                 ),
//                               ]),
//                             ],
//                           ),
//                           //),
//                         ),
//                       ],
//                       //),
//
//                       // ],
//                     ),
//                   //  Text("Last payment Amount"+ i.lastPaymentAmount.toString()),
//                 ],
//               ),
//             )
//           ] else if (viewVisible2) ...[
//             Container(
//               width: double.infinity,
//               child: Column(
//                 children: <Widget>[
//                   for (var i in mrtlist)
//                   // ListView(
//                     Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 100,
//                           margin: const EdgeInsets.only(
//                               right: 20, left: 20, top: 4, bottom: 4),
//                           padding: const EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0)),
//                             //  color: const Color(0xffEFF4F8),
//                             color: const Color(0xffF5F5F5),
//                           ),
//                           child: ListView(children: [
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.lastPaymentDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LAST PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar +
//                                       i.lastPaymentAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TYPE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTypeDescription.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "LOAN TERM ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.loanTerm.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ORIGATION DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.originationDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD PRINICIPAL PAID ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdPrincipalPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "CURRENT LATE FEE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.currentLateFee!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "NEXT MONTH PAYMENT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "YTD INTEREST PAID",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.ytdInterestPaid!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "MATURITY DATE ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.maturityDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "ESCROW BALANCE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.escrowBalance.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "DUE AMOUNT ",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   dollar + i.pastDueAmount!.toStringAsFixed(2),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "PAST DUE DATE",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Text(
//                                   i.nextPaymentDueDate.toString(),
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ]),
//                             Row(children: <Widget>[
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "TOTAL AMOUNT",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Spacer(),
//                               // Container(
//                               //   margin: const EdgeInsets.only(
//                               //       top: 10),
//                               //   child: Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Text(
//                               //       dollar + f.format(
//                               //           i.originationPrincipalAmount),
//                               //       style: TextStyle(
//                               //           color: Colors.black,
//                               //           fontSize: 14,
//                               //           fontWeight: FontWeight.w500),),
//                               //
//                               //   ),
//                               // ),
//                             ]),
//                           ]),
//                         ),
//
//                         //888****
//                       ],
//                     ),
//                 ],
//               ),
//             )
//           ] else if (viewVisible3) ...[
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: <Widget>[
//                   for (var i in crdlist)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       // use whichever suits your need
//                       children: <Widget>[
//                         Container(
//                             width: double.infinity,
//                             height: 100.0,
//                             margin: const EdgeInsets.only(right: 15, left: 15),
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(8.0),
//                                   bottomRight: Radius.circular(8.0),
//                                   topLeft: Radius.circular(8.0),
//                                   bottomLeft: Radius.circular(8.0)),
//                               // color: const Color(0xffEFF4F8),
//                               color: const Color(0xffF5F5F5),
//                             ),
//                             child: ListView(children: [
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT DATE",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST STATEMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     dollar +
//                                         i.lastPaymentAmount.toStringAsFixed(2),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("DUE DATE ",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       i.nextPaymentDueDate.toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("MINIMUM PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.minimumPaymentAmount!
//                                               .toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                               Row(children: <Widget>[
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text("LAST PAYMENT",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                                 Spacer(),
//                                 Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text(
//                                       dollar +
//                                           i.lastPaymentAmount.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500),
//                                     )),
//                               ]),
//                             ])),
//                       ],
//                     ),
//                 ],
//                 //),
//
//                 // ],
//               ),
//             ),
//           ] else
//             Container(
//               child: Text("Loading..."),
//             ),
//         ],
//       );
//     selected:
//     true;
//   }
//
//   void setStudentLoanContainer(Student student, double sliderValue) {
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var startdate = DateTime.parse(student.disbursementDates!.first);
//     var enddate = DateTime.parse(student.expectedPayoffDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     //num i = yearpassed.();
//     // num yearpassed = (currentdate.year - startdate.year);
//     //int endyear = (enddate.year - currentdate.year)
//     // ;
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(student.disbursementDates!.first);
//     // print(student.expectedPayoffDate);
//     // print(_loanyearvalues.toString());
//   }
//
//   void setMortgage(Mortgage mortgage, double mtgsliderValue) {
//     // var currentdate =  new DateTime.now();//DateTime.parse(currentdate);
//     // var startdate = DateTime.parse(mortgage.maturityDate!);
//     // var enddate = DateTime.parse(mortgage.originationDate!);
//     // int myearpassed = (currentdate.year - startdate.year);
//     // int mendyear = enddate.year - startdate.year ;
//     // print(myearpassed.toString());
//     // print(mendyear.toString());
//     // print(_mloanyearvalues.toString());
//     // m_minrange =  double.parse(myearpassed.toString()); ;
//     // m_maxrange =double.parse(mendyear.toString());   ;
//     // double mtgint =  m_maxrange  ;
//     // print("###3333####33hvcudfyhvuyfuyvuy");
//     // if(mtgsliderValue != 0)
//     // {
//     //   mtgint = mtgsliderValue ;
//     // }
//     // if(_mloanyearvalues <m_minrange) {
//     //   _mloanyearvalues = m_maxrange;
//     // }
//     // mbalanceamount = Constants.mAmortization(mortgage.originationPrincipalAmount,
//     //     mortgage.interestRate!.percentage as double, mtgint , myearpassed.toInt() );
//     // m_saveamount = mloanmaxvalue - mbalanceamount;
//     var currentdate = new DateTime.now(); //DateTime.parse(currentdate);
//     var enddate = DateTime.parse(mortgage.maturityDate!);
//     var startdate = DateTime.parse(mortgage.originationDate.toString());
//     int yearpassed = (currentdate.year - startdate.year);
//     int endyear = enddate.year - startdate.year;
//     // print(yearpassed.toString());
//     // print(endyear.toString());
//     // print(mortgage.maturityDate);
//     // print(mortgage.originationDate);
//     // print(_mloanyearvalues.toString());
//   }
//
// //############
// }
//
// //>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
//
// //----3
// Future<RefreshTokenResponse> valueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call redfresh token  .');
//   }
// }
//
// //>>>>>>>>>>>>>>-------------------------tokenAPI's--------------------------------->>>>>>>>>>>>>>>
// Future<LinkTokenResponse> linktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["transactions", "auth"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // prfint(Uri.parse(Constants.URL + '/link/token/create'));
// //  print('>>>>>>>>>>>>>>>>>>>>>>>> Link Token <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   // print(response.body);
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> institutionResponse(String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   print(
//       '>>>>>>>>>>>>>>>>>>>>>>>> institutionResponse <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   //print(response2.body);
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> accessTokenResponse(String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   print(
//       '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
//
// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
//
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }
//
// DateTime formatTimeOfDay(int month, int year, int day) {
//   final now = new DateTime.now();
//   final dt = DateTime(now.year, now.month, now.day);
//   return dt;
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Future<LinkTokenResponse> creditlinktokenResponse() async {
//   User user = User();
//   user.clientUserId = "115";
//   TokenRequest tokenRequest = TokenRequest();
//   tokenRequest.clientId = Constants.ClientId;
//   tokenRequest.secret = Constants.Secret;
//   tokenRequest.clientName = "Plaid Test App";
//   tokenRequest.user = user;
//   tokenRequest.products = ["liabilities"];
//   tokenRequest.countryCodes = ['US'];
//   tokenRequest.language = "en";
//   tokenRequest.webhook = "https://sample-web-hook.com";
//   final response =
//   await http.post(Uri.parse(Constants.URL + '/link/token/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(tokenRequest));
//   // print(Uri.parse(Constants.URL + '/link/token/create'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     @override
//     void dispose() {
//       Loader.hide();
//       // super.dispose();
//     }
//
//     return LinkTokenResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     @override
//     void dispose() {
//       Loader.hide();
//
//       // super.dispose();
//     }
//
//     throw Exception('Failed to call plaid App linktoken.');
//   }
// }
//
// Future<InstitutionResponse> creditinstitutionResponse(
//     String InstituteId) async {
//   InstituteOptions options = InstituteOptions();
//   options.includeOptionalMetadata = true;
//   InstitutionResquest institutionResquest = InstitutionResquest();
//   institutionResquest.institutionId = InstituteId;
//   institutionResquest.clientId = Constants.ClientId;
//   institutionResquest.secret = Constants.Secret;
//   institutionResquest.countryCodes = ['US'];
//   institutionResquest.options = options;
//   //print('Request body-----: ${jsonEncode(institutionResquest)}');
//   final response2 =
//   await http.post(Uri.parse(Constants.URL + '/institutions/get_by_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(institutionResquest));
//   // print('###########################################################################################################');
//   if (response2.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON
//     return InstitutionResponse.fromJson(jsonDecode(response2.body));
//   } else {
//     throw Exception('Failed to call institution .');
//   }
// }
//
// Future<AccessTokenResponse> creditaccessTokenResponse2(
//     String publicToken) async {
//   bool _isLoading = true;
//   AccessTokenRequest accessTokenRequest = AccessTokenRequest();
//   accessTokenRequest.clientId = Constants.ClientId;
//   accessTokenRequest.secret = Constants.Secret;
//   accessTokenRequest.publicToken = publicToken;
//   // print('Request body3-----: ${jsonEncode(accessTokenRequest)}');
//   final response3 =
//   await http.post(Uri.parse(Constants.URL + '/item/public_token/exchange'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(accessTokenRequest));
//
//   //print('##########################################'
//   // '###################################################'
//   // '##############');
//   // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
//   // print('respose33 body3-----: ${jsonEncode(response3.body)}');
//   // print('&&&&&&&&&&&&&^^@@@@@@@@@@@@@@@@*V************************V^^^#########!!!!!!');
//   //print(response3.body);
//   if (response3.statusCode == 200) {
//     bool _isLoading = false;
//     return AccessTokenResponse.fromJson(jsonDecode(response3.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     bool _isLoading = false;
//     throw Exception('Failed to call accessToken .');
//   }
// }
//
// Future<LiabilityResponse> liabilityData(
//     String accesstoken, String accountid) async {
//   bool _isLoading = true;
//   LiabilityOptions liabilityOptions = LiabilityOptions();
//   liabilityOptions.accountIds = [accountid];
//   LiabilityRequest liabilityRequest = LiabilityRequest();
//   liabilityRequest.clientId = Constants.ClientId;
//   liabilityRequest.secret = Constants.Secret;
//   liabilityRequest.accessToken = accesstoken;
//   liabilityRequest.options = liabilityOptions;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final response4 =
//   await http.post(Uri.parse(Constants.URL + '/liabilities/get'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(liabilityRequest));
//
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(response4.body)}');
//   //  print('credit bpdyyyyy');
//   //  print(response4.body);
//   //  print(response4.statusCode);
//   //  print(jsonEncode(liabilityRequest));
//   // print('credit bpdyyyyy');
//
//   // print(
//   //     '#################################credit##################################################');
//
//   if (response4.statusCode == 200) {
//     bool _isLoading = false;
//
//     return LiabilityResponse.fromJson(jsonDecode(response4.body));
//   } else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
//
// //>>>>>>>>>>>>>>>>>>>>>>>>>>liability>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //------
// Future<RefreshTokenResponse> refreshValueToken(String refreshtoken) async {
// //  bool _isLoading = true;
//   RefreshTokenRequest refreshTokenRequest = RefreshTokenRequest();
//   refreshTokenRequest.refreshToken = refreshtoken;
//   // print('Request body4-----: ${jsonEncode(liabilityRequest)}');
//   final responsetoken = await http.post(
//       Uri.parse(Constants.baseUrl2 + '/User/UpdateRefreshToken'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode(refreshTokenRequest));
//   //
//   // print('##########################################'
//   //     '###################################################'
//   //     '##############');
//   // print('respose44 body44-----: ${jsonEncode(responsetoken.body)}');
//   // print(
//   //     '#################################credit##################################################');
//   //
//   // print(responsetoken.body);
//   // print(
//   //     '#################################credit##################################################');
//
//   if (responsetoken.statusCode == 200) {
//     bool _isLoading = false;
//
//     return RefreshTokenResponse.fromJson(jsonDecode(responsetoken.body));
//   }
//   // else if(responsetoken.statusCode == 401){
//   //
//   //
//   // }
//   else {
//     bool _isLoading = false;
//     throw Exception('Failed to call  .');
//   }
// }
// class MyLabelCommonOptions extends LabelCommonOptions {
//   const MyLabelCommonOptions(
//       ) : super ();
//
//   /// Override [labelTextStyle] with a new font, color, etc.
//   @override
//   // get labelTextStyle => GoogleFonts.comforter(
//   //  style: TextStyle(
//   //   color: Color,
//   //   fontSize: 14.0,
//   //   fontWeight: FontWeight.w400, // Regular
//   //   ),
//   // );
//
//   get labelTextStyle =>
//       const ChartOptions().labelCommonOptions.labelTextStyle.copyWith(
//           color: Colors.white
//       );
//
// }
///dfkjvhuifdhvuihyvuhhvy///dfkjvhuifdhvuihyvuhhvy