import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

import 'survey2.dart';
import 'survey4.dart';
import 'survey_widgets.dart';

class SurveyPage3IntroText extends StatelessWidget {
  const SurveyPage3IntroText(this.text);
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

class SurveyPage3Intro extends StatelessWidget {
  SurveyPage3Intro({required this.appState});

  ApplicationState appState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : true,
        body: Container(
            color: Colors.white,
            child: Center(
                child: Column(
                    children: [
                      SizedBox(height: 230),
                      Text('수고하셨어요!', style: TextStyle(color: Color(0xff5653ff), fontFamily: 'gmarketSans', fontSize: 23, fontWeight: FontWeight.w500)),
                      SizedBox(height: 30),
                      SurveyPage3IntroText('벌써 한 단계를 완료하셨군요.'),
                      SizedBox(height: 5),
                      SurveyPage3IntroText('아이의 정확한 상태 진단을 위해'),
                      SizedBox(height: 5),
                      SurveyPage3IntroText('앞으로의 문항들도 열심히 채워보아요!'),
                      SizedBox(height: 86),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WhiteButton(
                              width: 128,
                                height:38,
                                text: '이전 단계로',

                                onPressed: () {
                                  appState.state = 'survey2';
                                  /*Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => SurveyPage2(appState: appState)));*/
                                }
                            ),
				SizedBox(width: 15),
                            BlueButton(
                              width:122,
                                height:41,
                                text: '다음 단계로',

                                onPressed: () {
                                    appState.state = 'survey3';
                                    /*Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => SurveyPage4(appState: appState))
                                    );*/
                                }
                            ),
                          ]
                      ),
                    ]
                )
            )
        )
    );
  }
}

class SurveyPage3 extends StatefulWidget {
  SurveyPage3({required this.appState});

  ApplicationState appState;

  _SurveyPage3State createState() => _SurveyPage3State();
}

