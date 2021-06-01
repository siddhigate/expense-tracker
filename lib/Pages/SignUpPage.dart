import 'dart:convert';

import 'package:expensetracker/Network/NetworkHandler.dart';
import 'package:expensetracker/Pages/DashboardPage.dart';
import 'package:expensetracker/Pages/LoginPage.dart';
import 'package:expensetracker/SQliteDatabase/loggedin.dart';
import 'package:expensetracker/Widgets/Buttons.dart';
import 'package:expensetracker/Widgets/InputFields.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'HomePage.dart';
import 'OnboardingPage.dart';
import 'ProfilePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final mycontrollerUsername = TextEditingController();
  final mycontrollerPassword = TextEditingController();
  final mycontrollerEmail = TextEditingController();

  bool _loading = false;

  Login lp = new Login();

  final InputFields i = new InputFields();
  final Buttons b = new Buttons();
  NetworkHandler n = new NetworkHandler();
  bool vis = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoadingOverlay(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(right: 50, left: 50, top: 40),
                child: SingleChildScrollView(
                  child: Column(
                    // child: Text('Hello World'),
                    children: [
                      Image.asset("images/signup2.png"),
                      SizedBox(height: 10),

                      i.createTextField("Enter your email", mycontrollerEmail),
                      SizedBox(height: 30),
                      i.createTextField(
                          "Enter a username", mycontrollerUsername),
                      SizedBox(height: 30),
                      //i.createPasswordField(mycontrollerPassword,false),
                      TextField(
                          textCapitalization: TextCapitalization.words,
                          controller: mycontrollerPassword,
                          obscureText: vis,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(fontSize: 16)),
                          decoration: InputDecoration(
                              filled: false,
                              fillColor: Colors.blue[200],
                              focusColor: Colors.blue[300],
                              hoverColor: Colors.blue[400],
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue[200]),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue[300]),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue[200]),
                              ),
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon: Icon(vis
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    vis = !vis;
                                  });
                                },
                              ))),

                      SizedBox(height: 50),
                      SizedBox(
                          height: 50,
                          width: 400,
                          //    child: b.createLoginButton("Sign Up", context,"hi","hi")),
                          child: FloatingActionButton.extended(
                              label: Text("Sign up",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(fontSize: 16))),
                              backgroundColor: Colors.lightBlueAccent,
                              onPressed: () async {

                                setState((){
                                      _loading=true;
                                    });
                                //var res = await n.get("/user/Siddhi1");
                                Map<String, String> data = {
                                  "username": mycontrollerUsername.text,
                                  "password": mycontrollerPassword.text,
                                  "email": mycontrollerEmail.text
                                };
                                var response =
                                    await n.post("/user/register", data);
                                Map<String, dynamic> d =
                                    jsonDecode(response.body);
                                if (d['msg'] == "success") {
                                  lp.setLogin(true);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OnboardingPage()),
                                  );
                                }
                              })),

                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 5),
                          Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0)),
                            ),
                            // margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),

                            child: Image.asset(
                              "images/googlelogo.png",
                              height: 40,
                              width: 30,
                            ),
                          ),
                          SizedBox(width: 12),
                          Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0)),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "images/facebooklogo.png",
                              height: 40,
                              width: 34,
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              " Log In",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.lightBlueAccent,
                                      decoration: TextDecoration.underline)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            isLoading: _loading));
  }
}
