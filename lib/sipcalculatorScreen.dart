import 'dart:math';

import 'package:flutter/material.dart';
import './utils/constant.dart';

class SipcalculatorScreen extends StatefulWidget {
  SipcalculatorScreen({Key key}) : super(key: key);

  @override
  _SipcalculatorScreenState createState() => _SipcalculatorScreenState();
}

class _SipcalculatorScreenState extends State<SipcalculatorScreen> {
  double p = 0, n = 0, r = 0, amount = 0, i = 0;
  int finalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              )),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 80,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "SIP Calculator",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Raleway",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    inputPrincipalTf(), //! calling of the function principal textfield
                    SizedBox(height: 30),
                    inputMonthTf(), //! calling of the month text field
                    SizedBox(height: 30),
                    inputRateTf(), //! calling of the rate textfield
                    calculateButton(),
                    Container(
                      child: (amount == 0)
                          ? Text(
                              "Oops! no return",
                              style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              "Rs $finalAmount ",
                              style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              ),
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

  int calculate() {
    i = r / 100 / 12;
    print("princial = $p \n Rate = $r \n month = $n \n I= $i");

    setState(() {
      amount = ((p * (pow((i + 1), n) - 1)) / i) * (i + 1);
      finalAmount = amount.round();
    });
    return 0;
  }

  calculateButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          print("Calculate button pressed");
          calculate();
        },
        color: Colors.white,
        child: Text(
          "CALCULATE",
          style: TextStyle(
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF527DAA),
          ),
        ),
      ),
    );
  }

  inputRateTf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Expected rate :",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Raleway",
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 10, left: 5),
          decoration: kBoxDecorationStyle,
          height: 40,
          child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              hintText: "Enter the expected ROI!",
              hintStyle: kHintTextStyle,
            ),
            onChanged: (String s) {
              r = double.parse(s);
            },
          ),
        ),
      ],
    );
  }

  inputMonthTf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Total duration :",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Raleway",
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10, left: 5),
          alignment: Alignment.center,
          decoration: kBoxDecorationStyle,
          height: 40,
          child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              hintText: "Enter the months!",
              hintStyle: kHintTextStyle,
            ),
            onChanged: (String s) {
              n = double.parse(s);
            },
          ),
        ),
      ],
    );
  }

  inputPrincipalTf() //!Widget to return the principal textfield
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Principal deposit:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Raleway",
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 10, left: 5),
          decoration: kBoxDecorationStyle,
          height: 40,
          child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              hintText: "Enter the amount to be diposited!",
              hintStyle: kHintTextStyle,
            ),
            onChanged: (String s) {
              p = double.parse(s);
            },
          ),
        ),
      ],
    );
  }
}
