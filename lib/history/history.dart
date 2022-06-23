import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:grow_up_helper/home/home_widgets.dart';

import 'package:grow_up_helper/survey/survey_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../main.dart';

class HistoryNutrientPage extends StatefulWidget {
  HistoryNutrientPage({required this.appState});

  ApplicationState appState;

  @override
  _HistoryNutrientPageState createState() => _HistoryNutrientPageState();
}

class _HistoryNutrientPageState extends State<HistoryNutrientPage> {
  var _currentDate = DateTime.now();
  var _selectedDate = DateTime.now().subtract(Duration(days: 1));
  var _targetDateTime = DateTime.now();

  var state = 'manageNutrient';

  var currentMonthDay = '1020';

  String _currentMonth = '';
  String _currentYear = '';

  var offset = 1;

  bool tooltip = false;

  @override
  void initState() {
    super.initState();

    _currentDate = _currentDate.day < 5 ? _currentDate.subtract(Duration(days: _currentDate.day)) : _currentDate;
    _selectedDate = DateTime.now().subtract(Duration(days: 1));
    _targetDateTime = _currentDate;
    offset = _selectedDate.weekday-1;

    currentMonthDay = DateFormat('MMdd').format(_currentDate);
    if (int.parse(currentMonthDay) < 1020) {
      currentMonthDay = '1020';
    }

    _currentMonth = DateFormat.MMM('ko').format(_currentDate);
    _currentYear = DateFormat.y('en').format(_currentDate);
  }


