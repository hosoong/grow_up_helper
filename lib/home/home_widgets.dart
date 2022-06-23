//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({required this.appState, required this.body, required this.index});
  final ApplicationState appState;
  final Widget body;
  final int index;

  @override
  Widget build(BuildContext context) => Scaffold(
          resizeToAvoidBottomInset : true,
          extendBody: false,

          bottomNavigationBar: BottomNavigationBar(
              //color: Colors.transparent,
              //elevation:0,
              //child:
              //Container(
              //    decoration: BoxDecoration(
              //        border: Border.all(
              //          color:Colors.white,
              //        ),
              //        color:Colors.white,
              //        borderRadius: BorderRadius.all(Radius.circular(20))
              //    ),
              //    width:375,
              //    height:82,
              //    child:
              //    Row(
              //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //        children: [
            
              showSelectedLabels:false,
              showUnselectedLabels:false,
              type: BottomNavigationBarType.fixed,
              items:[
              
              BottomNavigationBarItem(title:Text(''), icon:
                        MaterialButton(
                            minWidth: 18,
                            height:18,
                            child:
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Icon(Icons.straighten_rounded, color:index == 1 ? Colors.blue : Colors.grey),
                                  SizedBox(height:0),
                                  Text('관리', style: TextStyle(color:Colors.grey, fontSize: 10))
                                ]
                            ),
                            onPressed: () {
                              appState.state = 'manageNutrient';
                            })),
                            
                            BottomNavigationBarItem(title: Text(''), icon:
                        MaterialButton(
                            minWidth: 18,
                            height:18,
                            child:
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Icon(Icons.history, color:index == 2 ? Colors.blue : Colors.grey),
                                  Text('히스토리', style: TextStyle(color:Colors.grey, fontSize: 10))
                                ]
                            ),
                            onPressed: () {
                              appState.state = 'historyNutrient';
                            })),
                            
                            BottomNavigationBarItem(title: Text(''), icon:
                        MaterialButton(
                            minWidth: 18,
                            height:18,
                            child:
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Icon(Icons.home_outlined, color:index == 3 ? Colors.blue : Colors.grey),
                                  Text('홈', style: TextStyle(color:Colors.grey, fontSize: 10))
                                ]
                            ),
                            onPressed: () {
                              appState.state = 'home';
                            })),
                            
                            BottomNavigationBarItem(title: Text(''), icon:
                        MaterialButton(
                            minWidth: 18,
                            height:18,
                            child:
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Icon(Icons.message_outlined, color:index == 4 ? Colors.blue : Colors.grey),
                                  Text('커뮤니티', style: TextStyle(color:Colors.grey, fontSize: 10))
                                ]
                            ),
                            onPressed: () {
                              appState.state = 'community';
                            })),
                            
                            BottomNavigationBarItem(title: Text(''), icon:
                        MaterialButton(
                            minWidth: 18,
                            height:18,
                            child:
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Icon(Icons.person_outline, color:index == 5 ? Colors.blue : Colors.grey),
                                  Text('MY', style: TextStyle(color:Colors.grey, fontSize: 10))
                                ]
                            ),
                            onPressed: () {
                              appState.state = 'mypage';
                            })),
                      ]),
              //)
          //),
          body: Container(child:body, color:Colors.white)
  );
}

class HomeScaffoldBlue extends StatelessWidget {
  const HomeScaffoldBlue({required this.appState, required this.body, required this.index});
  final ApplicationState appState;
  final Widget body;
  final int index;

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset : true,
      extendBody: false,

      bottomNavigationBar: BottomNavigationBar(
        //color: Colors.transparent,
        //elevation:0,
        //child:
        //Container(
        //    decoration: BoxDecoration(
        //        border: Border.all(
        //          color:Colors.white,
        //        ),
        //        color:Colors.white,
        //        borderRadius: BorderRadius.all(Radius.circular(20))
        //    ),
        //    width:375,
        //    height:82,
        //    child:
        //    Row(
        //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //        children: [

          showSelectedLabels:false,
          showUnselectedLabels:false,
          type: BottomNavigationBarType.fixed,
          items:[

            BottomNavigationBarItem(title:Text(''), icon:
            MaterialButton(
                minWidth: 18,
                height:18,
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Icon(Icons.straighten_rounded, color:index == 1 ? Colors.blue : Colors.grey),
                      SizedBox(height:0),
                      Text('관리', style: TextStyle(color:Colors.grey, fontSize: 10))
                    ]
                ),
                onPressed: () {
                  appState.state = 'manageNutrient';
                })),

