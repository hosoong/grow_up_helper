import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class HomeAlarmPage extends StatefulWidget {
  HomeAlarmPage({required this.appState});

  ApplicationState appState;

  @override
  _HomeAlarmPageState createState() => _HomeAlarmPageState();
}

class _HomeAlarmPageState extends State<HomeAlarmPage> {
  String visible = '전체';
  List<String> visibles = ['전체', '완료한 일', '완료하지 못한 일'];

  var deadline = [2230, 2055, 1700, 1530, 1430, 1245, 755, 750];
  var dates = [
    '10:30 PM',
    '8:55 PM',
    '5:00 PM',
    '3:30 PM',
    '2:30 PM',
    '12:45 PM',
    '7:55 AM',
    '7:50 AM',
  ];
  var alarmList = [
    '혜지가 잠에 들 시간이에요.\n조용한 수면 환경을 조성해주세요.',
    '자기 전 혜지와 함께 하루동안의 피곤함을\n풀어보아요. 폼롤러를 이용한 스트레칭 타임!',
    '저녁 메뉴를 고민하실 때에는\n관리 탭의 추천 메뉴도 확인해보세요.',
    '오늘 비타민이 부족해요.\n간식으로 비타민이 풍부한 사과는 어떨까요?',
    '학원가는 길에도 운동할 수 있다는 사실!\n2층 정도는 계단으로 올라가도록 해주세요.',
    '학교에서의 혜지의 활동량을 확인하세요.\n적당한 활동이 중요해요!',
    '오늘 등굣길은 차로 태워주는 것보다\n도보로 조금이라도 같이 걸어보는건 어때요?',
    '혜지가 일어날 시간이에요!\n혜지를 기분좋게 깨워주세요.',
  ];
  var alarmListChecked = [false, false, false, false, false, false, false, false];
  List<bool> alarmListVisible = [];

  var nutrientAlarmListChecked;
  var sleepAlarmListChecked;
  var exerciseAlarmListChecked;