class _SurveyPage3State extends State<SurveyPage3> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_SurveyPage3State');

  final List<String> _eatingAmountList = ['1/4', '1/2', '3/4', '1', '2', '3+'];
  final List<String> _eatingHabitList = ['반찬을 많이 먹는', '밥을 많이 먹는', '골고루 많이 먹는', '국물을 많이 먹는', '잘 안먹는'];
  final List<String> _eatoutFrequencyList = ['0', '1', '2', '3+'];
  final List<String> _deliveryFrequencyList = ['0', '1', '2', '3+'];
  final List<String> _instantFrequencyList = ['0', '1', '2', '3+'];
  final List<String> _fastfoodFrequencyList = ['0', '1', '2', '3+'];
  final List<String> _waterCupList = ['0', '1', '2', '3', '4', '5', '6+'];

  final GlobalKey<DropDownState> _eatingAmount = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _eatingHabit = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _eatoutFrequency = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _deliveryFrequency = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _instantFrequency = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _fastfoodFrequency = GlobalKey<DropDownState>();
  final GlobalKey<DropDownState> _waterCup = GlobalKey<DropDownState>();

  String _eatingTime = '0';
  bool _validateEatingTime = true;

  String _snackFrequency = '0';
  bool _validateSnackFrequency = true;

  List<String> _eatingHabits = [for(var i=1; i<=6; i+=1) '0'];
  bool _validateEatingHabits = true;

  List<String> _snacks = [for(var i=1; i<=6; i+=1) '0'];
  bool _validateSnacks = true;

  bool _noHateFood = false;
  bool _noLikeFood = false;

  bool _validateHateFood = true;
  bool _validateLikeFood = true;

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
    if (_hateFood.indexOf('1') == -1 && (!_noHateFood)) {
      setState(() {_validateHateFood = false;});
    }
    else {
      setState(() {_validateHateFood = true;});
    }
    return _validateHateFood;
  }

  bool validateLikeFood() {
    if (_likeFood.indexOf('1') == -1 && (!_noLikeFood)) {
      setState(() {_validateLikeFood = false;});
    }
    else {
      setState(() {_validateLikeFood = true;});
    }
    return _validateLikeFood;
  }

  bool validateEatingTime() {
    if (_eatingTime == '0') {
      setState(() {_validateEatingTime = false;});
    }
    else {
      setState(() {_validateEatingTime = true;});
    }
    return _validateEatingTime;
  }

  bool validateSnackFrequency() {
    if (_snackFrequency == '0') {
      setState(() {_validateSnackFrequency = false;});
    }
    else {
      setState(() {_validateSnackFrequency = true;});
    }
    return _validateSnackFrequency;
  }

  bool validateEatingHabits() {
    if (_eatingHabits.indexOf('1') == -1) {
      setState(() {_validateEatingHabits = false;});
    }
    else {
      setState(() {_validateEatingHabits = true;});
    }
    return _validateEatingHabits;
  }

  bool validateSnacks() {
    if (_snacks.indexOf('1') == -1) {
      setState(() {_validateSnacks = false;});
    }
    else {
      setState(() {_validateSnacks = true;});
    }
    return _validateSnacks;
  }

  @override
  void initState() {
    super.initState();

    _noHateFood = widget.appState.userInfo.containsKey('hateFood') && noneSelected(widget.appState.userInfo['hateFood']) ? true : false;
    _noLikeFood = widget.appState.userInfo.containsKey('likeFood') && noneSelected(widget.appState.userInfo['likeFood']) ? true : false;
    _hateFood = widget.appState.userInfo.containsKey('hateFood') ? List<String>.from(widget.appState.userInfo['hateFood']) : _hateFood;
    _likeFood = widget.appState.userInfo.containsKey('likeFood') ? List<String>.from(widget.appState.userInfo['likeFood']) : _likeFood;

    _eatingTime = widget.appState.userInfo.containsKey('eatingTime') ? widget.appState.userInfo['eatingTime'] : '0';
    _eatingHabits = widget.appState.userInfo.containsKey('eatingHabits') ? List<String>.from(widget.appState.userInfo['eatingHabits']) : _eatingHabits;
    _snackFrequency = widget.appState.userInfo.containsKey('snackFrequency') ? widget.appState.userInfo['snackFrequency'] : '0';
    _snacks = widget.appState.userInfo.containsKey('snacks') ? List<String>.from(widget.appState.userInfo['snacks']) : _snacks;
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
                  TitleText('2. 상태 파악 (영양)'),

                  SizedBox(height: 10.0),
                  ProgressBar(48),

                  SizedBox(height: 30.0),
                  QuestionText('1. 아이의 평소 식사량은 얼마나 되나요?'),

                  SizedBox(height: 17),
                  Row(
                    children: <Widget>[
                      JustText('밥은 한 끼에'),
                      SizedBox(width: 10),
                      DropDown(key: _eatingAmount,
                          value: widget.appState.userInfo.containsKey('eatingAmount') ? widget.appState.userInfo['eatingAmount'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '공깃밥 기준', items: _eatingAmountList, width: 120),
                      SizedBox(width: 10),
                      JustText('그릇을 먹고,'),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: <Widget>[
                      DropDown(key: _eatingHabit,
                          value: widget.appState.userInfo.containsKey('eatingHabit') ? widget.appState.userInfo['eatingHabit'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '식사 습관', items: _eatingHabitList, width: 160),
                      SizedBox(width: 10),
                      JustText('편이예요.'),
                    ],
                  ),

                  SizedBox(height:30.0),
                  QuestionText('2. 아이의 식사시간이 얼마나 걸리나요?'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _eatingTime == '1',
                          onChanged: (value) {
                            setState(() {
                              _eatingTime = '1';
                            });
                            },
                        ),
                        OptionText('10분 이내')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _eatingTime == '2',
                          onChanged: (value) {
                            setState(() {
                              _eatingTime = '2';
                            });
                          },
                        ),
                        OptionText('10분~20분')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _eatingTime == '3',
                          onChanged: (value) {
                            setState(() {
                              _eatingTime = '3';
                            });
                          },
                        ),
                        OptionText('20분~30분')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _eatingTime == '4',
                          onChanged: (value) {
                            setState(() {
                              _eatingTime = '4';
                            });
                          },
                        ),
                        OptionText('30분 이상')
                      ]),
                    ],
                  ),
                  Visibility (
                    visible: !_validateEatingTime,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height:40),
                  QuestionText('3. 아이가 식사할 때 주로 무엇을 하나요?'),
                  SizedBox(height: 20),
                  Column(
                    children: <Widget>[
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _eatingHabits[0] == '1',
                          onChanged: (value) {
                            setState(() {
                              _eatingHabits[0] = _eatingHabits[0] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('밥 먹는데 집중한다')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _eatingHabits[1] == '1',
                          onChanged: (value) {
                            setState(() {
                              _eatingHabits[1] = _eatingHabits[1] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('휴대폰을 본다')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _eatingHabits[2] == '1',
                          onChanged: (value) {
                            setState(() {
                              _eatingHabits[2] = _eatingHabits[2] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('책을 읽는다')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _eatingHabits[3] == '1',
                          onChanged: (value) {
                            setState(() {
                              _eatingHabits[3] = _eatingHabits[3] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('돌아다닌다')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _eatingHabits[4] == '1',
                          onChanged: (value) {
                            setState(() {
                              _eatingHabits[4] = _eatingHabits[4] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('TV를 본다')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _eatingHabits[5] == '1',
                          onChanged: (value) {
                            setState(() {
                              _eatingHabits[5] = _eatingHabits[5] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('부모와 대화한다')
                      ])),
                    ],
                  ),
                  Visibility (
                    visible: !_validateEatingHabits,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height:30),
                  Row(children: [
                    QuestionText('4. 아이가 편식하는 음식이 있나요?'),
                    SizedBox(width:10),
                    SizedBox(width:30, child:
                      Checkbox(
                        value: _noHateFood,
                        onChanged: (value) {
                          setState(() {
                            _noHateFood = !_noHateFood;
                            _hateFood = List.from(_resetList);
                          });
                        },
                      )
                    ),
                    NoText('없어요')
                  ]),

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
                            child: Icon(Icons.add_circle_outline, color:Color(0xff575757)),
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
                                                  Row(mainAxisAlignment:MainAxisAlignment.center,children:[QuestionText('아이가 편식하는 음식을 모두 체크해 주세요.')]),
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
                                                    if (!noneSelected(_hateFood)) {
                                                      _noHateFood = false;
                                                    }
                                                    Navigator.of(context).pop();
                                                  },
                                                  text: '추가',
                                                )
                                              ]),
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

                  SizedBox(height:30),
                  Row(children: [
                    QuestionText('5. 아이가 좋아하는 음식이 있나요?'),
                    SizedBox(width:10),
                    SizedBox(width:30, child:
                    Checkbox(
                      value: _noLikeFood,
                      onChanged: (value) {
                        setState(() {
                          _noLikeFood = !_noLikeFood;
                          _likeFood = List.from(_resetList);
                        });
                      },
                    )
                    ),
                    NoText('없어요')
                  ]),

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
                        child: Icon(Icons.add_circle_outline, color:Color(0xff575757)),
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
                                              Row(mainAxisAlignment:MainAxisAlignment.center,children:[QuestionText('아이가 좋아하는 음식을 모두 체크해 주세요.')]),
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
                                                _likeFood = List.from(_temp_likeFood);
                                                if (!noneSelected(_likeFood)) {
                                                  _noLikeFood = false;
                                                }
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

                  SizedBox(height:40),
                  QuestionText('6. 아이는 집밥을 얼마나 자주 먹나요?'),
                  SizedBox(height:10),
                  Row(
                    children: <Widget>[
                      JustText('외식은 일주일에'),
                      SizedBox(width: 10),
                      DropDown(key: _eatoutFrequency,
                          value: widget.appState.userInfo.containsKey('eatoutFrequency') ? widget.appState.userInfo['eatoutFrequency'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '빈도', items: _eatoutFrequencyList, width: 130),
                      SizedBox(width: 10),
                      JustText('번 정도 하고,'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      JustText('배달음식은 일주일에'),
                      SizedBox(width: 10),
                      DropDown(key: _deliveryFrequency,
                          value: widget.appState.userInfo.containsKey('deliveryFrequency') ? widget.appState.userInfo['deliveryFrequency'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '빈도', items: _deliveryFrequencyList, width: 80),
                      SizedBox(width: 10),
                      JustText('번 먹어요.'),
                    ],
                  ),

                  SizedBox(height:35),
                  QuestionText('7. 아이가 간편조리음식(냉동음식)은 얼마나 먹나요?'),
                  SizedBox(height:10),
                  Row(
                    children: <Widget>[
                      JustText('간편조리 음식은 일주일에'),
                      SizedBox(width: 10),
                      DropDown(key: _instantFrequency,
                          value: widget.appState.userInfo.containsKey('instantFrequency') ? widget.appState.userInfo['instantFrequency'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '빈도', items: _instantFrequencyList, width: 80),
                      SizedBox(width: 10),
                      JustText('번 먹어요.'),
                    ],
                  ),

                  SizedBox(height:35),
                  QuestionText('8. 아이가 패스트푸드는 얼마나 먹나요?'),
                  SizedBox(height:10),
                  Row(
                    children: <Widget>[
                      JustText('패스트푸드는 일주일에'),
                      SizedBox(width: 10),
                      DropDown(key: _fastfoodFrequency,
                          value: widget.appState.userInfo.containsKey('fastfoodFrequency') ? widget.appState.userInfo['fastfoodFrequency'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '빈도', items: _fastfoodFrequencyList, width: 80),
                      SizedBox(width: 10),
                      JustText('번 먹어요.'),
                    ],
                  ),

                  SizedBox(height:35),
                  QuestionText('9. 아이가 하루에 물을 얼마나 마시나요?'),
                  SizedBox(height:10),
                  Row(
                    children: <Widget>[
                      JustText('하루에 물'),
                      SizedBox(width: 10),
                      DropDown(key: _waterCup,
                          value: widget.appState.userInfo.containsKey('waterCup') ? widget.appState.userInfo['waterCup'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '종이컵 기준', items: _waterCupList, width: 120),
                      SizedBox(width: 10),
                      JustText('컵을 마셔요.'),
                    ],
                  ),

                  SizedBox(height:40),
                  QuestionText('10. 아이가 하루에 간식을 얼마나 먹나요?'),
                  SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _snackFrequency == '1',
                          onChanged: (value) {
                            setState(() {
                              _snackFrequency = '1';
                            });
                          },
                        ),
                        OptionText('먹지 않는다.')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _snackFrequency == '2',
                          onChanged: (value) {
                            setState(() {
                              _snackFrequency = '2';
                            });
                          },
                        ),
                        OptionText('1~2회')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _snackFrequency == '3',
                          onChanged: (value) {
                            setState(() {
                              _snackFrequency = '3';
                            });
                          },
                        ),
                        OptionText('3~4회')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _snackFrequency == '4',
                          onChanged: (value) {
                            setState(() {
                              _snackFrequency = '4';
                            });
                          },
                        ),
                        OptionText('5회 이상')
                      ]),
                    ],
                  ),
                  Visibility (
                    visible: !_validateSnackFrequency,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height:40),
                  QuestionText('11. 간식은 주로 무엇을 먹나요? (중복 가능)'),
                  SizedBox(height:10),
                  Column(
                    children: <Widget>[
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _snacks[0] == '1',
                          onChanged: (value) {
                            setState(() {
                              _snacks[0] = _snacks[0] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('과일/야채')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _snacks[1] == '1',
                          onChanged: (value) {
                            setState(() {
                              _snacks[1] = _snacks[1] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('견과류')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _snacks[2] == '1',
                          onChanged: (value) {
                            setState(() {
                              _snacks[2] = _snacks[2] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('과자')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _snacks[3] == '1',
                          onChanged: (value) {
                            setState(() {
                              _snacks[3] = _snacks[3] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('젤리/사탕/초콜릿')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _snacks[4] == '1',
                          onChanged: (value) {
                            setState(() {
                              _snacks[4] = _snacks[4] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('빵/떡')
                      ])),
                      SizedBox(height:30, child: Row(children: [
                        Checkbox(
                          value: _snacks[5] == '1',
                          onChanged: (value) {
                            setState(() {
                              _snacks[5] = _snacks[5] == '1' ? '0' : '1';
                            });
                          },
                        ),
                        OptionText('분식')
                      ])),
                    ],
                  ),
                  Visibility (
                    visible: !_validateSnacks,
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
                              widget.appState.state = 'survey2';
                              /*Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => SurveyPage2(appState: widget.appState)));*/
                            }
                        ),
                        SizedBox(width: 15),
                        BlueButton(
                            width:122,
                            height:41,
                            text: '다음 단계로',

                            onPressed: () async {
                              bool flag1 = _formKey.currentState!.validate();
                              bool flag2 = validateEatingTime();
                              bool flag3 = validateEatingHabits();
                              bool flag4 = validateSnackFrequency();
                              bool flag5 = validateSnacks();
                              bool flag6 = validateHateFood();
                              bool flag7 = validateLikeFood();

                              if (flag1 && flag2 && flag3 && flag4 && flag5 && flag6 && flag7) {
                                Map<String, dynamic> info = {
                                  'phase': 'survey4',

                                  'eatingAmount': _eatingAmount.currentState!.value.toString(),
                                  'eatingHabit': _eatingHabit.currentState!.value.toString(),
                                  'eatingTime': _eatingTime,
                                  'eatingHabits': _eatingHabits,


                                  'eatoutFrequency': _eatoutFrequency.currentState!.value.toString(),
                                  'deliveryFrequency': _deliveryFrequency.currentState!.value.toString(),
                                  'instantFrequency': _instantFrequency.currentState!.value.toString(),
                                  'fastfoodFrequency': _fastfoodFrequency.currentState!.value.toString(),
                                  'waterCup': _waterCup.currentState!.value.toString(),
                                  'snackFrequency': _snackFrequency,
                                  'snacks': _snacks,
                                  'likeFood': _likeFood,
                                  'hateFood': _hateFood,

                                };

                                print(info);

                                widget.appState.writeDB(info);

                                widget.appState.state = 'survey4';
                                /*Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => SurveyPage4(appState: widget.appState))
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


