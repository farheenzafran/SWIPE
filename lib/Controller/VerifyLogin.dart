import 'package:country_list_pick/country_list_pick.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swipeapp/Controller/EmailScreen.dart';
import 'package:swipeapp/Controller/EmailSignup.dart';
import 'package:swipeapp/Controller/OtpScreen.dart';
import 'package:flutter/material.dart';
import 'package:swipeapp/Controller/Request/LoginRequest.dart';
import 'package:swipeapp/Controller/Response/CountryCodeResponse.dart';
import 'package:swipeapp/Controller/Response/LoginResponse.dart';
import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';
import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:swipeapp/Model%20Helper.dart';
import 'package:swipeapp/main.dart';

class VerifyLogin extends StatefulWidget {

  const VerifyLogin({Key? key}) : super(key: key);

  @override
  State<VerifyLogin> createState() => _SearchState();
}

class _SearchState extends State<VerifyLogin>  with SingleTickerProviderStateMixin
{
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);


    super.initState();
  }
  late String countryCode;
  late String phoneNumber;
  final phoneController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
  String LoginKey = "LoginKey";
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

      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0),
            // child:    SingleChildScrollView(
            child: Column(
              children: [
                headerView(),
               tababarView(),
                expandedView(),
              ],
            ),
          ),
        ),

      ),


    );
  }
  headerView(){
    return
      Container(
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/background.png"),
              fit: BoxFit.cover,
            )),
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
              'LOGIN',
              style: TextStyle(color: Colors.white, fontSize: 14 , fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),

      );
  }
  tababarView()
  {
    return
      TabBar(
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        tabs: [
          Tab(
            child: Text('Phone Number'),
          ),
          Tab(
            child: Text('Email'),
          ),
        ],
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
      );
  }
  expandedView()
  {
    return
      Expanded(
        child: TabBarView(
          children: [

            Container(
              height: 300,
              //padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: 20, left: 15, top: 20, bottom: 20),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
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
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          top: 15,  bottom: 5.0, left: 15, right: 15),// Will take 50% of screen space
                      child: TextButton(
                        onPressed: () {
                          // Loader.show(context,
                          //     isSafeAreaOverlay: false,
                          //     progressIndicator: CircularProgressIndicator(),
                          //     isBottomBarOverlay: false,
                          //     overlayFromBottom: 80,
                          //     themeData: Theme.of(context)
                          //         .copyWith(accentColor: Colors.black),
                          //     overlayColor: Color(0x0000ffff));
                          // Future.delayed(Duration(seconds:2 ), () {
                          //   Loader.hide();
                          // });
                          setState(() {
                            phoneController.text.isEmpty ? _validate = true : _validate = false;
                          });
                          phoneNumber = phoneController.value.text.toString();

                          checkTextFieldEmptyOrNot();

                          login(countryCode,phoneNumber)
                              .onError((error, stackTrace) => Future.error(error.toString(), StackTrace.current))
                              .then((value) => Navigator.push(context, MaterialPageRoute(
                              builder: (_) => OtpScreen(phoneNumber, countryCode)),));
                        },
                        style: TextButton.styleFrom(  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          padding: const EdgeInsets.all(0.0),),

                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xdeb46fea), Color(0xb59e3d57) ,Color(
                                    0xff9f60d0)]),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            child: const Text(
                              'Verify',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5,  bottom: 15.0, left: 15, right: 15),
                    child: Text(
                      'We will send you a text with a verification code. Message and data'
                          ' rates may apply.'
                          ' By continuing, you agree to our Terms of Service & Provicy Policy',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, bottom: 15.0, left: 15, right: 15),
                    child: Image(
                      image: AssetImage("asset/images/orline.png"),
                    ),
                    // Text('-     0r     -',
                    //   style: TextStyle(color: Colors.purpleAccent,
                    //        fontWeight: FontWeight.w500),),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(   padding: const EdgeInsets.only(
                        top: 15.0, left: 15, right: 15),),

                    onPressed: () {

                    },
                    child: Image(
                      image: AssetImage("asset/images/apple.png"),
                    ),
                  ),
                  //gmail
                  TextButton(style: TextButton.styleFrom( padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 15, right: 15),),
                    onPressed: () async{
                      Loader.show(context,
                          isSafeAreaOverlay: false,
                          progressIndicator: CircularProgressIndicator(),
                          isBottomBarOverlay: false,
                          overlayFromBottom: 80,
                          themeData:
                          Theme.of(context).copyWith(accentColor: Colors.black),
                          overlayColor: Color(0x0000ffff));
                      Future.delayed(Duration(seconds: 3), () {
                        Loader.hide();
                      });
                      signInWithGoogle();
                    }
                    ,
                    child: Image(
                      image: AssetImage("asset/images/google.png"),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(padding: const EdgeInsets.only(
                        bottom: 10.0, left: 15, right: 15),),

                    onPressed: () {},
                    child: Image(
                      image: AssetImage("asset/images/fb.png"),
                    ),
                  ),


                ],
              ),
            ),


            //tab 2-----------
            Container(
              height: 300,
              //padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: new Column(
                children: [

                  Padding(
                    padding: EdgeInsets.only(top: 20 , left: 15 , right: 15 , bottom: 5),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          hintText: 'Enter valid mail '
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( left: 15 , right: 15),
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter your secure password'
                      ),
                    ),
                  ),
                  Container(
                      width: double.infinity,

                      margin: const EdgeInsets.only(
                          top: 15,  bottom: 5.0, left: 15, right: 15),// Will take 50% of screen space
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EmailScreen()), );

                        },
                        style: TextButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          padding: const EdgeInsets.all(0.0),),

                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xdeb46fea), Color(0xb59e3d57) ,Color(
                                    0xff9f60d0)]),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            child: const Text(
                              'Login',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20.0, left: 15),
                    child:  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EmailScreen()));
                      },
                      child: Text(
                        'Forget password？Get a login link',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),


                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, bottom: 15.0, left: 15, right: 15),
                    child: Image(
                      image: AssetImage("asset/images/orline.png"),
                    ),
                    // Text('-     0r     -',
                    //   style: TextStyle(color: Colors.purpleAccent,
                    //        fontWeight: FontWeight.w500),),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(padding: const EdgeInsets.only(  top: 15.0, left: 15, right: 15),),
                    onPressed: () {

                    },
                    child: Image(
                      image: AssetImage("asset/images/apple.png"),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 15, right: 15),),

                    onPressed: () {
                      signInWithGoogle();
                    },
                    child: Image(
                      image: AssetImage("asset/images/google.png"),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom( padding: const EdgeInsets.only(
                        bottom: 10.0, left: 15, right: 15),),

                    onPressed: () {},
                    child: Image(
                      image: AssetImage("asset/images/fb.png"),
                    ),
                  ),


                ],
              ),
            ),


          ],
          controller: _tabController,
        ),
      );
  }
}
//Future<LoginResponse> login(String email, String password) async {
Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  var googleSignInAccount = await googleSignIn.signIn();
  // final GoogleSignInAuthentication googleSignInAuthentication =
  // await googleSignInAccount.authentication;
  //
  // final AuthCredential credential = GoogleAuthProvider.credential(
  //   accessToken: googleSignInAuthentication.accessToken,
  //   idToken: googleSignInAuthentication.idToken,
  // );
  //
  // final UserCredential authResult =
  // await _auth.signInWithCredential(credential);
  // final User user = authResult.user;
  //
  // if (user != null) {
  //   // Checking if email and name is null
  //   assert(user.email != null);
  //   assert(user.displayName != null);
  //   assert(user.photoURL != null);
  //
  //   name = user.displayName;
  //   email = user.email;
  //   imageUrl = user.photoURL;
  //
  //   // Only taking the first part of the name, i.e., First Name
  //   if (name.contains(" ")) {
  //     name = name.substring(0, name.indexOf(" "));
  //   }
  //
  //   assert(!user.isAnonymous);
  //   assert(await user.getIdToken() != null);
  //
  //   final User currentUser = _auth.currentUser;
  //   assert(user.uid == currentUser.uid);

  print('signInWithGoogle succeeded: helle');

  return 'helle';

}
Future<LoginResponse> login(String countrycode , String mobilenumber) async {
  LoginRequest loginRequest = LoginRequest();
  loginRequest.countryCode = countrycode;
  loginRequest.mobileNumber = mobilenumber;
  loginRequest.deviceName = "devicename";
  loginRequest.deviceToken = "devicetoken";

  // TODO: Uncomment after signup screen implementation.
  // loginRequest.deviceName = Constants.read(Constants.DevicName);
  // loginRequest.deviceToken = Constants.read(Constants.DeviceToken);

  final response5 = await http.post(Uri.parse(Constants.baseUrl2 + '/User/MobileLogin'),
      headers: <String, String>{'Content-Type': 'application/json', 'Accept': 'application/json',},
      body: jsonEncode(loginRequest));
  // print(jsonEncode(loginRequest));
  // print('objectobjectobjectobjectobjectobjectobjectobjectobjectobjectobject');
  print(response5.body);
  print(response5.statusCode);
  if (response5.statusCode == 200) {

    void dispose() {
      Loader.hide();
      // super.dispose();
    }
    return LoginResponse.fromJson(jsonDecode(response5.body));
  } else {
    //void dispose() {
    // Loader.hide();

    // super.dispose();
    //}
    void dispose() {
          Loader.hide();
          // super.dispose();
        }

    throw Exception('Failed to call transaction .');
  }
}
