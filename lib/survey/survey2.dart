import 'package:flutter/material.dart';

import '../main.dart';

import 'survey1.dart';
import 'survey3.dart';
import 'survey_widgets.dart';

class SurveyPage2 extends StatefulWidget {
  SurveyPage2({required this.appState});

  ApplicationState appState;

  _SurveyPage2State createState() => _SurveyPage2State();
}

class _SurveyPage2State extends State<SurveyPage2> {
  final List<String> _yearList = [for(var i=2008; i<=2018; i+=1) i.toString()];
  final List<String> _yearList2 = [for(var i=2000; i>=1974; i-=1) i.toString()];
  final List<String> _monthList = [for(var i=1; i<=12; i+=1) i.toString()];

  final _formKey = GlobalKey<FormState>(debugLabel: '_SurveyPage2State');

  String _hairGrowth = '0';
  bool _validateHairGrowth = true;

  final GlobalKey<DropDownState> _periodStartYear = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _periodStartMonth = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherPeriodStartYear = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherPeriodStartMonth = GlobalKey<DropDownState>();

  bool _noPeriodStart = false;

  bool validateHairGrowth() {
    if (_hairGrowth == '0') {
      setState(() {_validateHairGrowth = false;});
    }
    else {
      setState(() {_validateHairGrowth = true;});
    }
    return _validateHairGrowth;
  }

  String? _periodStartValidator(String? value) {
    if (_noPeriodStart) {
      return null;
    }
    return defaultValidator(value);
  }

  @override
  void initState() {
    super.initState();

    _noPeriodStart = widget.appState.userInfo.containsKey('periodStartYear') && widget.appState.userInfo['periodStartYear'].isEmpty ? true : false;
    _hairGrowth = widget.appState.userInfo.containsKey('hairGrowth') ? widget.appState.userInfo['hairGrowth'] : '0';
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
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height: 60),
                  TitleText('1. 자녀 정보 (사춘기)'),

                  SizedBox(height: 10.0),
                  ProgressBar(31),

                  SizedBox(height: 30.0),
                  QuestionText('9. 아이의 체모 발달 정도는 얼마나 진행되었나요?'),
                  SizedBox(height: 20.0),
                  Row(children: [
                    Column(children: [
                      Checkbox(
                        shape: CircleBorder(),
                        value: _hairGrowth == '1',
                        onChanged: (value) {
                          setState(() {
                            _hairGrowth = '1';
                          });
                        },
                      ),
                      Checkbox(
                        shape: CircleBorder(),
                        value: _hairGrowth == '2',
                        onChanged: (value) {
                          setState(() {
                            _hairGrowth = '2';
                          });
                        },
                      ),
                      Checkbox(
                        shape: CircleBorder(),
                        value: _hairGrowth == '3',
                        onChanged: (value) {
                          setState(() {
                            _hairGrowth = '3';
                          });
                        },
                      ),
                      Checkbox(
                        shape: CircleBorder(),
                        value: _hairGrowth == '4',
                        onChanged: (value) {
                          setState(() {
                            _hairGrowth = '4';
                          });
                        },
                      ),
                      Checkbox(
                        shape: CircleBorder(),
                        value: _hairGrowth == '5',
                        onChanged: (value) {
                          setState(() {
                            _hairGrowth = '5';
                          });
                        },
                      ),
                    ]),
                    SizedBox(width:20),
                    SizedBox(width:250, height:240, child: Image.asset('assets/hair.png', fit: BoxFit.fill)),
                  ]),
                  Visibility (
                    visible: !_validateHairGrowth,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 26.0),
                  QuestionText('9-1. 아이가 월경을 하고 있다면'),
                  SizedBox(height: 10.0),
                  Container(padding: EdgeInsets.only(left: 34), child:QuestionText('초경 시기를 알려주세요.')),
                  SizedBox(height: 10.0),
                  Row(
                      children: <Widget>[
                        DropDown(key: _periodStartYear,
                            value: widget.appState.userInfo.containsKey('periodStartYear') && widget.appState.userInfo['periodStartYear'].isNotEmpty ? widget.appState.userInfo['periodStartYear'] : null,
                            enabled: !_noPeriodStart,
                            validator: _periodStartValidator, hint: '시작년도', items: _yearList, width: 130),
                        JustText('년'),
                        SizedBox(width: 10),
                        DropDown(key: _periodStartMonth,
                            value: widget.appState.userInfo.containsKey('periodStartMonth') && widget.appState.userInfo['periodStartMonth'].isNotEmpty ? widget.appState.userInfo['periodStartMonth'] : null,
                            enabled: !_noPeriodStart,
                            validator: _periodStartValidator, hint: '월', items: _monthList, width: 90),
                        JustText('월에 시작했어요.'),
                      ],
                    ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Checkbox(
                        value: _noPeriodStart,
                        onChanged: (value) {
                          setState(() {
                            if (!_noPeriodStart) {
                              _periodStartYear.currentState!.value = null;
                              _periodStartMonth.currentState!.value = null;
                              _periodStartYear.currentState!.enabled = false;
                              _periodStartMonth.currentState!.enabled = false;
                            }
                            else {
                              _periodStartYear.currentState!.enabled = true;
                              _periodStartMonth.currentState!.enabled = true;
                            }
                            _noPeriodStart = !_noPeriodStart;
                          });
                        },
                      ),
                      NoText('월경을 하고 있지 않아요.'),
                    ],
                  ),

                  SizedBox(height: 25.0),
                  QuestionText('10. 엄마의 초경 시기를 알려주세요.'),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      DropDown(key: _motherPeriodStartYear,
                          value: widget.appState.userInfo.containsKey('motherPeriodStartYear') ? widget.appState.userInfo['motherPeriodStartYear'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '시작년도', items: _yearList2, width: 130),
                      JustText('년'),
                      SizedBox(width: 10),
                      DropDown(key: _motherPeriodStartMonth,
                          value: widget.appState.userInfo.containsKey('motherPeriodStartMonth') ? widget.appState.userInfo['motherPeriodStartMonth'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '월', items: _monthList, width: 90),
                      JustText('월에 시작했어요.'),
                    ],
                  ),

                  SizedBox(height:55.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WhiteButton(
                          width:128,
                          height:38,
                          text: '이전 단계로',

                          onPressed: () {
                            widget.appState.state = 'survey1';
                            /*Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => SurveyPage1(appState: widget.appState)));*/
                          }
                      ),
			SizedBox(width:15),
                      BlueButton(
                          width: 122,
                          height:41,
                          text: '다음 단계로',

                          onPressed: () async {
                            bool flag1 = _formKey.currentState!.validate();
                            bool flag2 = validateHairGrowth();

                            if (flag1 && flag2) {
                              Map<String, dynamic> info = {
                                'phase': 'survey3intro',

                                'hairGrowth': _hairGrowth,
                                'periodStartYear': _periodStartYear.currentState!.value == null ? '' : _periodStartYear.currentState!.value.toString(),
                                'periodStartMonth': _periodStartMonth.currentState!.value == null ? '' : _periodStartMonth.currentState!.value.toString(),
                                'motherPeriodStartYear': _motherPeriodStartYear.currentState!.value.toString(),
                                'motherPeriodStartMonth': _motherPeriodStartMonth.currentState!.value.toString(),
                              };

                              print(info);

                              widget.appState.writeDB(info);

                              widget.appState.state = 'survey3intro';
                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => SurveyPage3Intro(appState: widget.appState))
                              );*/
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
