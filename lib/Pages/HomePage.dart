import 'dart:convert';

import 'package:expensetracker/Network/ExpenseValues.dart';
import 'package:expensetracker/Network/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ExpenseValue> exp = [];

  NetworkHandler n = new NetworkHandler();
  String text = "0";

  void getData() async {
    var response = await n.postS("/user/getexpenses");

    exp = [];
    List<dynamic> res = jsonDecode(response.body)['result'];
    setState(() {
      res.forEach((element) {
        exp.add(ExpenseValue.fromJson(element));
        print(element);
      });

      int total = 0;
      exp.forEach((element) {
        int amtemp = int.parse(element.amount);
        total += amtemp;
        text = total.toString();
      });
    });
  }

  void initState() {
    super.initState();
    setState(() {
      getData();
    });
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30, right: 25, left: 25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back Siddhi!",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Manage your expenses here",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 30),
                        Column(children: [
                          Text(text, style: TextStyle(fontSize: 40)),
                          SizedBox(height: 20),
                          Text("Total Expense",
                              style: TextStyle(color: Colors.grey)),
                          // Text("Spent",style:TextStyle(color: Colors.grey)),
                        ]),
                        SizedBox(height: 150, width: 40),
                        Image.asset("images/coins.png",
                            height: 174, width: 174),
                      ]),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     FloatingActionButton(
                //       child: const Icon(Icons.refresh),
                //       backgroundColor: Colors.lightBlueAccent,
                //       onPressed: () {
                //         setState(() {
                //           getData();
                //         });
                //       },
                //     ),
                //   ],
                // ),
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: exp.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(exp[index].description),
                            trailing: Icon(Icons.delete,color: Colors.lightBlueAccent,),
                            onLongPress: () async {
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: FloatingActionButton.extended(
                                        onPressed: () async {
                                          String str =
                                              exp[index].description.toString();
                                          await n.delete(
                                              "/user/delete/expense/" + str);
                                          setState(() {
                                            getData();
                                          });
                                        },
                                        label: Text("Delete")),
                                  );
                                },
                              );
                            },
                            onTap: () {
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        content: Text("You have spent " +
                                            exp[index].amount +
                                            " rupees for " +
                                            exp[index].description));
                                  });
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
