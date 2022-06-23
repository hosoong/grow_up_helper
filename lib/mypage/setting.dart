import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main.dart';

class MypageSettingPage extends StatefulWidget {
  MypageSettingPage({required this.appState});

  ApplicationState appState;

  @override
  _MypageSettingPageState createState() => _MypageSettingPageState();
}

class _MypageSettingPageState extends State<MypageSettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 0.0),
            child: Row(
              children: <Widget>[
                TextButton(
                  child:
                  FaIcon(FontAwesomeIcons.chevronLeft, color: Colors.grey),
                  onPressed: () {
                    widget.appState.state = 'mypage';
                  },
                ),
                SizedBox(
                  width: 90,
                ),
                Text('환경설정',
                  style: TextStyle(color: Color(0xff5653ff),
                      fontFamily: 'gmarketSans',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25.0, 50.0, 18.0, 5.0),
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('멤버십 관리', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Text('나의 멤버십', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w300),),
                          SizedBox(width:240),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              color: Colors.grey),
                        ],
                      ),
                      SizedBox(height:5),
                      Divider(
                        thickness: 1,
                        color: Color(0xfff2f2f2),
                      ),
                      SizedBox(height:5),
                      Row(
                        children: <Widget>[
                          Text('결제 수단 관리', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w300),),
                          SizedBox(width:223),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              color: Colors.grey),
                        ],
                      ),
                      SizedBox(height:5),
                      Divider(
                        thickness: 1,
                        color: Color(0xfff2f2f2),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('디바이스 관리', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Text('업데이트', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w300),),
                          SizedBox(width:259),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              color: Colors.grey),
                        ],
                      ),
                      SizedBox(height:5),
                      Divider(
                        thickness: 1,
                        color: Color(0xfff2f2f2),
                      ),
                      SizedBox(height:5),
                      Row(
                        children: <Widget>[
                          Text('워치 관리', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w300),),
                          SizedBox(width:255),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              color: Colors.grey),
                        ],
                      ),
                      SizedBox(height:5),
                      Divider(
                        thickness: 1,
                        color: Color(0xfff2f2f2),
                      ),
                      SizedBox(height:5),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('고객센터', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Text('1:1 문의내역', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w300),),
                          SizedBox(width:239),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              color: Colors.grey),
                        ],
                      ),
                      SizedBox(height:5),
                      Divider(
                        thickness: 1,
                        color: Color(0xfff2f2f2),
                      ),
                      SizedBox(height:5),
                      Row(
                        children: <Widget>[
                          Text('FAQ', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w300),),
                          SizedBox(width:280),
                          FaIcon(
                            FontAwesomeIcons.chevronRight, color: Colors.grey,),
                        ],
                      ),
                      SizedBox(height:5),
                      Divider(
                        thickness: 1,
                        color: Color(0xfff2f2f2),
                      ),
                      SizedBox(height:5),
                      Row(
                        children: <Widget>[
                          Text('공지사항', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w300),),
                          SizedBox(width:256),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              color: Colors.grey),
                        ],
                      ),
                      SizedBox(height:5),
                      Divider(
                        thickness: 1,
                        color: Color(0xfff2f2f2),
                      ),
                      SizedBox(height:5)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('계정관리', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Text('계정확인', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w300),),
                          SizedBox(width:255),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              color: Colors.grey),
                        ],
                      ),
                      SizedBox(height:5),
                      Divider(
                        thickness: 1,
                        color: Color(0xfff2f2f2),
                      ),
                      SizedBox(height:5),
                      Row(
                        children: <Widget>[
			TextButton(style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft),
                            onPressed: () async {
                              await widget.appState.streamSub.cancel();
                              widget.appState.signOut();
				},
			child:
                          Text('로그아웃', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w300))),
                          SizedBox(width:255),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              color: Colors.grey),
                        ],
                      ),
                      SizedBox(height:0),
                      Divider(
                        thickness: 1,
                        color: Color(0xfff2f2f2),
                      ),
                      SizedBox(height:5),
                      Row(
                        children: <Widget>[
                          Text('탈퇴하기', style: TextStyle(color: Color(
                              0xff59597C),
                              fontFamily: 'gmarketSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w300),),
                          SizedBox(width:255),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              color: Colors.grey),
                        ],
                      ),
                      SizedBox(height:5),
                      Divider(
                        thickness: 1,
                        color: Color(0xfff2f2f2),
                      ),
                      SizedBox(height:5)
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


