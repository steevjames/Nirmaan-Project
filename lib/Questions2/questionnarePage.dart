import 'package:carbonfootprint/Components/alertDialog.dart';
import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carbonfootprint/Questions2/Components/section1.dart';
import 'package:carbonfootprint/Questions2/Components/section2.dart';
import 'package:carbonfootprint/Questions2/Components/section3.dart';
import 'package:flutter/material.dart';

class QuestionnarePage extends StatefulWidget {
  @override
  _QuestionnarePageState createState() => _QuestionnarePageState();
}

class _QuestionnarePageState extends State<QuestionnarePage> {
  static Map<String, dynamic> collectedData = {};
  int pageIndex = 0;
  ScrollController _scrollController = ScrollController();

  List<String> headings = ["Household", "Transport", "Lifestyle"];
  List<Color> colors = [primaryColor, Color(0xff007a5e), Color(0xff2e856e)];
  // Asigns pages in init state
  List<Widget> pageBodies;

  bool isLoading = false;

  load() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      isLoading = false;
    });
  }

  manageSubmission({@required pageData, @required context}) {
    collectedData[headings[pageIndex]] = pageData;
    print(collectedData);
    setState(() {
      if (pageIndex == headings.length - 1) {
        alertDialog(
            text:
                "Data has been collected. Footprint calculation & storage to be done.\n\nData collected is: \n\n" +
                    collectedData.toString(),
            context: context);
        return;
      }
      load();
      _scrollController.animateTo(0,
          duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      pageIndex += 1;
    });
  }

  @override
  void initState() {
    collectedData = {};
    // Assign pages here...
    pageBodies = [
      Questionnare1(
        submitAction: manageSubmission,
        primaryColor: colors[0],
      ),
      Questionnare2(
        submitAction: manageSubmission,
        primaryColor: colors[1],
      ),
      Questionnare3(
        submitAction: manageSubmission,
        primaryColor: colors[2],
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: zeroHeightAppbar(color: colors[pageIndex]),
      body: WillPopScope(
        onWillPop: () async {
          await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              // title: Text('Exit calculator ?'),
              title: Text(
                '\nDo you want to exit the carbon foorptint questionnare ?',
                style: TextStyle(
                  fontSize: 15,
                  color: textColor,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),

              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
          );
          return false;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                color: colors[pageIndex],
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Text(
                          isLoading ? " " : headings[pageIndex],
                          style: TextStyle(color: Colors.white, fontSize: 27),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 30,
                    color: colors[pageIndex],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: isLoading
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    colors[pageIndex]),
                              ),
                            ),
                          )
                        : pageBodies[pageIndex],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
