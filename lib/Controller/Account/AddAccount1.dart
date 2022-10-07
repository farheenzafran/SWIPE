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
import 'package:swipeapp/Controller/Account/AddAccountSuccessful3.dart';
import 'package:swipeapp/Controller/Account/ManageAccount2.dart';
import 'package:swipeapp/Controller/Request/AddUserRequest.dart';
import 'package:swipeapp/Controller/Response/AddUserResponse.dart';
import 'package:swipeapp/Controller/Response/ChildUserResponse.dart';
import '../../Model Helper.dart';
import '../Dashboard.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import '../Response/UserDeatail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAccount1 extends StatefulWidget {
  const AddAccount1({
    Key? key,
  }) : super(key: key);

  //AddAccount() : super();

  @override
  addacountState createState() => addacountState();
}

class addacountState extends State<AddAccount1> {
  late Function setTabIndex;

  late String countryCode;
  late String phoneNumber;
  late Future<List<ChildDataResult>>
      datalist; //= [] as Future<List<ChildDataResult>>;
  void initState() {
    super.initState();
    datalist = getChildUser();
  }

  Future<List<ChildDataResult>> getChildUser() async {
    UserDetail tempuserdetail = await Constants.getUserDetail();
    String ctoken = tempuserdetail.accessToken.toString();
    final response = await http.get(
        Uri.parse(Constants.baseUrl2 + '/User/GetChildUser'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $ctoken',
        });
    print(ctoken);
    print("!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!");
    print(response);
    print("bodyyyyyyyyyyyyyyyyy>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<");
    print(response.body);
    print(">>>>>>>>>>>>>>>>>>>>>>!!!!!!!!!!!!!!!!!!!!!!><<<<<<<<<<<<<<<<<<<<");
    print(">>>>>>>>>>>>>>>>>>>>>>!!!!!!!!!!!!!!!!!!!!!!><<<<<<<<<<<<<<<<<<<<");
    print(response.statusCode);
    print(">>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<");

    if (response.statusCode == 200) {
      ChildUserResponse userResponse =
          ChildUserResponse.fromJson(jsonDecode(response.body));
      return userResponse
          .result!; // usResult.fromJson(jsonDecode(response.body));

    } else {
      // return List<ChildDataResult>;
      throw Exception('Failed to call user getgoalchild .');
    }
  }

  String bname = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              addAccountHeader(),
              addButton(),
            ]),
      )),
    );
  }

//<<<<<<<<<<<<<<<<<<<UI View>>>>>>>>>>>>>>>>>>>>>>>>>>
  addAccountHeader() {
    return Flexible(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 18),
              //color: const Color(0xDEB46FEA),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("asset/images/background.png"),
                fit: BoxFit.cover,
              )),
              child: Column(children: [
                Container(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Icons.settings;
                    },
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(mainAxisSize: MainAxisSize.min, children: [
                  Align(
                    alignment: Alignment.center,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                          margin: EdgeInsets.all(8),
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0x54ecdcff)),
                          child:
                              // Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              Text(
                            'Admin Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                                color: Colors.white,
                                //font color
                                fontStyle: FontStyle.normal),
                          )
                          //   ],
                          // )

                          ),
                    ]),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                    //  color: Colors.yellow,
                      child: Row(
                        children: [
                          showuserData(),
                          addButton(),
                        ],
                      ))
                ]),
              ])

              //  ),
              ),
        ],
      ),
    ));
  }

  addButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                bottom: 5.0,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAccount2()),);

                },
                child: Image.asset('asset/images/addaccount.png',
                    width: 50.0, height: 50.0),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Add Account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ));
  }

  addchild() {
    return Container(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          //  addChildUser();
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAccount()),);
        },
        child: Image.asset('asset/images/Plus.png', width: 50.0, height: 50.0),
      ),
    );
  }

  showuserData() {
    return Container(
    //  color: Colors.red,
      height: 120,
      width: 190,
      margin: EdgeInsets.only(bottom: 5.0, right: 15),
      child: FutureBuilder<List<ChildDataResult>>(
          future: datalist,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    var item = snapshot.data![i];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('asset/images/pic.png'),
                        ),
                        Text(
                          snapshot.data![i].firstName.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          snapshot.data![i].lastName.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    );

                    // ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: [

                    // ]
                    //   );

                    // Text("first return>>>>>>"+ item.toString());
                  });
            } else {
              return Container();
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
          }),
    );
  }





//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
