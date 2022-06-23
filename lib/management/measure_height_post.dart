import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';

import '../main.dart';

class ManageMeasurePage3 extends StatefulWidget {
  ManageMeasurePage3({required this.appState});

  ApplicationState appState;

  @override
  _ManageMeasurePage3State createState() => _ManageMeasurePage3State();
}

class _ManageMeasurePage3State extends State<ManageMeasurePage3> {
  double height = 0;
  double growth = 0;
  var _name = '';
  void initState() {
    var curr = widget.appState.userInfo['activeChildIndex'];
        _name = widget.appState.userInfo['children'][curr]['name'];

    height = double.parse(widget.appState.userInfo['children'][curr]['currentHeight']);

    growth = height - double.parse(widget.appState.userInfo['children'][curr]['previousHeight']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        body: Container(
          padding: EdgeInsets.fromLTRB(0,0,0,0),
        color: Colors.white, child:ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[

                  SizedBox(height:40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: FaIcon(FontAwesomeIcons.chevronLeft,
                            color: Colors.grey),
                        onPressed: () {
                          widget.appState.state = 'manageMeasure2';
                        },
                      ),
                      SizedBox(width:240),
                      Container(
                      width:65,
                      height:35,
                      child:
                      BlueButton2(
                        width:0,
                        height:0,
                        text: "등록",
                        onPressed: () {
                          widget.appState.state = 'manageMeasure4';
                        }
                      )),
                      SizedBox(width:10),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
              padding: EdgeInsets.fromLTRB(22.0, 10.0, 20.0, 10.0),
              child: TextField(
                decoration: new InputDecoration.collapsed(hintText: '제목을 입력하세요'),
              ),
            ),
            Divider(
              thickness: 1,
              color: Color(0xffeeeeee),
            ),

            SizedBox(height:20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children:[
            Container(
              width: 359,
              height:140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                    color: Color(0xff5653ff),
                    width: 0.6,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_name+'의 현재 키는', style: TextStyle(fontSize:14, fontFamily: 'gmarketSans', color:Color(0xff5653ff))),
                    SizedBox(height:10),
                    Row(children:[Text(height.toString() + ' cm',style: TextStyle(fontSize:14, fontFamily:'gmarketSans', color:Color(0xff5653ff), fontWeight:FontWeight.w800)),
                    Text(' 입니다.', style: TextStyle(fontSize:14, fontFamily: 'gmarketSans', color:Color(0xff5653ff))),
                                        SizedBox(height:10)]),
                                        SizedBox(height:10),
                   Row(children:[Text('2주 전보다 ', style: TextStyle(fontSize:14, fontFamily: 'gmarketsans', color:Color(0xff5653ff))), Text( growth.toStringAsFixed(2), style:TextStyle(fontSize:14,fontFamily: 'gmarketsans', fontWeight:FontWeight.w800, color:Color(0xff5653ff))), Text(' cm 자랐네요!', style: TextStyle(fontSize:14, fontFamily: 'gmarketSans', color:Color(0xff5653ff))),
                  ]),
                ]),
                Container(width:96, height:96, child: Image.asset('assets/egg.png', fit: BoxFit.fill))
              ]),
            )]),

            SizedBox(height:20),

            Container(
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
              padding: EdgeInsets.fromLTRB(22.0, 10.0, 20.0, 10.0),
              child: TextField(
                decoration:
                new InputDecoration.collapsed(hintText: '내용을 입력하세요.'),
              ),
            ),
          ],
        )));
  }
}
