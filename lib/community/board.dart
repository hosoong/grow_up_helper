import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_up_helper/home/home_widgets.dart';

import '../main.dart';

class CommunityGossipPage extends StatefulWidget {
  CommunityGossipPage({required this.appState});

  ApplicationState appState;

  @override
  _CommunityGossipPageState createState() => _CommunityGossipPageState();
}

class _CommunityGossipPageState extends State<CommunityGossipPage> {
  @override
  Widget build(BuildContext context) {
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
                    widget.appState.state = 'community';
                  },
                ),
                SizedBox(
                  width: 60,
                ),
                JustText2('성장 수다게시판', 17),
              ],
            ),
          ),
        
          Container(
          padding:EdgeInsets.fromLTRB(20,20,10,0),
          width:300,
          child:
          Image.asset('assets/ccom1.png', fit: BoxFit.fill)),
        ],
      ),
    );
  }

  List<Score> getChartData() {
    final List<Score> chartData = [
      Score('health', 50),
      Score('heal', 50),
      Score('health', 50),
    ];
    return chartData;
  }
}

class Score {
  Score(this.continent, this.gdp);

  final String continent;
  final int gdp;
}
