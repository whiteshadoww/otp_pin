import 'package:flutter/material.dart';
import 'package:otp_pin/otp_pin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP PIN Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OtpWidget(
        "OTP PIN",
        "user@example.com",
        onFill: (pin) {
          print("The pin is: $pin");
        },
        onResend: () {
          print("resend pressed");
        },
      ),
    );
  }
}
