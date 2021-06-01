import 'package:expensetracker/Pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/Buttons.dart';

class OnboardingPage extends StatelessWidget {
  final Buttons b = new Buttons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.only(right: 50, left: 50, top: 0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset("images/firstpage.png"),
            SizedBox(height: 60),
            Text(
              "Hey! I am your ",
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontSize: 24, color: Colors.black54)),
            ),
            SizedBox(height: 10),
            Text(
              "PERSONAL EXPENSE",
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 28,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(height: 10),
            Text(
              "TRACKER",
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 28,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400)),
            ),

            SizedBox(
              height: 20,
            ),
            // Text("I'll help you manage your expenses efficiently", textAlign:TextAlign.center,style:TextStyle(fontSize : 18,color: Colors.grey), ),
            SizedBox(height: 60),

            SizedBox(
              height: 50,
              width: 400,
              child: b.createGetStartedButton("Get Started", context
                  
                  ),
            ),
          ],
        )),
      ),
    ));
  }
}
