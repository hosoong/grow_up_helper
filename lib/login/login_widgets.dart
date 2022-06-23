import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginField extends StatelessWidget {
  const LoginField(this.hint, this.controller, this.validator);
  final String hint;
  final TextEditingController controller;
  final String? Function(String value) validator;

  @override
  Widget build(BuildContext context) => TextFormField(
      obscureText: false,
      style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w200),
      controller: this.controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: this.hint,
          hintStyle: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w200),
      ),
      validator: (value) {
        return validator(value!);
      }
  );
}

class BlueButton extends StatelessWidget {
  const BlueButton({required this.text, required this.width, required this.height, required this.onPressed});
  final String text;
  final double width;
  final double height;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Color(0xFF5A6BFF),
    child: MaterialButton(
      minWidth: width,
      height: height,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: this.onPressed,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14.37, fontWeight: FontWeight.w500, color: Colors.white))
    ),
  );
}

void showErrorDialog(BuildContext context, String title, Exception e) {
  String message = '${(e as dynamic).message}';
  if (message == 'The email address is badly formatted.') {
    message = '이메일 형식이 맞지 않습니다.';
  }
  else if (message == 'The email address is already in use by another account.') {
    message = '이미 사용 중인 이메일입니다.';
  }
  else if (message == 'There is no user record corresponding to this identifier. The user may have been deleted.') {
    message = '등록되지 않은 이메일입니다.';
  }
  else if (message == 'The password is invalid or the user does not have a password.') {
    message = '비밀번호가 틀렸습니다.';
  }

  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(fontFamily: 'gmarketSans', fontSize: 24),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                message,
                style: GoogleFonts.notoSans(fontSize: 18),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(child:BlueButton(
            width: 194,
            height: 41,
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'OK',
          )),
        ],
      );
    },
  );
}