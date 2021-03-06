import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUser {
  String get uid => user.uid;
  String get phoneNo => user.phoneNumber;
  String get userName => user.displayName;
  String get userEmail => user.email;
  late double lat;
  late double lng;
  late String password;
  late User user;
  // collection ref. to update user in firestore
  final CollectionReference userData =
      FirebaseFirestore.instance.collection('UserData');

  Future<User> getCurrentUser() async {
    user = await FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<void> setCurrentData() async {}

  Map toMap() {
    return {
      "userName": userName,
      "password": password,
      "uid": uid,
      "phoneNo": phoneNo,
      "lat": lat,
      "lng": lng,
    };
  }

  Future<void> storeUserInMemory(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("username", user.displayName);
    sharedPreferences.setString('email', user.email);
    sharedPreferences.setString('phone', user.phoneNumber);
    sharedPreferences.setString('uid', user.uid);
  }

  Future updateUserData(String uid, String username, String email,
      String password, String phoneNo) async {
    return await userData.doc(uid).set({
      'username': username,
      'email': email,
      'uid': uid,
      'password': password,
      'phoneNo': phoneNo,
    });
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed("/init");
  }
}
