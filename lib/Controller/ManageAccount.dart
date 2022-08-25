import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:swipeapp/Controller/AddAccountSuccessful.dart';
import 'package:swipeapp/Controller/Dashboard.dart';
import 'package:swipeapp/Controller/Response/UserDeatail.dart';
import 'package:swipeapp/main.dart';
import '../Model Helper.dart';
import 'AddMember.dart';
import 'Request/AddUserRequest.dart';
import 'Response/AddUserResponse.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'Response/ChildUserResponse.dart';
String? select;
class ManageAccount extends StatefulWidget {
  @override
  _manageacountState createState() => _manageacountState();
}
class _manageacountState extends State<ManageAccount> {

  void initState()  {
    super.initState();
    datalist = getChildUser();
  }
  late String phoneNumber;
  late String email;
  late String fname;
  late String lname;
  late String countrycode;

  late Future<List<ChildDataResult>> datalist ;
  TextEditingController phoneController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _validate = false;
  checkTextFieldEmptyOrNot(){

    // Creating 3 String Variables.
    String text1;

    // Getting Value From Text Field and Store into String Variable
    text1 = phoneController.text ;


    // Checking all TextFields.
    if(text1 == '' )
    {
      // Put your code here which you want to execute when Text Field is Empty.
      print('Text Field is empty, Please Fill All Data');

    }else{

      // Put your code here, which you want to execute when Text Field is NOT Empty.
      print('Not Empty, All Text Input is Filled.');
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
                  emailVerify(),
                 // historyUser(),
                  addaccountButton(),

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
                        controller: phoneController,
                        autocorrect: true,
                        decoration: InputDecoration(

                            errorText: _validate ? 'Value Can\'t Be Empty' : null,



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

              });
            },
          ),
          Container(
            padding: EdgeInsets.only(top: 5,left: 10 , right: 15),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20),

            child: TextField(
              controller: emailController,
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
              controller: fnameController,
              obscureText: true,
              decoration: InputDecoration(
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
             controller: lnameController,
              obscureText: true,
              decoration: InputDecoration(
                errorText: _validate ? 'Value Can\'t Be Empty' : null,

                border: OutlineInputBorder(),
                labelText: 'Last Name ',
                //hintText: 'Enter Code',
              ),
            ) ,
          ),

        ],
      );

  }

 addaccountButton() {
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
          setState(() {
            phoneController.text.isEmpty ? _validate = true : _validate = false;
          });
          phoneNumber = phoneController.value.text.toString();
          fname = fnameController.value.text.toString();
          lname = lnameController.value.text.toString();
          email = emailController.value.text.toString();

          checkTextFieldEmptyOrNot();
          addUser(countryCode , phoneNumber, email, fname, lname );
            //  .onError((error, stackTrace) => Future.error(error.toString(), StackTrace.empty)).then((value) =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddAccountSuccessful()),);
         // ));

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
  historyUser()
  {
    Column(
      children: [
        Text("History"),

    Container(
    height: 180,

    child:
    FutureBuilder<List<ChildDataResult>>(
  future: datalist,
    builder: (context, snapshot) {
  if (snapshot.hasData) {
  return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (context, i) {
  var item = snapshot.data![i];
  return

  ListTile(
  title: Row(
  children: [
  CircleAvatar(
  radius: 30,
  backgroundImage: AssetImage('asset/images/pic.png'),
  ),
  Text(snapshot.data![i].lastName.toString(),
  style: TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w600),),

  ],
  )



  );
  // ListView(
  //   scrollDirection: Axis.horizontal,
  //   children: [


  // ]
  //   );

  // Text("first return>>>>>>"+ item.toString());
  });
  }
  else
  {
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
  }
    ),
    ),

      ],
    );


  }


//<<<<<Last Btracket >>>>>>>>>>//
}

//>>>>>>>>>>>>>>-------------------------API's--------------------------------->>>>>>>>>>>>>>>
Future<AddUserResponse> addUser(  String countryCode ,String mobilenumber , String email , String fname , String lname) async {
  AddUserRequest addUserRequest = AddUserRequest();
  if(select == "btnemail" )
    {
      addUserRequest.authenticationType = Constants.EmailPassword.toString();
      addUserRequest.email = email;

   }
  if(select == "PhoneNumber" )
  {
    addUserRequest.authenticationType = Constants.Mobile.toString();
    addUserRequest.countryCode = countryCode;
    addUserRequest.mobileNumber = mobilenumber;
    print(countryCode);
    print(mobilenumber);
    print(">>>>>>>>>??????/");
  }
  addUserRequest.firstname = fname;
  addUserRequest.lastname = lname;
  print("____________??????????????<<<<<<<");
  print(fname);
  print(lname);
  UserDetail tempuserdetail = await Constants.getUserDetail();

  addUserRequest.existinguserid = tempuserdetail.id;
  addUserRequest.deviceName = Constants.getdeviceType();
  addUserRequest.password = "";
  addUserRequest.deviceToken = "";
  //------------->>>>>>>>>>.
 String token = tempuserdetail.accessToken.toString();
  print('<<<<<<<<<<<<<<Request body----->>>>>>>>>>>>: ${jsonEncode(addUserRequest)}');
  final response = await http.post(Uri.parse(Constants.baseUrl2 + '/User/AddUser'),
      headers: <String, String>{
    'Content-Type': 'application/json', 'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(addUserRequest));
  print("&&&&&&&&&&??????????????<<<<<<<");
  print(response);
  print(response.body);
  print(response.statusCode);
  print("&&&&&&&&&&??????????????<<<<<<<");
  if (response.statusCode == 200) {
    print('####manage account Response <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${jsonEncode(response)}');

    return AddUserResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to call user adduserid .');
  }
}
Future<List<ChildDataResult>>  getChildUser( ) async {
  UserDetail tempuserdetail = await Constants.getUserDetail();
  String ctoken = tempuserdetail.accessToken.toString();
  final response = await http.get(Uri.parse(Constants.baseUrl2 + '/User/GetChildUser'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'Accept': 'application/json',
        'Authorization': 'Bearer $ctoken',
      });
  print(ctoken);
  print("responseprint>>>>>>>>>>>>>");
  print(response);
  print("bodyyyyyyyyyyyyyyyyy>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<");
  print(response.body);
  print(">>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<");
  print(response.statusCode);
  print(">>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<");

  if (response.statusCode == 200) {

    ChildUserResponse userResponse = ChildUserResponse.fromJson(jsonDecode(response.body));
    return userResponse.result! ;// usResult.fromJson(jsonDecode(response.body));

  }

  else

  {
    // return List<ChildDataResult>;
    throw Exception('Failed to call user childuserid .');
  }
}