import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_choices/search_choices.dart';

import '../main.dart';

import 'survey_widgets.dart';

class SurveyPage9 extends StatefulWidget {
  SurveyPage9({required this.appState});

  ApplicationState appState;

  _SurveyPage9State createState() => _SurveyPage9State();
}

class _SurveyPage9State extends State<SurveyPage9> {
  final List<String> _hourList = [for(int i=1; i<=12; i++) i.toString()];
  final List<String> _minuteList = [for(int i=0; i<=59; i++) i.toString()];

  bool _noJob1 = false;

  String? _noJob1Validator(String? value) {
    if (_noJob1) {
      return null;
    }
    return defaultValidator(value);
  }

  final _formKey = GlobalKey<FormState>(debugLabel: '_SurveyPage9State');

  final GlobalKey<DropDownState> _motherWorkStartHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherWorkStartMinute = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherWorkEndHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherWorkEndMinute = GlobalKey<DropDownState>();

  final GlobalKey<DropDownState> _motherWeekdayWakeHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherWeekdayWakeMinute = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherWeekdaySleepHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherWeekdaySleepMinute = GlobalKey<DropDownState>();

  final GlobalKey<DropDownState> _motherWeekendWakeHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherWeekendWakeMinute = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherWeekendSleepHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherWeekendSleepMinute = GlobalKey<DropDownState>();

  final GlobalKey<DropDownState> _motherPhoneHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherTVHour = GlobalKey<DropDownState>();

  final GlobalKey<DropDownState> _motherTogetherHour = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherTogetherStart = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _motherTogetherEnd = GlobalKey<DropDownState>();

  String _motherNightShiftFrequency = '0';
  String _motherEatTime = '0';
  String _motherSnackFrequency = '0';
  String _motherSatisfaction = '0';

  bool validateMotherNightShiftFrequency() {
    if (!_noJob1 && _motherNightShiftFrequency == '0') {
      return false;
    }
    else {
      return true;
    }
  }

  bool validateMotherEatTime() {
    if (_motherEatTime == '0') {
      return false;
    }
    else {
      return true;
    }
  }

  bool validateMotherSnackFrequency() {
    if (_motherSnackFrequency == '0') {
      return false;
    }
    else {
      return true;
    }
  }

  bool validateMotherSatisfaction() {
    if (_motherSatisfaction == '0') {
      return false;
    }
    else {
      return true;
    }
  }

  List<String> _resetList = [for(var i=1; i<=30; i+=1) '0'];

  List<String> _hateFood = [for(var i=1; i<=30; i+=1) '0'];
  List<String> _temp_hateFood = [for(var i=1; i<=30; i+=1) '0'];
  List<String> _hateFoodList = [
    '당근', '치즈', '해조류', '오이', '유제품', '생선류', '가지', '콩,두부', '해산물', '피망',
    '견과류', '채소류', '버섯', '돼지고기', '빵류', '강황작물', '소고기', '가공육류', '시금치', '닭고기',
    '과일류', '브로콜리', '계란류', '탄산음료', '나물류', '라면', '이온음료', '국물류', '튀김류', '주스'];

  List<String> _likeFood = [for(var i=1; i<=30; i+=1) '0'];
  List<String> _temp_likeFood = [for(var i=1; i<=30; i+=1) '0'];
  List<String> _likeFoodList = [
    '당근', '치즈', '해조류', '오이', '유제품', '생선류', '가지', '콩,두부', '해산물', '피망',
    '견과류', '채소류', '버섯', '돼지고기', '빵류', '강황작물', '소고기', '가공육류', '시금치', '닭고기',
    '과일류', '브로콜리', '계란류', '탄산음료', '나물류', '라면', '이온음료', '국물류', '튀김류', '주스'];

  bool noneSelected(List l) {
    if (l.indexOf('1') == -1)
      return true;
    return false;
  }

  String showFood(List l, List l2) {
    if (noneSelected(l)){
      return '음식을 등록해주세요';
    }
    else {
      List<String> temp = [];
      for(var i=0; i<l.length; i++) {
        if (l[i] == '1') {
          temp.add(l2[i]);
        }
      }
      return temp.join(', ');
    }
  }

