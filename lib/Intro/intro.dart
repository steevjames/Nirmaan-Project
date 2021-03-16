import 'package:carbonfootprint/Components/styling.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:carbonfootprint/Login/login.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() async {
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
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      bodyTextStyle: TextStyle(
        fontSize: 16.0,
        color: Colors.grey,
        fontStyle: FontStyle.normal,
      ),
    );

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
              child: Image.asset("assets/images/planet5.jpg", height: 200.0)),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Let's Get Started",
          bodyWidget: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "Reducing what is produced and what is consumed is essential to the best hierarchy. The logic behind it is simple to understand – if there is less waste, then there is less to recycle and reuse.",
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
              child: Image.asset("assets/images/planet1.jpg", height: 200.0)),
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
      done: const Text('',
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
