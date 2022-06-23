import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_up_helper/home/home_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({required this.appState});

  ApplicationState appState;

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  var _selectedValue = '';

  bool tooltip = false;

  void initState() {
    var curr = widget.appState.userInfo['activeChildIndex'];
    _selectedValue = widget.appState.userInfo['children'][curr]['name'];
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffoldBlue(
        index: 4,
        appState: widget.appState,
        body: GestureDetector(
          onTap: () {
            setState(() {
              if (tooltip)
                tooltip = !tooltip;
            });
          },
          child: ListView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
          Stack(children:[
          Column(crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              Stack(
                children: <Widget>[
                  Container(
                    height: 350.0,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: Color(0xff5772FF),
                  ),

                  Positioned(
                      bottom: 130,
                      right: 15,
                      child: Container(
                        height: 420,
                        width: 380,
                        //margin: EdgeInsets.all(100.0),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle),
                      )),
                  Positioned(
                      top: 70,
                      right: 15,
                      child: Container(
                        height: 420,
                        width: 380,
                        //margin: EdgeInsets.all(100.0),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle),
                      )),
                  Positioned(
                      top: 200,
                      left: 40,
                      child: Container(
                        height: 350,
                        width: 350,
                        //margin: EdgeInsets.all(100.0),
                        child: Column(
                          children: <Widget>[
                            Text('3단계 엄마 커뮤니티',
                                style: TextStyle(color: Colors.white,
                                    fontFamily: 'gmarketSans',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 55,
                                ),
                                Text('현재',
                                    style: GoogleFonts.notoSans(fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white)),
                                Text(' 혜지맘',
                                    style: GoogleFonts.notoSans(fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                                Text(' 님은',
                                    style: GoogleFonts.notoSans(fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white)),
                                Text(' 8~9세 아이들',
                                    style: GoogleFonts.notoSans(fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                                Text('을 둔 엄마들의',
                                    style: GoogleFonts.notoSans(fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 80,
                                ),
                                Text('3단계 커뮤니티',
                                    style: GoogleFonts.notoSans(fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                                Text('에 소속되어 있어요!',
                                    style: GoogleFonts.notoSans(fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 65,
                                ),
                                Text('약',
                                    style: GoogleFonts.notoSans(fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white)),
                                Text(' 183명',
                                    style: GoogleFonts.notoSans(fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                                Text(' 의 엄마들이 함께 하고 있습니다.',
                                    style: GoogleFonts.notoSans(fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                    top: 45,
                    left: 110,
                    child:
                    SizedBox(width: 170, height: 103 * 170 / 136, child:
                    Image.asset('assets/trophy.png', fit: BoxFit.fill)
                    ),
                  ),
                  Positioned(
                    top: 320.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                        ),
                      ),
                      height: 30.0,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 50,
                    child: TextButton(child: Icon(
                        Icons.help_outline, color: Colors.white, size: 30),
                        onPressed: () {
                          setState(() {
                            tooltip = !tooltip;
                          });
                        }),
                  ),
                ],
              ),

              Container(
                  color: Colors.white,
                  child: Column(children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('        관리 점수 랭킹',
                              style: TextStyle(
                                  color: Color(0xff59597c),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: 8),
                          Row(
                            children: <Widget>[
                              Text("         커뮤니티 평균 관리 점수", style: TextStyle(
                                  color: Color(0xff59597c),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w200)),
                              Text(" 95점", style: TextStyle(
                                  color: Color(0xff5772FF),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 13.42,
                                  fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 5, 10, 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffe3e3e3).withOpacity(0.6),
                                offset: Offset(3, 3),
                                blurRadius: 2.0,
                                spreadRadius: 2)
                          ]),
                      child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 18,
                              child: widget.appState.userInfo['profileURL'] !=
                                  null
                                  ? Container(
                                  width: 36.0,
                                  height: 36.0,

                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        //image: CachedNetworkImageProvider(appState.userInfo['profileURL'])
                                        image: NetworkImage(widget.appState
                                            .userInfo['profileURL']),
                                      )
                                  )
                              )
                                  : Container(
                                width: 36.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                    color: Color(0xffb9c1d9),
                                    shape: BoxShape.circle),
                                child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 24
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(width: 295, height: 26, child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(child: Row(children: [
                                          Text('48', style: TextStyle(
                                              color: Color(0xff9048ed),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(_selectedValue + '맘',
                                              style: TextStyle(
                                                  color: Color(0xff59597c),
                                                  fontFamily: 'gmarketSans',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500))
                                        ])),

                                        Container(child: Text(
                                            widget.appState.overallScore
                                                .toString() + '점   ',
                                            style: TextStyle(
                                                color: Color(0xff5772FF),
                                                fontFamily: 'gmarketSans',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))),
                                      ])),
                                ])),
                          ]),
                    ),

                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 5, 10, 5),
                      child: Row(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 18,
                                child: Container(
                                    width: 36.0,
                                    height: 36.0,

                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/young.png'),
                                        )
                                    )
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Container(width: 295, child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  SizedBox(height: 0),
                                  Container(child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(child: Row(children: [
                                          Text('  1 ', style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text('영차엉', style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500))
                                        ])),

                                        Container(child: Text('100점   ',
                                            style: TextStyle(
                                                color: Color(0xff5772FF),
                                                fontFamily: 'gmarketSans',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))),
                                      ])),

                                ])),
                          ]),
                    ),

                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 5, 10, 5),
                      child: Row(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 18,
                                child: Container(
                                    width: 36.0,
                                    height: 36.0,

                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/young2.png'),
                                        )
                                    )
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Container(width: 295, child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  SizedBox(height: 0),
                                  Container(child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(child: Row(children: [
                                          Text('  2 ', style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text('배노십', style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500))
                                        ])),

                                        Container(child: Text('99점   ',
                                            style: TextStyle(
                                                color: Color(0xff5772FF),
                                                fontFamily: 'gmarketSans',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))),
                                      ])),

                                ])),
                          ]),
                    ),

                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 5, 10, 5),
                      child: Row(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 18,
                                child: Container(
                                    width: 36.0,
                                    height: 36.0,

                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/young3.png'),
                                        )
                                    )
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Container(width: 295, child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  SizedBox(height: 0),
                                  Container(child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(child: Row(children: [
                                          Text('  3 ', style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text('편슈니', style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500))
                                        ])),

                                        Container(child: Text('98점   ',
                                            style: TextStyle(
                                                color: Color(0xff5772FF),
                                                fontFamily: 'gmarketSans',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))),
                                      ])),

                                ])),
                          ]),
                    ),

                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 5, 10, 5),
                      child: Row(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 18,
                                child: Container(
                                    width: 36.0,
                                    height: 36.0,

                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/young4.png'),
                                        )
                                    )
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Container(width: 295, child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  SizedBox(height: 0),
                                  Container(child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(child: Row(children: [
                                          Text('  4 ', style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text('워매웜', style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500))
                                        ])),

                                        Container(child: Text('97점   ',
                                            style: TextStyle(
                                                color: Color(0xff5772FF),
                                                fontFamily: 'gmarketSans',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))),
                                      ])),

                                ])),
                          ]),
                    ),

                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 5, 10, 5),
                      child: Row(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 18,
                                child: Container(
                                    width: 36.0,
                                    height: 36.0,

                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/young5.png'),
                                        )
                                    )
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Container(width: 295, child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  SizedBox(height: 0),
                                  Container(child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(child: Row(children: [
                                          Text('  5 ', style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text('이유아', style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500))
                                        ])),

                                        Container(child: Text('96점   ',
                                            style: TextStyle(
                                                color: Color(0xff5772FF),
                                                fontFamily: 'gmarketSans',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))),
                                      ])),

                                ])),
                          ]),
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 30.0),
                      padding: EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 0.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffe3e3e3).withOpacity(0.3),
                                offset: Offset(6, 5),
                                blurRadius: 2.0,
                                spreadRadius: 0.5)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(width: 70, height: 43 * 70 / 58,
                                  child:
                                  Image.asset(
                                      'assets/board.png', fit: BoxFit.fill)),
                            ],
                          ),
                          Container(
                            //padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('성장 수다 게시판',
                                    style: TextStyle(
                                        color: Color(0xff59597c),
                                        fontFamily: 'gmarketSans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.fromLTRB(
                                          0, 0, 0, 10)),
                                  child: Text(' 바로 가기     >',
                                      style: TextStyle(
                                          color: Color(0xff59597c),
                                          fontFamily: 'gmarketSans',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200)),
                                  onPressed: () {
                                    widget.appState.state = 'communityGossip';
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                        ),
                        Text("실시간 인기글",
                            style: TextStyle(fontFamily: 'gmarketSans',
                                fontSize: 15.45,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff444444))),
                      ],
                    ),
                    Container(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: 375,
                        height: 440,
                        child: Image.asset(
                            'assets/popular.png', fit: BoxFit.fill)),
                    SizedBox(height: 50,),
                  ])),

            ],
          ),
            Visibility(
                visible: tooltip,
                child: Opacity(
                    opacity: 0.8,
                    child: Container(width:MediaQuery.of(context).size.width, height:1500, color: Colors.grey,
                        child: Image.asset('assets/tooltip8.png', fit: BoxFit.fill)))
            ),
          ])]),
        ));
  }

}
