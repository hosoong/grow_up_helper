import 'package:flutter/material.dart';
import 'package:grow_up_helper/home/home_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';

class ManageExercisePage extends StatefulWidget {
  ManageExercisePage({required this.appState});

  ApplicationState appState;

  @override
  _ManageExercisePage createState() => _ManageExercisePage();
}

class _ManageExercisePage extends State<ManageExercisePage> {
  int walks = 0;
  double walkDistance = 0;
  int walkMin = 0;
  int walkRatio = 70;
  int kcal = 0;

  Map<dynamic, dynamic> a = {'a': 'a'};

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
        for (var activity in result['activities']){
          kcal += int.parse(activity['calories']);
          walkMin += (int.parse(activity['duration'])/60000).round();
          walkDistance += int.parse(activity['distance']);
          walks += int.parse(activity['steps']);
        }
        walkRatio = (walks/10000).round();
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
    var url = Uri.https('api.fitbit.com', '/1/user/-/activities/date/'+formattedDate+'.json');
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
          TodoList(todoCount: widget.appState.exerciseTodoCount, appState: widget.appState, icon: Container(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              decoration: BoxDecoration(
                  color: Color(0xffE9E9FF),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Transform.rotate(
                angle: 300 * 3.14 / 180,
                child: FaIcon(FontAwesomeIcons.shoePrints, color: Color(0xff5653FF), size:11),
              ),), todoList: widget.appState.exerciseTodoList, todoListChecked: widget.appState.exerciseTodoListChecked),

        SizedBox(height:10),

          Text(''+_name+'의 활동 내역', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45, fontWeight: FontWeight.w500, color: Color(0xff444444))),

        SizedBox(height:30),
        Stack(
            children:<Widget> [
              Container(
                alignment: AlignmentDirectional.topStart,
                width: 366,
                height: 252*366/336,
                child: Image.asset(_sex == 'M' ? 'assets/imageman2.png' : 'assets/imagewoman2.png'),
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
                            JustText2('걸음수     ', 12.5),
                            SizedBox(width: 20,),
                            JustText22(walks.toString()+'걸음', 16.18),
                          ],),
                          SizedBox(height:5),
                        Row(
                          children:<Widget> [
                            JustText2('거리        ', 12.5),
                            SizedBox(width: 20,),
                            JustText22(walkDistance.toString()+'km', 16.18),
                          ],),
                          SizedBox(height:5),
                        Row(
                          children:<Widget> [
                            JustText2('활동 시간', 12.5),
                            SizedBox(width: 20,),
                            JustText22(walkMin.toString()+'분', 16.18),
                          ],),

                        SizedBox(height:40),
                        Text(
                            '오늘 '+_name+'는\n',
                            style: TextStyle(color: Color(0xff5a6bff), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500)
                        ),
                        JustText3('권장 걸음수의 '+walkRatio.toString()+'%를 걸었어요.', 13),
                        SizedBox(height:3),
                        JustText3('활동으로 '+kcal.toString()+'kcal를 소비했어요.', 13),
                        SizedBox(height:3),
                        JustText3('총 '+walkMin.toString()+'분의 활동을 했어요.', 13),
                      ])
              )
            ]),

      SizedBox(height:40),

        Text(''+_name+'가 아직 권장 걸음수를 채우지 못했어요!', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45)),
        SizedBox(height:5),
                  Text.rich(TextSpan(style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15.45), children: [
            TextSpan(text: '집에서 할 수 있는 유산소 운동', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff5653ff))),
            TextSpan(text: '은 어때요?'),
          ])),
        SizedBox(height:20),
        SizedBox(width:385, height:230, child: Image.asset('assets/this_exercise.png', fit: BoxFit.fill)),
        SizedBox(height:10),
        Text('    엄마도 같이 해요!', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height:5),
        Text('    층간소음 걱정 없는 모닝 유산소', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 14)),
        SizedBox(height:25),
    ]))
        ],
      ),
        Visibility(
            visible: tooltip,
            child: Opacity(
                opacity: 0.8,
                child: Container(padding: EdgeInsets.fromLTRB(0,0,0,0), width:MediaQuery.of(context).size.width, height:1300, color: Colors.grey,
                    child:
                      
                      Image.asset('assets/tooltip1.png', fit: BoxFit.fill)))
        ),
  ])])
    )));
  }
}
