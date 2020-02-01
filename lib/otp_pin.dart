library otp_pin;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_pin/util.dart';

class OtpWidget extends StatefulWidget {
  final Color kPrimaryColor;
  final Color kNampadTextColor;
  final String title;
  final String user;
  final void Function(String pin) onFill;
  final VoidCallback onResend;

  OtpWidget(this.title, this.user,
      {Key key,
      this.kPrimaryColor = const Color(0xff1B2028),
      this.kNampadTextColor = const Color(0xff487870),
      this.onFill,
      this.onResend})
      : super(key: key);

  @override
  _OtpWidgetState createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  var pin = [];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 2280, allowFontScaling: true);

    return Scaffold(
      backgroundColor: widget.kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(color: Color(0xffCACBCD), fontSize: sp(80)),
            ),
            SizedBox(
              height: h(230),
            ),
            Center(
              child: Container(
                  width: w(480),
                  child: Row(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: w(80),
                            height: w(80),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  w(80 / 2),
                                )),
                          ),
                          pin.length < 1
                              ? SizedBox.shrink()
                              : Container(
                                  width: w(80),
                                  height: w(80),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: w(65),
                                      height: w(65),
                                      decoration: BoxDecoration(
                                          color: widget.kPrimaryColor,
                                          borderRadius: BorderRadius.circular(
                                            w(65 / 2),
                                          )),
                                    ),
                                  ),
                                )
                        ],
                      ),
                      SizedBox(width: w(50)),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: w(80),
                            height: w(80),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  w(80 / 2),
                                )),
                          ),
                          pin.length < 2
                              ? SizedBox.shrink()
                              : Container(
                                  width: w(80),
                                  height: w(80),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: w(65),
                                      height: w(65),
                                      decoration: BoxDecoration(
                                          color: widget.kPrimaryColor,
                                          borderRadius: BorderRadius.circular(
                                            w(65 / 2),
                                          )),
                                    ),
                                  ),
                                )
                        ],
                      ),
                      SizedBox(width: w(50)),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: w(80),
                            height: w(80),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  w(80 / 2),
                                )),
                          ),
                          pin.length < 3
                              ? SizedBox.shrink()
                              : Container(
                                  width: w(80),
                                  height: w(80),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: w(65),
                                      height: w(65),
                                      decoration: BoxDecoration(
                                          color: widget.kPrimaryColor,
                                          borderRadius: BorderRadius.circular(
                                            w(65 / 2),
                                          )),
                                    ),
                                  ),
                                )
                        ],
                      ),
                      SizedBox(width: w(50)),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: w(80),
                            height: w(80),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  w(80 / 2),
                                )),
                          ),
                          pin.length < 4
                              ? SizedBox.shrink()
                              : Container(
                                  width: w(80),
                                  height: w(80),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: w(65),
                                      height: w(65),
                                      decoration: BoxDecoration(
                                          color: widget.kPrimaryColor,
                                          borderRadius: BorderRadius.circular(
                                            w(65 / 2),
                                          )),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: h(100),
            ),
            Text(
              "Enter your OTP pin",
              style: TextStyle(color: Color(0xff4F535A), fontSize: sp(40)),
            ),
            SizedBox(
              height: h(40),
            ),
            Text(
              widget.user,
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: sp(45)),
            ),
            Center(
              child: Container(
                width: w(900),
                height: h(950),
                child: CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(20),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        children: List(9)
                            .asMap()
                            .map((k, m) {
                              return MapEntry(
                                  k,
                                  InkWell(
                                    splashFactory: CustomSplashFactory(),
                                    onTap: () {
                                      addPin(k + 1);
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            "${k + 1}",
                                            style: TextStyle(
                                                fontSize: sp(150),
                                                fontWeight: FontWeight.w400,
                                                color: widget.kNampadTextColor),
                                          ),
                                        )),
                                  ));
                            })
                            .values
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: w(750),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Container(
                      child: InkWell(
                          splashFactory: CustomSplashFactory(),
                          onTap: () {
                            addPin(0);
                          },
                          child: Container(
                            height: w(200),
                            width: w(200),
                            child: Center(
                              child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize: sp(150),
                                    fontWeight: FontWeight.w400,
                                    color: widget.kNampadTextColor),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: w(50),
                    ),
                    Container(
                      child: InkWell(
                          splashFactory: CustomSplashFactory(),
                          onTap: () {
                            addPin(0);
                          },
                          child: Container(
                            height: w(200),
                            width: w(200),
                            child: IconButton(
                              onPressed: () {
                                if (this.pin.isNotEmpty) this.pin.removeLast();
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.backspace,
                                size: w(110),
                                color: widget.kNampadTextColor,
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: w(30),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: h(20)),
            InkWell(
              splashFactory: CustomSplashFactory(),
              onTap: () {
                if (this.widget.onResend != null) this.widget.onResend();
              },
              child: Container(
                height: h(150),
                width: w(400),
                child: Center(
                  child: Text(
                    "RESEND",
                    style:
                        TextStyle(color: Color(0xff4F535A), fontSize: sp(45)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  addPin(int pin) {
    if (this.pin.length <= 3) {
      this.pin.add(pin);
      setState(() {});
      if (this.pin.length == 4 && this.widget.onFill != null)
        this
            .widget
            .onFill("${this.pin[0]}${this.pin[1]}${this.pin[2]}${this.pin[3]}");
    }
  }
}
