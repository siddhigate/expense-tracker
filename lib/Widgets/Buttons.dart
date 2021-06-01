
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:expensetracker/Network/NetworkHandler.dart';
import 'package:expensetracker/Pages/HomePage.dart';
import 'package:expensetracker/Pages/LoginPage.dart';
import 'package:expensetracker/Pages/OnboardingPage.dart';
import 'package:expensetracker/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons {
  Color color;
  String text;
  NetworkHandler n = new NetworkHandler();

  Buttons() {
    text = "";
    color = Colors.lightBlueAccent;
  }

  Widget createGetStartedButton(String text, BuildContext context) {
    return SizedBox(
        height: 50,
        width: 400,
        child: FloatingActionButton.extended(
            label: Text(text,
                style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18))),
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }));
  }

  Widget createLoginButton(
      String text, BuildContext context, String username, String password) {
    return SizedBox(
        height: 50,
        width: 400,
        child: FloatingActionButton.extended(
            label: Text(text,
                style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16))),
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () async {
              //var res = await n.get("/user/Siddhi1");
              Map<String, String> data = {
                "username": username,
                "password": password,
              };
              var response = await n.post("/user/login", data);
              var d= jsonDecode(response.body);
              if (d.msg == "success") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingPage()),
                );
              }
            }));
  }
}
