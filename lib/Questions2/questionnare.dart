import 'package:carbonfootprint/Components/alertDialog.dart';
import 'package:carbonfootprint/Components/styling.dart';
import 'package:flutter/material.dart';

class Questionnare extends StatefulWidget {
  @override
  _QuestionnareState createState() => _QuestionnareState();
}

class _QuestionnareState extends State<Questionnare> {
  static Map<String, dynamic> responses = {};

  static updateVal({key, value}) {
    responses[key.toString()] = value;
    print(responses);
  }

  // Todo convert response to carbon footprint value in handleValue of each question before calling updateVal

  List<Map<String, dynamic>> content = [
    {
      "heading": "ABOUT YOUR HOUSEHOLD",
      "icon": Icons.house,
      "type": "heading",
    },
    {
      "question": "Number of people in the household",
      "type": "number",
      "handleValue": (key, value) {
        updateVal(key: key, value: value);
      },
    },
    {
      "question": "Country of residence",
      "type": "dropdown",
      "options": ["option 1", "option 2", "option 3"],
      "handleValue": (key, value) {
        print(key.toString() + value);
        updateVal(key: key, value: value);
      },
    },
    {
      "question": "Size of housing (m2)",
      "type": "number",
      "handleValue": (key, value) {
        updateVal(key: key, value: value);
      },
    },
    {
      "question": "Type of housing",
      "type": "dropdown",
      "options": ["option 1", "option 2", "option 3"],
      "handleValue": (key, value) {
        updateVal(key: key, value: value);
      },
    },
    {
      "heading": "ENERGY CONSUMPTION",
      "icon": Icons.power,
      "type": "heading",
    },
    {
      "question": "Electricity consumption (KWh/month)",
      "type": "number",
      "handleValue": (key, value) {
        updateVal(key: key, value: value);
      },
    },
    {
      "question": "% from a clean energy source",
      "type": "number",
      "handleValue": (key, value) {
        updateVal(key: key, value: value);
      },
    },
    {
      "question": "Heating energy source",
      "type": "dropdown",
      "options": ["option 1", "option 2", "option 3"],
      "handleValue": (key, value) {
        updateVal(key: key, value: value);
      },
    },
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    responses = {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Questionnare"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[] +
                List.generate(
                  content.length,
                  (index) {
                    Widget returnWidget;

                    if (content[index]["type"] == "heading")
                      returnWidget = Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Row(
                          children: [
                            Icon(
                              content[index]["icon"],
                              color: primaryColor,
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                content[index]["heading"],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    else if (content[index]["type"] == "number")
                      returnWidget = Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              content[index]["question"],
                              style: TextStyle(
                                fontSize: 13,
                                color: textColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              onChanged: (val) {
                                content[index]["handleValue"](index, val);
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter a Value';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      );
                    else if (content[index]["type"] == "dropdown")
                      returnWidget = Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              content[index]["question"],
                              style: TextStyle(
                                fontSize: 13,
                                color: textColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField<String>(
                              validator: (value) {
                                if (value == null) {
                                  return 'Choose an option';
                                }
                                return null;
                              },
                              value: responses[index.toString()],
                              hint: new Text(
                                  responses[index.toString()] ?? "Choose"),
                              items: List.generate(
                                  content[index]["options"].length,
                                  (index2) => content[index]["options"][index2]
                                      .toString()).map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (val) {
                                content[index]["handleValue"](index, val);
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      );
                    else
                      returnWidget = Text("type");
                    return Column(
                      children: [
                        returnWidget,
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                ) +
                [
                  Center(
                    child: RaisedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        bool isFormValidated = _formKey.currentState.validate();
                        print(isFormValidated);
                        print(responses.toString());
                        if (isFormValidated) {
                          alertDialog(
                              text: "Responses are :\n\n " +
                                  responses.toString() +
                                  "\n\n(Use handle value function with each question to convert all values to numbers, then just add to get final carbon footprint when actually doing)",
                              context: context);
                          // Do something
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                ],
          ),
        ),
      ),
    );
  }
}
