import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_up_helper/home/home_widgets.dart';

import '../main.dart';

class CommunityExamplePage extends StatefulWidget {
  CommunityExamplePage({required this.appState});

  ApplicationState appState;

  @override
  _CommunityExamplePageState createState() => _CommunityExamplePageState();
}

class _CommunityExamplePageState extends State<CommunityExamplePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: Row(
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
          ),
          Container(
            margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('참 속상해요...',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'gmarketSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 150,
                    ),
                    FaIcon(FontAwesomeIcons.solidHeart, color: Colors.grey),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    '오늘 정말 속상한 일이 있었어요.\n 아이가 학교에 다녀와서 저에게 대뜸 엄마는 키가 작은 편이냐고 묻더라구요. 키가 작다고 친구들한테 놀림을 받았나봐요 ㅠㅠ \n 엄마로써 아이에게 많이 미안하네요.',
                    style: TextStyle(
                        color: Color(0xff59597c),
                        fontFamily: 'gmarketSans',
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 30,),
                Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.solidHeart,
                      color: Color(0xff5653FF),
                      size: 11,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('33',
                        style: TextStyle(
                            color: Color(0xff5653FF),
                            fontFamily: 'gmarketSans',
                            fontSize: 11,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 10,
                    ),
                    FaIcon(
                      FontAwesomeIcons.comments,
                      color: Color(0xff5653FF),
                      size: 11,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('12',
                        style: TextStyle(
                            color: Color(0xff5653FF),
                            fontFamily: 'gmarketSans',
                            fontSize: 11,
                            fontWeight: FontWeight.w500)),
                    Text('17시간전',
                        style: TextStyle(
                            color: Color(0xffC4C4C4),
                            fontFamily: 'gmarketSans',
                            fontSize: 12,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),

          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Row(
              children: <Widget>[
                FaIcon(FontAwesomeIcons.smileWink),
                SizedBox(width: 10),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('맛있는 초밥',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w800)),
                      Text('7세 남아',
                          style: TextStyle(
                              color: Color(0xff59597c),
                              fontFamily: 'gmarketSans',
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 25,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 30,),
                    Text('댓글 4', style: TextStyle(fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff59597C)),),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe3e3e3).withOpacity(0.6),
                            offset: Offset(10, 10),
                            blurRadius: 2.0,
                            spreadRadius: 2)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.smileWink),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children:<Widget> [
                                      Text('맛있는 초밥',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'gmarketSans',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800)),
                                      Text('7세 남아',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                      FaIcon(FontAwesomeIcons.solidHeart),
                                    ],
                                  ),
                                  Text('2021.7.5 00:00',
                                      style: TextStyle(
                                          color: Color(0xff59597c),
                                          fontFamily: 'gmarketSans',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                  '저희 아이도 비슷한 경험 있어요.\n이 나이때 키 큰게 얼마나 대수라고...아이들이 놀리더라고요.\n요즘 아이들 못됐어요.맘님 힘내세요ㅠ',
                                  style: TextStyle(
                                      color: Color(0xff59597c),
                                      fontFamily: 'gmarketSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe3e3e3).withOpacity(0.6),
                            offset: Offset(10, 10),
                            blurRadius: 2.0,
                            spreadRadius: 2)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.smileWink),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children:<Widget> [
                                      Text('뒷태 여신',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'gmarketSans',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800)),
                                      Text('8세 여아',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                      FaIcon(FontAwesomeIcons.solidHeart),
                                    ],
                                  ),
                                  Text('2021.7.5 00:00',
                                      style: TextStyle(
                                          color: Color(0xff59597c),
                                          fontFamily: 'gmarketSans',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                  '영양제는 안먹이시나요?저희 애는 영양제 먹으니까 엄청 컸어요.한번 드셔보세요.',
                                  style: TextStyle(
                                      color: Color(0xff59597c),
                                      fontFamily: 'gmarketSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe3e3e3).withOpacity(0.6),
                            offset: Offset(10, 10),
                            blurRadius: 2.0,
                            spreadRadius: 2)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.smileWink),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children:<Widget> [
                                      Text('저녁 뭐먹지',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'gmarketSans',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800)),
                                      Text('8세 남아',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                      FaIcon(FontAwesomeIcons.solidHeart),
                                    ],
                                  ),
                                  Text('2021.7.5 00:00',
                                      style: TextStyle(
                                          color: Color(0xff59597c),
                                          fontFamily: 'gmarketSans',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '@울딸쵝오',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'gmarketSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                            Container(
                              child: Text(
                                  '요즘 아이들 다 일반화 하는건 옳지 않은듯 해요. 저희 동네 아이들은 하나같이 인사도 잘하고 착해요.아마 몇몇 아이들만 그런가봐요~',
                                  style: TextStyle(
                                      color: Color(0xff59597c),
                                      fontFamily: 'gmarketSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe3e3e3).withOpacity(0.6),
                            offset: Offset(10, 10),
                            blurRadius: 2.0,
                            spreadRadius: 2)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.smileWink),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children:<Widget> [
                                      Text('저녁 뭐먹지',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'gmarketSans',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800)),
                                      Text('8세 남아',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                      FaIcon(FontAwesomeIcons.solidHeart),
                                    ],
                                  ),
                                  Text('2021.7.5 00:00',
                                      style: TextStyle(
                                          color: Color(0xff59597c),
                                          fontFamily: 'gmarketSans',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '@저녁뭐먹지',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'gmarketSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                            Container(
                              child: Text(
                                  '일반화한 것은 아니고, 저도 아이들 많이 보는데 요즘들어 아이들이 예전과 다르다고 느껴서요~;;불편했담 죄송요',
                                  style: TextStyle(
                                      color: Color(0xff59597c),
                                      fontFamily: 'gmarketSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe3e3e3).withOpacity(0.6),
                            offset: Offset(10, 10),
                            blurRadius: 2.0,
                            spreadRadius: 2)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: Column(
                          children: [
                            Row(
                              children:<Widget> [
                                Text('혜지맘',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'gmarketSans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800)),
                                Text('7세 여아',
                                    style: TextStyle(
                                        color: Color(0xff59597c),
                                        fontFamily: 'gmarketSans',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                                FaIcon(FontAwesomeIcons.solidHeart),
                              ],
                            ),
                            Container(
                              child: TextField(
                                style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14.37, fontWeight: FontWeight.w500, color: Color(0xff59597C)),
                                decoration: new InputDecoration.collapsed(
                                    hintText: '댓글을 입력하세요...'
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