  bool validateHateFood() {
    if (_hateFood.indexOf('1') == -1) {
      return false;
    }
    else {
      return true;
    }
  }

  bool validateLikeFood() {
    if (_likeFood.indexOf('1') == -1) {
      return false;
    }
    else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();

    _noJob1 = widget.appState.userInfo.containsKey('motherWorkStartHour') && widget.appState.userInfo['motherWorkStartHour'].isEmpty ? true : false;

    _motherNightShiftFrequency = widget.appState.userInfo.containsKey('motherNightShiftFrequency') ? widget.appState.userInfo['motherNightShiftFrequency'] : '0';
    _motherEatTime = widget.appState.userInfo.containsKey('motherEatTime') ? widget.appState.userInfo['motherEatTime'] : '0';
    _motherSnackFrequency = widget.appState.userInfo.containsKey('motherSnackFrequency') ? widget.appState.userInfo['motherSnackFrequency'] : '0';
    _motherSatisfaction = widget.appState.userInfo.containsKey('motherSatisfaction') ? widget.appState.userInfo['motherSatisfaction'] : '0';

    _hateFood = widget.appState.userInfo.containsKey('motherHateFood') ? List<String>.from(widget.appState.userInfo['motherHateFood']) : _hateFood;
    _likeFood = widget.appState.userInfo.containsKey('motherLikeFood') ? List<String>.from(widget.appState.userInfo['motherLikeFood']) : _likeFood;
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
                  TitleText('부모 정보'),

                  SizedBox(height: 10.0),
                  ProgressBar(97),

                  SizedBox(height: 30.0),
                  QuestionText('1. 엄마의 출퇴근시간이 어떻게 되시나요?'),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      DropDown(key: _motherWorkStartHour,
                          value: widget.appState.userInfo.containsKey('motherWorkStartHour') && widget.appState.userInfo['motherWorkStartHour'].isNotEmpty ? widget.appState.userInfo['motherWorkStartHour'] : null,
                          enabled: !_noJob1,
                          validator: _noJob1Validator, hint: '00', items: _hourList, width: 80),
                      JustText('시'),
                      DropDown(key: _motherWorkStartMinute,
                          value: widget.appState.userInfo.containsKey('motherWorkStartMinute') && widget.appState.userInfo['motherWorkStartMinute'].isNotEmpty ? widget.appState.userInfo['motherWorkStartMinute'] : null,
                          enabled: !_noJob1,
                          validator: _noJob1Validator, hint: '00', items: _minuteList, width: 80),
                      JustText('분에 출근하고'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DropDown(key: _motherWorkEndHour,
                          value: widget.appState.userInfo.containsKey('motherWorkEndHour') && widget.appState.userInfo['motherWorkEndHour'].isNotEmpty ? widget.appState.userInfo['motherWorkEndHour'] : null,
                          enabled: !_noJob1,
                          validator: _noJob1Validator, hint: '00', items: _hourList, width: 80),
                      JustText('시'),
                      DropDown(key: _motherWorkEndMinute,
                          value: widget.appState.userInfo.containsKey('motherWorkEndMinute') && widget.appState.userInfo['motherWorkEndMinute'].isNotEmpty ? widget.appState.userInfo['motherWorkEndMinute'] : null,
                          enabled: !_noJob1,
                          validator: _noJob1Validator, hint: '00', items: _minuteList, width: 80),
                      JustText('분에 퇴근해요.'),
                    ],
                  ),
                                        SizedBox(height:5),
                  Row(
                    children: [
                      Checkbox(
                        value: _noJob1,
                        onChanged: (value) {
                          setState(() {
                            if (!_noJob1) {
                              _motherWorkStartHour.currentState!.value = null;
                              _motherWorkStartMinute.currentState!.value = null;
                              _motherWorkEndHour.currentState!.value = null;
                              _motherWorkEndMinute.currentState!.value = null;
                              _motherWorkStartHour.currentState!.enabled = false;
                              _motherWorkStartMinute.currentState!.enabled = false;
                              _motherWorkEndHour.currentState!.enabled = false;
                              _motherWorkEndMinute.currentState!.enabled = false;
                              _motherNightShiftFrequency = '0';
                            }
                            else {
                              _motherWorkStartHour.currentState!.enabled = true;
                              _motherWorkStartMinute.currentState!.enabled = true;
                              _motherWorkEndHour.currentState!.enabled = true;
                              _motherWorkEndMinute.currentState!.enabled = true;
                            }
                            _noJob1 = !_noJob1;
                          });
                        },
                      ),
                      NoText('일을 하지 않아요.'),
                    ],
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('2. 엄마는 야근을 자주 하시는 편인가요?'),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherNightShiftFrequency == '1',
                          onChanged: (value) {
                            setState(() {
                              if (!_noJob1)
                                _motherNightShiftFrequency = '1';
                            });
                          },
                        ),
                        OptionText('주 0회')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherNightShiftFrequency == '2',
                          onChanged: (value) {
                            setState(() {
                              if (!_noJob1)
                                _motherNightShiftFrequency = '2';
                            });
                          },
                        ),
                        OptionText('주 1회')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherNightShiftFrequency == '3',
                          onChanged: (value) {
                            setState(() {
                              if (!_noJob1)
                                _motherNightShiftFrequency = '3';
                            });
                          },
                        ),
                        OptionText('주 2회')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherNightShiftFrequency == '4',
                          onChanged: (value) {
                            setState(() {
                              if (!_noJob1)
                                _motherNightShiftFrequency = '4';
                            });
                          },
                        ),
                        OptionText('주 3회')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherNightShiftFrequency == '5',
                          onChanged: (value) {
                            setState(() {
                              if (!_noJob1)
                                _motherNightShiftFrequency = '5';
                            });
                          },
                        ),
                        OptionText('주 4회')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherNightShiftFrequency == '6',
                          onChanged: (value) {
                            setState(() {
                              if (!_noJob1)
                                _motherNightShiftFrequency = '6';
                            });
                          },
                        ),
                        OptionText('주 5회~')
                      ]),
                    ],
                  ),
                                                          SizedBox(height:5),

                  Row(
                    children: [
                      Checkbox(
                        value: _noJob1,
                        onChanged: (value) {
                          setState(() {
                            if (!_noJob1) {
                              _motherWorkStartHour.currentState!.value = null;
                              _motherWorkStartMinute.currentState!.value = null;
                              _motherWorkEndHour.currentState!.value = null;
                              _motherWorkEndMinute.currentState!.value = null;
                              _motherWorkStartHour.currentState!.enabled = false;
                              _motherWorkStartMinute.currentState!.enabled = false;
                              _motherWorkEndHour.currentState!.enabled = false;
                              _motherWorkEndMinute.currentState!.enabled = false;
                              _motherNightShiftFrequency = '0';
                            }
                            else {
                              _motherWorkStartHour.currentState!.enabled = true;
                              _motherWorkStartMinute.currentState!.enabled = true;
                              _motherWorkEndHour.currentState!.enabled = true;
                              _motherWorkEndMinute.currentState!.enabled = true;
                            }
                            _noJob1 = !_noJob1;
                          });
                        },
                      ),
                      NoText('일을 하지 않아요.'),
                    ],
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('3. 엄마의 기상/취침시간이 어떻게 되나요?'),
                  QuestionText('(주말, 주중)'),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      JustText('주중에는'),
                      DropDown(key: _motherWeekdayWakeHour,
                          value: widget.appState.userInfo.containsKey('motherWeekdayWakeHour') ? widget.appState.userInfo['motherWeekdayWakeHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 80),
                      JustText('시'),
                      DropDown(key: _motherWeekdayWakeMinute,
                          value: widget.appState.userInfo.containsKey('motherWeekdayWakeMinute') ? widget.appState.userInfo['motherWeekdayWakeMinute'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _minuteList, width: 80),
                      JustText('분에 일어나고'),
                    ],
                  ),
                  SizedBox(height:8),
                  Row(
                    children: <Widget>[
                    SizedBox(width:55),
                      DropDown(key: _motherWeekdaySleepHour,
                          value: widget.appState.userInfo.containsKey('motherWeekdaySleepHour') ? widget.appState.userInfo['motherWeekdaySleepHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 80),
                      JustText('시'),
                      DropDown(key: _motherWeekdaySleepMinute,
                          value: widget.appState.userInfo.containsKey('motherWeekdaySleepMinute') ? widget.appState.userInfo['motherWeekdaySleepMinute'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _minuteList, width: 80),
                      JustText('분에 잠에 들어요.'),
                    ],
                  ),
                                    SizedBox(height:8),
                  Row(
                    children: <Widget>[
                      JustText('주말에는'),
                      DropDown(key: _motherWeekendWakeHour,
                          value: widget.appState.userInfo.containsKey('motherWeekendWakeHour') ? widget.appState.userInfo['motherWeekendWakeHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 80),
                      JustText('시'),
                      DropDown(key: _motherWeekendWakeMinute,
                          value: widget.appState.userInfo.containsKey('motherWeekendWakeMinute') ? widget.appState.userInfo['motherWeekendWakeMinute'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _minuteList, width: 80),
                      JustText('분에 일어나고'),
                    ],
                  ),
                                    SizedBox(height:8),
                  Row(
                    children: <Widget>[
                                        SizedBox(width:55),
                      DropDown(key: _motherWeekendSleepHour,
                          value: widget.appState.userInfo.containsKey('motherWeekendSleepHour') ? widget.appState.userInfo['motherWeekendSleepHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 80),
                      JustText('시'),
                      DropDown(key: _motherWeekendSleepMinute,
                          value: widget.appState.userInfo.containsKey('motherWeekendSleepMinute') ? widget.appState.userInfo['motherWeekendSleepMinute'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _minuteList, width: 80),
                      JustText('분에 잠에 들어요.'),
                    ],
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('4. 엄마의 전자기기 사용도는 어떻게 되나요?'),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      JustText('핸드폰은 하루에'),
                      DropDown(key: _motherPhoneHour,
                          value: widget.appState.userInfo.containsKey('motherPhoneHour') ? widget.appState.userInfo['motherPhoneHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 80),
                      JustText('시간 정도 사용하고'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      JustText('TV는 하루에'),
                      DropDown(key: _motherTVHour,
                          value: widget.appState.userInfo.containsKey('motherTVHour') ? widget.appState.userInfo['motherTVHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 80),
                      JustText('시간 정도 사용해요'),
                    ],
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('5. 엄마의 식사시간은 얼마나 걸리나요?'),
                  SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherEatTime == '1',
                          onChanged: (value) {
                            setState(() {
                                _motherEatTime = '1';
                            });
                          },
                        ),
                        OptionText('5분이내')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherEatTime == '2',
                          onChanged: (value) {
                            setState(() {
                              _motherEatTime = '2';
                            });
                          },
                        ),
                        OptionText('5분 ~ 15분')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherEatTime == '3',
                          onChanged: (value) {
                            setState(() {
                                _motherEatTime = '3';
                            });
                          },
                        ),
                        OptionText('15분 ~ 30분')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherEatTime == '4',
                          onChanged: (value) {
                            setState(() {
                                _motherEatTime = '4';
                            });
                          },
                        ),
                        OptionText('30분 이상')
                      ]),
                    ],
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('6. 엄마는 하루에 군것질을 얼마나 하나요?'),
                                    SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherSnackFrequency == '1',
                          onChanged: (value) {
                            setState(() {
                              _motherSnackFrequency = '1';
                            });
                          },
                        ),
                        OptionText('먹지않는다')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherSnackFrequency == '2',
                          onChanged: (value) {
                            setState(() {
                              _motherSnackFrequency = '2';
                            });
                          },
                        ),
                        OptionText('1회 ~ 2회')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherSnackFrequency == '3',
                          onChanged: (value) {
                            setState(() {
                              _motherSnackFrequency = '3';
                            });
                          },
                        ),
                        OptionText('3회 ~ 4회')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherSnackFrequency == '4',
                          onChanged: (value) {
                            setState(() {
                              _motherSnackFrequency = '4';
                            });
                          },
                        ),
                        OptionText('5회 이상')
                      ]),
                    ],
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('7. 엄마가 좋아하는 음식이 있나요?'),
                                    SizedBox(height:5),
                  Column(children:[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          SizedBox(
                              width: 290,
                              child:
                              Text(showFood(_likeFood, _likeFoodList),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.notoSans(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: noneSelected(_likeFood) ? Color(0xffc1c1c1) : Color(0xff575757),
                                  )
                              )
                          ),

                          MaterialButton(
                            shape: CircleBorder(),
                            minWidth: 18,
                            height:18,
                            child: Icon(Icons.add_circle_outline, color:Colors.grey),
                            onPressed: () {
                              _temp_likeFood = List.from(_likeFood);
                              showDialog (
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                            insetPadding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                                            content: Container(
                                              width:MediaQuery.of(context).size.width,
                                              //height:MediaQuery.of(context).size.height,
                                              child: Column(
                                                children: <Widget>[
                                                  Row(mainAxisAlignment:MainAxisAlignment.center,children:[
                                                    SizedBox(width:68, height:3,
                                                        child:  Divider(color: Color(0xffc4c4c4), thickness:3)),]
                                                  ),
                                                  SizedBox(height:30),
                                                  Row(mainAxisAlignment:MainAxisAlignment.center,children:[QuestionText('엄마가 좋아하는 음식을 모두 체크해 주세요.')]),
                                                  SizedBox(height:30),

                                                  Flexible(
                                                      child:
                                                      GridView.builder(
                                                        itemCount: _likeFood.length,
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                                                            childAspectRatio:3),
                                                        itemBuilder: (context, i) {
                                                          return Stack(
                                                            children: [
                                                              Row(children:[
                                                                Checkbox(
                                                                  value: _temp_likeFood[i] == '1',
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      _temp_likeFood[i] = _temp_likeFood[i] == '1' ? '0' : '1';
                                                                    });
                                                                  },
                                                                ),
                                                                NotoSansText(_likeFoodList[i], Color(0xff59597c), 12, FontWeight.w400),
                                                              ]
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      )),

                                                ],
                                              ),
                                            ),

                                            actions: <Widget>[
                                              Row(mainAxisAlignment:MainAxisAlignment.center,
                                                  children: [
                                                WhiteButton(
                                                  width: 128,
                                                  height: 41,
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  text: '취소',
                                                ),
                                                    SizedBox(width:15),
                                                BlueButton(
                                                  width: 122,
                                                  height: 41,
                                                  onPressed: () {
                                                    _likeFood = List.from(_temp_likeFood);
                                                    Navigator.of(context).pop();
                                                  },
                                                  text: '추가',
                                                )
                                              ]
                                              ),
                                              SizedBox(height:30),
                                            ],
                                          );
                                        }
                                    );
                                  }
                              ).then((context) {
                                setState((){

                                });
                              });
                            },
                          ),
                        ]),
                    Divider(color: Colors.black, endIndent: 20),
                  ]),

                  SizedBox(height: 30.0),
                  QuestionText('8. 엄마가 잘 먹지 않는 음식이 있나요?'),
                                    SizedBox(height:5),
                  Column(children:[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          SizedBox(
                              width: 290,
                              child:
                              Text(showFood(_hateFood, _hateFoodList),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.notoSans(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: noneSelected(_hateFood) ? Color(0xffc1c1c1) : Color(0xff575757),
                                  )
                              )
                          ),

                          MaterialButton(
                            shape: CircleBorder(),
                            minWidth: 18,
                            height:18,
                            child: Icon(Icons.add_circle_outline, color:Colors.grey),
                            onPressed: () {
                              _temp_hateFood = List.from(_hateFood);
                              showDialog (
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                            insetPadding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                                            content: Container(
                                              width:MediaQuery.of(context).size.width,
                                              //height:MediaQuery.of(context).size.height,
                                              child: Column(
                                                children: <Widget>[
                                                  Row(mainAxisAlignment:MainAxisAlignment.center,children:[
                                                    SizedBox(width:68, height:3,
                                                        child:  Divider(color: Color(0xffc4c4c4), thickness:3)),]
                                                  ),
                                                  SizedBox(height:30),
                                                  Row(mainAxisAlignment:MainAxisAlignment.center,children:[QuestionText('엄마가 잘 먹지 않는 음식을 모두 체크해 주세요.')]),
                                                  SizedBox(height:30),

                                                  Flexible(
                                                      child:
                                                      GridView.builder(
                                                        itemCount: _hateFood.length,
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                                                            childAspectRatio:3),
                                                        itemBuilder: (context, i) {
                                                          return Stack(
                                                            children: [
                                                              Row(children:[
                                                                Checkbox(
                                                                  value: _temp_hateFood[i] == '1',
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      _temp_hateFood[i] = _temp_hateFood[i] == '1' ? '0' : '1';
                                                                    });
                                                                  },
                                                                ),
                                                                NotoSansText(_hateFoodList[i], Color(0xff59597c), 12, FontWeight.w400),
                                                              ]
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      )),

                                                ],
                                              ),
                                            ),

                                            actions: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                WhiteButton(
                                                  width: 128,
                                                  height: 41,
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  text: '취소',
                                                ),
                                                    SizedBox(width:15),
                                                BlueButton(
                                                  width: 122,
                                                  height: 41,
                                                  onPressed: () {
                                                    _hateFood = List.from(_temp_hateFood) ;
                                                    Navigator.of(context).pop();
                                                  },
                                                  text: '추가',
                                                )
                                              ]
                                              ),
                                              SizedBox(height:30),
                                            ],
                                          );
                                        }
                                    );
                                  }
                              ).then((context) {
                                setState((){

                                });
                              });
                            },
                          ),
                        ]),
                    Divider(color: Colors.black, endIndent: 20),
                  ]),

                  SizedBox(height: 30.0),
                  QuestionText('9. 엄마가 자녀와 함께하는 시간은 어떻게 되나요?'),
                                    SizedBox(height:10),
                  Row(
                    children: <Widget>[
                      JustText('자녀와 하루에'),
                      DropDown(key: _motherTogetherHour,
                          value: widget.appState.userInfo.containsKey('motherTogetherHour') ? widget.appState.userInfo['motherTogetherHour'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 80),
                      JustText('시간 정도를 함께하고'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      JustText('주로'),
                      DropDown(key: _motherTogetherStart,
                          value: widget.appState.userInfo.containsKey('motherTogetherStart') ? widget.appState.userInfo['motherTogetherStart'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 80),
                      JustText('시 부터'),
                      DropDown(key: _motherTogetherEnd,
                          value: widget.appState.userInfo.containsKey('motherTogetherEnd') ? widget.appState.userInfo['motherTogetherEnd'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '00', items: _hourList, width: 80),
                      JustText('시 사이에'),
                    ],
                  ),
                  JustText('\n함께 시간을 보내요.'),

                  SizedBox(height: 30.0),
                  QuestionText('10. 자녀와 함께하는 시간에 만족하시나요?'),
                                    SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherSatisfaction == '1',
                          onChanged: (value) {
                            setState(() {
                              _motherSatisfaction = '1';
                            });
                          },
                        ),
                        OptionText('매우 불만족')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherSatisfaction == '2',
                          onChanged: (value) {
                            setState(() {
                              _motherSatisfaction = '2';
                            });
                          },
                        ),
                        OptionText('불만족')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherSatisfaction == '3',
                          onChanged: (value) {
                            setState(() {
                              _motherSatisfaction = '3';
                            });
                          },
                        ),
                        OptionText('보통')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherSatisfaction == '4',
                          onChanged: (value) {
                            setState(() {
                              _motherSatisfaction = '4';
                            });
                          },
                        ),
                        OptionText('만족')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _motherSatisfaction == '5',
                          onChanged: (value) {
                            setState(() {
                              _motherSatisfaction = '5';
                            });
                          },
                        ),
                        OptionText('매우 만족')
                      ]),
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
                              widget.appState.state = 'survey8';
                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => SurveyPage2(appState: widget.appState)));*/
                            }
                        ),
                        SizedBox(width:15),
                        BlueButton(
                            width:122,
                            height:41,
                            text: '다음 단계로',

                            onPressed: () async {
                              bool flag1 = _formKey.currentState!.validate();
                              bool flag2 = validateMotherSnackFrequency();
                              bool flag3 = validateMotherEatTime();
                              bool flag4 = validateMotherNightShiftFrequency();
                              bool flag5 = validateMotherSatisfaction();
                              bool flag6 = validateHateFood();
                              bool flag7 = validateLikeFood();

                              if (flag1 && flag2 && flag3 && flag4 && flag5 && flag6 && flag7) {
                                Map<String, dynamic> info = {
                                  'phase': 'surveyResult2intro',

                                  'motherSnackFrequency': _motherSnackFrequency,
                                  'motherEatTime': _motherEatTime,
                                  'motherNightShiftFrequency': _motherNightShiftFrequency,
                                  'motherSatisfaction': _motherSatisfaction,

                                  'motherWorkStartHour': _motherWorkStartHour.currentState!.value == null ? '' : _motherWorkStartHour.currentState!.value.toString(),
                                  'motherWorkStartMinute': _motherWorkStartMinute.currentState!.value == null ? '' : _motherWorkStartMinute.currentState!.value.toString(),
                                  'motherWorkEndHour': _motherWorkEndHour.currentState!.value == null ? '' : _motherWorkEndHour.currentState!.value.toString(),
                                  'motherWorkEndMinute': _motherWorkEndMinute.currentState!.value == null ? '' : _motherWorkEndMinute.currentState!.value.toString(),

                                  'motherWeekdayWakeHour': _motherWeekdayWakeHour.currentState!.value == null ? '' : _motherWeekdayWakeHour.currentState!.value.toString(),
                                  'motherWeekdayWakeMinute': _motherWeekdayWakeMinute.currentState!.value == null ? '' : _motherWeekdayWakeMinute.currentState!.value.toString(),
                                  'motherWeekdaySleepHour': _motherWeekdaySleepHour.currentState!.value == null ? '' : _motherWeekdaySleepHour.currentState!.value.toString(),
                                  'motherWeekdaySleepMinute': _motherWeekdaySleepMinute.currentState!.value == null ? '' : _motherWeekdaySleepMinute.currentState!.value.toString(),

                                  'motherWeekendWakeHour': _motherWeekendWakeHour.currentState!.value == null ? '' : _motherWeekendWakeHour.currentState!.value.toString(),
                                  'motherWeekendWakeMinute': _motherWeekendWakeMinute.currentState!.value == null ? '' : _motherWeekendWakeMinute.currentState!.value.toString(),
                                  'motherWeekendSleepHour': _motherWeekendSleepHour.currentState!.value == null ? '' : _motherWeekendSleepHour.currentState!.value.toString(),
                                  'motherWeekendSleepMinute': _motherWeekendSleepMinute.currentState!.value == null ? '' : _motherWeekendSleepMinute.currentState!.value.toString(),

                                  'motherPhoneHour': _motherPhoneHour.currentState!.value == null ? '' : _motherPhoneHour.currentState!.value.toString(),
                                  'motherTVHour': _motherTVHour.currentState!.value == null ? '' : _motherTVHour.currentState!.value.toString(),

                                  'motherTogetherHour': _motherTogetherHour.currentState!.value == null ? '' : _motherTogetherHour.currentState!.value.toString(),
                                  'motherTogetherStart': _motherTogetherStart.currentState!.value == null ? '' : _motherTogetherStart.currentState!.value.toString(),
                                  'motherTogetherEnd': _motherTogetherEnd.currentState!.value == null ? '' : _motherTogetherEnd.currentState!.value.toString(),

                                  'motherLikeFood': _likeFood,
                                  'motherHateFood': _hateFood,
                                };

                                print(info);

                                widget.appState.userInfo.addAll(info);

                                widget.appState.writeDB(info);

                                widget.appState.state = 'surveyResult2intro';

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
