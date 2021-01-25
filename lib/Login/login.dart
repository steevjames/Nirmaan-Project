import 'dart:async';
import 'dart:convert' show json;
import 'package:carbonfootprint/Navigation/navigation.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'animation.dart';
import 'authentication.dart';
import 'package:carbonfootprint/Homepage/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              FlutterLogo(size: 150),
              SizedBox(height: 70),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NavigationBar();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                  fontSize: 20,
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
//
//GoogleSignIn _googleSignIn = GoogleSignIn(
//  scopes: <String>[
//    'email',
//    'https://www.googleapis.com/auth/contacts.readonly',
//  ],
//);
//
//class SignInDemo extends StatefulWidget {
//  @override
//  State createState() => SignInDemoState();
//}
//
//class SignInDemoState extends State<SignInDemo> {
//  GoogleSignInAccount _currentUser;
//  String _contactText;
//
//  @override
//  void initState() {
//    super.initState();
////    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
////      setState(() {
////        _currentUser = account;
////      });
////      if (_currentUser != null) {
////        _handleGetContact();
////      }
////    });
////    _googleSignIn.signInSilently();
//  }
//
////  Future<void> _handleGetContact() async {
////    setState(() {
////      _contactText = "Loading contact info...";
////    });
////    final http.Response response = await http.get(
////      'https://people.googleapis.com/v1/people/me/connections'
////      '?requestMask.includeField=person.names',
////      headers: await _currentUser.authHeaders,
////    );
////    if (response.statusCode != 200) {
////      setState(() {
////        _contactText = "People API gave a ${response.statusCode} "
////            "response. Check logs for details.";
////      });
////      print('People API ${response.statusCode} response: ${response.body}');
////      return;
////    }
////    final Map<String, dynamic> data = json.decode(response.body);
////    final String namedContact = _pickFirstNamedContact(data);
////    setState(() {
////      if (namedContact != null) {
////        _contactText = "I see you know $namedContact!";
////      } else {
////        _contactText = "No contacts to display.";
////      }
////    });
////  }
//
////  String _pickFirstNamedContact(Map<String, dynamic> data) {
////    final List<dynamic> connections = data['connections'];
////    final Map<String, dynamic> contact = connections?.firstWhere(
////      (dynamic contact) => contact['names'] != null,
////      orElse: () => null,
////    );
////    if (contact != null) {
////      final Map<String, dynamic> name = contact['names'].firstWhere(
////        (dynamic name) => name['displayName'] != null,
////        orElse: () => null,
////      );
////      if (name != null) {
////        return name['displayName'];
////      }
////    }
////    return null;
////  }
//
////  Future<void> _handleSignIn() async {
////    try {
////      await _googleSignIn.signIn();
////    } catch (error) {
////      print(error);
////    }
////  }
//
//  // Future<void> _handleSignOut() => _googleSignIn.disconnect();
//
//  Widget _buildBody() {
//    if (_currentUser != null) {
//      return Column(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
////          ListTile(
////            leading: GoogleUserCircleAvatar(
////              identity: _currentUser,
////            ),
////            title: Text(_currentUser.displayName ?? ''),
////            subtitle: Text(_currentUser.email ?? ''),
////          ),
////          const Text("Signed in successfully."),
////          Text(_contactText ?? ''),
////          RaisedButton(
////            child: const Text('SIGN OUT'),
////            onPressed: _handleSignOut,
////          ),
////          RaisedButton(
////            child: const Text('REFRESH'),
////            onPressed: _handleGetContact,
////          ),
//        ],
//      );
//    } else {
//      return Container(
//        child: MaterialButton(
//          child: Text(
//            "Sign In With Google",
//            style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
//          ),
//          onPressed: () {
//            signInWithGoogle().then((result) {
//              if (result != null) {
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                    builder: (context) {
//                      return HomePage();
//                    },
//                  ),
//                );
//              }
//            });
//          },
//        ),
//      );
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        backgroundColor: Colors.white,
//        body: SingleChildScrollView(
//          child: Container(
//            child: Column(
//              children: <Widget>[
//                Container(
//                  height: 250,
//                  decoration: BoxDecoration(
//                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
