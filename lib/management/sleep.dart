import 'package:flutter/material.dart';
import 'package:grow_up_helper/home/home_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' as convert;
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';

class ManageSleepPage extends StatefulWidget {
  ManageSleepPage({required this.appState});

  ApplicationState appState;

  @override
  _ManageSleepPageState createState() => _ManageSleepPageState();
}

class _ManageSleepPageState extends State<ManageSleepPage> {
  int sleepDurationHour = 8;
  int sleepDurationMin = 27;
  int sleepHour = 22;
  int sleepMin = 23;
  int wakeHour = 7;
  int wakeMin = 45;
  int untilSleepHour = 1;
  int untilSleepMin = 45;
  int rem = 70;
  int wakeup = 0;

  var _name = '';
  var _sex = '';

  bool tooltip = false;

  void initState() {
    super.initState();

    var curr = widget.appState.userInfo['activeChildIndex'];
    _name = widget.appState.userInfo['children'][curr]['name'];
    _sex = widget.appState.userInfo['children'][curr]['sex'];

    parse_uri().then((result){
      setState((){
        for (var sleep in result['sleep']){
          if (sleep['type'] != 'stages'){
            continue;
          }

          var duration = sleep['timeInBed'];
          sleepDurationHour = (duration / 60).floor();
          sleepDurationMin = duration % 60;

          var start = sleep['startTime'].split('T')[1][5];
          sleepHour = int.parse(start.split(':')[0]);
          sleepMin = int.parse(start.split(':')[1]);

          wakeHour = sleepHour + sleepDurationHour;
          wakeMin = sleepMin + sleepDurationMin;
          wakeHour += (wakeMin / 60).floor();
          wakeMin = wakeMin % 60;
          wakeHour = wakeHour % 24;

          var untilSleep = sleep['minutesToFallAsleep'];
          untilSleepHour = (untilSleep / 60).floor();
          untilSleepMin = untilSleep % 60;

          var remMin = sleep['levels']['summary']['rem']['minutes'];
          rem = (remMin / duration).round();

          wakeup = sleep['levels']['summary']['wake']['count'];
        }

      });
    });

  }

  Future<Map> parse_uri() async {
    var activeChild = widget.appState.userInfo['activeChildIndex'];
    var accessToken = widget.appState.userInfo['children'][activeChild]['accessToken'];

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    var jsonResponse = null;
    //var url = Uri.https('api.fitbit.com', '/1/user/-/profile.json');
    var url = Uri.https('api.fitbit.com', '/1.2/user/-/sleep/date/'+formattedDate+'.json');
    var response = await http.get(url, headers: {'Authorization': 'Bearer '+accessToken});
    if (response.statusCode == 200) {
      jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return jsonResponse;
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
          TodoList(todoCount: widget.appState.sleepTodoCount, appState: widget.appState, icon: Container(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              decoration: BoxDecoration(
                  color: Color(0xffE9E9FF),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: FaIcon(FontAwesomeIcons.solidMoon, size:11, color: Color(0xff5653FF))), todoList: widget.appState.sleepTodoList, todoListChecked: widget.appState.sleepTodoListChecked),

          SizedBox(height:10),

                    Text(_name+'의 수면 상태', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45, fontWeight: FontWeight.w500, color: Color(0xff444444))),

          SizedBox(height:30),
          Stack(
              children:<Widget> [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  width: 366,
                  height: 252*366/336,
                  child: Image.asset(_sex == 'M' ? 'assets/imageman.png' : 'assets/imagewoman.png'),
                ),

                Positioned(
                  left:160,
                    top:30,
                    child:
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Row(
                          children:<Widget> [
                            JustText2('수면시간', 12.5),
                            SizedBox(width: 20,),
                            JustText22(sleepDurationHour.toString()+'시간 '+sleepDurationMin.toString()+'분', 16.18),
                          ],),
                          SizedBox(height:5),
                        Row(
                          children:<Widget> [
                            JustText2('취침시간', 12.5),
                            SizedBox(width: 20,),
                            JustText22(sleepHour.toString()+':'+sleepMin.toString()+'pm', 16.18),
                          ],),
                                                    SizedBox(height:5),
                        Row(
                          children:<Widget> [
                            JustText2('기상시간', 12.5),
                            SizedBox(width: 20,),
                            JustText22(wakeHour.toString()+':'+wakeMin.toString()+'am', 16.18),
                          ],),

                        SizedBox(height:40),
                        Text(
                            '지난 밤 '+_name+'는\n',
                            style: TextStyle(color: Color(0xff5a6bff), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500)
                        ),
                        JustText3('잠에 들기까지 '+untilSleepHour.toString()+'시간 '+untilSleepMin.toString()+'분이 걸렸어요.', 13),
                        SizedBox(height:3),
                        JustText3(rem.toString()+'%가 렘수면 상태였어요.', 13),
                        SizedBox(height:3),
                        JustText3('수면 도중 '+wakeup.toString()+'번 깨어났어요.', 13),
                      ])
                )
              ]),

      SizedBox(height:40),

          Row(
            children:<Widget> [
              //SizedBox(width:15 ,),
                Text(''+_name+'의 수면 그래프', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45, fontWeight: FontWeight.w500, color: Color(0xff444444))),
            ],
          ),
          SizedBox(height:30),
          SizedBox(width:380, height:210, child: Image.asset('assets/sleep_graph.png', fit: BoxFit.fill)),
          SizedBox(height:20),

        ])) ],
      ),
          Visibility(
              visible: tooltip,
              child: Opacity(
                  opacity: 0.8,
                  child: Container(width:MediaQuery.of(context).size.width, height:1300, color: Colors.grey,
                      child: Image.asset('assets/tooltip3.png', fit: BoxFit.fill)))
          ),
        ])]),
    )));
  }
}
