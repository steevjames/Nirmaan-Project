import 'package:flutter/material.dart';
import 'package:carbonfootprint/Components/styling.dart';

class Questionnare2 extends StatefulWidget {
  final Function submitAction;
  final Color primaryColor;
  Questionnare2({@required this.submitAction, @required this.primaryColor});
  @override
  _QuestionnareState createState() => _QuestionnareState();
}

class _QuestionnareState extends State<Questionnare2> {
  static Map<String, dynamic> responses = {};

  static updateVal({key, value}) {
    responses[key.toString()] = value;
    print(responses);
  }

  List<Map<String, dynamic>> content = [
    {
      "heading": "New content here (to be added)",
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
      "options": ["Option 1", "Option 2", "Option 3"],
      "handleValue": (key, value) {
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
      "options": ["Option 1", "Option 2", "Option 3"],
      "handleValue": (key, value) {
        updateVal(key: key, value: value);
      },
    },
    {
      "heading": "Energy Consumption",
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
      "options": ["Option 1", "Option 2", "Option 3"],
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
    Color primaryColor = widget.primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[SizedBox(height: 10)] +
              List.generate(
                content.length,
                (index) {
                  Widget returnWidget;
                  if (content[index]["type"] == "heading")
                    returnWidget = Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                          Container(
                            color: Colors.black26,
                            height: 1,
                            margin: EdgeInsets.only(left: 50, top: 7),
                            width: MediaQuery.of(context).size.width * .5,
                          )
                        ],
                      ),
                    );
                  else if (content[index]["type"] == "number")
                    returnWidget = Row(
                      children: [
                        SizedBox(width: 15),
                        Expanded(
                          flex: 1,
                          child: Text(
                            content[index]["question"],
                            style: TextStyle(
                              fontSize: 13,
                              color: textColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            onChanged: (val) {
                              content[index]["handleValue"](index, val);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primaryColor,
                                  width: 1.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12,
                              ),
                            ),
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
                        SizedBox(width: 15),
                        Expanded(
                          flex: 1,
                          child: Text(
                            content[index]["question"],
                            style: TextStyle(
                              fontSize: 13,
                              color: textColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Choose an option';
                              }
                              return null;
                            },
                            value: responses[index.toString()],
                            hint: new Text(
                              responses[index.toString()] ?? "Choose",
                              style: TextStyle(fontSize: 13),
                            ),
                            items: List.generate(
                                content[index]["options"].length,
                                (index2) => content[index]["options"][index2]
                                    .toString()).map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(
                                  value,
                                  style: TextStyle(fontSize: 13),
                                ),
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
                SizedBox(height: 20),
                Center(
                  child: RaisedButton(
                    color: primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      bool isFormValidated = _formKey.currentState.validate();
                      print(isFormValidated);
                      print(responses.toString());
                      if (isFormValidated) {
                        widget.submitAction(
                            pageData: responses, context: context);
                      }
                    },
                  ),
                ),
                SizedBox(height: 50),
              ],
        ),
      ),
    );
  }
}
