import 'dart:convert';

import 'package:havadar/view/homePage.dart';
import 'package:havadar/view/intro_page.dart';
import 'package:havadar/view/widget/buttonWidget.dart';
import 'package:havadar/view/widget/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/model/loginResponseModel.dart';
import 'animatedProgressWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // value
  String txtlogin = "ارسال کد تایید";
  var _formKey = GlobalKey<FormState>();
  var email;
  Color? _fillColor = Color(0xFFF0F0F0);
  var password;
  bool _enterOtpCode = false;
  bool _numdisable = true;
  bool _checkLogin = true;
  bool hidepol = true;

  // bool shoProgress = false;

  // bool _isLogin = false;

  // value

  void _otp() {
    setState(() {
      _enterOtpCode = true;
      _fillColor = Color(0xffdbdbdb);
      _numdisable = false;
      _checkLogin = false;
      txtlogin = "ورود";
      hidepol = false;
      Navigator.of(context).pop(animatedProgress);
    });
  }

  void _otpReset() {
    setState(() {
      _enterOtpCode = false;
      _fillColor = Color(0xFFF0F0F0);
      _numdisable = true;
      _checkLogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Container(
                height: 200,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: new BoxDecoration(
                  color: Colors.green,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                child: new Text('ورود / ثبت نام',
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900))),
            new Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _formKey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Container(
                        child: TextFieldWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "فیلد شماره خالی می باشد";
                        } else if (value.length < 11) {
                          return "فیلد شماره کامل نمی باشد";
                        }
                      },
                      labelText: "شماره",
                      icon: Icons.phone_android_outlined,
                      en: _numdisable,
                      fillColor: _fillColor,
                      // onPre: (){},
                      onSaved: (String? value) {
                        email = value;
                      },
                    )),
                    new Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Visibility(
                          visible: _enterOtpCode,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "فیلد شماره خالی می باشد";
                              }
                            },
                            onSaved: (String? value) {
                              password = value;
                            },
                            enabled: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4)
                            ],
                            // textAlign: TextAlign.right,
                            // maxLength: 11,
                            style: new TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "کدتایید",
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
                                Icons.password,
                                size: 16,
                                color: Colors.green,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.refresh),
                                color: Colors.green,
                                onPressed: () {
                                  setState(() {
                                    animatedProgress();
                                  });
                                  loginSendRequest(email: email);
                                },
                              ),
                            ),
                          ),
                        )),
                    new Container(
                      // margin: EdgeInsets.only(top: 10),
                      child: Visibility(
                        visible: _enterOtpCode,
                        child: new TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                color: Color(0xff4a64fe),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            padding: const EdgeInsets.all(0),
                            primary: Colors.green,
                          ),
                          onPressed: () {
                            _formKey.currentState?.reset();
                            _otpReset();
                          },
                          child: const Text('شماره اشتباه است؟'),
                        ),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 15),
                      child: GestureDetector(
                        child: ButtonWidget(title: txtlogin, hasBorder: false),
                        onTap: () {
                          _formKey.currentState?.validate();
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            if (_checkLogin == true) {
                              showPolicy();
                            } else {
                              setState(() {
                                animatedProgress();
                              });
                              tokenSendRequest(
                                  email: email, password: password);
                            }
                          }
                        },
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 15, bottom: 20),
                      child: GestureDetector(
                        child: ButtonWidget(
                          title: "پشتیبانی",
                          hasBorder: true,
                        ),
                        onTap: () {
                          _launchURL();
                          // getData();
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void loginSendRequest({required String email}) async {
    print("login send");
    var url = Uri.http('roydad.modernfa.co', '/api/register', {'q': '{http}'});
    var body = Map<String, dynamic>();
    body["mobile"] = email;
    Response response = await post(url, body: body);
    if (response.statusCode == 200) {
      var loginJson = json.decode(utf8.decode(response.bodyBytes));
      var model = loginResponseModel(loginJson["success"]);
      if (model.status == true) {
        _showToast1(context);
        // Navigator.of(context).pop(animatedProgress);
        _otp();
        print(model.status);
      }
    } else {
      _showToast(context);
      setState(() {
        Navigator.of(context).pop(animatedProgress);
      });
    }
  }

  void tokenSendRequest(
      {required String email, required String password}) async {
    print("token send");

    var url = Uri.http('roydad.modernfa.co', '/api/login', {'q': '{http}'});
    var body = Map<String, dynamic>();
    body["mobile"] = email;
    body["smsToken"] = password;
    print(body);
    Response response = await post(url, body: body);
    if (response.statusCode == 200) {
      var tokenJson = json.decode(utf8.decode(response.bodyBytes));
      var model = tokenResponseModel(tokenJson["success"], tokenJson["data"]);
      if (model.tokenstatus == true) {
        setData(
            model.data["token"]);

        _showToast2(context);
        print("shayan  is ${model.data}");
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 800),
                child: HomePage(indexset: 1,)));
      }
    }
  }

  Future<void> showPolicy() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تایید شرایط و قوانین هوادار',
              textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('''
          لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.
''', textDirection: TextDirection.rtl, textAlign: TextAlign.right,style: TextStyle(fontSize: 14),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('پذیرش و ادامه'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  animatedProgress();
                });
                if (_checkLogin == true) {
                  loginSendRequest(email: email);
                } else {
                  tokenSendRequest(email: email, password: password);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showPolicy2() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تایید شرایط و قوانین هوادار',
              textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('''
          لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.
''', textDirection: TextDirection.rtl, textAlign: TextAlign.right,style: TextStyle(fontSize: 14),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('تایید قوانین'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> animatedProgress() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => animatedProgressWidget(),
    );
  }
}

_launchURL() async {
  const url = 'tel:09331365455';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('خطا در ارسال کد، لطفا دقایقی دیگر تست کنید'),
      action: SnackBarAction(
          label: 'بستن', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

void _showToast1(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('کد با موفقیت ارسال شد'),
      action: SnackBarAction(
          label: 'بستن', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

void _showToast2(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('شما ثبت نام شدید'),
      action: SnackBarAction(
          label: 'بستن', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

void _showToast3(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('کد اشتباه است'),
      action: SnackBarAction(
          label: 'بستن', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

setData(String auToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLogin', true);
  prefs.setString('auToken', auToken);
  print("data is saved");
}
