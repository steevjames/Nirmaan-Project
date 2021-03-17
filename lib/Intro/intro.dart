import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:carbonfootprint/Login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  Future firstTime;
  Future isLoggedin;

  checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('firstTime') ?? 1;
  }

  checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userDetails') ?? false;
  }

  void _onIntroEnd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('firstTime', 0);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  @override
  void initState() {
    isLoggedin = checkLoggedIn() ?? false;
    firstTime = checkFirstTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      pageColor: Colors.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        color: Color(0xff004c48),
        fontSize: 25.0,
        // fontStyle: FontStyle.italic,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      bodyTextStyle: TextStyle(
        fontSize: 16.0,
        color: Colors.grey,
        fontStyle: FontStyle.normal,
      ),
    );

    return FutureBuilder(
      future: firstTime,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        else if (snapshot.data != 1)
          return FutureBuilder(
            future: isLoggedin,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              else if (snapshot.data == false)
                return LoginPage();
              else
                return NavigationBar();
            },
          );
        else
          return IntroductionScreen(
            key: introKey,
            pages: [
              PageViewModel(
                title: "Welcome",
                body:
                    "A carbon footprint is a measure of the amount of greenhouse gases released into the atmosphere by human activities.\n\n  Abnormal increase of greenhouses gases are causing unpredictable climate changes and natural disasters, which is why we have to act while we still have the chance.",
                image: Center(
                  child: Image.asset("assets/images/global.jpg", height: 200.0),
                ),
                //image: _buildImage('assets/images/back'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "What can we do ?",
                body:
                    "The 3 R's\n\nReduce, Reuse, Recycle – these three 'R' words are an important part of sustainable living, as they help to cut down on the amount of waste we have to throw away.",
                image: Center(
                    child: Image.asset("assets/images/planet5.jpg",
                        height: 200.0)),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Let's do our part !",
                bodyWidget: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        "Reducing what is produced and what is consumed is essential to the best hierarchy. Let's take the initiative and do our part to keep the world as it is.",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        _onIntroEnd();
                      },
                      child: Text("Lets get started !"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          primaryColor,
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                image: Center(
                    child: Image.asset("assets/images/planet1.jpg",
                        height: 200.0)),
                decoration: pageDecoration,
              ),
            ],
            onDone: () => _onIntroEnd(),
            //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
            showSkipButton: true,
            skipFlex: 0,
            nextFlex: 0,
            skip: const Text(
              '',
              style: TextStyle(
                color: Color(0xff004c48),
              ),
            ),
            // next: const Icon(
            //   Icons.arrow_forward,
            //   color: Color(0xff004c48),
            // ),
            done: const Text('',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                )),
            dotsDecorator: const DotsDecorator(
              size: Size(7.0, 7.0),
              activeColor: Color(0xff004c48),
              color: Color(0xFFBDBDBD),
              activeSize: Size(15.0, 15.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
            ),
          );
      },
    );
  }
}
