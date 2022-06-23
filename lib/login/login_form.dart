import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'login_widgets.dart';

class LoginForm extends StatefulWidget {
  LoginForm({required this.appState});

  ApplicationState appState;

  void login(BuildContext context, String email, String password) {
    appState.signInWithEmailAndPassword(email, password, (e) => showErrorDialog(context, '로그인 실패', e));
  }

  void startRegister() {
    appState.state = 'register';
  }

  void findIdPw() {
    return;
  }

  void cancel() {
    appState.state = 'loggedOut';
  }

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_LoginFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailValidator(String value) {
    if (value.isEmpty) {
      return '이메일을 입력하세요!';
    }
    else {
      return null;
    }
  }
  String? _passwordValidator(String value) {
    if (value.isEmpty) {
      return '비밀번호를 입력하세요!';
    }
    else {
      return null;
    }
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
              child: ListView(children: [Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height:171),
                  SizedBox(
                    height: 126.98,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 86.0),
                  LoginField('아이디', _emailController, _emailValidator),
                  SizedBox(height: 30.0),
                  TextFormField(
                      obscureText: true,
                      style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w200),
                      controller: _passwordController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: '비밀번호',
                          hintStyle: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w200)
                      ),
                      validator: (value) {
                        return _passwordValidator(value!);
                      }
                  ),
                  SizedBox(height: 58.0),
                  BlueButton(
                    width: 194,
                    height: 41,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.login(
                          context,
                          _emailController.text,
                          _passwordController.text,
                        );
                      }
                    },
                    text: '로그인',
                  ),
                  SizedBox(
                    height: 21.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: widget.findIdPw,
                        child: Text('ID/비밀번호 찾기', style: GoogleFonts.notoSans(fontSize: 15, color: Colors.transparent, fontWeight: FontWeight.w400,
                          shadows: [
                            Shadow(offset: Offset(0, -5), color: Colors.black)
                          ],)),
                      ),
                      MaterialButton(
                        onPressed: widget.startRegister,
                        child: Text('회원가입', style: GoogleFonts.notoSans(fontSize: 15, color: Colors.transparent, fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline, decorationColor: Colors.black, shadows: [
                            Shadow(offset: Offset(0, -5), color: Colors.black)
                          ],)),
                      ),
                    ],
                  ),
                ],
              )]),
          ),
        ),
      ),
    );
  }
}