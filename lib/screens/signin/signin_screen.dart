part of '../screens.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  bool _isHidePassword = false;
  bool _isLogin = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height - 90),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/instagram.png',
                    height: 50,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: greyBorderColor,
                        width: 0.3,
                      ),
                    ),
                    child: TextFormField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(

                        border: InputBorder.none,
                        hintText: 'شماره تلفن، نام کاربری',
                        hintStyle: TextStyle(
                          color: greyDarkColor,
                          fontSize: 14,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isEmailValid = !_isEmailValid;
                              _emailController.clear();
                            });
                          },
                          child: _isEmailValid
                              ? Icon(Icons.close_rounded)
                              : SizedBox(),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _isEmailValid = value.length >= 1;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: greyBorderColor,
                        width: 0.3,
                      ),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: !_isHidePassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'پسوورد',
                        hintStyle: TextStyle(
                          color: greyDarkColor,
                          fontSize: 14,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isHidePassword = !_isHidePassword;
                            });
                          },
                          child: (!_isHidePassword)
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _isPasswordValid = value.length >= 1;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'آیا رمز عبور خود را فراموش کرده اید؟',
                        style: TextStyle(
                          color: blueColor,
                          fontWeight: medium,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: 45,
                    width: double.infinity,
                    child: _isLogin
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: _isPasswordValid && _isEmailValid
                                  ? blueColor
                                  : blueSkyColor,
                              onSurface: blueColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: _isPasswordValid && _isEmailValid
                                ? () {
                                    setState(() {
                                      _isEmailValid = true;
                                      _isPasswordValid = true;
                                      _isLogin = true;
                                    });
                                    Future.delayed(Duration(seconds: 2), () {
                                      setState(() {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MainScreen(),
                                          ),
                                        );
                                        _isLogin = false;
                                      });
                                    });
                                  }
                                : null,
                            child: Text(
                              'ورود',
                              style: TextStyle(
                                color: whiteColor,
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: greyBorderColor,
                          thickness: 0.3,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'یا',
                        style: TextStyle(
                          color: greyDarkColor,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Divider(
                          color: greyBorderColor,
                          thickness: 0.3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo/facebook.png', height: 20),
                      SizedBox(width: 10),
                      Text(
                        'ورود به وسیله گوگل',
                        style: TextStyle(
                          color: blueColor,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: greyBorderColor,
              width: 0.3,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "حساب کاربری ندارید؟ ",
              style: TextStyle(
                color: greyDarkColor,
                letterSpacing: 0.1,
              ),
            ),
            Text(
              ' ساخت حساب کاربری',
              style: TextStyle(
                color: blueColor,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
