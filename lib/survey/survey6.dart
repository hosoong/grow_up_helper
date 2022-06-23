import 'package:flutter/material.dart';

import '../main.dart';

import 'survey5.dart';
import 'survey_widgets.dart';

class SurveyPage6 extends StatefulWidget {
  SurveyPage6({required this.appState});

  ApplicationState appState;

  _SurveyPage6State createState() => _SurveyPage6State();
}

class _SurveyPage6State extends State<SurveyPage6> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_SurveyPage6State');

  final List<String> _hourList = [for(var i=1; i<=12; i+=1) i.toString()];
  final List<String> _minuteList = [for(var i=0; i<=59; i+=1) i.toString()];
  final List<String> _electronicDeviceList = ['스마트폰', '태블릿', '컴퓨터'];
  final List<String> _electronicMinuteList = [for(var i=10; i<=120; i+=10) i.toString()];
  final List<String> _distanceList = ['바로 옆', '세걸음 이하', '세걸음~다섯걸음', '다섯걸음~열걸음', '열걸음 이상'];

  final GlobalKey<DropDownState> _napHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _napMinute = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _napStart = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _napEnd = GlobalKey<DropDownState>();

  final GlobalKey<DropDownState> _weekdayWakeHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _weekdayWakeMinute = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _weekdaySleepHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _weekdaySleepMinute = GlobalKey<DropDownState>();

  final GlobalKey<DropDownState> _weekendWakeHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _weekendWakeMinute = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _weekendSleepHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _weekendSleepMinute = GlobalKey<DropDownState>();

  final GlobalKey<DropDownState> _electronicDevice = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _electronicDeviceMinute = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _electronicDeviceDistance = GlobalKey<DropDownState>();

  List<String> _sleepHabits = [for(var i=1; i<=5; i+=1) '0'];
  bool _validateSleepHabits = true;

  List<String> _whenKidSleep = [for(var i=1; i<=5; i+=1) '0'];
  bool _validateWhenKidSleep = true;

  String _timeUntilSleep = '0';
  bool _validateTimeUntilSleep = true;

  String _tossAndTurn = '0';
  bool _validateTossAndTurn = true;

  bool _noNap = false;
  bool _noDevice = false;

  String? _napValidator(String? value) {
    if (_noNap) {
      return null;
    }
    return defaultValidator(value);
  }

  String? _noDeviceValidator(String? value) {
    if (_noDevice) {
      return null;
    }
    return defaultValidator(value);
  }

  bool validateSleepHabits() {
    if (_sleepHabits.indexOf('1') == -1) {
      setState(() {_validateSleepHabits = false;});
    }
    else {
      setState(() {_validateSleepHabits = true;});
    }
    return _validateSleepHabits;
  }

  bool validateWhenKidSleep() {
    if (_whenKidSleep.indexOf('1') == -1) {
      setState(() {_validateWhenKidSleep = false;});
    }
    else {
      setState(() {_validateWhenKidSleep = true;});
    }
    return _validateWhenKidSleep;
  }

  bool validateTimeUntilSleep() {
    if (_timeUntilSleep == '0') {
      setState(() {_validateTimeUntilSleep = false;});
    }
    else {
      setState(() {_validateTimeUntilSleep = true;});
    }
    return _validateTimeUntilSleep;
  }

  bool validateTossAndTurn() {
    if (_tossAndTurn == '0') {
      setState(() {_validateTossAndTurn = false;});
    }
    else {
      setState(() {_validateTossAndTurn = true;});
    }
    return _validateTossAndTurn;
  }

  @override
  void initState() {
    super.initState();

    _noNap = widget.appState.userInfo.containsKey('napStart') && widget.appState.userInfo['napStart'].isEmpty ? true : false;
    _noDevice = widget.appState.userInfo.containsKey('electronicDevice') && widget.appState.userInfo['electronicDevice'].isEmpty ? true : false;
    _timeUntilSleep = widget.appState.userInfo.containsKey('timeUntilSleep') ? widget.appState.userInfo['timeUntilSleep'] : '0';
    _tossAndTurn = widget.appState.userInfo.containsKey('tossAndTurn') ? widget.appState.userInfo['tossAndTurn'] : '0';
    _whenKidSleep = widget.appState.userInfo.containsKey('whenKidSleep') ? List<String>.from(widget.appState.userInfo['whenKidSleep']) : _whenKidSleep;
    _sleepHabits = widget.appState.userInfo.containsKey('sleepHabits') ? List<String>.from(widget.appState.userInfo['sleepHabits']) : _sleepHabits;
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
                  QuestionText('1. 아이의 수면 중 습관이 있나요?'),
                  SizedBox(height: 10),
                  Column(
                    children: <Widget>[
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _sleepHabits[0] == '1',
                          onChanged: (value) {
                            setState(() {
                              _sleepHabits[0] = _sleepHabits[0] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('코골이')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _sleepHabits[1] == '1',
                          onChanged: (value) {
                            setState(() {
                              _sleepHabits[1] = _sleepHabits[1] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('이갈이')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _sleepHabits[2] == '1',
                          onChanged: (value) {
                            setState(() {
                              _sleepHabits[2] = _sleepHabits[2] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('잠꼬대')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _sleepHabits[3] == '1',
                          onChanged: (value) {
                            setState(() {
                              _sleepHabits[3] = _sleepHabits[3] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('돌아다님')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _sleepHabits[4] == '1',
                          onChanged: (value) {
                            setState(() {
                              _sleepHabits[4] = _sleepHabits[4] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('없음')
                      ])),
                    ],
                  ),
                  Visibility (
                    visible: !_validateSleepHabits,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('2. 아이가 평소에 잠에 들기까지 얼마나 걸리나요?'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _timeUntilSleep == '1',
                          onChanged: (value) {
                            setState(() {
                              _timeUntilSleep = '1';
                            });
                          },
                        ),
                        OptionText('15분 이내')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _timeUntilSleep == '2',
                          onChanged: (value) {
                            setState(() {
                              _timeUntilSleep = '2';
                            });
                          },
                        ),
                        OptionText('15분~30분')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _timeUntilSleep == '3',
                          onChanged: (value) {
                            setState(() {
                              _timeUntilSleep = '3';
                            });
                          },
                        ),
                        OptionText('30분~1시간')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _timeUntilSleep == '4',
                          onChanged: (value) {
                            setState(() {
                              _timeUntilSleep = '4';
                            });
                          },
                        ),
                        OptionText('1시간 이상')
                      ]),
                    ],
                  ),
                  Visibility (
                    visible: !_validateTimeUntilSleep,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('3. 아이가 주기적으로 낮잠을 자나요?'),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      DropDown(key: _napHour,
                          value: widget.appState.userInfo.containsKey('napHour') && widget.appState.userInfo['napHour'].isNotEmpty ? widget.appState.userInfo['napHour'] : null,
                          enabled: !_noNap,
                          validator: _napValidator, hint: '00', items: _hourList, width: 60),
                      SizedBox(width: 10),
                      JustText('시간'),
                      SizedBox(width: 10),
                      DropDown(key: _napMinute,
                          value: widget.appState.userInfo.containsKey('napMinute') && widget.appState.userInfo['napMinute'].isNotEmpty ? widget.appState.userInfo['napMinute'] : null,
                          enabled: !_noNap,
                          validator: _napValidator, hint: '00', items: _minuteList, width: 60),
                      SizedBox(width: 10),
                      JustText('분 정도,'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DropDown(key: _napStart,
                          value: widget.appState.userInfo.containsKey('napStart') && widget.appState.userInfo['napStart'].isNotEmpty ? widget.appState.userInfo['napStart'] : null,
                          enabled: !_noNap,
                          validator: _napValidator, hint: '00', items: _hourList, width: 60),
                      SizedBox(width: 10),
                      JustText('시에서'),
                      SizedBox(width: 10),
                      DropDown(key: _napEnd,
                          value: widget.appState.userInfo.containsKey('napEnd') && widget.appState.userInfo['napEnd'].isNotEmpty ? widget.appState.userInfo['napEnd'] : null,
                          enabled: !_noNap,
                          validator: _napValidator, hint: '00', items: _minuteList, width: 60),
                      SizedBox(width: 10),
                      JustText('시 사이에 자요.'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _noNap,
                        onChanged: (value) {
                          setState(() {
                            if (!_noNap) {
                              _napHour.currentState!.value = null;
                              _napMinute.currentState!.value = null;
                              _napStart.currentState!.value = null;
                              _napEnd.currentState!.value = null;
                              _napHour.currentState!.enabled = false;
                              _napMinute.currentState!.enabled = false;
                              _napStart.currentState!.enabled = false;
                              _napEnd.currentState!.enabled = false;
                            }
                            else {
                              _napHour.currentState!.enabled = true;
                              _napMinute.currentState!.enabled = true;
                              _napStart.currentState!.enabled = true;
                              _napEnd.currentState!.enabled = true;
                            }
                            _noNap = !_noNap;
                          });
                        },
                      ),
                      NoText('낮잠을 자지 않아요.'),
                    ],
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('4. 아이가 몇 시에 자고 몇 시에 일어나나요?'),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      JustText('주중에는'),
                      SizedBox(width: 10),
                      DropDown(key: _weekdayWakeHour,
                          value: widget.appState.userInfo.containsKey('weekdayWakeHour') ? widget.appState.userInfo['weekdayWakeHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 60),
                      SizedBox(width: 10),
                      JustText('시'),
                      SizedBox(width: 10),
                      DropDown(key: _weekdayWakeMinute,
                          value: widget.appState.userInfo.containsKey('weekdayWakeMinute') ? widget.appState.userInfo['weekdayWakeMinute'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _minuteList, width: 60),
                      SizedBox(width: 10),
                      JustText('분에 일어나고'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DropDown(key: _weekdaySleepHour,
                          value: widget.appState.userInfo.containsKey('weekdaySleepHour') ? widget.appState.userInfo['weekdaySleepHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 60),
                      SizedBox(width: 10),
                      JustText('시'),
                      SizedBox(width: 10),
                      DropDown(key: _weekdaySleepMinute,
                          value: widget.appState.userInfo.containsKey('weekdaySleepMinute') ? widget.appState.userInfo['weekdaySleepMinute'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _minuteList, width: 60),
                      SizedBox(width: 10),
                      JustText('분에 잠이 들어요.'),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      JustText('주말에는'),
                      SizedBox(width: 10),
                      DropDown(key: _weekendWakeHour,
                          value: widget.appState.userInfo.containsKey('weekendWakeHour') ? widget.appState.userInfo['weekendWakeHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 60),
                      SizedBox(width: 10),
                      JustText('시'),
                      SizedBox(width: 10),
                      DropDown(key: _weekendWakeMinute,
                          value: widget.appState.userInfo.containsKey('weekendWakeMinute') ? widget.appState.userInfo['weekendWakeMinute'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _minuteList, width: 60),
                      SizedBox(width: 10),
                      JustText('분에 일어나고'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DropDown(key: _weekendSleepHour,
                          value: widget.appState.userInfo.containsKey('weekendSleepHour') ? widget.appState.userInfo['weekendSleepHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 60),
                      SizedBox(width: 10),
                      JustText('시'),
                      SizedBox(width: 10),
                      DropDown(key: _weekendSleepMinute,
                          value: widget.appState.userInfo.containsKey('weekendSleepMinute') ? widget.appState.userInfo['weekendSleepMinute'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _minuteList, width: 60),
                      SizedBox(width: 10),
                      JustText('분에 잠이 들어요.'),
                    ],
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('5. 아이 잠에 들 때 엄마아빠는 주로 무엇을 하나요?'),
                  SizedBox(height: 10),
                  Column(
                    children: <Widget>[
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _whenKidSleep[0] == '1',
                          onChanged: (value) {
                            setState(() {
                              _whenKidSleep[0] = _whenKidSleep[0] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('티비를 봐요')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _whenKidSleep[1] == '1',
                          onChanged: (value) {
                            setState(() {
                              _whenKidSleep[1] = _whenKidSleep[1] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('집안일을 해요')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _whenKidSleep[2] == '1',
                          onChanged: (value) {
                            setState(() {
                              _whenKidSleep[2] = _whenKidSleep[2] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('대화를 해요')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _whenKidSleep[3] == '1',
                          onChanged: (value) {
                            setState(() {
                              _whenKidSleep[3] = _whenKidSleep[3] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('업무를 해요')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _whenKidSleep[4] == '1',
                          onChanged: (value) {
                            setState(() {
                              _whenKidSleep[4] = _whenKidSleep[4] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('잠을 자요')
                      ])),
                    ],
                  ),
                  Visibility (
                    visible: !_validateWhenKidSleep,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),


                  SizedBox(height: 30.0),
                  QuestionText('6. 잠을 잘 때 얼마나 뒤척이나요?'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _tossAndTurn == '1',
                          onChanged: (value) {
                            setState(() {
                              _tossAndTurn = '1';
                            });
                          },
                        ),
                        OptionText('아주적음')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _tossAndTurn == '2',
                          onChanged: (value) {
                            setState(() {
                              _tossAndTurn = '2';
                            });
                          },
                        ),
                        OptionText('적음')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _tossAndTurn == '3',
                          onChanged: (value) {
                            setState(() {
                              _tossAndTurn = '3';
                            });
                          },
                        ),
                        OptionText('보통')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _tossAndTurn == '4',
                          onChanged: (value) {
                            setState(() {
                              _tossAndTurn = '4';
                            });
                          },
                        ),
                        OptionText('많음')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _tossAndTurn == '5',
                          onChanged: (value) {
                            setState(() {
                              _tossAndTurn = '5';
                            });
                          },
                        ),
                        OptionText('아주많음')
                      ]),
                    ],
                  ),
                  Visibility (
                    visible: !_validateTossAndTurn,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('7. 아이가 자기 전에 전자기기를 사용하나요?'),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      DropDown(key: _electronicDevice,
                          value: widget.appState.userInfo.containsKey('electronicDevice') && widget.appState.userInfo['electronicDevice'].isNotEmpty ? widget.appState.userInfo['electronicDevice'] : null,
                          enabled: !_noDevice,
                          validator: _noDeviceValidator, hint: '태블릿PC', items: _electronicDeviceList, width: 120),
                      SizedBox(width: 10),
                      JustText('을/를 자기 전에'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DropDown(key: _electronicDeviceMinute,
                          value: widget.appState.userInfo.containsKey('electronicDeviceMinute') && widget.appState.userInfo['electronicDeviceMinute'].isNotEmpty ? widget.appState.userInfo['electronicDeviceMinute'] : null,
                          enabled: !_noDevice,
                          validator: _noDeviceValidator, hint: '00', items: _electronicMinuteList, width: 60),
                      SizedBox(width: 10),
                      JustText('분 정도 사용해요.'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      JustText('사용 후에는'),
                      SizedBox(width: 10),
                      DropDown(key: _electronicDeviceDistance,
                          value: widget.appState.userInfo.containsKey('electronicDeviceDistance') && widget.appState.userInfo['electronicDeviceDistance'].isNotEmpty ? widget.appState.userInfo['electronicDeviceDistance'] : null,
                          enabled: !_noDevice,
                          validator: _noDeviceValidator, hint: '거리', items: _distanceList, width: 60),
                      SizedBox(width: 10),
                      JustText('거리에 놓고 자요.'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _noDevice,
                        onChanged: (value) {
                          setState(() {
                            if (!_noDevice) {
                              _electronicDevice.currentState!.value = null;
                              _electronicDeviceDistance.currentState!.value = null;
                              _electronicDeviceMinute.currentState!.value = null;
                              _electronicDevice.currentState!.enabled = false;
                              _electronicDeviceDistance.currentState!.enabled = false;
                              _electronicDeviceMinute.currentState!.enabled = false;
                            }
                            else {
                              _electronicDevice.currentState!.enabled = true;
                              _electronicDeviceDistance.currentState!.enabled = true;
                              _electronicDeviceMinute.currentState!.enabled = true;
                            }
                            _noDevice = !_noDevice;
                          });
                        },
                      ),
                      NoText('전자기기를 사용하지 않아요.'),
                    ],
                  ),

                  SizedBox(height:50.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WhiteButton(
                            width:126,
                            height:38,
                            text: '이전 단계로',

                            onPressed: () {
                              widget.appState.state = 'survey5';
                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => SurveyPage5(appState: widget.appState)));*/
                            }
                        ),
                        SizedBox(width:15),
                        BlueButton(
                            width:122,
                            height:41,
                            text: '다음 단계로',

                            onPressed: () async {
                              bool flag1 = _formKey.currentState!.validate();
                              bool flag2 = validateSleepHabits();
                              bool flag3 = validateWhenKidSleep();
                              bool flag4 = validateTimeUntilSleep();
                              bool flag5 = validateTossAndTurn();

                              if (flag1 && flag2 && flag3 && flag4 && flag5) {
                                Map<String, dynamic> info = {
                                  'phase': 'surveyResult',

                                  'timeUntilSleep': _timeUntilSleep,
                                  'tossAndTurn': _tossAndTurn,
                                  'whenKidSleep': _whenKidSleep,
                                  'sleepHabits': _sleepHabits,

                                  'napHour': _napHour.currentState!.value == null ? '' : _napHour.currentState!.value.toString(),
                                  'napMinute': _napMinute.currentState!.value == null ? '' : _napMinute.currentState!.value.toString(),
                                  'napStart': _napStart.currentState!.value == null ? '' : _napStart.currentState!.value.toString(),
                                  'napEnd': _napEnd.currentState!.value == null ? '' : _napEnd.currentState!.value.toString(),

                                  'weekdayWakeHour': _weekdayWakeHour.currentState!.value.toString(),
                                  'weekdayWakeMinute': _weekdayWakeMinute.currentState!.value.toString(),
                                  'weekdaySleepHour': _weekdaySleepHour.currentState!.value.toString(),
                                  'weekdaySleepMinute': _weekdaySleepMinute.currentState!.value.toString(),

                                  'weekendWakeHour': _weekendWakeHour.currentState!.value.toString(),
                                  'weekendWakeMinute': _weekendWakeMinute.currentState!.value.toString(),
                                  'weekendSleepHour': _weekendSleepHour.currentState!.value.toString(),
                                  'weekendSleepMinute': _weekendSleepMinute.currentState!.value.toString(),

                                  'electronicDevice': _electronicDevice.currentState!.value == null ? '' : _electronicDevice.currentState!.value.toString(),
                                  'electronicDeviceMinute': _electronicDeviceMinute.currentState!.value == null ? '' : _electronicDeviceMinute.currentState!.value.toString(),
                                  'electronicDeviceDistance': _electronicDeviceDistance.currentState!.value == null ? '' : _electronicDeviceDistance.currentState!.value.toString(),
                                };

                                print(info);

                                widget.appState.userInfo.addAll(info);

                                widget.appState.writeDB(info);

                                widget.appState.state = 'surveyResult';
                                /*Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => TutorialPage(appState: widget.appState))
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