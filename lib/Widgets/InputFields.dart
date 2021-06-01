import 'package:expensetracker/Pages/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFields{

  Widget createTextField(String text,TextEditingController textEditingController){
    return TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: textEditingController,



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
                      labelText: text,
                      
                    ),
                    style: GoogleFonts.roboto(textStyle:TextStyle(fontSize: 16)),
                  );
  }

  Widget createPasswordField(TextEditingController textEditingController,bool vis){

    return TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: textEditingController,



            obscureText: vis,
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
                icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  //setState(() {
                   // vis = !vis;
                  //});
                },
              ))
              );
                    
  }
}