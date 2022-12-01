import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'animatedProgressWidget.dart';


class wallet extends StatefulWidget {
  const wallet({Key? key}) : super(key: key);

  @override
  _walletState createState() => _walletState();
}

class _walletState extends State<wallet> {
  final _payKey = GlobalKey<FormState>();
  var pay;
  late String _auToken;
  String credit = "0";
  String debit = "0";
  String balance = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(
                2.0, 2.0), // 10% of the width, so there are ten blinds.
            colors: <Color>[
              Color(0xffc5efff),
              Color(0xff008ec7),
              Color(0xff001219)
            ], // red to yellow
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              leading: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back)),
          title: Title(color: Colors.black, child: Text("کیف پول",)),
          ),
          body: Scrollbar(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: ListView(
                children: [

                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                        border: Border.all(
                            color: const Color(0xFF000000),
                            width: 0.5,
                            style: BorderStyle.solid),
                        color: Colors.white30),
                    height: 120,
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            ":مبلغ باقی مانده",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Text(
                          "$balance تومان",
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                              color: Colors.green,
                              fontFamily: "Vazir-f",
                              decoration: TextDecoration.none,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                        border: Border.all(
                            color: const Color(0xFF000000),
                            width: 0.5,
                            style: BorderStyle.solid),
                        color: Colors.white30),
                    height: 120,
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            ":کل مبلغ شارژ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Text(
                          "$credit تومان",
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                              color: Colors.green,
                              fontFamily: "Vazir-f",
                              decoration: TextDecoration.none,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                        border: Border.all(
                            color: const Color(0xFF000000),
                            width: 0.5,
                            style: BorderStyle.solid),
                        color: Colors.white30),
                    height: 120,
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            ":مبلغ مصرف شده",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Text(
                          "$debit تومان",
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                              color: Colors.green,
                              fontFamily: "Vazir-f",
                              decoration: TextDecoration.none,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.only(top: 13),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                        border: Border.all(
                            color: const Color(0xFF000000),
                            width: 0.5,
                            style: BorderStyle.solid),
                        color: Colors.white30),
                    // height: 120,
                    width: double.maxFinite,
                    child: Form(
                        key: _payKey,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "مقدار شارژ کیف پول را مشخص کنید",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 220,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "فیلد شماره خالی می باشد";
                                    } else if (value.length < 6) {
                                      return "حداقل مبلغ شارژ 10تومان می باشد.";
                                    }
                                  },
                                  onSaved: (String? value) {
                                    setState(() {
                                      pay = value;
                                    });
                                  },
                                  enabled: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  // textAlign: TextAlign.right,
                                  // maxLength: 11,
                                  style: new TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                  ),
                                  // obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "مبلغ(تومان)",
                                    labelStyle: new TextStyle(
                                      color: Colors.green,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF0F0F0),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.green,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.payment,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              Text("9 درصد ارزش افزوده هنگام پرداخت اضافه می شود",style: TextStyle(
                                fontFamily: "vazir-f",
                                fontSize: 10
                              ),),
                              ElevatedButton(
                                  onPressed: () {
                                    _payKey.currentState?.validate();
                                    if (_payKey.currentState!.validate()) {
                                      _payKey.currentState?.save();
                                      // print(pay);
                                      _addWallet(_auToken, pay);
                                    }
                                  },
                                  child: Text("تایید")),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _auToken = "1659|3QdFqu8gDCv7XDuYGA4qkzRN3az5hYpHt5kJg9Gj";
    });
    animatedProgress();
    getDataWallets();

    print(_auToken);
  }

  Future<void> animatedProgress() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return animatedProgressWidget();
      },
    );
  }

  void getDataWallets() async {
    var url = Uri.http('portal.bigbaar.com', '/api/wallets', {'q': '{http}'});
    Response response = await get(
      url,
      headers: {
        "Authorization": "Bearer $_auToken",
      },
    );
    print(_auToken);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("update wallets");
      print(utf8.decode(response.bodyBytes));
      var walletData = json.decode(utf8.decode(response.bodyBytes));
      var walletD = walletData["data"];
      Navigator.of(context).pop(animatedProgress);
      setState(() {
        credit = walletD["credit"].toString() as String;
        balance = walletD["balance"].toString() as String;
        debit = walletD["debit"].toString() as String;
      });
    } else {
      print("no");
      setState(() {
        // shoProgress = false;
        // _showToast1(context);
      });
    }
  }
}

_addWallet(String token, amount) async {
  var url = "https://portal.bigbaar.com/payment?token=$token&amount=$amount";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
