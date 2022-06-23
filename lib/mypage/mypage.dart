import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_up_helper/home/home_widgets.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';

import '../main.dart';

class MypagePage extends StatefulWidget {
  MypagePage({required this.appState});

  ApplicationState appState;

  @override
  _MypagePageState createState() => _MypagePageState();
}

class _MypagePageState extends State<MypagePage> {
  int _hasBeenPressed=0;

  var activeChildIndex;
  List<int> childIndexes = [];

  var badgeList = {
    0: {'badgeTitle': '이걸 알림가몰라', 'badgeContext': '키모아는 꾸준한 알림으로 엄마가 해야할 일을 알려드려요. 만나서 반가워요! 앞으로 자주 보게 될 거에요.', 'percent': 95},
    2: {'badgeTitle': '럭키세븐', 'badgeContext': '일주일 내내 모든 알림을 확인하셨어요! 7일동안 키모아와 함께하다니! 이건 행운이야!', 'percent': 8},
    5: {'badgeTitle': '한국의 마이클 조던', 'badgeContext': '이 성장세라면 한국의 마이클 조던도 노려볼 수 있겠어요!', 'percent': 2},
    7: {'badgeTitle': '비밀번호 486', 'badgeContext': '하루에 네번 알림을 보고 여덟번 무시하고 여섯번의 확인을 해줘~ 키를 키워주는 단 하나뿐인 비밀번호야~ 알림 486번 확인!', 'percent': 23},
    8: {'badgeTitle': '어 퍼펙트 데이', 'badgeContext': '할 일을 모두 완료한 완벽한 날이네요. 이렇게만 계속 이어나가면 우리 아이 키가 쑥쑥 자라날 거에요!', 'percent': 11},
    9: {'badgeTitle': '달려라 챔피언', 'badgeContext': '챔피언! 관리해주는 네가.\n챔피언! 키모아 쓰는 네가.', 'percent': 5},
    11: {'badgeTitle': '불난다 불나!', 'badgeContext': '어머니의 아이에 대한 열정이 아이를 3cm 더 크게 했어요! 그런 멋진 어머니에게 드리는 뱃지입니다!', 'percent': 65},
    13: {'badgeTitle': '와신상담', 'badgeContext': '한 번 실패해도 다시 일어서서 도전하는 모습. 너무 멋져요! 이 정도 열정이면 뭐든 할 수 있겠는데요? 조금만 더 힘내봐요!', 'percent': 3},
    40: {'badgeTitle': '달려라 챔피언', 'badgeContext': '키모아없인못살롱 원장입니다 호호! VIP가 되신걸 축하드려요~', 'percent': 0.3},
  };
  
  var badgeTitle = [
    '이걸 알림가몰라', '100일의 기적', '럭키세븐',
    '벌써 일 년', '설렘주의보', '한국의 마이클 조던',
    '펜슬 하이', '비밀번호 486', '어 퍼펙트 데이',
    '달려라 챔피언', '성장판 번개맨', '불난다 불나!',
    '아슬아슬세이프', '와신상담', 'ㅈ...자니?',
    '엄마는 수호천사', '키.E.O.', '忍忍忍',
    '해피알림데이', '은하철도9999', '3000만큼 사랑해',
    '기상천회', '내이름은 백구', '계란한판',
    
    '천릿길도 한걸음부터', '느낌 아니까~', '한달동안 쑥쑥',
    '10점 만점에 10점', '우리집 천사', '꾸준함이 핵심',
    '새신을 신고 뛰어보자', '잘 먹여줘~잘 키워줘~', '엄마는 단짝',
    '자장자장 잘도잔다', '키모아의 시작', '칸트의 부활',
    '24시간이 모자라', '키모아의 비밀', '시간의 달인',
    '가려진 시간 사이로', '키모아 없인 못살롱', '9회말아웃',
    '229분의 기적', '원밀리언', '쑥쑥이',
    '유니코니', '타임 투 그로업', '모범 키모어',
    '하이하이', '이대로만', '로켓펀치'
  ];

