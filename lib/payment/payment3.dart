import 'package:flutter/material.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';
import 'dart:io';

import '../main.dart';

class PaymentPage3 extends StatefulWidget {
  PaymentPage3({required this.appState});

  ApplicationState appState;

  @override
  _PaymentPage3State createState() => _PaymentPage3State();
}

class _PaymentPage3State extends State<PaymentPage3> {

  String? _servicePeriod;
  String? _date;
  String? _later;

  void initState() {
    super.initState();

    _servicePeriod = widget.appState.userInfo['servicePeriod'];
    //sleep(Duration(milliseconds:1000));

    DateTime now = new DateTime.now();
    int a = _servicePeriod![0] == '3' ? 3 :
    _servicePeriod![0] == '6' ? 6 :
    _servicePeriod![0] == '9' ? 9 : 12;
    DateTime later = new DateTime(now.year, now.month+a, now.day);

    _date = now.year.toString() + '년 ' + now.month.toString() + '월 ' + now.day.toString() + '일';
    _later = later.year.toString() + '년 ' + later.month.toString() + '월 ' + later.day.toString() + '일';
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:ListView(
          children:<Widget>[
            SizedBox(height:30),
            TitleText('결제 완료'),
            SizedBox(height:20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  //width: 300,
                  //height: 300,
                  //padding: EdgeInsets.all(30),
                  //color: Colors.white,
                  child: Column(
                    children:<Widget> [
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget> [
                            Row(
                              children:<Widget> [
                                Text('서비스 이용 기간', style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 16, fontWeight: FontWeight.w500)),
                                SizedBox(width:20),
                                Text(
                                    _servicePeriod == null ? '0개월' :
                                    _servicePeriod![0] == '3' ? '3개월' :
                                    _servicePeriod![0] == '6' ? '6개월' :
                                    _servicePeriod![0] == '9' ? '9개월' :
                                    '1년(12개월)'
                                    , style: TextStyle(color: Colors.black, fontFamily: 'gmarketSans', fontSize: 16, fontWeight: FontWeight.w800)
                                ),
                              ],
                            ),
                            SizedBox(height:5),
                            Divider(
                              thickness: 1,
                              color: Color(0xff5653ff),
                            ),
                            SizedBox(height:20),
                            Row(
                              children:<Widget> [
                                Text('결제 금액:', style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 14, fontWeight: FontWeight.w500)),
                                SizedBox(width:10),
                                Text(
                                    _servicePeriod == null ? '00,000원' :
                                    _servicePeriod![0] == '3' ? '300,000원' :
                                    _servicePeriod![0] == '6' ? '600,000원' :
                                    _servicePeriod![0] == '9' ? '900,000원' :
                                    ':1,200,000원'
                                    , style: TextStyle(color: Colors.black, fontFamily: 'gmarketSans', fontSize: 14, fontWeight: FontWeight.w800)
                                ),
                              ],
                            ),
                            SizedBox(height:10),
                            Text(
                                _date == null ? '결제일:0000년 00월 00일' : '결제일: '+_date!
                                , style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 14, fontWeight: FontWeight.w500)
                            ),
                            SizedBox(height:10),
                            Text(
                                _later == null ? '다음 결제일:0000년 00월 00일' : '다음 결제일: '+_later!
                                , style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 14, fontWeight: FontWeight.w500)
                            ),
                            SizedBox(height:10),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget> [
                            Row(
                              children:<Widget> [
                                Text('총 서비스 이용 금액', style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 16, fontWeight: FontWeight.w500)),
                                SizedBox(width:20),
                                Text(
                                    _servicePeriod == null ? '00,000원' :
                                    _servicePeriod![0] == '3' ? '300,000원' :
                                    _servicePeriod![0] == '6' ? '600,000원' :
                                    _servicePeriod![0] == '9' ? '900,000원' :
                                    '1,200,000원'
                                    , style: TextStyle(color: Colors.black, fontFamily: 'gmarketSans', fontSize: 16, fontWeight: FontWeight.w800)
                                ),
                              ],
                            ),
                            SizedBox(height:5),
                            Divider(
                              thickness: 1,
                              color: Color(0xff5653ff),
                            ),
                            SizedBox(height:20),
                            Text('결제 수단: 신용카드', style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 14, fontWeight: FontWeight.w500)),
                            SizedBox(height:10),
                            Text('할부: 일시불', style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 14, fontWeight: FontWeight.w500)),
                            SizedBox(height:10),
                            Text('VISA 9938-****-****-****', style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 14, fontWeight: FontWeight.w500)),
                            SizedBox(height:50),
                          ],
                        ),
                      ),
                          ],
                        ),
                      ),

                SizedBox(height:20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    SizedBox(width:100),
                    BlueButton(
                      width: 200,
                      height: 41,
                      text: '다음으로',
                      onPressed: () {
                        Map<String, dynamic> info = {
                          'phase': 'survey7intro',
                        };

                        print(info);

                        widget.appState.writeDB(info);

                        widget.appState.state = 'survey7intro';
                      },
                    ),
                  ],
                ),

                /*ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child:Column(
                    children:<Widget> [
                      Text('로그아웃', style: TextStyle(fontSize: 20),),
                    ],
                  ),

                    onPressed: () async {
                      await widget.appState.streamSub.cancel();
                      widget.appState.signOut();
                    }
                ),*/
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
