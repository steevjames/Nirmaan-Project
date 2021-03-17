import 'dart:convert';

import 'package:carbonfootprint/Components/alertDialog.dart';
import 'package:carbonfootprint/Navigation/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication.dart';

class LoginPage extends StatefulWidget {
  final bool autoLogin;
  LoginPage({this.autoLogin});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  login() async {
    setState(() {
      isLoading = true;
    });
    try {
      User result = await signInWithGoogle();
      if (result != null) {
        Map<String, dynamic> userDetails = {
          "name": result.displayName,
          "email": result.email,
          "phone": result.phoneNumber,
          "photo": result.photoURL
        };
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userDetails', jsonEncode(userDetails));
        while (Navigator.canPop(context)) Navigator.pop(context);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return NavigationBar();
            },
          ),
        );
      }
    } catch (e) {
      print("error $e");
      setState(() {
        isLoading = false;
      });
      alertDialog(text: "Login Failed", context: context);
    }
  }

  @override
  void initState() {
    if (widget.autoLogin == null || widget.autoLogin) login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SafeArea(child: Center()),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    isLoading ? "Logging in" : "Login",
                    style: TextStyle(color: Color(0xff666666), fontSize: 25),
                  ),
                ),
              ),
              SizedBox(height: 70),
              Image(
                image: AssetImage("assets/images/login.png"),
                height: 140.0,
              ),
            ],
          ),
          Column(
            children: [
              // Signin Button

              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      onPressed: () {
                        login();
                      },
                      // borderSide: BorderSide(color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                                image: AssetImage("assets/images/google.png"),
                                height: 35.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

              SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }
}