  void initState() {
    var hm = int.parse(DateFormat('HHmm').format(DateTime.now()));

    var totalAlarmList = [
      '혜지가 잠에 들 시간이에요.\n조용한 수면 환경을 조성해주세요.',
      '자기 전 혜지와 함께 하루동안의 피곤함을\n풀어보아요. 폼롤러를 이용한 스트레칭 타임!',
      '저녁 메뉴를 고민하실 때에는\n관리 탭의 추천 메뉴도 확인해보세요.',
      '오늘 비타민이 부족해요.\n간식으로 비타민이 풍부한 사과는 어떨까요?',
      '학원가는 길에도 운동할 수 있다는 사실!\n2층 정도는 계단으로 올라가도록 해주세요.',
      '학교에서의 혜지의 활동량을 확인하세요.\n적당한 활동이 중요해요!',
      '오늘 등굣길은 차로 태워주는 것보다\n도보로 조금이라도 같이 걸어보는건 어때요?',
      '혜지가 일어날 시간이에요!\n혜지를 기분좋게 깨워주세요.',
    ];

    // activate alarms
    nutrientAlarmListChecked = [];
    sleepAlarmListChecked = [];
    exerciseAlarmListChecked = [];
    alarmListVisible = [];

    for (var i=0; i<totalAlarmList.length; i++) {
      if (hm > deadline[i]) {
        alarmListVisible.add(true);

        if (i == 2 || i == 3) {
          nutrientAlarmListChecked.add(false);
        }
        else if (i == 0 || i == 7) {
          sleepAlarmListChecked.add(false);
        }
        else {
          exerciseAlarmListChecked.add(false);
        }
      }
      else {
        alarmListVisible.add(false);
      }
    }

    if (widget.appState.alarmListChecked.isEmpty) {
      widget.appState.alarmListChecked = List.from(alarmListChecked);
    }
    widget.appState.nutrientAlarmListChecked = List.from(nutrientAlarmListChecked);
    widget.appState.sleepAlarmListChecked = List.from(sleepAlarmListChecked);
    widget.appState.exerciseAlarmListChecked = List.from(exerciseAlarmListChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : true,
        body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    color: Colors.white,
    child: ListView(
      children:<Widget> [
        Container(
          child: Column(
            children:<Widget> [
              SizedBox(height:20),
              Row(children:[
              TextButton(
                child: Icon(Icons.arrow_back_ios, color: Color(0xffa6a6c7)),
                onPressed: () {
                  widget.appState.state = 'home';
                },
              )]),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    Container(
                      width:140,
                        child:
                    DropdownButtonFormField(
                      isExpanded: true,
                      decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
                      value: visible,
                      items: visibles.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Container(width: 140, child: Padding(padding: EdgeInsets.only(left: 140*0.1), child:Text(value, style: GoogleFonts.notoSans(color: Color(0xff59597c), fontWeight: FontWeight.w500, fontSize: 13.0), textAlign: TextAlign.center))),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          visible = value as String;
                        });
                      },
                    )),
                    SizedBox(width:20),
              ]),

              Column(children:[
                SizedBox(height:10),
                Container(
                  margin: EdgeInsets.fromLTRB(0,0,0,0),
                    height: MediaQuery.of(context).size.height-200,
                    child: ListView.builder(
                      itemCount: alarmList.length,
                      itemBuilder: (context, i) {
                        return Stack(
                          children: [
                            Visibility(
                                visible: alarmListVisible[i] && (visible == '전체' || (widget.appState.alarmListChecked[i] ? visible == '완료한 일' : visible == '완료하지 못한 일')),
                                child:
                                Container(
                                  height:100,
                                  margin: EdgeInsets.fromLTRB(5,0,5,20),
                                  //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [BoxShadow(
                                          color: Color(0xffe3e3e3).withOpacity(0.6),
                                          offset: Offset(3,3),
                                          blurRadius: 2.0,
                                          spreadRadius: 2
                                      )]

                                  ),
                                  child:
                                  Container(
                                      child:
                                      CheckboxListTile(
                                        contentPadding: EdgeInsets.fromLTRB(15,10,5,0),
                                        title: Text(DateFormat('y/MM/dd').format(DateTime.now())+' '+dates[i]+'\n', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 11)),
                                        subtitle: Text(alarmList[i], style: GoogleFonts.notoSans(fontSize: 13)),
                                        value: widget.appState.alarmListChecked[i],
                                        onChanged: (value) {
                                          setState(() {
                                            if (widget.appState.alarmListChecked[i]) {
                                              if (i == 2 || i == 3) {
                                                widget.appState.nutrientAlarmCount[0] -= 1;
                                              }
                                              else if (i == 0 || i == 7) {
                                                widget.appState.sleepAlarmCount[0] -= 1;
                                              }
                                              else {
                                                widget.appState.exerciseAlarmCount[0] -= 1;
                                              }
                                            }
                                            else {
                                              if (i == 2 || i == 3) {
                                                widget.appState.nutrientAlarmCount[0] += 1;
                                              }
                                              else if (i == 0 || i == 7) {
                                                widget.appState.sleepAlarmCount[0] += 1;
                                              }
                                              else {
                                                widget.appState.exerciseAlarmCount[0] += 1;
                                              }
                                            }

                                            widget.appState.alarmListChecked[i] = !widget.appState.alarmListChecked[i];

                                            widget.appState.notify();
                                          });
                                          },
                                        secondary: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                            children:[SizedBox(height:10), Container(
                                            width:39, height:39,
                                          padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                          decoration: BoxDecoration(
                                              color: Color(0xffE9E9FF),
                                              borderRadius: BorderRadius.all(Radius.circular(10))),
                                          child:
                                          Center(child:
                                              Transform.rotate(
                                                angle: i == 2 || i == 3 || i == 0 || i == 7 ? 0 : 300 * 3.14 / 180,
                                                child:
                                          FaIcon(i == 2 || i == 3 ?
                                                    FontAwesomeIcons.appleAlt :
                                                i == 0 || i == 7 ?
                                                    FontAwesomeIcons.solidMoon :
                                                FontAwesomeIcons.shoePrints, size:19, color:Color(0xff5653ff)))))]),
                                        activeColor: Color(0xffe3e3e3),
                                        checkColor: Colors.blue,
                                        selected: widget.appState.alarmListChecked[i],
                                        tileColor: Colors.white,
                                      )),
                                )
                            ),
                          ]);
                        },
                    )),
              ]),



    ]),
        ),

      ],
    )));
  }
}
