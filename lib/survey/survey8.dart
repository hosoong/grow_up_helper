import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_choices/search_choices.dart';

import '../main.dart';

import 'survey_widgets.dart';

class SurveyPage8 extends StatefulWidget {
  SurveyPage8({required this.appState});

  ApplicationState appState;

  _SurveyPage8State createState() => _SurveyPage8State();
}

class _SurveyPage8State extends State<SurveyPage8> {
  final List<String> _scheduleImagePath = ['assets/schedule1.png', 'assets/schedule2.png', 'assets/schedule3.png'];

  final _formKey = GlobalKey<FormState>(debugLabel: '_SurveyPage8State');

  int scheduleIndex = 0;

  bool validateSchedule() {
    if (scheduleIndex == 2) {
      return true;
    }
    else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : true,
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height: 60),
                  TitleText('아이 일과 입력'),

                  SizedBox(height: 10.0),
                  ProgressBar(53),

                  SizedBox(height: 30.0),
                  QuestionText('                   아이의 하루 일과가 어떻게 되나요?'),

                  SizedBox(height: 20.0),
                  Image(image: AssetImage('assets/days.png'),
                  width:312,
                  height:30),

                  SizedBox(height: 30.0),
                  MaterialButton(
                    child: Image(image: AssetImage(_scheduleImagePath[scheduleIndex]),
                      width:335,
                      height:698),
                  onPressed: () {
                      setState((){
                        if (scheduleIndex < 2) {
                          scheduleIndex++;
                        }
                      });
                  }),


                  SizedBox(height:40.0),
                  Row(
                      mainAxisAlignment: scheduleIndex == 2 ? MainAxisAlignment.center : MainAxisAlignment.center,
                      children: [
                        scheduleIndex == 2 ? WhiteButton(
                            width:126,
                            height:38,
                            text: '이전 단계로',

                            onPressed: () {
                              widget.appState.state = 'survey7';
                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => SurveyPage2(appState: widget.appState)));*/
                            }
                        ) :
                        BlueButton(
                            width:126,
                            height:38,
                            text: '이전 단계로',

                            onPressed: () {
                              widget.appState.state = 'survey7';
                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => SurveyPage2(appState: widget.appState)));*/
                            }
                        ),
                        SizedBox(width:15),
                        Visibility(child:BlueButton(
                            width:122,
                            height:41,
                            text: '다음 단계로',

                            onPressed: () async {
                              bool flag1 = _formKey.currentState!.validate();

                              bool flag2 = validateSchedule();

                              if (flag1 && flag2) {
                                Map<String, dynamic> info = {
                                  'phase': 'survey9',
                                };

                                print(info);

                                widget.appState.writeDB(info);

                                widget.appState.state = 'survey9';

                              }
                              else {
                                showDialog<void>(
                                    context: context,
                                    builder: (context) {
                                      return AlertPopup();
                                    }
                                );
                              }
                            }
                        ),
                        visible: scheduleIndex == 2),
                      ]
                  ),
                  SizedBox(height:20)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}