import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonData {
  static String newBuyPkgID = '';
  static const String gymerRole = "Gymer";
  static const List<String> rolesPTNE = ['pt', 'ne'];
  double getScreenWidth(context, {double resize = 0}) {
    return MediaQuery.of(context).size.width - resize;
  }

  void setNewBuyPkgID(String txt) {
    newBuyPkgID = txt;
  }

  bool isLoginable(String loggedRole) {
    return loggedRole == gymerRole;
  }

  bool isMatchRolePTNE(String? role) {
    return rolesPTNE
        .any((element) => element.toLowerCase() == role?.toLowerCase());
  }

  bool isMatchDate(String date1, String date2) {
    date1 = date1.substring(0, 10);
    date2 = date2.substring(0, 10);
    return date1 == date2;
  }

  String convertDate(String date2) {
    date2 = date2.substring(0, 10);
    return "${date2}T00:00:00";
  }

  String parsePrice(price) {
    String converted = price.toString().replaceAllMapped(
        RegExp(r"(?<=\d)(?=(\d\d\d)+(?!\d))"), (match) => "${match.group(0)}.");
    return converted;
  }

  Future<bool> setUserID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("userID", value);
  }

  Future<String> getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userID") ?? "000";
  }

  Future<bool> setUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("userName", value);
  }

  Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userName") ?? "000";
  }

  Future<bool> setPTID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("ptID", value);
  }

  Future<String> getPTID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("ptID") ?? "000";
  }

  Future<bool> setPGID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("pgID", value);
  }

  Future<String> getPGID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("pgID") ?? "000";
  }

  Future<bool> setExcerciseID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("excerciseID", value);
  }

  Future<String> getExcerciseID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("excerciseID") ?? "000";
  }

  Future<bool> setptFBID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("ptFbId", value);
  }

  Future<String> getptFBID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("ptFbId") ?? "000";
  }

  Future<bool> setNEFbID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("neFbId", value);
  }

  Future<String> getNEFBID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("neFbId") ?? "000";
  }

  Future<bool> setPGIDFeedback(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("pgID", value);
  }

  Future<String> getPGIDFeedback() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("pgID") ?? "000";
  }
}
