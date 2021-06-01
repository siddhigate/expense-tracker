import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler{


  String baseurl ="http://192.168.43.216:5000";


  var log = Logger();


  
  Future get(String url) async {
   
    String fullurl = baseurl+url;
    
    var response = await http.get(
      fullurl,
      
    );
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    
    String url1 = baseurl+url;
    log.d(body);
    var response = await http.post(
      url1,
      headers: {
        "Content-type": "application/json"
      },
      body: json.encode(body),
    );
    log.d(response.body);
    return response;
  }

  
  Future<http.Response> postS(String url) async {
    
    String url1 = baseurl+url;
   // log.d(body);
    var response = await http.post(
      url1,
      headers: {
        "Content-type": "application/json"
      },
      
    );
    log.d(response.body);
    return response;
  }


  Future<http.Response> delete(String url) async {
    
    String url1 = baseurl+url;
   // log.d(body);
    var response = await http.delete(
      url1,
   
    );
    log.d(response.body);
    return response;
  }


}