  @override
  Widget build(BuildContext context) {

    return HomeScaffoldBlue(
      index: 2,
      appState: widget.appState,
      body: GestureDetector(
        onTap: () {
      setState(() {
        if (tooltip)
          tooltip = !tooltip;
      });
    },
    child:ListView(
      physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
    Stack(children:[
    Column(crossAxisAlignment: CrossAxisAlignment.end,
        children:[
          SizedBox(height:20),
          Stack(
            children: <Widget>[
              // Max Size
              Container(
                color: Color(0xff5772FF),
                height: 180.0,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                      SizedBox(width:14),
                        TextButton(child:Icon(Icons.help_outline, color: Colors.white, size: 30), onPressed: () {
                          setState(() {
                            tooltip = !tooltip;
                          });
                        }),
                        IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.calendarAlt, color: Colors.white),
                            onPressed:(){
                              showDialog (
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                            insetPadding: EdgeInsets.fromLTRB(0, 300, 0, 0),
                                            content: Container(
                                              width:MediaQuery.of(context).size.width,
                                              //height:MediaQuery.of(context).size.height,
                                              child: Column(children:[
                                                Row(mainAxisAlignment:MainAxisAlignment.center,children:[
                                                  SizedBox(width:68, height:3,
                                                      child:  Divider(color: Color(0xffc4c4c4), thickness:3)),]
                                                ),
                                                SizedBox(height:20),

                                                SizedBox(height: 0),
                                                Container(
                                                  child: new Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[
                                                        SizedBox(width:10),
                                                        TextButton(
                                                          child:
                                                          FaIcon(FontAwesomeIcons.chevronLeft, color: Colors.grey),
                                                          onPressed: () {
                                                            print('prev');
                                                            /*setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month - 1);
                          _currentMonth = DateFormat.MMM('ko').format(_targetDateTime);
                          _currentYear = DateFormat.y('en').format(_targetDateTime);
                        });*/
                                                          },
                                                        ),
                                                        Column(
                                                          children: <Widget>[
                                                            Text(
                                                              _currentMonth,
                                                              style: TextStyle(
                                                                  fontFamily: 'gmarketSans',
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 27.0,
                                                                  color: Color(0xff5653ff)
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TextButton(
                                                          child:
                                                          FaIcon(FontAwesomeIcons.chevronRight, color: Colors.grey),
                                                          onPressed: () {
                                                            print('next');
                                                            /*setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month + 1);
                          _currentMonth = DateFormat.MMM('ko').format(_targetDateTime);
                          _currentYear = DateFormat.y('en').format(_targetDateTime);
                        });*/
                                                          },
                                                        ),
                                                        SizedBox(width:10),
                                                      ]),
                                                ),
                                                Center(child:Text(
                                                  _currentYear,
                                                  style: TextStyle(
                                                      fontFamily: 'gmarketSans',
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14.0,
                                                      color: Color(0xff59597c)
                                                  ),
                                                )),
                                                SizedBox(height: 20),
                                                Container(
                                                  child: CalendarCarousel<Event>(
                                                    locale: 'ko',

                                                    minSelectedDate: DateTime(_currentDate.year, 10, 20),
                                                    maxSelectedDate: DateTime(_currentDate.year, _currentDate.month, _currentDate.day-1),

                                                    prevDaysTextStyle: TextStyle(color: Color(0xff858585), fontFamily: 'gmarketSans', fontSize: 12, fontWeight: FontWeight.w500),
                                                    daysTextStyle: TextStyle(color: Color(0xff858585), fontFamily: 'gmarketSans', fontSize: 12, fontWeight: FontWeight.w500),
                                                    nextDaysTextStyle: TextStyle(color: Color(0xff858585), fontFamily: 'gmarketSans', fontSize: 12, fontWeight: FontWeight.w500),

                                                    weekdayTextStyle: TextStyle(color: Color(0xff858585), fontFamily: 'gmarketSans', fontSize: 12, fontWeight: FontWeight.w500),
                                                    weekendTextStyle: TextStyle(color: Color(0xff858585), fontFamily: 'gmarketSans', fontSize: 12, fontWeight: FontWeight.w500),
                                                    isScrollable: false,

                                                    selectedDayBorderColor: Color(0xff5653ff),
                                                    selectedDayButtonColor: Color(0xff5653ff),

                                                    todayBorderColor: Colors.white,
                                                    todayButtonColor: Colors.white,
                                                    todayTextStyle: TextStyle(color: Color(0xff858585), fontFamily: 'gmarketSans', fontSize: 12, fontWeight: FontWeight.w500),
                                                    selectedDayTextStyle: TextStyle(color: Colors.white, fontFamily: 'gmarketSans', fontSize: 12, fontWeight: FontWeight.w500),

                                                    height: MediaQuery.of(context).size.height*0.4,
                                                    daysHaveCircularBorder: true,
                                                    showOnlyCurrentMonthDate: true,
                                                    weekFormat: false,
                                                    showHeader: false,
                                                    customGridViewPhysics: NeverScrollableScrollPhysics(),

                                                    selectedDateTime: _currentDate,
                                                    targetDateTime: _targetDateTime,

                                                    onDayPressed: (date, events) {
                                                      setState(() {
                                                        _selectedDate = date;
                                                        offset = date.weekday-1;
                                                        Navigator.of(context).pop();
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ])
                                            ),
                                          );
                                        }
                                    );
                                  }
                              ).then((context) {
                                setState((){

                                });
                              });
                            }
                            ),
                      ],
                    ),

                    SizedBox(height:20),
                    Container(width:445, height:55, child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text('월', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13, color: Colors.white)),
                              Container(
                                width: 34,
                                height:34,
                                  decoration: BoxDecoration(
                                      color: offset == 0 ? Colors.white : Colors.transparent,
                                      borderRadius: BorderRadius.all(Radius.circular(33))
                                  ),
                                  child: Center(child:Text((_selectedDate.day-offset).toString(),
                                      style: TextStyle(fontFamily: 'gmarketSans', fontSize: 17, fontWeight: offset == 0 ? FontWeight.bold : FontWeight.w500, color: offset == 0 ? Color(0xff5772ff) : Colors.white)
                                  )),
                              )
                          ]),

                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text('화', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13, color: Colors.white)),
                                Container(
                                  width: 34,
                                  height:34,
                                  decoration: BoxDecoration(
                                      color: offset == 1 ? Colors.white : Colors.transparent,
                                      borderRadius: BorderRadius.all(Radius.circular(33))
                                  ),
                                  child: Center(child:Text((_selectedDate.day-offset+1).toString(),
                                      style: TextStyle(fontFamily: 'gmarketSans', fontSize: 17, fontWeight: offset == 1 ? FontWeight.bold : FontWeight.w500, color: offset == 1 ? Color(0xff5772ff) : Colors.white)
                                  )),
                                )
                              ]),

                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text('수', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13, color: Colors.white)),
                                Container(
                                  width: 34,
                                  height:34,
                                  decoration: BoxDecoration(
                                      color: offset == 2 ? Colors.white : Colors.transparent,
                                      borderRadius: BorderRadius.all(Radius.circular(33))
                                  ),
                                  child: Center(child:Text((_selectedDate.day-offset+2).toString(),
                                      style: TextStyle(fontFamily: 'gmarketSans', fontSize: 17, fontWeight: offset == 2 ? FontWeight.bold : FontWeight.w500, color: offset == 2 ? Color(0xff5772ff) : Colors.white)
                                  )),
                                )
                              ]),

                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text('목', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13, color: Colors.white)),
                                Container(
                                  width: 34,
                                  height:34,
                                  decoration: BoxDecoration(
                                      color: offset == 3 ? Colors.white : Colors.transparent,
                                      borderRadius: BorderRadius.all(Radius.circular(33))
                                  ),
                                  child: Center(child:Text((_selectedDate.day-offset+3).toString(),
                                      style: TextStyle(fontFamily: 'gmarketSans', fontSize: 17, fontWeight: offset == 3 ? FontWeight.bold : FontWeight.w500, color: offset == 3 ? Color(0xff5772ff) : Colors.white)
                                  )),
                                )
                              ]),

                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text('금', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13, color: Colors.white)),
                                Container(
                                  width: 34,
                                  height:34,
                                  decoration: BoxDecoration(
                                      color: offset == 4 ? Colors.white : Colors.transparent,
                                      borderRadius: BorderRadius.all(Radius.circular(33))
                                  ),
                                  child: Center(child:Text((_selectedDate.day-offset+4).toString(),
                                      style: TextStyle(fontFamily: 'gmarketSans', fontSize: 17, fontWeight: offset == 4 ? FontWeight.bold : FontWeight.w500, color: offset == 4 ? Color(0xff5772ff) : Colors.white)
                                  )),
                                )
                              ]),

                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text('토', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13, color: Colors.white)),
                                Container(
                                  width: 34,
                                  height:34,
                                  decoration: BoxDecoration(
                                      color: offset == 5 ? Colors.white : Colors.transparent,
                                      borderRadius: BorderRadius.all(Radius.circular(33))
                                  ),
                                  child: Center(child:Text((_selectedDate.day-offset+5).toString(),
                                      style: TextStyle(fontFamily: 'gmarketSans', fontSize: 17, fontWeight: offset == 5 ? FontWeight.bold : FontWeight.w500, color: offset == 5 ? Color(0xff5772ff) : Colors.white)
                                  )),
                                )
                              ]),

                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text('일', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13, color: Colors.white)),
                                Container(
                                  width: 34,
                                  height:34,
                                  decoration: BoxDecoration(
                                      color: offset == 6 ? Colors.white : Colors.transparent,
                                      borderRadius: BorderRadius.all(Radius.circular(33))
                                  ),
                                  child: Center(child:Text((_selectedDate.day-offset+6).toString(),
                                      style: TextStyle(fontFamily: 'gmarketSans', fontSize: 17, fontWeight: offset == 6 ? FontWeight.bold : FontWeight.w500, color: offset == 6 ? Color(0xff5772ff) : Colors.white)
                                  )),
                                )
                              ]),

                      ])
                    )
                  ],
                ),
              ),
              Positioned(
                top: 150.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  height: 30.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),

          Container(color: Colors.white, child: Column(children:[

            SizedBox(height:10),
            Container(
            margin: EdgeInsets.fromLTRB(10,0,10,0),
              width: 380,
              child: Image.asset('assets/'+DateFormat('MMdd').format(_selectedDate)+'top.png', fit: BoxFit.fill),
            ),

            SizedBox(height:40),
            Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child:
                Container(width:412, child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Container(
                        // optional
                          width:412/3,
                          height:35,
                          padding: const EdgeInsets.only(bottom: 1.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2.0, color: state == 'manageNutrient' ? Color(0xff5a6bff) : Color(0xfff3f6f4)))),
                          child: MaterialButton(child: Text('영양', style: TextStyle(color: state == 'manageNutrient' ? Color(0xff5a6bff) : Color(0xff444444), fontWeight: state == 'manageNutrient' ? FontWeight.w800 : FontWeight.w400)), onPressed: () {
                            setState((){
                              state = 'manageNutrient';
                            });
                          })),
                      Container(
                        // optional
                          width:412/3,
                          height:35,
                          padding: const EdgeInsets.only(bottom: 1.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2.0, color: state == 'manageSleep' ? Color(0xff5a6bff) : Color(0xfff3f6f4)))),
                          child: MaterialButton(child: Text('수면', style: TextStyle(color: state == 'manageSleep' ? Color(0xff5a6bff) : Color(0xff444444), fontWeight: state == 'manageSleep' ? FontWeight.w800 : FontWeight.w400)), onPressed: () {
                            setState((){
                              state = 'manageSleep';
                            });
                          })),
                      Container(
                        // optional
                          width:412/3,
                          height:35,
                          padding: const EdgeInsets.only(bottom: 1.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2.0, color: state == 'manageExercise' ? Color(0xff5a6bff) : Color(0xfff3f6f4)))),
                          child: MaterialButton(child: Text('운동', style: TextStyle(color: state == 'manageExercise' ? Color(0xff5a6bff) : Color(0xff444444), fontWeight: state == 'manageExercise' ? FontWeight.w800 : FontWeight.w400)), onPressed: () {
                            setState((){
                              state = 'manageExercise';
                            });
                          })),
                ]),
              ),
            ),

            SizedBox(height:30),
            Container(
                        margin: EdgeInsets.fromLTRB(25,0,5,0),
              width: 380,
              child: Image.asset('assets/'+DateFormat('MMdd').format(_selectedDate)+(state == 'manageNutrient' ? 'eat.png' : state == 'manageSleep' ? 'sleep.png' : 'run.png'), fit: BoxFit.fill),
            ),
            SizedBox(height:40),
          ]))
    ]),
      Visibility(
          visible: tooltip,
          child: Opacity(
              opacity: 0.8,
              child: Container(width:MediaQuery.of(context).size.width, height: state == 'manageNutrient' ? 2450 : state == 'manageSleep' ? 2270 : 2000, color: Colors.grey,
                  child: Image.asset(state == 'manageNutrient' ? 'assets/tooltip5.png' : state == 'manageSleep' ? 'assets/tooltip6.png' : 'assets/tooltip7.png', fit: BoxFit.fill)))
      ),
    ])])
      ));
  }
}
