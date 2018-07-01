import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:crypto_coin_watch/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  List coins = await getInfo();
  print(coins);
  runApp(new MyApp(coins));}

class MyApp extends StatelessWidget {
  final List _coins;
  MyApp(this._coins);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new HomePage(_coins),
    );
  }
}
Future<List> getInfo() async {
  String CryptoURL = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(CryptoURL);
  return JSON.decode(response.body);

}

