import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:grow_up_helper/home/home_widgets.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class ManageNutrientPage extends StatefulWidget {
  ManageNutrientPage({required this.appState});

  ApplicationState appState;

  @override
  _ManageNutrientPageState createState() => _ManageNutrientPageState();
}

class _ManageNutrientPageState extends State<ManageNutrientPage> {
  bool _ischecked1 = false;
  bool _ischecked2 = true;
  bool _ischecked3 = false;
  bool _ischecked4 = false;

  bool added_menu = false;

  var _name = '';

  bool tooltip = false;

  void initState() {
    super.initState();

    var curr = widget.appState.userInfo['activeChildIndex'];
    _name = widget.appState.userInfo['children'][curr]['name'];
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
    color: Colors.white,
        child:ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
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
          SizedBox(height:25),

          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
          Text(' 오늘 할 일', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45, fontWeight: FontWeight.w500, color: Color(0xff444444))),

              SizedBox(height:5),
          TodoList(todoCount: widget.appState.nutrientTodoCount, appState: widget.appState, icon: Container(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              decoration: BoxDecoration(
                  color: Color(0xffE9E9FF),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: FaIcon(FontAwesomeIcons.appleAlt, size:11, color: Color(0xff5653FF))), todoList: widget.appState.nutrientTodoList, todoListChecked: widget.appState.nutrientTodoListChecked),

          SizedBox(height:10),

          Text('오늘 '+_name+'의 식단', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45, fontWeight: FontWeight.w500, color: Color(0xff444444))),

    Container(
        height:30,
        child:
          Row(
            children:<Widget> [
              TextButton(
                onPressed: () {
                  widget.appState.state = 'savedMenu';
                },
                child: Text('★ 저장된 식단 보기 >', style: TextStyle(color: Color(0xff5a6bff), fontFamily: 'gmarketSans', fontSize: 12)),
              )
            ],
          )),

        SizedBox(height:10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Container(
                  margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                   width: 46,
                   height: 400,
                   child:Image.asset('assets/image_100.png'),
                 ),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                  SizedBox(height:8),
                  Text('아침식사', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13.49)),

                  Container(
                    width:310,
                    height:79,
                    margin: EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [BoxShadow(
                            color: Color(0xffe3e3e3).withOpacity(0.6),
                            offset: Offset(3,3),
                            blurRadius: 2.0,
                            spreadRadius: 2
                        )]

                    ),
                    child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(width:200,child:
                                Text('쌀밥 계란국 쏘세지야채볶음\n코다리찜 데친브로콜리', style: GoogleFonts.notoSans(fontSize: 14.33))
                              ),
                              Container(width:30,child:
                                TextButton(
                                    onPressed: () {
                                      setState((){
                                        _ischecked1 = !_ischecked1;
                                      });
                                    },
                                  child: _ischecked1 ? Icon(Icons.star, size: 18,color:Color(0xff5653ff)) : Icon(Icons.star_border, size:18, color: Colors.grey)
                                )
                              ),
                        ]),
                  ),

                      SizedBox(height:23),
                      Text('점심식사', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13.49)),

                      Container(
                        width:310,
                        height:79,
                        margin: EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            boxShadow: [BoxShadow(
                                color: Color(0xffe3e3e3).withOpacity(0.6),
                                offset: Offset(3,3),
                                blurRadius: 2.0,
                                spreadRadius: 2
                            )]

                        ),
                        child:
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(width:200,child:
                              Text('쌀밥 된장찌개 제육볶음 김치전\n콩나물무침 알타리무김치', style: GoogleFonts.notoSans(fontSize: 14.33, color: Color(0xff444444)))
                              ),
                              Container(width:30,child:
                              TextButton(
                                  onPressed: () {
                                    setState((){
                                      _ischecked2 = !_ischecked2;
                                    });
                                  },
                                  child: _ischecked2 ? Icon(Icons.star, size: 18,color:Color(0xff5653ff)) : Icon(Icons.star_border, size:18, color: Colors.grey)
                              )
                              ),
                            ]),
                      ),

                      SizedBox(height:25),
                      Text('저녁식사', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13.49)),

                      Container(
                        width:310,
                        height:79,
                        margin: EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            boxShadow: [BoxShadow(
                                color: Color(0xffe3e3e3).withOpacity(0.6),
                                offset: Offset(3,3),
                                blurRadius: 2.0,
                                spreadRadius: 2
                            )]

                        ),
                        child:
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(width:200,child:
                                  added_menu ? Text('북엇국', style: GoogleFonts.notoSans(fontSize: 14.33, color: Color(0xff444444)))
                        :
                                TextButton(
                                  child: Icon(Icons.add_circle_outline, size: 30, color:Colors.grey),
                                  onPressed:(){
                                    showDialog (
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                                  insetPadding: EdgeInsets.fromLTRB(0, 420, 0, 0),
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
                                                        Image.asset('assets/add_menu.png', width:350, height:200,)
                                                      ]),
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
                                                              // Respond to button press
                                                              setState((){
                                                                added_menu = true;
                                                              });
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
                                  }
                                )
                              ),
                              Container(width:30,child:
                              TextButton(
                                  onPressed: () {
                                    setState((){
                                      _ischecked3 = !_ischecked3;
                                    });
                                  },
                                  child: _ischecked3 ? Icon(Icons.star, size: 18,color:Color(0xff5653ff)) : Icon(Icons.star_border, size:18, color: Colors.grey)
                              )
                              ),
                            ]),
                      ),

                      SizedBox(height:15),
                      Text('간식', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13.49)),

                      Container(
                        width:310,
                        height:79,
                        margin: EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            boxShadow: [BoxShadow(
                                color: Color(0xffe3e3e3).withOpacity(0.6),
                                offset: Offset(3,3),
                                blurRadius: 2.0,
                                spreadRadius: 2
                            )]

                        ),
                        child:
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(width:200,child:
                              Text('인절미떡 우유', style: GoogleFonts.notoSans(fontSize: 14.33, color: Color(0xff444444)))
                              ),
                              Container(width:30,child:
                              TextButton(
                                  onPressed: () {
                                    setState((){
                                      _ischecked4 = !_ischecked4;
                                    });
                                  },
                                  child: _ischecked4 ? Icon(Icons.star, size: 18,color:Color(0xff5653ff)) : Icon(Icons.star_border, size:18, color: Colors.grey)
                              )
                              ),
                            ]),
                      ),
                ])
              ]),

          SizedBox(height:50),
          Text(''+_name+'는 지금 단백질이 부족해요', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45)),
          SizedBox(height:5),
          Text.rich(TextSpan(style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45), children: [
            TextSpan(text: '오늘 저녁은 ',),
            TextSpan(text: '버섯 샌드위치', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff5653ff))),
            TextSpan(text: ' 어때요?'),
          ])),

          SizedBox(height:20),
          SizedBox(width:385, height:230, child: Image.asset('assets/mushsand.png', fit: BoxFit.fill)),
          SizedBox(height:5),
          Text('      10분만에 뚝딱!', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height:3),
          Text('      가장 쉽게 만드는 버섯 샌드위치 레시피', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 14)),
          SizedBox(height:20),

        ]))]),

          Visibility(
              visible: tooltip,
              child: Opacity(
                  opacity: 0.8,
                  child: Container(width:MediaQuery.of(context).size.width, height:1500, color: Colors.grey,
                    child: Image.asset('assets/tooltip2.png', fit: BoxFit.fill)))
          ),

          ])
        ]),
      ),
      ),
    );
  }
}
