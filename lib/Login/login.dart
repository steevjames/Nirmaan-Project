// import 'dart:async';
// import 'dart:convert' show json;
import 'package:carbonfootprint/Navigation/navigation.dart';
// import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'animation.dart';
import 'authentication.dart';
// import 'package:carbonfootprint/Homepage/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image(image: AssetImage("assets/images/logocover.jpeg")),
              Image(
                image: AssetImage("assets/images/bluelogin1.jpg"),
                height: 320.0,
              ),
              SizedBox(height: 10),
              isLoading ? CircularProgressIndicator() : _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return RaisedButton(
      splashColor: Colors.white,
      color: Colors.white,
      onPressed: () async {
        setState(() {
          isLoading = true;
        });
        try {
          var result = await signInWithGoogle();
          print(result);
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NavigationBar();
                },
              ),
            );
          }
        } catch (_) {
          print("Login failed");
          setState(() {
            isLoading = false;
          });
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      // borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/images/google.png"), height: 35.0),
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
    );
  }
}

//                      image: DecorationImage(
//                          image: AssetImage('assets/images/logocover.jpeg'),
//                          fit: BoxFit.fill)),
//                  child: Stack(
//                    children: <Widget>[
//                      Positioned(
//                        child: FadeAnimation(
//                            1.6,
//                            Container(
//                              margin: EdgeInsets.only(top: 50),
//                              child: Center(
//                                child: Text(
//                                  "",
//                                  style: TextStyle(
//                                      color: Colors.white,
//                                      fontSize: 40,
//                                      fontWeight: FontWeight.bold),
//                                ),
//                              ),
//                            )),
//                      )
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.all(30.0),
//                  child: Column(
//                    children: <Widget>[
//                      FadeAnimation(
//                          2,
//                          Container(
//                            height: 100,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(20),
//                                gradient: LinearGradient(colors: [
//                                  Colors.lightGreen[200],
//                                  Colors.white,
//                                ])),
//                            child: Center(
//                              child: new Image.asset('assets/images/back.jpg'),
//                            ),
//                          )),
//                    ],
//                  ),
//                ),
//                Text(
//                  "Sample Logo!",
//                  style: TextStyle(color: Colors.lightGreen[900]),
//                ),
//                Padding(
//                  padding: EdgeInsets.all(30.0),
//                  child: Column(
//                    children: <Widget>[
//                      Divider(
//                        thickness: 1,
//                        indent: 40,
//                        endIndent: 40,
//                      ),
//                      SizedBox(
//                        height: 20,
//                      ),
//                      FadeAnimation(
//                          2,
//                          Container(
//                            height: 40,
//                            decoration: BoxDecoration(
//                                //boxShadow: ,
//                                color: Colors.white,
//                                boxShadow: [
//                                  new BoxShadow(
//                                    color: Colors.grey[400],
//                                    blurRadius: 10.0,
//                                  ),
//                                ]
//                                //borderRadius: BorderRadius.circular(30),
//                                ),
//                            child: Center(
//                              child: Row(
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: Icon(
//                                      FontAwesomeIcons.google,
//                                      color: Colors.blue[900],
//                                    ),
//                                  ),
//                                  _buildBody(),
//                                ],
//                              ),
//                            ),
//                          )),
//                      SizedBox(
//                        height: 20,
//                      ),
//                      FadeAnimation(
//                          1.5,
//                          Text(
//                            "You are not currently signed in!",
//                            style: TextStyle(color: Colors.grey[400]),
//                          )),
//                    ],
//                  ),
//                )
//              ],
//            ),
//          ),
//        ));
//  }
//}
