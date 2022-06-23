import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

import 'survey3.dart';
import 'survey5.dart';
import 'survey_widgets.dart';

class SurveyPage4 extends StatefulWidget {
  SurveyPage4({required this.appState});

  ApplicationState appState;

  _SurveyPage4State createState() => _SurveyPage4State();
}

class _SurveyPage4State extends State<SurveyPage4> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_SurveyPage4State');

  final GlobalKey<DropDownState> _exerciseType = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _exerciseFrequency = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _exerciseTime = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _exercisePlace = GlobalKey<DropDownState>();

  String? _exerciseTypeZ = '';
  String? _exerciseFrequencyZ = '';
  String? _exerciseTimeZ = '';
  String? _exercisePlaceZ = '';

  bool temp_flag = false;

  final List<String> _exerciseTypeList = ['태권도', '농구', '축구', '야구', '그 외 구기종목', '배드민턴', '테니스', '수영',
  '줄넘기', '달리기', '자전거타기', '발레', '필라테스', '요가', '춤', '그 외 운동학원', '그 외 호신무술'];
  final List<String> _exerciseFrequencyList = [for(var i=1; i<=12; i+=1) i.toString()];
  final List<String> _exerciseTimeList = [for(var i=1; i<=12; i+=1) i.toString()];
  final List<String> _exercisePlaceList = ['집', '장소'];

  String _activityAmount = '0';
  bool _validateActivityAmount = true;

  String _outdoorActivityAmount = '0';
  bool _validateOutdoorActivityAmount = true;

  List<String> _transportation = [for(var i=1; i<=4; i+=1) '0'];
  bool _validateTransportation = true;

  bool validateActivityAmount() {
    if (_activityAmount == '0') {
      setState(() {_validateActivityAmount = false;});
    }
    else {
      setState(() {_validateActivityAmount = true;});
    }
    return _validateActivityAmount;
  }

  bool validateOutdoorActivityAmount() {
    if (_outdoorActivityAmount == '0') {
      setState(() {_validateOutdoorActivityAmount = false;});
    }
    else {
      setState(() {_validateOutdoorActivityAmount = true;});
    }
    return _validateOutdoorActivityAmount;
  }

  bool validateTransportation() {
    if (_transportation.indexOf('1') == -1) {
      setState(() {_validateTransportation = false;});
    }
    else {
      setState(() {_validateTransportation = true;});
    }
    return _validateTransportation;
  }


  @override
  void initState() {
    super.initState();

    _exerciseTypeZ = widget.appState.userInfo.containsKey('exerciseType') ? widget.appState.userInfo['exerciseType'] : _exerciseTypeZ;
    _exerciseFrequencyZ = widget.appState.userInfo.containsKey('exerciseFrequency') ? widget.appState.userInfo['exerciseFrequency'] : _exerciseFrequencyZ;
    _exerciseTimeZ = widget.appState.userInfo.containsKey('exerciseTime') ? widget.appState.userInfo['exerciseTime'] : _exerciseTimeZ;
    _exercisePlaceZ = widget.appState.userInfo.containsKey('exercisePlace') ? widget.appState.userInfo['exercisePlace'] : _exercisePlaceZ;
    temp_flag = widget.appState.userInfo.containsKey('exercisePlace') ? true : false;

    _activityAmount = widget.appState.userInfo.containsKey('activityAmount') ? widget.appState.userInfo['activityAmount'] : '0';
    _outdoorActivityAmount = widget.appState.userInfo.containsKey('outdoorActivityAmount') ? widget.appState.userInfo['outdoorActivityAmount'] : '0';
    _transportation = widget.appState.userInfo.containsKey('transportation') ? List<String>.from(widget.appState.userInfo['transportation']) : _transportation;
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
                  TitleText('2. 상태 파악 (운동)'),

                  SizedBox(height: 10.0),
                  ProgressBar(69),

                  SizedBox(height: 30.0),
                  QuestionText('1. 아이의 평소 활동량이 어떻게 되나요?'),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _activityAmount == '1',
                          onChanged: (value) {
                            setState(() {
                              _activityAmount = '1';
                            });
                          },
                        ),
                        OptionText('아주적음')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _activityAmount == '2',
                          onChanged: (value) {
                            setState(() {
                              _activityAmount = '2';
                            });
                          },
                        ),
                        OptionText('적음')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _activityAmount == '3',
                          onChanged: (value) {
                            setState(() {
                              _activityAmount = '3';
                            });
                          },
                        ),
                        OptionText('보통')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _activityAmount == '4',
                          onChanged: (value) {
                            setState(() {
                              _activityAmount = '4';
                            });
                          },
                        ),
                        OptionText('많음')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _activityAmount == '5',
                          onChanged: (value) {
                            setState(() {
                              _activityAmount = '5';
                            });
                          },
                        ),
                        OptionText('아주많음')
                      ]),
                    ],
                  ),
                  Visibility (
                    visible: !_validateActivityAmount,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('2. 아이가 주기적으로 하는 운동이 있나요?'),
                  SizedBox(height: 10.0),
                  QuestionText('     (운동 학원 포함)'),
                  SizedBox(height: 10.0),
                  Column(children:[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          SizedBox(
                              width: 290,
                              child:
                              Text('운동 정보를 입력해 주세요.',
                                //showFood(_hateFood, _hateFoodList),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.notoSans(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffc1c1c1),
                                  )
                              )
                          ),

                          MaterialButton(
                            shape: CircleBorder(),
                            minWidth: 18,
                            height:18,
                            child: Icon(Icons.add_circle_outline, color: Color(0xff575757)),
                            onPressed: () {
                              //_temp_hateFood = List.from(_hateFood);
                              showDialog (
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                            insetPadding: EdgeInsets.fromLTRB(0, 445, 0, 0),
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
                                                  Row(mainAxisAlignment:MainAxisAlignment.start,children:[QuestionText('자녀의 운동 정보를 입력해 주세요.')]),
                                                  SizedBox(height:0),

                                                  SizedBox(height:15),
                                                  Row(
                                                      children:[
                                                        DropDown(key: _exerciseType,
                                                            value: null,//widget.appState.userInfo.containsKey('exerciseType') ? widget.appState.userInfo['exerciseType'] : null,
                                                            enabled: true,
                                                            validator: defaultValidator, hint: '운동 종류', items: _exerciseTypeList, width: 100),
                                                        SizedBox(width:10),
                                                        JustText('을(를) 일주일에'),
                                                      ]),
                                                  Row(
                                                      children:[
                                                        DropDown(key: _exerciseFrequency,
                                                      value: null,//widget.appState.userInfo.containsKey('exerciseFrequency') ? widget.appState.userInfo['exerciseFrequency'] : null,
                                                      enabled: true,
                                                      validator: defaultValidator, hint: '횟수', items: _exerciseFrequencyList, width: 100),
                                                        SizedBox(width:10),
                                                        JustText('회'),

                                                        SizedBox(width:10),
                                                        DropDown(key: _exerciseTime,
                                                            value: null,//widget.appState.userInfo.containsKey('exerciseTime') ? widget.appState.userInfo['exerciseTime'] : null,
                                                            enabled: true,
                                                            validator: defaultValidator, hint: '회당 시간', items: _exerciseTimeList, width: 100),
                                                        SizedBox(width:10),
                                                        JustText('시간'),
                                                      ]),
                                                  Row(
                                                      children:[
                                                        Container(width: 100,child: Column(children:[
                                                          //SizedBox(height:2),
                                                          DropDown(key: _exercisePlace,
                                                              value: null,//widget.appState.userInfo.containsKey('exercisePlace') ? widget.appState.userInfo['exercisePlace'] : null,
                                                              enabled: true,
                                                              validator: defaultValidator, hint: '장소', items: _exercisePlaceList, width: 100),
                                                        ])),
                                                        SizedBox(width:10),
                                                        JustText('에서 운동해요.'),
                                                      ]),

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
                                                    if (_exerciseType.currentState!.value != null &&
                                                        _exerciseFrequency.currentState!.value != null &&
                                                        _exerciseTime.currentState!.value != null &&
                                                        _exercisePlace.currentState!.value != null){
                                                      temp_flag = true;
                                                      _exerciseTypeZ = _exerciseType.currentState!.value;
                                                      _exerciseFrequencyZ = _exerciseFrequency.currentState!.value;
                                                      _exerciseTimeZ = _exerciseTime.currentState!.value;
                                                      _exercisePlaceZ = _exercisePlace.currentState!.value;
                                                      Navigator.of(context).pop();
                                                    }
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

                  SizedBox(height:10),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Container(width: 100,child: Column(children:[
                      //SizedBox(height:2),
                      Text(
                          temp_flag ? _exerciseTypeZ.toString() : '운동 종류',
                          style: GoogleFonts.notoSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: temp_flag ? Color(0xff59597c) : Color(0xffc1c1c1),
                          )),
                      Divider(color: Colors.black, endIndent: 0),
                    ])),
                    SizedBox(width:10),
                    JustText('운동을'),
                  ]),
		SizedBox(height:8),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Container(width: 100,child: Column(children:[
                          //SizedBox(height:2),
                          Text(
                              temp_flag ? _exerciseFrequencyZ.toString() : '00',
                              style: GoogleFonts.notoSans(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: temp_flag ? Color(0xff59597c) : Color(0xffc1c1c1),
                              )),
                          Divider(color: Colors.black, endIndent: 0),
                        ])),
                        SizedBox(width:10),
                        JustText('회'),
                        SizedBox(width:10),
                        Container(width: 100,child: Column(children:[
                          //SizedBox(height:2),
                          Text(
                              temp_flag ? _exerciseTimeZ.toString() : '00',
                              style: GoogleFonts.notoSans(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: temp_flag ? Color(0xff59597c) : Color(0xffc1c1c1),
                              )),
                          Divider(color: Colors.black, endIndent: 0),
                        ])),
                        SizedBox(width:10),
                        JustText('시간'),
                      ]),
		SizedBox(height:8),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Container(width: 100,child: Column(children:[
                          //SizedBox(height:2),
                          Text(
                              temp_flag ? _exercisePlaceZ.toString() : '어디서',
                              style: GoogleFonts.notoSans(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: temp_flag ? Color(0xff59597c) : Color(0xffc1c1c1),
                              )),
                          Divider(color: Colors.black, endIndent: 0),
                        ])),
                        SizedBox(width:10),
                        JustText('에서 해요.'),
                      ]),

                  SizedBox(height: 30.0),
                  QuestionText('3. 등하교시 주 이동시간이 무엇인가요?'),
                  SizedBox(height: 10.0),
                  Column(
                    children: <Widget>[
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _transportation[0] == '1',
                          onChanged: (value) {
                            setState(() {
                              _transportation[0] = _transportation[0] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('도보 (왕복 거리)')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _transportation[1] == '1',
                          onChanged: (value) {
                            setState(() {
                              _transportation[1] = _transportation[1] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('자전거')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _transportation[2] == '1',
                          onChanged: (value) {
                            setState(() {
                              _transportation[2] = _transportation[2] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('버스')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _transportation[3] == '1',
                          onChanged: (value) {
                            setState(() {
                              _transportation[3] = _transportation[3] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('자동차')
                      ])),
                    ],
                  ),
                  Visibility (
                    visible: !_validateTransportation,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('4. 주말에 야외할동 시간이 얼마나 되나요?'),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _outdoorActivityAmount == '1',
                          onChanged: (value) {
                            setState(() {
                              _outdoorActivityAmount = '1';
                            });
                          },
                        ),
                        OptionText('1시간 미만'),
                        SizedBox(height:18)
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _outdoorActivityAmount == '2',
                          onChanged: (value) {
                            setState(() {
                              _outdoorActivityAmount = '2';
                            });
                          },
                        ),
                        OptionText('1시간 이상~'),
                        OptionText('3시간 미만')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _outdoorActivityAmount == '3',
                          onChanged: (value) {
                            setState(() {
                              _outdoorActivityAmount = '3';
                            });
                          },
                        ),
                        OptionText('3시간 이상~'),
                        OptionText('5시간 미만')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _outdoorActivityAmount == '4',
                          onChanged: (value) {
                            setState(() {
                              _outdoorActivityAmount = '4';
                            });
                          },
                        ),
                        OptionText('5시간이상'),
                        SizedBox(height:18)
                      ]),
                    ],
                  ),
                  Visibility (
                    visible: !_validateOutdoorActivityAmount,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
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
                              widget.appState.state = 'survey3';
                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => SurveyPage3(appState: widget.appState)));*/
                            }
                        ),
                        SizedBox(width:15),
                        BlueButton(
                            width:122,
                            height:41,
                            text: '다음 단계로',

                            onPressed: () async {
                              bool flag1 = _formKey.currentState!.validate();
                              bool flag2 = validateActivityAmount();
                              bool flag3 = validateOutdoorActivityAmount();
                              bool flag4 = validateTransportation();

                              if (flag1 && flag2 && flag3 && flag4) {
                                Map<String, dynamic> info = {
                                  'phase': 'survey5',

                                  'activityAmount': _activityAmount,
                                  'outdoorActivityAmount': _outdoorActivityAmount,
                                  'transportation': _transportation,

                                  'exerciseType': _exerciseTypeZ,
                                  'exerciseFrequency': _exerciseFrequencyZ,
                                  'exerciseTime': _exerciseTimeZ,
                                  'exercisePlace': _exercisePlaceZ,
                                };

                                print(info);

                                widget.appState.writeDB(info);

                                widget.appState.state = 'survey5';
                                /*Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => SurveyPage5(appState: widget.appState))
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
