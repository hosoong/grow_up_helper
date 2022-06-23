import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

import 'survey4.dart';
import 'survey6.dart';
import 'survey_widgets.dart';

class SurveyPage5 extends StatefulWidget {
  SurveyPage5({required this.appState});

  ApplicationState appState;

  _SurveyPage5State createState() => _SurveyPage5State();
}

class _SurveyPage5State extends State<SurveyPage5> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_SurveyPage5State');

  final List<String> _bagWeightList = ['1', '2', '3', '4+'];
  final List<String> _hourList = [for(var i=1; i<=12; i+=1) i.toString()];
  final List<String> _minuteList = [for(var i=0; i<=59; i+=1) i.toString()];

  final GlobalKey<DropDownState> _bagWeight = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _longSittingHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _longSittingMinute = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _dailySittingHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _dailySittingMinute = GlobalKey<DropDownState>();

  String _neckPosture = '0';
  bool _validateNeckPosture = true;

  String _legPosture = '0';
  bool _validateLegPosture = true;

  String _shoulderPosture = '0';
  bool _validateShoulderPosture = true;

  String _backPosture = '0';
  bool _validateBackPosture = true;

  bool validateNeckPosture() {
    if (_neckPosture == '0') {
      setState(() {_validateNeckPosture = false;});
    }
    else {
      setState(() {_validateNeckPosture = true;});
    }
    return _validateNeckPosture;
  }

  bool validateLegPosture() {
    if (_legPosture == '0') {
      setState(() {_validateLegPosture = false;});
    }
    else {
      setState(() {_validateLegPosture = true;});
    }
    return _validateLegPosture;
  }

  bool validateShoulderPosture() {
    if (_shoulderPosture == '0') {
      setState(() {_validateShoulderPosture = false;});
    }
    else {
      setState(() {_validateShoulderPosture = true;});
    }
    return _validateShoulderPosture;
  }

  bool validateBackPosture() {
    if (_backPosture == '0') {
      setState(() {_validateBackPosture = false;});
    }
    else {
      setState(() {_validateBackPosture = true;});
    }
    return _validateBackPosture;
  }

  @override
  void initState() {
    super.initState();

    _neckPosture = widget.appState.userInfo.containsKey('neckPosture') ? widget.appState.userInfo['neckPosture'] : '0';
    _legPosture = widget.appState.userInfo.containsKey('legPosture') ? widget.appState.userInfo['legPosture'] : '0';
    _shoulderPosture = widget.appState.userInfo.containsKey('shoulderPosture') ? widget.appState.userInfo['shoulderPosture'] : '0';
    _backPosture = widget.appState.userInfo.containsKey('backPosture') ? widget.appState.userInfo['backPosture'] : '0';
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
                  TitleText('3. 상태 진단'),

                  SizedBox(height: 10.0),
                  ProgressBar(80),

                  SizedBox(height: 30.0),
                  QuestionText('1. 아이의 평소 자세는 어떤가요?'),
                  SizedBox(height: 20),
                  SizedBox(width:250, height:150, child: Image.asset('assets/neck.png', fit: BoxFit.fill)),
                  Row(
                    children: [
                      SizedBox(width:80),
                      Checkbox(
                        shape: CircleBorder(),
                        value: _neckPosture == '1',
                        onChanged: (value) {
                          setState(() {
                            _neckPosture = '1';
                          });
                        },
                      ),
                      SizedBox(width:10),
                      Checkbox(
                        shape: CircleBorder(),
                        value: _neckPosture == '2',
                        onChanged: (value) {
                          setState(() {
                            _neckPosture = '2';
                          });
                        },
                      ),
                      SizedBox(width:10),
                      Checkbox(
                        shape: CircleBorder(),
                        value: _neckPosture == '3',
                        onChanged: (value) {
                          setState(() {
                            _neckPosture = '3';
                          });
                        },
                      ),
                    ]
                  ),
                  Visibility (
                    visible: !_validateNeckPosture,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 20.0),
                  QuestionText('2. 아이가 평소에 다리를 많이 꼬는 편인가요?'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(width: 20.0),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _legPosture == '1',
                          onChanged: (value) {
                            setState(() {
                              _legPosture = '1';
                            });
                          },
                        ),
                        OptionText('꼬지 않음')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _legPosture == '2',
                          onChanged: (value) {
                            setState(() {
                              _legPosture = '2';
                            });
                          },
                        ),
                        OptionText('드물게')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _legPosture == '3',
                          onChanged: (value) {
                            setState(() {
                              _legPosture = '3';
                            });
                          },
                        ),
                        OptionText('가끔')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _legPosture == '4',
                          onChanged: (value) {
                            setState(() {
                              _legPosture = '4';
                            });
                          },
                        ),
                        OptionText('자주')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _legPosture == '5',
                          onChanged: (value) {
                            setState(() {
                              _legPosture = '5';
                            });
                          },
                        ),
                        OptionText('항상')
                      ]),
                      SizedBox(width: 20.0),
                    ],
                  ),
                  Visibility (
                    visible: !_validateLegPosture,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('3. 아이의 평소 가방의 무게는 어떤가요?'),
                  Row(
                    children: <Widget>[
                      JustText('책이 약'),
                      SizedBox(width: 10),
                      DropDown(key: _bagWeight,
                          value: widget.appState.userInfo.containsKey('bagWeight') ? widget.appState.userInfo['bagWeight'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '책 권수', items: _bagWeightList, width: 80),
                      SizedBox(width: 10),
                      JustText('권 정도 있어요.'),
                    ],
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('4. 아이가 서있을 때 어깨가 평행인가요?'),
                                    SizedBox(height:2),
                  AdditionalText('양 끝으로 갈수록 기울어진 정도가 큼을 나타냅니다.'),
                  SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(width: 20.0),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _shoulderPosture == '1',
                          onChanged: (value) {
                            setState(() {
                              _shoulderPosture = '1';
                            });
                          },
                        ),
                        OptionText('왼쪽')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _shoulderPosture == '2',
                          onChanged: (value) {
                            setState(() {
                              _shoulderPosture = '2';
                            });
                          },
                        ),
                        SizedBox(height: 18),
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _shoulderPosture == '3',
                          onChanged: (value) {
                            setState(() {
                              _shoulderPosture = '3';
                            });
                          },
                        ),
                        OptionText('균형잡힘')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _shoulderPosture == '4',
                          onChanged: (value) {
                            setState(() {
                              _shoulderPosture = '4';
                            });
                          },
                        ),
                        SizedBox(height: 18),
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _shoulderPosture == '5',
                          onChanged: (value) {
                            setState(() {
                              _shoulderPosture = '5';
                            });
                          },
                        ),
                        OptionText('오른쪽')
                      ]),
                      SizedBox(width: 20.0),
                    ],
                  ),
                  Visibility (
                    visible: !_validateShoulderPosture,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('5. 아이가 앉아있을 때 허리가 얼마나 굽었나요?'),
                                                      SizedBox(height:2),
                  AdditionalText('높은 수일수록 굽어진 정도가 큼을 나타냅니다.'),
                  SizedBox(height:10),
                  Container(
            width:350,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      
                        Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _backPosture == '1',
                          onChanged: (value) {
                            setState(() {
                              _backPosture = '1';
                            });
                          },
                        ),
                        OptionText('바름')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _backPosture == '2',
                          onChanged: (value) {
                            setState(() {
                              _backPosture = '2';
                            });
                          },
                        ),
                        SizedBox(height: 18),
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _backPosture == '3',
                          onChanged: (value) {
                            setState(() {
                              _backPosture = '3';
                            });
                          },
                        ),
                        SizedBox(height: 18),
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _backPosture == '4',
                          onChanged: (value) {
                            setState(() {
                              _backPosture = '4';
                            });
                          },
                        ),
                        OptionText('굽음')
                      ]),
                    ],
                  )),
                  Visibility (
                    visible: !_validateShoulderPosture,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('6. 아이가 하루에 책상 앞에 주로 얼마나 앉아있나요?'),
                  SizedBox(height:10),
                  Row(
                    children: <Widget>[
                      JustText('길게는'),
                      SizedBox(width: 10),
                      DropDown(key: _longSittingHour,
                          value: widget.appState.userInfo.containsKey('longSittingHour') ? widget.appState.userInfo['longSittingHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '0', items: _hourList, width: 60),
                      SizedBox(width: 10),
                      JustText('시간'),
                      SizedBox(width: 10),
                      DropDown(key: _longSittingMinute,
                          value: widget.appState.userInfo.containsKey('longSittingMinute') ? widget.appState.userInfo['longSittingMinute'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _minuteList, width: 60),
                      SizedBox(width: 10),
                      JustText('분 정도,'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      JustText('하루에 총'),
                      SizedBox(width: 10),
                      DropDown(key: _dailySittingHour,
                          value: widget.appState.userInfo.containsKey('dailySittingHour') ? widget.appState.userInfo['dailySittingHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '0', items: _hourList, width: 60),
                      SizedBox(width: 10),
                      JustText('시간'),
                      SizedBox(width: 10),
                      DropDown(key: _dailySittingMinute,
                          value: widget.appState.userInfo.containsKey('dailySittingMinute') ? widget.appState.userInfo['dailySittingMinute'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _minuteList, width: 60),
                      SizedBox(width: 10),
                      JustText('분 앉아있어요.'),
                    ],
                  ),

                  SizedBox(height:40.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WhiteButton(
                            width:126,
                            height:38,
                            text: '이전 단계로',

                            onPressed: () {
                              widget.appState.state = 'survey4';
                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => SurveyPage4(appState: widget.appState)));*/
                            }
                        ),
                        SizedBox(width:15),
                        BlueButton(
                            width:122,
                            height:41,
                            text: '다음 단계로',

                            onPressed: () async {
                              bool flag1 = _formKey.currentState!.validate();
                              bool flag2 = validateNeckPosture();
                              bool flag3 = validateLegPosture();
                              bool flag4 = validateShoulderPosture();
                              bool flag5 = validateBackPosture();

                              if (flag1 && flag2 && flag3 && flag4 && flag5) {
                                Map<String, dynamic> info = {
                                  'phase': 'survey6',

                                  'backPosture': _backPosture,
                                  'neckPosture': _neckPosture,
                                  'shoulderPosture': _shoulderPosture,
                                  'legPosture': _legPosture,

                                  'bagWeight': _bagWeight.currentState!.value.toString(),
                                  'longSittingHour': _longSittingHour.currentState!.value.toString(),
                                  'longSittingMinute': _longSittingMinute.currentState!.value.toString(),
                                  'dailySittingHour': _dailySittingHour.currentState!.value.toString(),
                                  'dailySittingMinute': _dailySittingMinute.currentState!.value.toString(),
                                };

                                print(info);

                                widget.appState.writeDB(info);

                                widget.appState.state = 'survey6';
                                /*Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => SurveyPage6(appState: widget.appState))
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