            BottomNavigationBarItem(title: Text(''), icon:
            MaterialButton(
                minWidth: 18,
                height:18,
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Icon(Icons.history, color:index == 2 ? Colors.blue : Colors.grey),
                      Text('히스토리', style: TextStyle(color:Colors.grey, fontSize: 10))
                    ]
                ),
                onPressed: () {
                  appState.state = 'historyNutrient';
                })),

            BottomNavigationBarItem(title: Text(''), icon:
            MaterialButton(
                minWidth: 18,
                height:18,
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Icon(Icons.home_outlined, color:index == 3 ? Colors.blue : Colors.grey),
                      Text('홈', style: TextStyle(color:Colors.grey, fontSize: 10))
                    ]
                ),
                onPressed: () {
                  appState.state = 'home';
                })),

            BottomNavigationBarItem(title: Text(''), icon:
            MaterialButton(
                minWidth: 18,
                height:18,
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Icon(Icons.message_outlined, color:index == 4 ? Colors.blue : Colors.grey),
                      Text('커뮤니티', style: TextStyle(color:Colors.grey, fontSize: 10))
                    ]
                ),
                onPressed: () {
                  appState.state = 'community';
                })),

            BottomNavigationBarItem(title: Text(''), icon:
            MaterialButton(
                minWidth: 18,
                height:18,
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Icon(Icons.person_outline, color:index == 5 ? Colors.blue : Colors.grey),
                      Text('MY', style: TextStyle(color:Colors.grey, fontSize: 10))
                    ]
                ),
                onPressed: () {
                  appState.state = 'mypage';
                })),
          ]),
      //)
      //),
      body: Container(child:body, color:Color(0xff5772ff))
  );
}

class manageTopBar extends StatefulWidget {
  manageTopBar({required this.appState});

  final ApplicationState appState;


  _manageTopBarState createState() => _manageTopBarState();
}

class _manageTopBarState extends State<manageTopBar> {

  var appState;

  void initState(){
    super.initState();

    appState = widget.appState;
  }

  @override
  Widget build(BuildContext context) => Column(children:[

    Row(children: [
      SizedBox(width:20),
      CircleAvatar(
        radius: 33,
  child: appState.userInfo['profileURL'] != null
            ? Container(
            width: 66.0,
            height: 66.0,

            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    //image: CachedNetworkImageProvider(appState.userInfo['profileURL'])
                  image: NetworkImage(appState.userInfo['profileURL']),
                )
            )
        )
            : Container(
          width: 66.0,
          height: 66.0,
          decoration: BoxDecoration(
              color: Color(0xffb9c1d9),
              shape: BoxShape.circle),
          child: Icon(
              Icons.person,
              color: Colors.white,
              size: 54
          ),
        ),
      ),
      SizedBox(width:20),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(appState.userInfo['nickname']+'님,', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 14)),
            SizedBox(height:3),
            Text.rich(TextSpan(style: TextStyle(fontFamily: 'gmarketSans', fontSize: 14), children: [
              TextSpan(text: '오늘 관리점수는 ',),
              TextSpan(text: appState.todoScore.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '점입니다.'),
            ])),
            SizedBox(height:4),
            Text('조금 더 힘을 내보아요!', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 14)),
          ])
    ]),

