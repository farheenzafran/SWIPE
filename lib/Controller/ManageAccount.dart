import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:swipeapp/Controller/Dashboard.dart';
import 'package:swipeapp/main.dart';
import '../Model Helper.dart';
import 'AddMember.dart';
import 'Request/AddUserRequest.dart';
import 'Response/AddUserResponse.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
String? select;
class ManageAccount extends StatefulWidget {
  //const ManageAccount({Key? key}) : super(key: key);

  @override
  _manageacountState createState() => _manageacountState();
}

class _manageacountState extends State<ManageAccount> {

 //  late String phoneNumber;
 //  late String countryCode;
 //  late String email;
 //  late String fname;
 //  late String lname;
 // // ManageAccount(this.phoneNumber, this.countryCode);
 //
 //  TextEditingController phoneController = TextEditingController();
 //  TextEditingController fnameController = TextEditingController();
 //  TextEditingController lnameController = TextEditingController();
 //  TextEditingController emailController = TextEditingController();

  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  addAccountHeader(),
                  emailVerify(),
                  paymentButton(),

                ],
              ),
            ],

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
              'Manage Member Account',
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
  emailVerify()
  {
    return
      Column(
        children: [

              RadioListTile(
                value: "PhoneNumber",
                groupValue: select,
                title: Text("Phone Number", style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),),
                onChanged: (value){
                  setState(() {
                    select= value.toString();
                  });
                },
              ),


          Container(
            margin: EdgeInsets.only(
                right: 20, left: 15, top: 5, bottom: 10),
            child: Container(
              height: 35,
              width: double.infinity,
              //color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(
                top: 15,),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 35,
                    width: 100,
                    child: Theme(
                      data: ThemeData.light().copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Colors.black,
                          )),
                      child: CountryListPick(
                          theme: CountryTheme(
                            isShowFlag: true,
                            isShowTitle: false,
                            isShowCode: true,
                            isDownIcon: false,
                            showEnglishName: true,
                            alphabetTextColor: Colors.black,
                            alphabetSelectedTextColor:
                            Colors.black,
                            labelColor: Colors.black,
                            alphabetSelectedBackgroundColor:
                            Colors.black,
                          ),
                          useUiOverlay: false,
                          useSafeArea: false,
                          initialSelection: 'US',
                          onChanged: (CountryCode? code) {
                            countryCode = (code!).dialCode!;
                            //  print('-----+++++__QQQQQQQQQQQQ)');
                            //  print(countryCode);
                          }),

                    ),
                  ),
                  SizedBox(
                      height: 30,
                      width: 170,
                      child: TextField(
                      //  controller: phoneController,
                        autocorrect: true,
                        decoration: InputDecoration(

                        ),
                      )
                  ),
                ],
              ),
            ),
          ),


          RadioListTile(
            title: Text("Email", style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600),),
            value: "btnemail",
            groupValue:select,
            onChanged: (value){
              setState(() {
            select = value.toString();
                print('>>>>>>>>>>>>>>>>>>>>>>>> Response3 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
                print(select);
                print(value.toString());
                print('>>>>>>>>>>>>>>>>>>>>>>>> Response3 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
              });
            },
          ),
          Container(
            padding: EdgeInsets.only(top: 5,left: 10 , right: 15),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20),

            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Member Email',
                //hintText: 'Enter Code',
              ),
            ) ,
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 20.0,left: 15 , bottom: 10),
            alignment: Alignment.topLeft,
            child: SizedBox(
              child: Text(
                'Name on Account ',
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black

                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5,left: 8 , right: 15),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: TextField(
             // controller: fnameController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name ',
                //hintText: 'Enter Code',
              ),
            ) ,
          ),
          Container(
            padding: EdgeInsets.only(top: 5,left: 8 , right: 15),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: TextField(
             // controller: lnameController,

              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last Name ',
                //hintText: 'Enter Code',
              ),
            ) ,
          ),

        ],
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
          print('>>>>>>>>>>>>>>>>>>>>>>>> Response <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
          print(select);
          print('>>>>>>>>>>>>>>>>>>>>>>>> Response <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
          // phoneNumber = phoneController.value.text.toString();
          // fname = fnameController.value.text.toString();
          // lname = lnameController.value.text.toString();
          // email = emailController.value.text.toString();
          // addUser(phoneNumber, this.countryCode , email, fname, lname )
          //     .onError((error, stackTrace) => Future.error(error.toString(), StackTrace.empty))
          //     .then((value) => Navigator.push(context,
          //   MaterialPageRoute(builder: (context) => AddMember(phoneNumber, countryCode, email)),
          // ));
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()),);
          // addUser(countryCode,phoneNumber)
          //     .onError((error, stackTrace) => Future.error(error.toString(), StackTrace.current))
          //     .then((value) => Navigator.push(context, MaterialPageRoute(
          //     builder: (_) => AddMember(countryCode,phoneNumber)),));
        },
        child: Text(
          'Invite Now',
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


//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
// Future<AddUserResponse> addUser(String countryCode , String mobilenumber  , String email , String fname , String lname) async {
//   AddUserRequest addUserRequest = AddUserRequest();
//
//   if(select == "btnemail" )
//     {
//       addUserRequest.authenticationType = Constants.EmailPassword.toString();
//       addUserRequest.email = email;
//       addUserRequest.firstname = fname;
//       addUserRequest.lastname = lname;
//    }
//   if(select == "PhoneNumber" )
//   {
//     addUserRequest.authenticationType = Constants.Mobile.toString();
//     addUserRequest.countryCode = countryCode;
//     addUserRequest.mobileNumber = mobilenumber;
//   }
//
//
//   addUserRequest.deviceName = "deviceName";
//   addUserRequest.deviceToken = "deviceToken";
//   addUserRequest.existinguserid = "existinguserid" as int? ;
//   addUserRequest.authenticationType = "authenticated";
//   print('<<<<<<<<<<<<<<Request body----->>>>>>>>>>>>: ${jsonEncode(addUserRequest)}');
//   final response = await http.post(Uri.parse(Constants.baseUrl2 + '/User/AddUser'),
//       headers: <String, String>{
//     'Content-Type': 'application/json', 'Accept': 'application/json',
//       },
//       body: jsonEncode(addUserRequest));
//    print('###########################################################################################################');
//   print('>>>>>>>>>>>>>>>>>>>>>>>> Response <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
//   print(response.body);
//   if (response.statusCode == 200) {
//     return AddUserResponse.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to call user id .');
//   }
// }