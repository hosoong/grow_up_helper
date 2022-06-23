import 'package:flutter/material.dart';
import 'package:grow_up_helper/main.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';

class PaymentPage1 extends StatefulWidget {
  PaymentPage1({required this.appState});

  ApplicationState appState;

  @override
  _PaymentPage1State createState() => _PaymentPage1State();
}

class _PaymentPage1State extends State<PaymentPage1> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset : true,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Colors.white,
        child:ListView(
          children:<Widget>[
            Column(
              children: <Widget>[
                SizedBox(height:70),
                TitleText('키모아 성장 관리 시스템'),
                SizedBox(height:20),
                Row(children:[
                                                SizedBox(width:30),
                Image.asset('assets/payment_intro.png', width: 256*1.3, height: 189*1.3),
                                
                ]),
                SizedBox(height:25),
                Text('누구보다 아이를 잘 알아야 하는건 엄마잖아요.', style: TextStyle(color: Color(0xff5653ff), fontFamily: 'gmarketSans', fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height:15),
                NotoSansText('키모아의 성장 관리 시스템은', Color(0xff59597c), 14.5, FontWeight.w200),
                                SizedBox(height:5),
                NotoSansText('자녀의 현재 상태와 진단 결과를', Color(0xff59597c), 14.5, FontWeight.w200),
                                                SizedBox(height:5),
                NotoSansText('각각의 아이에 맞는 성향 분석과 부모 분석으로', Color(0xff59597c), 14.5, FontWeight.w200),
                                                SizedBox(height:5),
                NotoSansText('체계적인 1:1 온라인 성장관리를 제공해요.', Color(0xff59597c), 14.5, FontWeight.w200),
                SizedBox(height:40),
                Text('함께 있어도 아이 마음은 모를 때가 있기에.', style: TextStyle(color: Color(0xff5653ff), fontFamily: 'gmarketSans', fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height:15),
                NotoSansText('스마트 워치를 사용하여', Color(0xff59597c), 14.5, FontWeight.w200),
                                                SizedBox(height:5),
                NotoSansText('자녀의 현 상태를 정확하게 파악하고', Color(0xff59597c), 14.5, FontWeight.w200),
                                                SizedBox(height:5),
                NotoSansText('그에 따른 맞춤 관리법을 매 시간, 매일 추천해 드려요.', Color(0xff59597c), 14.5, FontWeight.w200),
                SizedBox(height:60),
                BlueButton(
                  width: 194,
                  height: 41,
                  text: '결제하기',
                    onPressed: () {
                      widget.appState.state = 'payment2';
                    }
                ),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


