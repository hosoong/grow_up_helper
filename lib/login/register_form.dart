import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_up_helper/main.dart';

import 'login_widgets.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({required this.appState});

  ApplicationState appState;

  void register(BuildContext context, String email, String password) {
    appState.registerAccount(email, password, (e) => showErrorDialog(context, '회원가입 실패', e));
  }

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();

  bool validateEmail = false;
  bool validatePassword = false;
  bool validatePassword2 = false;

  void _emailValidator(String value) {
    setState(() {
      if (value.isEmpty) {
        validateEmail = false;
      }
      else {
        validateEmail = true;
      }
    });
  }
  void _passwordValidator(String value) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{1,99}$';
    RegExp regExp = new RegExp(pattern);
    setState(() {
      if (value.isEmpty) {
        validatePassword = false;
      }
      else if(!regExp.hasMatch(value)) {
        validatePassword = false;
      }
      else {
        validatePassword = true;
      }
    });
  }
  void _password2Validator(String value) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{1,99}$';
    RegExp regExp = new RegExp(pattern);
    setState(() {
      if (value.isEmpty) {
        validatePassword2 = false;
      }
      else if(!regExp.hasMatch(value)) {
        validatePassword2 = false;
      }
      else if (value != _passwordController.text) {
        validatePassword2 = false;
      }
      else {
        validatePassword2 = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          color: Colors.white,
          child: Form(
                key: _formKey,
                onChanged: () {
                  _emailValidator(_emailController.text);
                  _passwordValidator(_passwordController.text);
                  _password2Validator(_password2Controller.text);
                },
                child: ListView(children: [Column(
                  children: <Widget>[
                    SizedBox(height: 90),
                    SizedBox(
                      height: 30.0,
                      child: Text('회원가입', style: TextStyle(color: Color(0xff5a6bff), fontFamily: 'GmarketSans', fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: 40.0),

                    Align(alignment: Alignment.topLeft, child: Text('이메일을 입력해주세요', style: TextStyle(fontFamily: 'GmarketSans', fontSize: 13, fontWeight: FontWeight.w500)),),
                    SizedBox(height: 12.0),
                    Row(children: [
                      Container(
                        width: 296,
                        child: TextFormField(
                          obscureText: false,
                          style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w200),
                          controller: _emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: 'example@gmail.com',
                            hintStyle: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w200),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                      )),
                      validateEmail ? Icon(Icons.done, color: Colors.green) : Icon(Icons.close, color: Colors.red)
                    ]),
                    Divider(color: Colors.black, thickness: 1),

                    SizedBox(height: 40.0),

                    Align(alignment: Alignment.topLeft, child: Text('비밀번호를 입력해주세요', style: TextStyle(fontFamily: 'GmarketSans', fontSize: 13, fontWeight: FontWeight.w500)),),
                    SizedBox(height: 12.0),
                    Row(children: [
                      Container(
                          width: 296,
                          child: TextFormField(
                            obscureText: true,
                            style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w200),
                            controller: _passwordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: '비밀번호를 입력하세요.',
                              hintStyle: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w200),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          )),
                      validatePassword ? Icon(Icons.done, color: Colors.green) : Icon(Icons.close, color: Colors.red)
                    ]),
                    Divider(color: Colors.black, thickness: 1),
                    Align(alignment: Alignment.topLeft, child: Text('숫자,대문자,특수기호를 포함해야합니다.', style: GoogleFonts.notoSans(fontSize: 11, fontWeight: FontWeight.w200, color: Color(0xffc1c1c1))),),

                    SizedBox(height: 40.0),

                    Align(alignment: Alignment.topLeft, child: Text('비밀번호를 다시 한번 입력해주세요', style: TextStyle(fontFamily: 'GmarketSans', fontSize: 13, fontWeight: FontWeight.w500)),),
                    SizedBox(height: 12.0),
                    Row(children: [
                      Container(
                          width: 296,
                          child: TextFormField(
                            obscureText: true,
                            style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w200),
                            controller: _password2Controller,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: '비밀번호를 입력하세요.',
                              hintStyle: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w200),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          )),
                      validatePassword2 ? Icon(Icons.done, color: Colors.green) : Icon(Icons.close, color: Colors.red)
                    ]),
                    Divider(color: Colors.black, thickness: 1),
                    Align(alignment: Alignment.topLeft, child: Text('숫자,대문자,특수기호를 포함해야합니다.', style: GoogleFonts.notoSans(fontSize: 11, fontWeight: FontWeight.w200, color: Color(0xffc1c1c1))),),

                    SizedBox(height: 50.0),
                    BlueButton(
                      width: 194,
                      height:41,
                      onPressed: () {
                        if (validateEmail && validatePassword && validatePassword2) {
                          widget.register(
                            context,
                            _emailController.text,
                            _passwordController.text,
                          );
                        }
                      },
                      text: '회원가입',
                    ),
                  ],
                )]),
              )
        ),
      ),
    );
  }
}