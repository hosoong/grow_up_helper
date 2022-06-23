import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_up_helper/home/home_widgets.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';
import 'package:arkit_plugin/arkit_plugin.dart';

import '../main.dart';
import 'measure_height_api.dart';

class ManageMeasurePage extends StatefulWidget {
  ManageMeasurePage({required this.appState});

  ApplicationState appState;

  @override
  _ManageMeasurePageState createState() => _ManageMeasurePageState();
}

class _ManageMeasurePageState extends State<ManageMeasurePage> {

  int goalHeight = 165;
  double height = 143.0;
  double growthRate = 0.3;
  double untilGoal = 22;

  var _name = '';
  var _sex = '';

  bool tooltip = false;

  void initState() {
    super.initState();

    var curr = widget.appState.userInfo['activeChildIndex'];
    _name = widget.appState.userInfo['children'][curr]['name'];
    _sex = widget.appState.userInfo['children'][curr]['sex'];

    goalHeight = widget.appState.userInfo['children'][curr]['goalHeight'];
    height = double.parse(widget.appState.userInfo['children'][curr]['currentHeight']);

    untilGoal = goalHeight - height;
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      index: 1,
      appState: widget.appState,
      body: GestureDetector(
        onTap: () {
      setState(() {
        if (tooltip)
          tooltip = !tooltip;
      });
    },
    child:Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:ListView(
          children:<Widget>[
        Stack(children:[
        Column(crossAxisAlignment: CrossAxisAlignment.end,
          children:[
            SizedBox(height:20),
            TextButton(child:Icon(Icons.help_outline, color: Color(0xffa6a6c7)), onPressed: () {
              setState(() {
                tooltip = !tooltip;
              });
            }),

            manageTopBar(appState: widget.appState),

            SizedBox(height:0),

    Container(
    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[

            SizedBox(height:25),
            Stack(
                children:<Widget> [
                  Container(
                  padding: EdgeInsets.fromLTRB(0,5, 0, 0),
                    alignment: AlignmentDirectional.topStart,
                    width: 450,
                    height: 252/336*450,
                    child: Image.asset(_sex == 'M' ? 'assets/imageman3.png' : 'assets/imagewoman3.png'),
                  ),

                Positioned(left:70, child:
                          Text.rich(TextSpan(style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45, fontWeight: FontWeight.w500, color: Color(0xff444444)), children: [
            TextSpan(text: _name+'의 목표 키는 ',),
            TextSpan(text: goalHeight.toString()+'cm', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff5653ff))),
            TextSpan(text: ' 입니다.'),
          ]))),
                
                  Positioned(
                      left:180,
                      top:120,
                      child:
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Row(
                              children:<Widget> [
                                JustText2('키       ', 12.5),
                                SizedBox(width: 20,),
                                JustText22(height.toString()+'cm', 16.18),
                              ],),
                              SizedBox(height:5),
                            Row(
                              children:<Widget> [
                                JustText2('성장율', 12.5),
                                SizedBox(width: 20,),
                                JustText22('+'+growthRate.toString()+'cm', 16.18),
                              ],),
                              SizedBox(height:5),
                            Row(
                              children:<Widget> [
                                JustText2('백분율', 12.5),
                                SizedBox(width: 20,),
                                JustText22('상위 '+43.toString()+'%', 16.18),
                              ],),

                            SizedBox(height:40),
                            Text(
                                _name+'의 키 측정 결과\n',
                                style: TextStyle(color: Color(0xff5a6bff), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500)
                            ),
                            JustText3('지난 측정보다 '+growthRate.toString()+'cm 더 컸어요.', 13),
                            SizedBox(height:3),
                            JustText3('3단계 182명의 아이들 중 79등이에요.', 13),
                            SizedBox(height:3),
                            JustText3('목표 키까지 '+untilGoal.toString()+'cm 남았어요.', 13),
                          ])
                  )
                ]),

      SizedBox(height:30),

            Center(child:BlueButton(text: '오늘의 키 측정하기', width: 170, height:40.42, onPressed: () {
              widget.appState.state = 'measure';
            })),

            SizedBox(height:50),
            
            Container(padding: EdgeInsets.fromLTRB(20, 0, 0, 0), child:
            Column(children:[
            Row(
              children:<Widget> [
                //SizedBox(width:15 ,),
                Text('성장 현황 그래프', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45, color: Color(0xff444444), fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height:20),
            SizedBox(width:380, height:210/315*380, child: Image.asset('assets/growth_graph.png', fit: BoxFit.fill)),
            SizedBox(height:10)])),

          ]))],
        ),
          Visibility(
              visible: tooltip,
              child: Opacity(
                  opacity: 0.8,
                  child: Container(width:MediaQuery.of(context).size.width, height:1000, color: Colors.grey,
                      child: Image.asset('assets/tooltip4.png', fit: BoxFit.fill)))
          ),
  ])])
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}


