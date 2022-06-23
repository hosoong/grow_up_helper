import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_up_helper/home/home_widgets.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';

import '../main.dart';

class ManageMeasurePage2 extends StatefulWidget {
  ManageMeasurePage2({required this.appState});

  ApplicationState appState;

  @override
  _ManageMeasurePage2State createState() => _ManageMeasurePage2State();
}

class _ManageMeasurePage2State extends State<ManageMeasurePage2> {

  double height = 74;
  int goalHeight = 165;
  double untilGoal = 87;
  double growth = 0;

  var _name = '';

  void initState() {
    super.initState();

    var curr = widget.appState.userInfo['activeChildIndex'];
    _name = widget.appState.userInfo['children'][curr]['name'];

    goalHeight = widget.appState.userInfo['children'][curr]['goalHeight'];
    height = double.parse(widget.appState.userInfo['children'][curr]['currentHeight']);

    growth = height - double.parse(widget.appState.userInfo['children'][curr]['previousHeight']);

    untilGoal = goalHeight - height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : true,
      body: Container(
        padding: EdgeInsets.fromLTRB(30,0,30,0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:ListView(
          children:<Widget>[
            SizedBox(height:40),
            Row(mainAxisAlignment: MainAxisAlignment.center, children:[JustText2('측정 결과', 17)]),

            SizedBox(height:60),
            Text(
                '    '+_name+'의 현재 키는',
                style: TextStyle(color: Color(0xff5a6bff), fontFamily: 'gmarketSans', fontSize: 17, fontWeight: FontWeight.w500)
            ),
            SizedBox(height:10),
            Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
              Text(
                  '    '+ height.toString()+'cm',
                  style: TextStyle(color: Color(0xff5a6bff), fontFamily: 'gmarketSans', fontSize: 20, fontWeight: FontWeight.bold)
              ),
              Text(
                  ' 입니다.',
                  style: TextStyle(color: Color(0xff5a6bff), fontFamily: 'gmarketSans', fontSize: 17, fontWeight: FontWeight.w500)
              ),
            ]),

            SizedBox(height:20),
            JustText2(growth > 0 ? '      2주 전보다 '+growth.toStringAsFixed(2)+' cm 더 자랐네요!' : '      2주 전과 큰 차이를 보이지 않았어요', 15),
            SizedBox(height:40),
            SizedBox(width:315, height:210,
                child: Image.asset(growth > 0 ? 'assets/good_growth.png' : 'assets/bad_growth.png', fit: BoxFit.none)),

            SizedBox(height:40),

            growth > 0 ?
            Column(children:[
            Row(mainAxisAlignment: MainAxisAlignment.center, children:[
              JustText2('목표 키까지 ', 17),
              Text(
                  untilGoal.toStringAsFixed(2).toString()+'cm ',
                  style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 20, fontWeight: FontWeight.bold)
              ),
              JustText2('남았습니다!', 17)
            ]),
            SizedBox(height:15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children:[
              JustText2('시작이 반이잖아요~ 아자아자!', 17)
            ]),
            SizedBox(height:100),
            Row(mainAxisAlignment: MainAxisAlignment.center,
                children:[
                WhiteButton(text: '확인', width: 140, height:42, onPressed: () {
                  widget.appState.state = 'manageMeasure';
                }),
              SizedBox(width:15),
              BlueButton(text: '자랑하기', width: 140, height:42, onPressed: () {
                widget.appState.state = 'manageMeasure3';
              }),
            ])]) : Column(children:[
              Row(mainAxisAlignment: MainAxisAlignment.center, children:[
                JustText2('관리의 부재일 수 있어요.', 17)
              ]),
              SizedBox(height:15),
              Row(mainAxisAlignment: MainAxisAlignment.center, children:[
                JustText2('괜찮아요. 관리법을 다시 설정해 볼까요?', 17)
              ]),
              SizedBox(height:80),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    BlueButton(text: '확인', width:190, height:42, onPressed: () {
                      widget.appState.state = 'manageMeasure';
                    })
                  ])]),

            SizedBox(height:20),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


