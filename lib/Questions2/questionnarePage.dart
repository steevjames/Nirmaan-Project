import 'package:carbonfootprint/Components/alertDialog.dart';
import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:carbonfootprint/Questions2/Components/section1.dart';
import 'package:carbonfootprint/Questions2/Components/section2.dart';
import 'package:flutter/material.dart';

class QuestionnarePage extends StatefulWidget {
  @override
  _QuestionnarePageState createState() => _QuestionnarePageState();
}

class _QuestionnarePageState extends State<QuestionnarePage> {
  static Map<String, dynamic> collectedData = {};
  int pageIndex = 0;
  ScrollController _scrollController = ScrollController();

  List<String> headings = ["Household", "Transport", "Something Else"];
  // Asign pages in init state
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
    load();
    setState(() {
      if (pageIndex == 1) {
        alertDialog(
            text:
                "Data has been collected. Will add data procesing & more pages.\n\n" +
                    collectedData.toString(),
            context: context);
        return;
      }
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
      ),
      Questionnare2(
        submitAction: manageSubmission,
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: zeroHeightAppbar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              color: primaryColor,
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
                  color: primaryColor,
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
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(primaryColor),
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
    );
  }
}
