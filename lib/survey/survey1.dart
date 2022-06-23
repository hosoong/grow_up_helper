import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

import 'survey2.dart';
import 'survey_widgets.dart';

class SurveyPage1IntroText extends StatelessWidget {
  const SurveyPage1IntroText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.center,
      child: Text(
          this.text,
          style: GoogleFonts.notoSans(color: Color(0xff59597c), fontSize: 15, fontWeight: FontWeight.w200)
      )
  );
}

class SurveyPage1Intro extends StatelessWidget {
  SurveyPage1Intro({required this.appState});

  ApplicationState appState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : true,
        body: Container(
                color: Colors.white,
                child: Center(
                    child: ListView(children: [Column(
                        children: [
                          SizedBox(height: 230),
                          Text('반갑습니다!', style: TextStyle(color: Color(0xff5653ff), fontFamily: 'gmarketSans', fontSize: 23, fontWeight: FontWeight.w500)),
                          SizedBox(height: 30),
                          SurveyPage1IntroText('자녀의 정확한 상태 진단을 위해'),
                          SizedBox(height: 5),
                          SurveyPage1IntroText('초기 문진을 완료해 주세요.'),
                          SizedBox(height: 5),
                          SurveyPage1IntroText('영양, 운동, 자세를 위한 문진으로 이루어져 있으며,'),
                          SizedBox(height: 5),
                          SurveyPage1IntroText('예상 소요시간은 약 15분 입니다.'),
                          SizedBox(height: 48),
                          BlueButton(
                            text: '시작하기',
                            width: 194,
                            height: 41,

                            onPressed: () {
                              appState.state = 'survey1';
                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => SurveyPage1(appState: appState))
                              );*/
                            },
                          ),
                        ]
                    )])
                )
        )
    );
  }
}

class SurveyPage1 extends StatefulWidget {
  SurveyPage1({required this.appState});

  ApplicationState appState;

  _SurveyPage1State createState() => _SurveyPage1State();
}

class _SurveyPage1State extends State<SurveyPage1> {
  final List<String> _birthRankList = ['첫', '두', '세', '네', '다섯', '여섯', '일곱', '여덟', '아홉', '열', '열한', '열두+'];
  final List<String> _birthYearList = [for(var i=2000; i<=2021; i+=1) i.toString()];
  final List<String> _birthMonthList = [for(var i=1; i<=12; i+=1) i.toString()];
  final List<String> _birthWeekList = [for(var i=30; i<=40; i+=1) i.toString()];

  String? _sex = null;
  bool _validateSex = true;

  TextEditingController _name = TextEditingController();
  TextEditingController _lastYearHeight = TextEditingController();
  TextEditingController _currentHeight = TextEditingController();
  TextEditingController _currentWeight = TextEditingController();
  TextEditingController _motherHeight = TextEditingController();
  TextEditingController _motherFatherHeight = TextEditingController();
  TextEditingController _motherMotherHeight = TextEditingController();
  TextEditingController _fatherHeight = TextEditingController();
  TextEditingController _fatherFatherHeight = TextEditingController();
  TextEditingController _fatherMotherHeight = TextEditingController();

  final _formKey = GlobalKey<FormState>(debugLabel: '_SurveyPage1State');

  final _birthRank = GlobalKey<DropDownState>();
  final _birthYear = GlobalKey<DropDownState>();
  final _birthMonth = GlobalKey<DropDownState>();
  final _birthWeek = GlobalKey<DropDownState>();

  bool _isTwin = false;
  bool _noMotherFatherHeight = false;
  bool _noMotherMotherHeight = false;
  bool _noFatherMotherHeight = false;
  bool _noFatherFatherHeight = false;

  String? _motherFatherHeightValidator(String? value) {
    if (_noMotherFatherHeight) {
      return null;
    }
    return numberValidator(value);
  }

  String? _motherMotherHeightValidator(String? value) {
    if (_noMotherMotherHeight) {
      return null;
    }
    return numberValidator(value);
  }

  String? _fatherFatherHeightValidator(String? value) {
    if (_noFatherFatherHeight) {
      return null;
    }
    return numberValidator(value);
  }

  String? _fatherMotherHeightValidator(String? value) {
    if (_noFatherMotherHeight) {
      return null;
    }
    return numberValidator(value);
  }

