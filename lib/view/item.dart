
import 'package:havadar/util/items/item_3.dart';
import 'package:havadar/util/items/item_4.dart';
import 'package:havadar/view/login.dart';
import 'package:flutter/material.dart';
import 'package:havadar/view/wallet.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../util/items/item_1.dart';
import '../util/items/item_2.dart';

class item extends StatelessWidget {
  const item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(2.0, 2.0),
            // 10% of the width, so there are ten blinds.
            colors: <Color>[
              Color(0xff06800a),
              Color(0xff27c52c),
              Color(0xff59f35d)
            ], // red to yellow
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: 70, left: 12, right: 12, bottom: 100),
          child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: (10 / 12),
              // crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              //physics:BouncingScrollPhysics(),
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Fluttertoast.showToast(msg: "شرمنده، وقت نشد تکمیلش کنیم...!", fontSize: 15);
                    },
                    child: Column(
                      children: [
                        Center(
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment(2.0, 3.0),
                                  // 10% of the width, so there are ten blinds.
                                  colors: <Color>[
                                    Color(0xffbeff3b),
                                    Color(0xff001219)
                                  ], // red to yellow
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/image/item_4.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'امتیازات هواداری',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "iranyekan",
                              color: Colors.white70,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 500),
                              child: item4()));
                    },
                    child: Column(
                      children: [
                        Center(
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment(2.0, 3.0),
                                  // 10% of the width, so there are ten blinds.
                                  colors: <Color>[
                                    Color(0xfff5ff74),
                                    Color(0xff001219)
                                  ], // red to yellow
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/image/item_5.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'بلیط ورزشگاه',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "iranyekan",
                              color: Colors.white70,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 500),
                              child: wallet()));
                    },
                    child: Column(
                      children: [
                        Center(
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment(2.0, 3.0),
                                  // 10% of the width, so there are ten blinds.
                                  colors: <Color>[
                                    Color(0xffffff46),
                                    Color(0xff001219)
                                  ], // red to yellow
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/image/item_6.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'کیف پول دیجیتال',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "iranyekan",
                              color: Colors.white70,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),


                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 500),
                              child: item1()));
                    },
                    child: Column(
                      children: [
                        Center(
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment(2.0, 3.0),
                                  // 10% of the width, so there are ten blinds.
                                  colors: <Color>[
                                    Color(0xff00ff88),
                                    Color(0xff001219)
                                  ], // red to yellow
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/image/item_1.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),

                        Text(
                          'نتایج زنده فوتبال',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "iranyekan",
                              color: Colors.white70,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 500),
                              child: item2()));
                    },
                    child: Column(
                      children: [
                        Center(
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment(2.0, 3.0),
                                  // 10% of the width, so there are ten blinds.
                                  colors: <Color>[
                                    Color(0xff1effba),
                                    Color(0xff001219)
                                  ], // red to yellow
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/image/item_3.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'جدیدترین اخبار',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "iranyekan",
                              color: Colors.white70,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 500),
                              child: item3()));
                    },
                    child: Column(
                      children: [
                        Center(
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment(2.0, 3.0),
                                  // 10% of the width, so there are ten blinds.
                                  colors: <Color>[
                                    Color(0xffaaffeb),
                                    Color(0xff001219)
                                  ], // red to yellow
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/image/item_2.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'پخش زنده',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "iranyekan",
                              color: Colors.white70,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),


                //

                //
              ]),
        ),
      ),
    );
  }
}
