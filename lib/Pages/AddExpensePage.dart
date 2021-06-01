import 'dart:convert';

import 'package:expensetracker/Network/NetworkHandler.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpensePage> {
  final mycontrollerDesc = TextEditingController();
  final mycontrollerAmount = TextEditingController();
  final mycontrollerTotal = TextEditingController();

  NetworkHandler n = new NetworkHandler();

  String txt = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70, right: 25, left: 25),
        child: Container(
//          padding: EdgeInsets.only(right: , left: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Siddhi!",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Fill in the details",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                SizedBox(height: 30),

                // Card(
                // margin:EdgeInsets.only(bottom:30),
                //elevation:2.0,

                SingleChildScrollView(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/login3.png",
                            height: 200, width: 200),
                      ]),
                ),

                // ),
                SizedBox(height: 20),
                TextField(
                  textCapitalization: TextCapitalization.words,
                  controller: mycontrollerDesc,
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
                      labelText: "Enter description",
                      //errorText: validateDescription(mycontrollerDesc.text),
                      hintText: "For what did you spend your money?"),
                ),
                SizedBox(height: 40),
                TextField(
                  textCapitalization: TextCapitalization.words,
                  controller: mycontrollerAmount,
                  keyboardType: TextInputType.number,
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
                      labelText: "Enter amount",
                      hintText: "How much money did you spend?"),
                ),
                SizedBox(height: 50),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FloatingActionButton(
                    heroTag: "btn2",
                    child: const Icon(Icons.add),
                    backgroundColor: Colors.lightBlueAccent,
                    onPressed: ()  {
                      setState(() async {
                        int currentAmount;
                        if (mycontrollerDesc.text.isEmpty &&
                            mycontrollerTotal.text.isEmpty) {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Retrieve the text the that user has entered by using the
                                // TextEditingController.
                                content: Text(
                                    "Oops! You forgot to enter the description and amount.Please enter the information "),
                              );
                            },
                          );
                        } else if (mycontrollerDesc.text.isEmpty) {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Retrieve the text the that user has entered by using the
                                // TextEditingController.
                                content: Text(
                                    "Oops! You forgot to enter the description."),
                              );
                            },
                          );
                        } else if (mycontrollerAmount.text.isEmpty) {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Retrieve the text the that user has entered by using the
                                // TextEditingController.
                                content: Text(
                                    "Oops! Yor forgot to enter the amount"),
                              );
                            },
                          );
                        } else  {
                          currentAmount = int.parse(mycontrollerAmount.text);
                          txt = (int.parse(txt) + currentAmount).toString();

                          Map<String, String> data = {
                            "description": mycontrollerDesc.text,
                            "amount": mycontrollerAmount.text,
                          };
                          var response = await n.post("/user/addexpense", data);
                          Map<String, dynamic> d = jsonDecode(response.body);
                          if (d['msg'] == "success") {
                            mycontrollerAmount.text="";
                            mycontrollerDesc.text="";
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // Retrieve the text the that user has entered by using the
                                  // TextEditingController.
                                  content: Text("Expense added successfully!"),
                                );
                              },
                            );
                          }
                        }
                      });
                    },
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  String validateDescription(String str) {
    if (str.isEmpty) {
      return "Description can't be empty ";
    } else {
      return null;
    }
  }
}
/*class SecondRoute extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
  }
}*/
