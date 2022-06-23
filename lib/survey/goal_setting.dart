import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:io';

import '../main.dart';
import 'survey_widgets.dart';

class GoalSettingPage extends StatefulWidget {
  GoalSettingPage({required this.appState});

  ApplicationState appState;

  @override
  _GoalSettingPageState createState() => _GoalSettingPageState();
}

class _GoalSettingPageState extends State<GoalSettingPage> {
  double goalTime = 50;

  int goalHeight = 0;
  int maxHeight = 0;
  int minHeight = 0;

  @override
  void initState() {
    super.initState();

    maxHeight = widget.appState.userInfo['goalHeight'];
    minHeight = (maxHeight/1.05).round();
    goalHeight = (maxHeight/2+minHeight/2).round();
  }

  void onVolumeChanged(double value) {
    setState(() {
      goalTime = value;
    });
  }

  void add() {
    setState(() {
      if (goalHeight < maxHeight)
        goalHeight++;
    });
  }

  void minus() {
    setState(() {
      if (goalHeight > minHeight)
        goalHeight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset : true,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Colors.white,
        child:ListView(
          children:<Widget>[
            Column(
              children:<Widget> [
                SizedBox(height: 40),
                TitleText('목표 성장 키 및 목표시간 설정'),
                SizedBox(height: 40),

                Text(widget.appState.userInfo['name']+'의 목표 키를 설정해봐요.', style: TextStyle(fontFamily: 'gmarketSans',
                    fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height: 10,),
                NotoSansText('목표 키는 최종 키와 예상 키 사이에서 설정 가능해요.', Colors.black, 13, FontWeight.w400),
                                SizedBox(height: 3,),
                                NotoSansText('실현 가능한 목표치로 아이의 스트레스를 줄여주세요.', Colors.black, 13, FontWeight.w400),
                SizedBox(height: 30,),
                Text('추천 목표 키', style: TextStyle(fontFamily: 'gmarketSans',
                    fontSize: 16)),
                SizedBox(height:30),


                Container(
                  width:375,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[

                        Container(
                          alignment: AlignmentDirectional.center,
                          width:200,
                          height:200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child:
                          Text('$goalHeight'+'cm', style: TextStyle(fontFamily: 'gmarketSans',
                              fontSize: 36, fontWeight:FontWeight.bold)),
                        ),

                        Positioned(
                          left:70,
                          top:85,
                          child:
                              Container(
                                width:30,
                                  height:30,
                                  child:
                        new FloatingActionButton(
                          heroTag: 1,
                          onPressed: minus,
                          child: new Icon(Icons.remove, color: Colors.grey,),
                          backgroundColor: Color(0xfff4f3f8)))),

                  Positioned(
                    right:70,
                    top:85,
                    child:
                    Container(
                        width:30,
                        height:30,
                        child:
                        new FloatingActionButton(
                          heroTag: 2,
                          onPressed: add,
                          child: new Icon(Icons.add, color: Colors.grey,),
                          backgroundColor: Color(0xfff4f3f8),))),

                      ],
                    ),
                ),

                SizedBox(height: 70,),
                Text('하루에 '+widget.appState.userInfo['name']+'를 위해서 얼마나 시간을 쏟고 싶나요?', style: TextStyle(fontFamily: 'gmarketSans',
                    fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height: 15,),
                NotoSansText('엄마의 노력은 아이의 성장에 있어 가장 중요한 부분이에요.', Colors.black, 13, FontWeight.w400),
                                SizedBox(height: 3,),
                NotoSansText('엄마가 최선을 다할 수 있게 키모아가 도와드릴게요.', Colors.black, 13, FontWeight.w400),
                SizedBox(height: 30,),
                Text('일일 목표 성장 관리 시간 설정', style: TextStyle(fontFamily: 'gmarketSans',
                    fontSize: 16)),

                SizedBox(height:10),
                Container(
                    padding: const EdgeInsets.all(0),
                    height:250,
                    child:

                SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(canScaleToFit:false,
                          minimum: 0,
                          maximum: 230,
                          startAngle: 270,
                          endAngle: 270,
                          showLabels: false,
                          showTicks: false,
                          radiusFactor: 0.9,
                          axisLineStyle: AxisLineStyle(
                              cornerStyle: CornerStyle.bothFlat,
                              color: Colors.grey[200],
                              thickness: 8),
                          pointers: <GaugePointer>[

                            MarkerPointer(
                                value: goalTime,
                                enableDragging: true,
                                onValueChanged: onVolumeChanged,
                                markerHeight: 13,
                                markerWidth: 13,
                                markerType: MarkerType.circle,
                                color: Colors.blue,
                            )
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                angle: 90,
                                axisValue: 5,
                                positionFactor: 0.1,
                                widget:
                    Text(goalTime.ceil().toString() + '분', style: TextStyle(fontFamily: 'gmarketSans',
                    fontSize: 36, fontWeight:FontWeight.bold)),
                            )
                          ]
                      )
                    ]
                )),

                SizedBox(height:40),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                children:[
                WhiteButton(width:128, height:38, text:'이전 단계로', onPressed: () {
                widget.appState.state = 'surveyResult2';
}),
                SizedBox(width:15),
                BlueButton(
                  width:128,
                  height:42,
                  onPressed: () {
                    // Respond to button press
                    showDialog (
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                  insetPadding: EdgeInsets.fromLTRB(0, 470, 0, 0),
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
                                        Row(children:[
                                          QuestionText('잠깐! 다시 한 번 확인해주세요.')]),
                                        SizedBox(height:30),
                                        Row(children:[
                                          NotoSansText('아이의 목표 키는 ', Colors.black, 16, FontWeight.w400),
                                          Text(goalHeight.toString()+'cm', style: TextStyle(fontFamily: 'GmarketSans', fontSize:16,
                                          fontWeight:FontWeight.bold))
                                        ]),
                                        SizedBox(height:10),
                                        Row(children:[
                                          NotoSansText('엄마의 일일 성장 관리 목표시간은 ', Colors.black, 16, FontWeight.w400),
                                          Text(goalTime.ceil().toString()+'분', style: TextStyle(fontFamily: 'GmarketSans', fontSize:16,
                                              fontWeight:FontWeight.bold))
                                        ]),
                                        SizedBox(height:20),
                                        Row(children:[
                                        NotoSansText('이렇게 목표치를 설정할까요?', Colors.black, 16, FontWeight.w400),]),
                                        Row(children:[
                                        NotoSansText('(목표 키는 다음 문진 전까지 수정할 수 없어요.)', Colors.black, 12, FontWeight.w400)]),

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
                                            onPressed: () async {
                                              // Respond to button press
                                              Map<String, dynamic> info = {
                                                'phase': 'deviceRegister',

                                                'goalHeight': goalHeight,
                                                'goalTime': goalTime.ceil(),
                                              };

                                              print(info);

                                              widget.appState.writeDB(info);

                                              widget.appState.state = 'deviceRegister';

                                              Navigator.of(context).pop();
                                            },
                                            text: '확인',
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
                  text: "관리 시작하기",
                )]),
                SizedBox(height: 20,),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


