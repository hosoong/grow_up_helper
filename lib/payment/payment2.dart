import 'package:flutter/material.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';

import '../main.dart';

class PaymentPage2 extends StatefulWidget {
  PaymentPage2({required this.appState});

  ApplicationState appState;

  @override
  _PaymentPage2State createState() => _PaymentPage2State();
}

class _PaymentPage2State extends State<PaymentPage2> {

  void initState(){
    super.initState();
  }

  String? _servicePeriod;
  String? _date;
  String? _later;

  final List<String> _servicePeriodList = ['3개월 (300,000원)',
    '6개월 (600,000원)',
    '9개월 (900,000원)',
    '1년 (1,200,000원)'];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double width = 180;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:ListView(
          children:<Widget>[
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    children:<Widget> [
                      TitleText('서비스 구매'),
                    ],
                  ),
                ),
                SizedBox(height:30),
                Container(
                    margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                  child:Column(
                    children:<Widget> [
                      Row(
                        children: [
                          SizedBox(height:10,),
                          Text('STEP1. 상품 구매', style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 16, fontWeight: FontWeight.w500)),

                        ],
                      ),
                      SizedBox(height:30,),
                      Row(
                        children: [
                          Text('서비스 이용 기간', style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 14, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    width: width,
                    child: DropdownButtonFormField(

                      isExpanded: true,
                      value: _servicePeriod,
                      items: _servicePeriodList.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Container(width: width, child: Padding(padding: EdgeInsets.only(left: width*0.1), child:Text(value, style: TextStyle(fontSize: 15), textAlign: TextAlign.center))),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _servicePeriod = value as String;

                          DateTime now = new DateTime.now();
                          int a = _servicePeriod![0] == '3' ? 3 :
                          _servicePeriod![0] == '6' ? 6 :
                          _servicePeriod![0] == '9' ? 9 : 12;
                          DateTime later = new DateTime(now.year, now.month+a, now.day);

                          _date = now.year.toString() + '년 ' + now.month.toString() + '월 ' + now.day.toString() + '일';
                          _later = later.year.toString() + '년 ' + later.month.toString() + '월 ' + later.day.toString() + '일';
                        });
                      },
                      hint: Container(width: width, child: Padding(padding: EdgeInsets.only(left: width*0.1), child: Text('이용 기간', style: TextStyle(fontSize: 15), textAlign: TextAlign.center))),
                    )),
                SizedBox(height:20,),
                Container(
                  margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:<Widget> [
                      Row(children:[
                        NotoSansText(
                            _servicePeriod == null ? '결제 금액:00,000원' :
                            _servicePeriod![0] == '3' ? '결제 금액:300,000원' :
                            _servicePeriod![0] == '6' ? '결제 금액:600,000원' :
                            _servicePeriod![0] == '9' ? '결제 금액:900,000원' :
                            '결제 금액:1,200,000원', Color(0xff59597C), 16, FontWeight.w500
                        )]),
                        SizedBox(height:6),
                      Row(children:[
                        NotoSansText(
                            _date == null ? '결제일:0000년 00월 00일' : '결제일:'+_date!, Color(0xff59597C), 16, FontWeight.w500
                        )]),
                                                        SizedBox(height:6),
                      Row(children:[
                        NotoSansText(
                      _later == null ? '다음 결제일:0000년 00월 00일' : '다음 결제일:'+_later!, Color(0xff59597C), 16, FontWeight.w500
                        )]),
                      SizedBox(height:10),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height:10),
                      Row(children:[
                      NotoSansText(
                        _servicePeriod == null ? '총 서비스 이용 금액 00,000원' :
                        _servicePeriod![0] == '3' ? '총 서비스 이용 금액 300,000원' :
                        _servicePeriod![0] == '6' ? '총 서비스 이용 금액 600,000원' :
                        _servicePeriod![0] == '9' ? '총 서비스 이용 금액 900,000원' :
                        '총 서비스 이용 금액 1,200,000원', Color(0xff59597C), 18, FontWeight.w800
                      )]),

                    ],
                  ),
                ),

                SizedBox(height:50),
                Container(
                  margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 10.0),
                  child: Text('STEP2. 결제 수단 선택하기', style: TextStyle(color: Color(0xff59597C), fontFamily: 'gmarketSans', fontSize: 16, fontWeight: FontWeight.w500)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15.0, 0.0, 10.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      BlueButton(
                          width: 110,
                          height: 41,
                          text: '신용카드',
                          onPressed: () {}
                      ),
                    
                      WhiteButton(
                          width: 110,
                          height: 41,
                          text: '카카오페이',
                          onPressed: () {

                          }
                      ),
                      WhiteButton(
                          width: 110,
                          height: 41,
                          text: '네이버페이',
                          onPressed: () {

                          }
                      ),
                    ],
                  ),
                ),

                SizedBox(height:80),
                Row(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children:<Widget> [
                    SizedBox(width:100),
                    BlueButton(
                        width: 194,
                        height: 41,
                        text: '결제하기',
                        onPressed: () async {
                          bool flag1 = _servicePeriod != null;

                          if (flag1) {
                            Map<String, dynamic> info = {
                              'phase': 'payment3',
                              'servicePeriod': _servicePeriod
                            };

                            print(info);

                            widget.appState.userInfo['servicePeriod'] = _servicePeriod;

                            widget.appState.writeDB(info);

                            widget.appState.state = 'payment3';
                          }
                          else {
                            showDialog<void>(
                                context: context,
                                builder: (context) {
                                  return AlertPopup();
                                }
                            );
                          }
                        }
                    ),
                  ],
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


