import 'package:carbonfootprint/Components/alertDialog.dart';
import 'package:carbonfootprint/Components/styling.dart';
import 'package:carbonfootprint/Components/zeroHeightAppbar.dart';
import 'package:flutter/material.dart';

// Login & UI is mixed, edit carefully

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  // This is the set from which questions are taken.
  List<Map<String, dynamic>> questions = [
    {
      "question": "How would you describe your diet?",
      "description":
          "We take into account the full lifecycle of different foods, including direct emissions and land use change.",
      "options": [
        {"option": "Meat or dairy with most meals", "impact": 3},
        {"option": "Meat a few meals per week", "impact": 10},
        {"option": "Vegetrian (ovo-lacto)", "impact": 15},
        {"option": "No beef or dairy (poultry instead of beef)", "impact": 5},
        {"option": "Vegan", "impact": 1},
      ]
    },
    {
      "question":
          "How much of the food you buy is seasonal and localy sourced?",
      "description":
          "Approximately 6 to 11% of food's carbon footprint comes from its transport and storage.",
      "options": [
        {"option": "I only buy local and seasonal food", "impact": 8},
        {"option": "I mostly eat local and seasonal food", "impact": 15},
        {
          "option":
              "I avoid flown in foods but otherwise I don’t consider distance travelled when buying food",
          "impact": 7
        },
        {"option": "No beef or dairy (poultry instead of beef)", "impact": 11},
        {
          "option": "I don’t consider distance travelled when buying food",
          "impact": 12
        },
      ],
    },
    {
      "question": "How much of the food you buy goes to waste?",
      "description":
          "This represents the percentage of all the food you buy that goes to waste. This excludes unedible parts.",
      "options": [
        {"option": "0 - 10%", "impact": 4},
        {"option": "10 - 20%", "impact": 3},
        {"option": "20 - 30%", "impact": 2},
        {"option": "30 - 40%", "impact": 1},
      ]
    },
    {
      "question": "What percentage of household waste do you recycle?",
      "description": "plastic, metals, glass, paper and cardboard.",
      "options": [
        {"option": "0%", "impact": 45},
        {"option": "20%", "impact": 35},
        {"option": "50%", "impact": 25},
        {"option": "80%", "impact": 15},
        {"option": "100%", "impact": 1},
      ]
    },
  ];
  var totalImpact = 0;

  // Selected index controls which question is selected.
  int selectedIndex = 0;
  int selectedRadio = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Zero height appbar: It avoids status bar
      appBar: zeroHeightAppbar(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: primaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: Text(
                        (selectedIndex + 1).toString(),
                      ),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: Text(
                        questions[selectedIndex]["question"],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 50,
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
                  child: Column(
                    children: <Widget>[
                          SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              questions[selectedIndex]["description"],
                              style: TextStyle(
                                  color: textColorLight, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 15),
                        ] +
                        List.generate(
                          questions[selectedIndex]["options"].length,
                          // Generates list of Radio buttons
                          (index) => RadioListTile(
                            dense: true,
                            value: index,
                            groupValue: selectedRadio,
                            onChanged: (option) {
                              setState(() {
                                selectedRadio = option;
                              });
                            },
                            title: Text(
                              questions[selectedIndex]["options"][index]
                                  ["option"],
                              style: TextStyle(
                                color: textColor,
                                fontSize: 14.5,
                              ),
                            ),
                          ),
                        ) +
                        [
                          SizedBox(height: 20),
                          RaisedButton(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: primaryColor,
                              ),
                            ),
                            child: Text(
                              selectedIndex == questions.length - 1
                                  ? "Submit"
                                  : "Next",
                              style: TextStyle(
                                color: textColor,
                              ),
                            ),
                            onPressed: () {
                              // If last question
                              if (selectedIndex == questions.length - 1) {
                                alertDialog(
                                    text: "Total impact is " +
                                        (totalImpact +
                                                questions[selectedIndex]
                                                        ["options"]
                                                    [selectedRadio]["impact"])
                                            .toString(),
                                    context: context);
                              }
                              // If not last question
                              else {
                                if (selectedRadio == -1)
                                  alertDialog(
                                      text: "Select an option",
                                      context: context);
                                else
                                  setState(() {
                                    totalImpact += questions[selectedIndex]
                                        ["options"][selectedRadio]["impact"];
                                    selectedIndex += 1;
                                    selectedRadio = -1;
                                  });
                              }
                            },
                          ),
                          SizedBox(height: 30),
                        ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