SizedBox(height:20),
    Container(width:412, child:
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Container(
            // optional
              width:103,
              height:35,
              padding: const EdgeInsets.only(bottom: 1.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2.0, color: appState.state == 'manageNutrient' ? Color(0xff5a6bff) : Color(0xfff3f6f4)))),
              child: MaterialButton(child: Text('영양', style: TextStyle(color: appState.state == 'manageNutrient' ? Color(0xff5a6bff) : Color(0xff444444), fontWeight: appState.state == 'manageNutrient' ? FontWeight.w800 : FontWeight.w400)), onPressed: () {
                appState.state = 'manageNutrient';
              })),
          Container(
            // optional
              width:103,
              height:35,
              padding: const EdgeInsets.only(bottom: 1.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2.0, color: appState.state == 'manageSleep' ? Color(0xff5a6bff) : Color(0xfff3f6f4)))),
              child: MaterialButton(child: Text('수면', style: TextStyle(color: appState.state == 'manageSleep' ? Color(0xff5a6bff) : Color(0xff444444), fontWeight: appState.state == 'manageSleep' ? FontWeight.w800 : FontWeight.w400)), onPressed: () {
                appState.state = 'manageSleep';
              })),
          Container(
            // optional
              width:103,
                            height:35,
              padding: const EdgeInsets.only(bottom: 1.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2.0, color: appState.state == 'manageExercise' ? Color(0xff5a6bff) : Color(0xfff3f6f4)))),
              child: MaterialButton(child: Text('운동', style: TextStyle(color: appState.state == 'manageExercise' ? Color(0xff5a6bff) : Color(0xff444444), fontWeight: appState.state == 'manageExercise' ? FontWeight.w800 : FontWeight.w400)), onPressed: () {
                appState.state = 'manageExercise';
              })),
          Container(
            // optional
              width:103,
                            height:35,
              padding: const EdgeInsets.only(bottom: 1.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2.0, color: appState.state == 'manageMeasure' ? Color(0xff5a6bff) : Color(0xfff3f6f4)))),
              child: MaterialButton(child: Text('키측정', style: TextStyle(color: appState.state == 'manageMeasure' ? Color(0xff5a6bff) : Color(0xff444444), fontWeight: appState.state == 'manageMeasure' ? FontWeight.w800 : FontWeight.w400)), onPressed: () {
                appState.state = 'manageMeasure';
              })),
        ]))
  ]);
}


class TodoList extends StatefulWidget {
    TodoList({required this.appState, required this.icon, required this.todoList, required this.todoListChecked,
    required this.todoCount,});
    final ApplicationState appState;

    var todoList;
    var todoListChecked;
    var todoCount;
    var icon;

    _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var todoList;
  var todoListChecked;
  bool expanded = false;

  void initState() {
    super.initState();
    todoList = widget.todoList;
    todoListChecked = widget.todoListChecked;
  }

  @override
    Widget build(BuildContext context) => Column(children:[
      Container(
          height: !expanded ? 210 : 340,
          child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, i) {
              return Stack(
                children: [
                  Visibility(
                      visible: i < 3 || expanded,
                      child:
                      Container(
                        height:54,
                        margin: EdgeInsets.fromLTRB(3,8,3,5),
                        //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
                            Container(
                                child:
                        CheckboxListTile(
                          title: Text(todoList[i], style: TextStyle(fontFamily: 'gmarketSans', fontSize: 12)),
                          value: todoListChecked[i],
                          onChanged: (value) {
                            setState(() {
                              if (todoListChecked[i]) {
                                widget.todoCount[0] -= 1;
                              }
                              else {
                                widget.todoCount[0] += 1;
                              }

                              todoListChecked[i] = !todoListChecked[i];

                              widget.appState.notify();

                            });
                          },
                          secondary: widget.icon,
                          activeColor: Color(0xffe3e3e3),
                          checkColor: Colors.blue,
                          selected: todoListChecked[i],
                          tileColor: Colors.white,
                        )),
                      )
                  ),
                ],
              );
            },
          )),

      MaterialButton(child: Icon(!expanded ? Icons.expand_more : Icons.expand_less, color:Color(0xff7879f1), size:35),
          onPressed: () {
            setState((){
              expanded = !expanded;
            });
          }),
    ]);
}


class JustText2 extends StatelessWidget {
  const JustText2(this.text, this.fontSize);
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.centerLeft,
      child: Text(
          this.text,
          style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: this.fontSize, fontWeight: FontWeight.w500)
      )
  );
}

class JustText22 extends StatelessWidget {
  const JustText22(this.text, this.fontSize);
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.centerLeft,
      child: Text(
          this.text,
          style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: this.fontSize, fontWeight: FontWeight.w800)
      )
  );
}

class JustText3 extends StatelessWidget {
  const JustText3(this.text, this.fontSize);
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.centerLeft,
      child: Text(
          this.text,
          style: GoogleFonts.notoSans(color: Color(0xff59597c), fontSize: this.fontSize, fontWeight: FontWeight.w500)
      )
  );
}

