import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:grow_up_helper/home/home_widgets.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';

class SavedMenuPage extends StatefulWidget {
  SavedMenuPage({required this.appState});

  ApplicationState appState;

  @override
  _SavedMenuPageState createState() => _SavedMenuPageState();
}

class _SavedMenuPageState extends State<SavedMenuPage> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child:ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Column(
                  children:[
                SizedBox(height:20),
                Row(children:[
                  TextButton(child: Icon(Icons.arrow_back_ios, color: Colors.grey), onPressed: () {
                    widget.appState.state = 'manageNutrient';
                  })
                ]),
                Container(
                  width:MediaQuery.of(context).size.width*0.8,
                    child: Image.asset('assets/saved_menu.png', fit: BoxFit.fill, alignment: AlignmentDirectional.topCenter,)),
              SizedBox(height:20)]),

            ]),
      ),
    );
  }
}