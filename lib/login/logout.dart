import 'package:flutter/material.dart';

import '../main.dart';
import '../survey/survey_widgets.dart';

class LogoutPage extends StatefulWidget {
  LogoutPage({required this.appState});

  ApplicationState appState;

  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: EdgeInsets.all(10),
        child: Form(
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height:50.0),
                  Text("내부적인 에러 발생.."),
                  SizedBox(height:50.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StyledButton(
                            text: '문진 처음부터',

                            onPressed: () async {
                              widget.appState.state = 'profile';
                            }
                        ),
                        StyledButton(
                            text: '로그아웃',

                            onPressed: () async {
                              await widget.appState.streamSub.cancel();
                              widget.appState.signOut();
                           }
                        ),
                      ]
                  ),
                  SizedBox(height:20)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}