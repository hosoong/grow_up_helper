import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_choices/search_choices.dart';

import '../main.dart';

import 'survey_widgets.dart';

class SurveyPage7IntroText extends StatelessWidget {
  const SurveyPage7IntroText(this.text);
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

class SurveyPage7Intro extends StatelessWidget {
  SurveyPage7Intro({required this.appState});

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
                      Text('추가 정보 입력', style: TextStyle(color: Color(0xff5653ff), fontFamily: 'gmarketSans', fontSize: 23, fontWeight: FontWeight.w500)),
                      SizedBox(height: 30),
                      SurveyPage7IntroText('체계적인 1:1 관리를 위해'),
                      SizedBox(height: 5),
                      SurveyPage7IntroText('추가적인 정보를 입력해주세요.'),
                      SizedBox(height: 5),
                      SurveyPage7IntroText('아이의 성향, 일과, 부모의 성향에 맞추어'),
                      SizedBox(height: 5),
                      SurveyPage7IntroText('어울리는 관리법을 추천해드려요.'),
                      SizedBox(height: 50),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BlueButton(
                                width:194,
                                height:41,
                                text: '시작하기',

                                onPressed: () {
                                  appState.state = 'survey7';
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

class SurveyPage7 extends StatefulWidget {
  SurveyPage7({required this.appState});

  ApplicationState appState;

  _SurveyPage7State createState() => _SurveyPage7State();
}

class _SurveyPage7State extends State<SurveyPage7> {
  final List<String> _cookGuyList = ['외할머니', '외할아버지', '친할머니', '친할아버지', '엄마', '아빠', '기타'];
  var _schoolList = ['포항 양덕초등학교', '포항 장흥초등학교', '포항 양학초등학교', '포항 동부초등학교'];

  final _formKey = GlobalKey<FormState>(debugLabel: '_SurveyPage7State');

  final GlobalKey<DropDownState> _cookGuy = GlobalKey<DropDownState>();

  String _school = '';
  bool _noSchool = false;

  bool _noDrug = false;
  bool _noAllergy = false;

  bool _validateDrug = true;
  bool _validateAllergy = true;

  List<String> _resetList = [for(var i=1; i<=9; i+=1) '0'];

  List<String> _drug = [for(var i=1; i<=9; i+=1) '0'];
  List<String> _temp_drug = [for(var i=1; i<=9; i+=1) '0'];
  List<String> _drugList = [
    '칼슘', '오메가3', '비타민', '유산균', '루테인', '지용성 비타민', '마그네슘', '종합비타민', '미네랄'];

  List<String> _allergy = [for(var i=1; i<=9; i+=1) '0'];
  List<String> _temp_allergy = [for(var i=1; i<=9; i+=1) '0'];
  List<String> _allergyList = [
    '우유', '계란', '견과류', '갑각류', '생선 및 해산물', '과일', '대두', '참깨', '메밀'];

  bool noneSelected(List l) {
    if (l.indexOf('1') == -1)
      return true;
    return false;
  }

  String showDrug(List l, List l2) {
    if (noneSelected(l)){
      return '영양제 정보를 입력하세요.';
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

  String showAllergy(List l, List l2) {
    if (noneSelected(l)){
      return '알러지 정보를 입력하세요.';
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

  bool validateDrug() {
    if (_drug.indexOf('1') == -1 && (!_noDrug)) {
      setState(() {_validateDrug = false;});
    }
    else {
      setState(() {_validateDrug = true;});
    }
    return _validateDrug;
  }

  bool validateAllergy() {
    if (_allergy.indexOf('1') == -1 && (!_noAllergy)) {
      setState(() {_validateAllergy = false;});
    }
    else {
      setState(() {_validateAllergy = true;});
    }
    return _validateAllergy;
  }

  String _obedience = '0';
  bool _validateObedience = true;

  String _tendency = '0';
  bool _validateTendency = true;

  String _stress = '0';
  bool _validateStress = true;

  bool validateObedience() {
    if (_obedience == '0') {
      setState(() {_validateObedience = false;});
    }
    else {
      setState(() {_validateObedience = true;});
    }
    return _validateObedience;
  }

  bool validateTendency() {
    if (_tendency == '0') {
      setState(() {_validateTendency = false;});
    }
    else {
      setState(() {_validateTendency = true;});
    }
    return _validateTendency;
  }

  bool validateStress() {
    if (_stress == '0') {
      setState(() {_validateStress = false;});
    }
    else {
      setState(() {_validateStress = true;});
    }
    return _validateStress;
  }

  bool validateSchool() {
    if (_noSchool) {
      return true;
    }
    else if (_school.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();

    _noDrug = widget.appState.userInfo.containsKey('drug') && noneSelected(widget.appState.userInfo['drug']) ? true : false;
    _noAllergy = widget.appState.userInfo.containsKey('allergy') && noneSelected(widget.appState.userInfo['allergy']) ? true : false;
    _drug = widget.appState.userInfo.containsKey('drug') ? List<String>.from(widget.appState.userInfo['drug']) : _drug;
    _allergy = widget.appState.userInfo.containsKey('allergy') ? List<String>.from(widget.appState.userInfo['allergy']) : _allergy;

    _obedience = widget.appState.userInfo.containsKey('obedience') ? widget.appState.userInfo['obedience'] : '0';
    _tendency = widget.appState.userInfo.containsKey('tendency') ? widget.appState.userInfo['tendency'] : '0';
    _stress = widget.appState.userInfo.containsKey('stress') ? widget.appState.userInfo['stress'] : '0';
    _school = widget.appState.userInfo.containsKey('school') ? widget.appState.userInfo['school'] : '';

    _noSchool = widget.appState.userInfo.containsKey('school') && widget.appState.userInfo['school'].isEmpty ? true : false;

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
                  TitleText('자녀 추가 정보'),

                  SizedBox(height: 10.0),
                  ProgressBar(36),

                  SizedBox(height: 30.0),
                  QuestionText('1. 아이는 부모님의 말을 잘 듣는 편인가요?'),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _obedience == '1',
                          onChanged: (value) {
                            setState(() {
                              _obedience = '1';
                            });
                          },
                        ),
                        OptionText('순종하는 편\n')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _obedience == '2',
                          onChanged: (value) {
                            setState(() {
                              _obedience = '2';
                            });
                          },
                        ),
                        OptionText('\n')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _obedience == '3',
                          onChanged: (value) {
                            setState(() {
                              _obedience = '3';
                            });
                          },
                        ),
                        OptionText('\n')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _obedience == '4',
                          onChanged: (value) {
                            setState(() {
                              _obedience = '4';
                            });
                          },
                        ),
                        OptionText('\n')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _obedience == '5',
                          onChanged: (value) {
                            setState(() {
                              _obedience = '5';
                            });
                          },
                        ),
                        OptionText('순종하지\n 않는 편')
                      ]),
                    ],
                  ),
                  Visibility (
                    visible: !_validateObedience,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('2. 아이의 성향은 어떠한가요?'),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _tendency == '1',
                          onChanged: (value) {
                            setState(() {
                              _tendency = '1';
                            });
                          },
                        ),
                        OptionText('내향적')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _tendency == '2',
                          onChanged: (value) {
                            setState(() {
                              _tendency = '2';
                            });
                          },
                        ),
                        OptionText('')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _tendency == '3',
                          onChanged: (value) {
                            setState(() {
                              _tendency = '3';
                            });
                          },
                        ),
                        OptionText('')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _tendency == '4',
                          onChanged: (value) {
                            setState(() {
                              _tendency = '4';
                            });
                          },
                        ),
                        OptionText('')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _tendency == '5',
                          onChanged: (value) {
                            setState(() {
                              _tendency = '5';
                            });
                          },
                        ),
                        OptionText('외향적')
                      ]),
                    ],
                  ),
                  Visibility (
                    visible: !_validateTendency,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('3. 아이가 스트레스에 민감한 편인가요?'),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _stress == '1',
                          onChanged: (value) {
                            setState(() {
                              _stress = '1';
                            });
                          },
                        ),
                        OptionText('민감한 편')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _stress == '2',
                          onChanged: (value) {
                            setState(() {
                              _stress = '2';
                            });
                          },
                        ),
                        OptionText('')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _stress == '3',
                          onChanged: (value) {
                            setState(() {
                              _stress = '3';
                            });
                          },
                        ),
                        OptionText('')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _stress == '4',
                          onChanged: (value) {
                            setState(() {
                              _stress = '4';
                            });
                          },
                        ),
                        OptionText('')
                      ]),
                      Column(children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: _stress == '5',
                          onChanged: (value) {
                            setState(() {
                              _stress = '5';
                            });
                          },
                        ),
                        OptionText('둔감한 편')
                      ]),
                    ],
                  ),
                  Visibility (
                    visible: !_validateStress,
                    child: Text('값을 선택하세요!', style: TextStyle(color: Colors.red, fontSize: 12)),
                  ),

                  SizedBox(height: 30.0),
                  QuestionText('4. 아이의 식사를 챙겨주는 사람이 누구인가요?'),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      DropDown(key: _cookGuy,
                          value: widget.appState.userInfo.containsKey('cookGuy') ? widget.appState.userInfo['cookGuy'] : null,
                          enabled: true,
                          validator: defaultValidator, hint: '외할머니', items: _cookGuyList, width: 130),
                      JustText('께서 주로 챙겨주세요.'),
                    ],
                  ),

                  SizedBox(height: 30.0),
                  Row(children: [
                    QuestionText('5. 아이가 복용하는 영양제가 있나요?'),
                    SizedBox(width:10),
                    SizedBox(width:30, child:
                    Checkbox(
                      value: _noDrug,
                      onChanged: (value) {
                        setState(() {
                          _noDrug = !_noDrug;
                          _drug = List.from(_resetList);
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
                              Text(showDrug(_drug, _drugList),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.notoSans(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: noneSelected(_drug) ? Color(0xffc1c1c1) : Color(0xff575757),
                                  )
                              )
                          ),

                          MaterialButton(
                            shape: CircleBorder(),
                            minWidth: 18,
                            height:18,
                            child: Icon(Icons.add_circle_outline, color:Colors.grey),
                            onPressed: () {
                              _temp_drug = List.from(_drug);
                              showDialog (
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                            insetPadding: EdgeInsets.fromLTRB(0, 450, 0, 0),
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
                                                  Row(children:[SizedBox(width:10),
                                                    QuestionText('영양제 정보 입력')]),
                                                  SizedBox(height:30),

                                                  Flexible(
                                                      child:
                                                      GridView.builder(
                                                        itemCount: _drug.length,
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                                                            childAspectRatio:3),
                                                        itemBuilder: (context, i) {
                                                          return Stack(
                                                            children: [
                                                              Row(children:[
                                                                Checkbox(
                                                                  value: _temp_drug[i] == '1',
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      _temp_drug[i] = _temp_drug[i] == '1' ? '0' : '1';
                                                                    });
                                                                  },
                                                                ),
                                                                NotoSansText(_drugList[i], Color(0xff59597c), 12, FontWeight.w400),
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
                                                    _drug = List.from(_temp_drug) ;
                                                    if (!noneSelected(_drug)) {
                                                      _noDrug = false;
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

                  SizedBox(height: 30.0),
                  Row(children: [
                    QuestionText('6. 아이가 알러지가 있나요?'),
                    SizedBox(width:10),
                    SizedBox(width:30, child:
                    Checkbox(
                      value: _noAllergy,
                      onChanged: (value) {
                        setState(() {
                          _noAllergy = !_noAllergy;
                          _allergy = List.from(_resetList);
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
                              Text(showAllergy(_allergy, _allergyList),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.notoSans(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: noneSelected(_allergy) ? Color(0xffc1c1c1) : Color(0xff575757),
                                  )
                              )
                          ),

                          MaterialButton(
                            shape: CircleBorder(),
                            minWidth: 18,
                            height:18,
                            child: Icon(Icons.add_circle_outline, color:Colors.grey),
                            onPressed: () {
                              _temp_allergy = List.from(_allergy);
                              showDialog (
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                            insetPadding: EdgeInsets.fromLTRB(0, 450, 0, 0),
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
                                                  Row(children:[SizedBox(width:10),
                                                    QuestionText('알러지 정보 입력')]),
                                                  SizedBox(height:30),
                                                  
                                                  Flexible(
                                                      child:
                                                      GridView.builder(
                                                        itemCount: _allergy.length,
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                                                            childAspectRatio:3),
                                                        itemBuilder: (context, i) {
                                                          return Stack(
                                                            children: [
                                                              Row(children:[
                                                                Checkbox(
                                                                  value: _temp_allergy[i] == '1',
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      _temp_allergy[i] = _temp_allergy[i] == '1' ? '0' : '1';
                                                                    });
                                                                  },
                                                                ),
                                                                NotoSansText(_allergyList[i], Color(0xff59597c), 12, FontWeight.w400),
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
                                                    _allergy = List.from(_temp_allergy) ;
                                                    if (!noneSelected(_allergy)) {
                                                      _noAllergy = false;
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

                  SizedBox(height: 30.0),
                  QuestionText('7. 아이의 학교 정보를 등록해주세요.'),
                  SizedBox(height: 15.0),
                  Row(children:[SizedBox(width:350,child:
                  SearchChoices.single(
                    style: GoogleFonts.notoSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff575757),
                    ),
                    icon: Icon(Icons.search, size:20),
                    items: _schoolList.map((value){
                      return DropdownMenuItem(value: value,
                          child: Text(value));}).toList(),
                    value: _school,
                    hint:
                    Text('초등학교 이름을 검색하세요.\n',
                        style: GoogleFonts.notoSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffc1c1c1),
                        )),
                    searchHint:
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.center,
                        children: <Widget>[
                    Row(mainAxisAlignment:MainAxisAlignment.center,children:[
                      SizedBox(width:68, height:3,
                          child:  Divider(color: Color(0xffc4c4c4), thickness:3)),]
                    ),
                    SizedBox(height:30),
                    Row(mainAxisAlignment:MainAxisAlignment.center,children:[QuestionText('초등학교 이름을 입력하세요.')])]),
                    onChanged: (value) {
                      setState(() {
                        _school = value;
                        _noSchool = false;
                      });
                    },
                    clearIcon: Icon(Icons.clear_all, size:0),
                    isExpanded: true,
                  ))]),
                  Row(children: [
                    SizedBox(width:30, child:
                    Checkbox(
                      value: _noSchool,
                      onChanged: (value) {
                        setState(() {
                          if (!_noSchool){
                            _school = '';
                          }
                          else {

                          }
                          _noSchool = !_noSchool;
                        });
                      },
                    )
                    ),
                    NoText("우리아이는 학교를 다니지 않아요")
                  ]),

                  SizedBox(height:40.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WhiteButton(
                            width:126,
                            height:38,
                            text: '이전 단계로',

                            onPressed: () {
                              widget.appState.state = 'survey7intro';
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
                              bool flag2 = validateObedience();
                              bool flag3 = validateTendency();
                              bool flag4 = validateStress();
                              bool flag5 = validateSchool();
                              bool flag6 = validateDrug();
                              bool flag7 = validateAllergy();

                              if (flag1 && flag2 && flag3 && flag4 && flag5 && flag6 && flag7) {
                                Map<String, dynamic> info = {
                                  'phase': 'survey8',

                                  'obedience': _obedience,
                                  'tendency': _tendency,
                                  'stress': _stress,
                                  'cookGuy': _cookGuy.currentState!.value.toString(),
                                  'school': _school,
                                  'drug': _drug,
                                  'allergy': _allergy,

                                };

                                print(info);

                                widget.appState.writeDB(info);

                                widget.appState.state = 'survey8';

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