  void initState() {
    activeChildIndex = widget.appState.userInfo['activeChildIndex'];
    childIndexes = [for(var i=0; i<=widget.appState.userInfo['children'].length; i++) i];
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffoldBlue(
      index: 5,
      appState: widget.appState,
      body: ListView(
      physics: ClampingScrollPhysics(),
        children: <Widget>[
      Stack(children:[
      Column(crossAxisAlignment: CrossAxisAlignment.end,
          children:[
          Container(
            height:2880,
              child:
            Stack(children:[
              Container(
                padding: EdgeInsets.fromLTRB(15,0,5,0),
                width: MediaQuery.of(context).size.width,
                child:
                Column(children:[
                  SizedBox(height:5),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                      children:[TextButton(
                          child:
                          Icon(Icons.settings_outlined, color: Colors.white),
                          onPressed: () {
                            widget.appState.state = 'mypageSetting';
                          })
                      ]),
                  Row(children: [
                    SizedBox(width:20),
                    CircleAvatar(
                      radius: 33,
                      child: widget.appState.userInfo['profileURL'] != null
                          ? Container(
                          width: 66.0,
                          height: 66.0,

                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                //image: CachedNetworkImageProvider(appState.userInfo['profileURL'])
                                image: NetworkImage(widget.appState.userInfo['profileURL']),
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
                    SizedBox(width:25),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.appState.userInfo['nickname'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'gmarketSans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(width:6),
                              FaIcon(FontAwesomeIcons.edit,color:Colors.white,size:14),
                            ],
                          ),
                          SizedBox(height:10),
                          Row(
                              children: <Widget>[
                                Text('게시글 204개 ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'gmarketSans',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(width:3),
                                FaIcon(FontAwesomeIcons.chevronRight,size:11,color:Colors.white),
                                SizedBox(width:10),
                                Text('댓글 1830개 ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'gmarketSans',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(width:3),
                                FaIcon(FontAwesomeIcons.chevronRight,size:11,color:Colors.white),
                              ]),
                        ])
                  ]),
                  SizedBox(height:10),
                  Container(height:36, child:
                    WhiteButton2(width:149, height:20, text:'프로필 보기', onPressed:() {
                      widget.appState.state = 'mypageProfile';
                    })
                  ),

                ]),
              ),

              Positioned(top:200, child:
                Container(
                  width: MediaQuery.of(context).size.width,
                    height:3000,
                    padding: EdgeInsets.fromLTRB(20,0,20,0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                      border: Border.all(width:3, color:Colors.white),
                      color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        SizedBox(height:30),
                        Text('등록된 자녀',style: TextStyle(fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
                        SizedBox(height:15),


                        Carousel(
                          height: 114,
                          items: childIndexes,
                          builderFunction: (context, index) {
                            if (index < childIndexes.length-1) {
                              return Container(
                                width:220,
                                height:104,
                                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                margin: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: activeChildIndex != index ? Colors.white : Color(0xff546bFF),
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xffe3e3e3).withOpacity(0.6),
                                          offset: Offset(0, 5),
                                          blurRadius: 2.0,
                                          spreadRadius: 2)
                                    ]),
                                child: TextButton(
                                    child: Row(children:[
                                      CircleAvatar(
                                        radius: 33,
                                        child: Container(
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

                                      SizedBox(width:15),
                                      Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            Row(children:[
                                              Text(widget.appState.userInfo['children'][index]['name'],
                                                  style: TextStyle(fontFamily: 'gmarketSans', fontWeight: FontWeight.w500,
                                                      fontSize: 17, color: Colors.black)),
                                              SizedBox(width:5),
                                              Text(widget.appState.userInfo['children'][index]['birthRank']+'째',
                                                  style: TextStyle(fontFamily: 'gmarketSans', fontWeight: FontWeight.w500,
                                                      fontSize: 11, color: Colors.black)),
                                            ]),
                                            SizedBox(height:8),
                                            Text('3단계 커뮤니티',
                                                style: GoogleFonts.notoSans(fontWeight: FontWeight.w300,
                                                    fontSize: 10.5, color: Colors.black)),
                                            Text('2021. 10. 23 관리 시작',
                                                style: GoogleFonts.notoSans(fontWeight: FontWeight.w300,
                                                    fontSize: 10.5, color: Colors.black)),
                                          ])
                                    ]),
                                    onPressed:() {
                                      widget.appState.userInfo['activeChildIndex'] = index;
                                      widget.appState.state = 'home';
                                    }
                                )
                              );
                            }
                            else {
                              return Container(
                                  width:214,
                                  height:104,
                                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                  margin: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: activeChildIndex != index ? Colors.white : Color(0xff546bFF),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xffe3e3e3).withOpacity(0.6),
                                            offset: Offset(0, 5),
                                            blurRadius: 2.0,
                                            spreadRadius: 2)
                                      ]),
                                  child: TextButton(
                                      child: Icon(Icons.add_circle_outline, size: 40, color: Color(0xff546bFF)),
                                      onPressed:() {
                                        widget.appState.state = 'survey1intro';
                                      }
                                  )
                              );
                            }
                          },
                        ),



                        SizedBox(height:50),
                        Row(children:[
                            Text('획득한 뱃지    ', style: TextStyle(fontFamily: 'gmarketSans', fontSize:16, fontWeight: FontWeight.w500)),
                            Text('9', style: TextStyle(fontFamily: 'gmarketSans', fontSize:24, fontWeight: FontWeight.w800)),
                            Text(' 개 / 51개', style: TextStyle(fontFamily: 'gmarketSans', fontSize:15, fontWeight: FontWeight.w500)),
                            
                        ])

                  ])
                )
              ),
            ])
          ),
        ]),
        Positioned(
          top: 470,
          left: 20,
          child:
            Opacity(
              opacity: 1,
              child:
                Container(
                    width:MediaQuery.of(context).size.width*0.9,
                    height:2400,
                    //color: Colors.grey,
                    child:
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1/1.08
                        ),
                        itemCount: 51,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              foregroundDecoration: badgeList.containsKey(index) ? null : BoxDecoration(
                                color: Colors.grey,
                                backgroundBlendMode: BlendMode.saturation,
                              ),
                              color: Colors.white,
                              child: TextButton(
                                  child:
                                  Column(
                                  children:[ Image.asset('assets/badge'+index.toString()+'.png', height:90),
                                  SizedBox(height:10),
                                    Text(badgeTitle[index], style: TextStyle(fontFamily: 'gmarketSans', fontWeight: FontWeight.w500, fontSize:11, color: Colors.black))
                                  ]),
                                onPressed:(){
                                print(index);
                                if (badgeList.containsKey(index)){
                                    showDialog (
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                                  insetPadding: EdgeInsets.fromLTRB(0, 360, 0, 0),
                                                  content: Container(
                                                  padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
                                                    width:MediaQuery.of(context).size.width,
                                                    //height:MediaQuery.of(context).size.height,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Row(mainAxisAlignment:MainAxisAlignment.center,children:[
                                                          SizedBox(width:68, height:3,
                                                              child:  Divider(color: Color(0xffc4c4c4), thickness:3)),]
                                                        ),
                                                        SizedBox(height:30),
                                                        Column(children:[
                                                            Text(badgeList[index]!['badgeTitle'].toString(), style: TextStyle(fontFamily: 'gmarketSans', fontSize: 18, fontWeight: FontWeight.bold)),
                                                            
                                                        SizedBox(height:10),
                                                        
                                                            Image.asset('assets/badge' + index.toString() + '.png', height:140),
                                                            
                                                            SizedBox(height:20),
                                                            
                                                            Column(
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                            children:[
                                                            
                                                            Row(children:[Text(badgeList[index]!['percent'].toString(), style: TextStyle(fontFamily: 'gmarketSans', fontSize: 12, fontWeight: FontWeight.w200)),
                                                            
                                                            Text('% 사용자가 획득했어요',style: TextStyle(fontFamily: 'gmarketSans', fontSize: 12, fontWeight: FontWeight.w200))
                                                            ]),
                                                            SizedBox(height:10),
                                                            
                                                            Text(badgeList[index]!['badgeContext'].toString(), style: GoogleFonts.notoSans(fontSize:15, fontWeight: FontWeight.w400))]),
                                                        ])
                                                      ]),
                                                  ),

                                                  actions: <Widget>[
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          
                                                          BlueButton(
                                                            width: 122,
                                                            height: 41,
                                                            onPressed: () {
                                                              
                                                              Navigator.of(context).pop();
                                                              },
                                                            text: '확인',
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
                                  }}
                                )
                          );
                        }
                    ),
                )))
      ])]),
    );
  }

}

class Carousel extends StatelessWidget {
  Carousel({
    required this.items,
    required this.builderFunction,
    required this.height,
    this.dividerIndent = 20,
  });

  final List<dynamic> items;
  final double dividerIndent;

  final Function(BuildContext context, dynamic item) builderFunction;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.separated(
          physics: PageScrollPhysics(),
          separatorBuilder: (context, index) => Divider(
            indent: dividerIndent,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            Widget item = builderFunction(context, items[index]);
            if (index == 0) {
              return Padding(
                child: item,
                padding: EdgeInsets.only(left: 0),
              );
            } else if (index == items.length - 1) {
              return Padding(
                child: item,
                padding: EdgeInsets.only(right: dividerIndent),
              );
            }
            return item;
          }),
    );
  }
}

