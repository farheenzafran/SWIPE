import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controller/Response/UserDeatail.dart';
import 'dart:io' as IO;

class Constants{
  static  String ClientId = "5e79fae37ba2dd00148a46f9";
  static  String Secret = "6f659b9485ddf6eb85054997ed4091";
  static  String URL = "https://sandbox.plaid.com";
  static String baseUrl = "https://breakbulkdevservices.azurewebsites.net/api";
  static  String baseUrl2 = "http://swipe-test.us-east-1.elasticbeanstalk.com/api";
  static String LoginKey = "LoginSession";
  static String LoginKey2 = "userLoginSession";
  static String SignUpKey = "LoginSession2";
  static String DevicName = "DeviceName";
  static String DeviceToken = "DeviceToken";
  static String UserObject = "UserObject";
  static String CountryCode = "CountryCode";
  static String firstname = "firstname";
  static String lastname = "lastname";
  static String authenticationType = "authenticationType";

  static String userDetailKey = "UserData";
  static int Mobile = 1;
  static int GmailSignIn = 2;
  static int  EmailPassword = 3;
  static int debitcardValue = 1;
  static int creditcardValue = 2;

  static read( String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? "";
    print('read: $value');
    return value;
  }

  static save(String key , String value) async {
    print(key);
    print(value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    print('saved $value');
  }
  static getBankdata<BankData>(String Key)
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var val = jsonEncode(BankData);
    print('printbankjsondata $val' );
    prefs.setString(Key, val);
  }
 static Future<UserDetail> getUserDetail() async {
    String bdata = await Constants.read(Constants.userDetailKey);
   // if (bdata != "") {
      dynamic dicData = jsonDecode(bdata);
      UserDetail udetail = UserDetail.fromJson(dicData);
      return udetail;
   // }
  }

  static delete(String key, String value ) async {
    print(key);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // tdata.add(bankDataobj);
    prefs.remove(key);
    await prefs.setString(key,value);


  }
  static  Amortization(int? loanAmount, double intRate, double years , int yearpassed) {
    num timeData = years;
    num interestData = intRate;
    num principalData = loanAmount as num;
    num resultData = principalData * (1 + ((timeData / 100) * interestData));
    return resultData;

  }
  static  mAmortization(int? loanAmount, double intRate, double years , int yearpassed) {
    num timeData = years;
    num interestData = intRate;
    num principalData = loanAmount as num;
    num resultData = principalData * (1 + ((timeData / 100) * interestData));
    return resultData;

  }
   static getdeviceType()
  {
    String deviceType = "android";
    if(IO.Platform.isIOS)
      {
        deviceType = "ios";
      }
    return deviceType;

  }


}

class Logic {
  void doSomething() {
    print("doing something");
  }
}


