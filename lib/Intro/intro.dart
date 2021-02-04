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

  void checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('firstTime');
    if (firstTime == false)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Home()),
      );
  }

  void _onIntroEnd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool firstTime = prefs.getBool('firstTime');
    await prefs.setBool('firstTime', false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Home()),
    );
  }

  // Widget _buildImage(String assetName) {
  //   return Align(
  //     child: Image.asset('assets/$assetName.jpg', width: 350.0),
  //     alignment: Alignment.bottomCenter,
  //   );
  // }

  @override
  void initState() {
    checkFirstTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      pageColor: Colors.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        color: Color(0xff555555),
        fontSize: 25.0,
        // fontStyle: FontStyle.italic,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.grey,
        fontStyle: FontStyle.italic,
      ),
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Carbon Footprint",
          body:
              "A carbon footprint is the amount of greenhouse gases—primarily carbon dioxide—released into the atmosphere by a particular human activity. ",
          image: Center(
            child: Image.asset("assets/images/global.jpg", height: 200.0),
          ),
          //image: _buildImage('assets/images/back'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "The 3 R's",
          body:
              "Reduce, Reuse, Recycle – these three 'R' words are an important part of sustainable living, as they help to cut down on the amount of waste we have to throw away.",
          image: Center(
              child: Image.asset("assets/images/planet5.jpg", height: 200.0)),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reduce",
          body:
              "Reducing what is produced and what is consumed is essential to the best hierarchy. The logic behind it is simple to understand – if there is less waste, then there is less to recycle and reuse.",
          image: Center(
              child: Image.asset("assets/images/planet1.jpg", height: 200.0)),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reuse",
          body:
              "Reusing is the act of taking old items that you might consider throwing away and finding a new use for them.",
          image: Center(
              child: Image.asset("assets/images/planet3.jpg", height: 200.0)),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Recycle",
          body:
              "This is probably the most well-known and well-understood of the 3 Rs. If you have recycling pick-up services, you will be familiar with recycling paper, plastic and metal materials.",
          image: Center(
            child: Image.asset("assets/images/planet4.jpg", height: 200.0),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip',
          style: TextStyle(
            color: Color(0xff004c48),
          )),
      next: const Icon(
        Icons.arrow_forward,
        color: Color(0xff004c48),
      ),
      done: const Text('Done',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          )),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: Color(0xff004c48),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Home')),
      body: LoginPage(),
    );
  }
}
