import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:swipeapp/Controller/Login/EmailScreen.dart';
import 'package:swipeapp/Controller/Login/EmailSignup.dart';
import 'package:swipeapp/Controller/Login/OtpScreen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _signupState();
}

class _signupState extends State<Signup> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scrollbar(
          child: SafeArea(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("asset/images/background.png"),
                        fit: BoxFit.cover,
                      )),
                  child: Wrap(
                    spacing: 120,
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
                        'SignUp',
                        style: TextStyle(fontWeight: FontWeight.w600 , color: Colors.white, fontSize: 15)
                        ,textAlign: TextAlign.center ,
                      ),
                    ],
                  ),
                ),
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
                ),
                Expanded(
                  child: TabBarView(
                    children: [

                      Container(
                        height: 300,
                        //padding: const EdgeInsets.all(20.0),
                        width: Size.infinite.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: new Column(
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
                                            onChanged: print,
                                            initialSelection: 'US'),
                                      ),
                                    ),
                                    SizedBox(
                                        height: 30,
                                        width: 170,
                                        child: TextField(
                                          autocorrect: true,
                                          decoration: InputDecoration(

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
                                    top: 15,  bottom: 5.0, left: 15, right: 15),

                                // Will take 50% of screen space
                                child: TextButton(
                                  onPressed: () {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => OtpScreen("", "")));
                                  },
                                    style: TextButton.styleFrom(

                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                  padding: const EdgeInsets.all(0.0),
                                    ),
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
                                        'Verify',
                                        style: TextStyle(
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
                              style: TextButton.styleFrom(

                              padding: const EdgeInsets.only(
                                  top: 15.0, left: 15, right: 15),),
                              onPressed: () {

                              },
                              child: Image(
                                image: AssetImage("asset/images/apple.png"),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(

                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0, left: 15, right: 15),),
                              onPressed: () {},
                              child: Image(
                                image: AssetImage("asset/images/google.png"),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(

                              padding: const EdgeInsets.only(
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
                        width: Size.infinite.width,
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
                                    hintText: 'Enter valid mail id as abc@gmail.com'
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only( left: 15 , right: 15),
                              child: TextField(
                                obscureText: true,
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
                                    style: TextButton.styleFrom(

                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                  padding: const EdgeInsets.all(0.0),
                                    ),
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
                              style: TextButton.styleFrom(

                              padding: const EdgeInsets.only(
                                  top: 15.0, left: 15, right: 15),),
                              onPressed: () {

                              },
                              child: Image(
                                image: AssetImage("asset/images/apple.png"),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(

                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0, left: 15, right: 15),),
                              onPressed: () {},
                              child: Image(
                                image: AssetImage("asset/images/google.png"),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(

                              padding: const EdgeInsets.only(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}