  bool validateSex() {
    if (_sex == null || _sex!.isEmpty) {
      setState(() {_validateSex = false;});
    }
    else {
      setState(() {_validateSex = true;});
    }
    return _validateSex;
  }

  @override
  void initState() {
    super.initState();

    _sex = widget.appState.userInfo.containsKey('sex') ? widget.appState.userInfo['sex'] : null;
    _isTwin = widget.appState.userInfo.containsKey('isTwin') ? widget.appState.userInfo['isTwin'] : false;

    _name = TextEditingController(text: widget.appState.userInfo.containsKey('name') ? widget.appState.userInfo['name'] : null);

    _lastYearHeight = TextEditingController(text: widget.appState.userInfo.containsKey('lastYearHeight') ? widget.appState.userInfo['lastYearHeight'] : null);
    _currentHeight = TextEditingController(text: widget.appState.userInfo.containsKey('currentHeight') ? widget.appState.userInfo['currentHeight'] : null);
    _currentWeight = TextEditingController(text: widget.appState.userInfo.containsKey('currentWeight') ? widget.appState.userInfo['currentWeight'] : null);

    _motherHeight = TextEditingController(text: widget.appState.userInfo.containsKey('motherHeight') ? widget.appState.userInfo['motherHeight'] : null);
    _motherFatherHeight = TextEditingController(text: widget.appState.userInfo.containsKey('motherFatherHeight') ? widget.appState.userInfo['motherFatherHeight'] : null);
    _motherMotherHeight = TextEditingController(text: widget.appState.userInfo.containsKey('motherMotherHeight') ? widget.appState.userInfo['motherMotherHeight'] : null);

    _fatherHeight = TextEditingController(text: widget.appState.userInfo.containsKey('fatherHeight') ? widget.appState.userInfo['fatherHeight'] : null);
    _fatherFatherHeight = TextEditingController(text: widget.appState.userInfo.containsKey('fatherFatherHeight') ? widget.appState.userInfo['fatherFatherHeight'] : null);
    _fatherMotherHeight = TextEditingController(text: widget.appState.userInfo.containsKey('fatherMotherHeight') ? widget.appState.userInfo['fatherMotherHeight'] : null);

    _noMotherFatherHeight = widget.appState.userInfo.containsKey('motherFatherHeight') && widget.appState.userInfo['motherFatherHeight'].isEmpty ? true : false;
    _noMotherMotherHeight = widget.appState.userInfo.containsKey('motherMotherHeight') && widget.appState.userInfo['motherMotherHeight'].isEmpty ? true : false;
    _noFatherFatherHeight = widget.appState.userInfo.containsKey('fatherFatherHeight') && widget.appState.userInfo['fatherFatherHeight'].isEmpty ? true : false;
    _noFatherMotherHeight = widget.appState.userInfo.containsKey('fatherMotherHeight') && widget.appState.userInfo['fatherMotherHeight'].isEmpty ? true : false;
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
                  TitleText('1. 자녀 정보'),

                  SizedBox(height: 10.0),
                  ProgressBar(16),

                  SizedBox(height: 30.0),
                  QuestionText('1. 아이의 이름은 무엇인가요?'),
                  SizedBox(height: 8),
                  SurveyField('이름을 입력해 주세요.', _name, defaultValidator, true, false),

                  SizedBox(height: 40.0),
                  QuestionText('2. 아이의 성별은 무엇인가요?'),
                  SizedBox(height: 17),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _sex == 'W' ? BlueButton(
                            width:148,
                            height:38,
                            onPressed: () {
                              setState(() {
                                _sex = 'W';
                              });
                              },
                            text: '여아'
                        ) : WhiteButton(
                            width:148,
                            height: 38,
                            onPressed: () {
                              setState(() {
                                _sex = 'W';
                              });
                              },
                            text: '여아'
                        ),
                        _sex == 'M' ? BlueButton(
                            width:148,
                            height:38,
                            onPressed: () {
                              setState(() {
                                _sex = 'M';
                              });
                            },
                            text: '남아'
                        ) : WhiteButton(
                            width:148,
                            height: 38,
                            onPressed: () {
                              setState(() {
                                _sex = 'M';
                              });
                            },
                            text: '남아'
                        ),
                      ]),
                  Visibility (
                    visible: !_validateSex,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height:42),
                  QuestionText('3. 아이는 몇째인가요?'),
                  SizedBox(height:8),
                  Container(
                    child: Row(
                      children: <Widget>[
                        DropDown(key: _birthRank,
                            value: widget.appState.userInfo.containsKey('birthRank') ? widget.appState.userInfo['birthRank'] : null,
                            enabled: true,
                            validator: defaultValidator, hint: '첫', items: _birthRankList, width: 120),
                        SizedBox(width: 10),
                        JustText('번째 아이에요.'),
                        SizedBox(width: 20),
                        Checkbox(
                          value: _isTwin,
                          onChanged: (value) {
                            setState(() {
                              _isTwin = !_isTwin;
                            });
                          },
                        ),
                        NoText('쌍둥이에요.'),
                      ],
                    ),
                  ),

                  SizedBox(height: 37.0),
                  QuestionText('4. 아이는 언제 태어났나요?'),
                  SizedBox(height: 8),
                  Container(
                    child: Row(
                      children: <Widget>[
                        DropDown(key: _birthYear,
                            value: widget.appState.userInfo.containsKey('birthYear') ? widget.appState.userInfo['birthYear'] : null,
                            enabled: true,
                            validator: defaultValidator, hint: '출생년도', items: _birthYearList, width: 120),
                        SizedBox(width: 10),
                        JustText('년'),
                        SizedBox(width: 20),
                        DropDown(key: _birthMonth,
                            value: widget.appState.userInfo.containsKey('birthMonth') ? widget.appState.userInfo['birthMonth'] : null,
                            enabled: true,
                            validator: defaultValidator, hint: '출생월', items: _birthMonthList, width: 100),
                        SizedBox(width: 10),
                        JustText('월'),
                      ],
                    ),
                  ),
                  SizedBox(height:15),
                  Row(
                    children: <Widget>[
                      DropDown(key: _birthWeek,
                          value: widget.appState.userInfo.containsKey('birthWeek') ? widget.appState.userInfo['birthWeek'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '임신주수', items: _birthWeekList, width: 120),
                      SizedBox(width: 10),
                      JustText('주에 태어났어요.')],
                  ),

                  SizedBox(height: 37.0),
                  QuestionText('5. 아이의 신체 정보를 입력해 주세요.'),
                  AdditionalText('(정확할수록 좋아요!)'),
                  SizedBox(height:15),
                  Row(
                    children: <Widget>[
                      JustText('1년 전엔'),
                      SizedBox(width: 10),
                      new Container(
                        width: 100,
                        child: SurveyField('1년 전 키', _lastYearHeight, numberValidator, true, true)
                      ),
                      SizedBox(width: 10),
                      JustText('cm였고,'),
                    ],
                  ),
                  SizedBox(height:7),
                  Row(
                    children: <Widget>[
                      JustText('지금은'),
                      SizedBox(width: 20),
                      new Container(
                        width: 100,
                        child: SurveyField('현재 키', _currentHeight, numberValidator, true, true),
                      ),
                      SizedBox(width: 10),
                      JustText('cm에,'),
                    ],
                  ),
                  SizedBox(height:7),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 60),
                      new Container(
                        width: 100,
                        child: SurveyField('현재 몸무게', _currentWeight, numberValidator, true, true),
                      ),
                      SizedBox(width: 10),
                      JustText('kg이에요.'),
                    ],
                  ),

                  SizedBox(height: 35.0),
                  QuestionText('6. 엄마의 키를 입력해 주세요.'),
                  SizedBox(height:12),
                  Row(
                    children: <Widget>[
                      JustText('엄마 키는'),
                      SizedBox(width: 10),
                      new Container(
                        width: 100,
                        child: SurveyField('엄마 키', _motherHeight, numberValidator, true, true),
                      ),
                      SizedBox(width: 10),
                      JustText('cm,'),
                    ],
                  ),
                  SizedBox(height:7),
                  Row(
                    children: <Widget>[
                      JustText('외할아버지 키는'),
                      SizedBox(width: 10),
                      new Container(
                        width: 100,
                        child: SurveyField('외할아버지 키', _motherFatherHeight, _motherFatherHeightValidator, !_noMotherFatherHeight, true),
                      ),
                      SizedBox(width: 10),
                      JustText('cm,'),
                      Checkbox(
                        value: _noMotherFatherHeight,
                        onChanged: (value) {
                          setState(() {
                            if (!_noMotherFatherHeight) {
                              _motherFatherHeight.text = '';
                            }
                            _noMotherFatherHeight = !_noMotherFatherHeight;
                          });
                        },
                      ),
                      NoText('모르겠어요'),
                    ],
                  ),
                  SizedBox(height:7),
                  Row(
                    children: <Widget>[
                      JustText('외할머니 키는'),
                      SizedBox(width: 10),
                      new Container(
                        width: 100,
                        child: SurveyField('외할머니 키', _motherMotherHeight, _motherMotherHeightValidator, !_noMotherMotherHeight, true),
                      ),
                      SizedBox(width: 10),
                      JustText('cm에요.'),
                      Checkbox(
                        value: _noMotherMotherHeight,
                        onChanged: (value) {
                          setState(() {
                            if (!_noMotherMotherHeight) {
                              _motherMotherHeight.text = '';
                            }
                            _noMotherMotherHeight = !_noMotherMotherHeight;
                          });
                        },
                      ),
                      NoText('모르겠어요'),
                    ],
                  ),

                  SizedBox(height: 44.0),
                  QuestionText('7. 아빠의 키를 입력해 주세요.'),
                  SizedBox(height:12),
                  Row(
                    children: <Widget>[
                      JustText('아빠 키는'),
                      SizedBox(width: 10),
                      new Container(
                        width: 100,
                        child: SurveyField('아빠 키', _fatherHeight, numberValidator, true, true),
                      ),
                      SizedBox(width: 10),
                      JustText('cm,'),
                    ],
                  ),
                  SizedBox(height:7),
                  Row(
                    children: <Widget>[
                      JustText('친할아버지 키는'),
                      SizedBox(width: 10),
                      new Container(
                        width: 100,
                        child: SurveyField('친할아버지 키', _fatherFatherHeight, _fatherFatherHeightValidator, !_noFatherFatherHeight, true),
                      ),
                      SizedBox(width: 10),
                      JustText('cm,'),
                      Checkbox(
                        value: _noFatherFatherHeight,
                        onChanged: (value) {
                          setState(() {
                            if (!_noFatherFatherHeight) {
                              _fatherFatherHeight.text = '';
                            }
                            _noFatherFatherHeight = !_noFatherFatherHeight;
                          });
                        },
                      ),
                      NoText('모르겠어요'),
                    ],
                  ),
                  SizedBox(height:7),
                  Row(
                    children: <Widget>[
                      JustText('친할머니 키는'),
                      SizedBox(width: 10),
                      new Container(
                        width: 100,
                        child: SurveyField('친할머니 키', _fatherMotherHeight, _fatherMotherHeightValidator, !_noFatherMotherHeight, true),
                      ),
                      SizedBox(width: 10),
                      JustText('cm에요.'),
                      Checkbox(
                        value: _noFatherMotherHeight,
                        onChanged: (value) {
                          setState(() {
                            if (!_noFatherMotherHeight) {
                              _fatherMotherHeight.text = '';
                            }
                            _noFatherMotherHeight = !_noFatherMotherHeight;
                          });
                        },
                      ),
                      NoText('모르겠어요'),
                    ],
                  ),

                  SizedBox(height:50.0),
                  BlueButton(
                        width:160,
                        height:41,
                        text: '다음 단계로',

                        onPressed: () async {

                          bool flag1 = _formKey.currentState!.validate();
                          bool flag2 = validateSex();

                          if (flag1 && flag2) {
                            Map<String, dynamic> info = {
                              'phase': 'survey2',

                              'name': _name.text,
                              'sex': _sex,
                              'isTwin': _isTwin,
                              'birthRank': _birthRank.currentState!.value.toString(),
                              'birthYear': _birthYear.currentState!.value.toString(),
                              'birthMonth': _birthMonth.currentState!.value.toString(),
                              'birthWeek': _birthWeek.currentState!.value.toString(),
                              'lastYearHeight': _lastYearHeight.text,
                              'currentHeight': _currentHeight.text,
                              'currentWeight': _currentWeight.text,
                              'motherHeight': _motherHeight.text,
                              'motherFatherHeight': _motherFatherHeight.text,
                              'motherMotherHeight': _motherMotherHeight.text,
                              'fatherHeight': _fatherHeight.text,
                              'fatherFatherHeight': _fatherFatherHeight.text,
                              'fatherMotherHeight': _fatherMotherHeight.text,
                            };

                            print(info);

                            widget.appState.writeDB(info);

                            widget.appState.state = 'survey2';
                            /*Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => SurveyPage2(appState: widget.appState))
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
