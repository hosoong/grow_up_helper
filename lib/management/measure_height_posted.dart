import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';

import '../main.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageMeasurePage4 extends StatefulWidget {
  ManageMeasurePage4({required this.appState});

  ApplicationState appState;

  @override
  _ManageMeasurePage4State createState() => _ManageMeasurePage4State();
}

class _ManageMeasurePage4State extends State<ManageMeasurePage4> {
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
        padding: EdgeInsets.fromLTRB(20,0,20,0),
        color: Colors.white, child:ListView(
        children: <Widget>[
          SizedBox(height:40),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  child:
                  FaIcon(FontAwesomeIcons.chevronLeft, color: Colors.grey),
                  onPressed: () {
                    widget.appState.state = 'communityGossip';
                  },
                ),
              ],
            ),


          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NotoSansText(_name+' 또 키 컸어요~', Color(0xff333e63), 16, FontWeight.w800),
                SizedBox(
                  width: 150,
                ),
                SizedBox(width:25,height:18*25/20, child: Image.asset('assets/shadowheart.png',fit:BoxFit.fill)),
              ],
            ),

          SizedBox(height:20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Container(
                  width: 360,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children:[
                SizedBox(width:14),
          Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:<Widget> [
                Text('2주 동안 미션에 뜬 줄넘기도,,,하구,,,\n추천식단 저녁 먹으면서 고생한 보람이 있네요...\n맘님들도 성공하세요~페트병 하나 남았네요 ㅋㅋ',
               style:GoogleFonts.notoSans(color:Color(0xff59597c), fontSize:14, fontWeight:FontWeight.w500, height:1.5)),
              ],
            )]),

          SizedBox(height: 40),
          Container(
          padding:EdgeInsets.fromLTRB(0,0,0,0),
          width:464,
          child:
          Image.asset('assets/proud.png',fit:BoxFit.fill)),
          SizedBox(height:40),
        ],
      ),
    ));
  }
}
