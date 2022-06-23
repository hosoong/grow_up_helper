import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileField extends StatelessWidget {
  const ProfileField(this.hint, this.controller, this.validator, this.enabled, this.center);
  final String hint;
  final TextEditingController controller;
  final String? Function(String value) validator;
  final bool center;
  final bool enabled;

  @override
  Widget build(BuildContext context) => Container(
      width: 233,
      child:TextFormField(
        obscureText: false,
        style: GoogleFonts.notoSans(fontSize: 13.0, fontWeight: FontWeight.w400),
        enabled: this.enabled,
        onChanged: this.validator,
        controller: this.controller,
        decoration: InputDecoration(
          //contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: this.hint,
            errorMaxLines: 2,
            errorStyle: TextStyle(fontSize: 12)
        ),
        validator: (value) {
          return this.validator(value!);
        },
        textAlign: this.center ? TextAlign.center : TextAlign.left,
      )
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

class BlueButton2 extends StatelessWidget {
  const BlueButton2({required this.text, required this.width, required this.height, required this.onPressed});
  final String text;
  final double width;
  final double height;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(20.0),
    color: Color(0xFF5A6BFF),
    child: MaterialButton(
        minWidth: width,
        height: height,
        padding: EdgeInsets.all(0),
        onPressed: this.onPressed,
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'GmarketSans', fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white))
    ),
  );
}

class WhiteButton extends StatelessWidget {
  const WhiteButton({required this.text, required this.width, required this.height, required this.onPressed});
  final String text;
  final double width;
  final double height;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.white,
    child: MaterialButton(
        minWidth: width,
        height: height,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: this.onPressed,
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14.37, fontWeight: FontWeight.w500, color: Color(0xFF5A6BFF)))
    ),
  );
}

class WhiteButton2 extends StatelessWidget {
  const WhiteButton2({required this.text, required this.width, required this.height, required this.onPressed});
  final String text;
  final double width;
  final double height;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.white,
    child: MaterialButton(
        minWidth: width,
        height: height,
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        onPressed: this.onPressed,
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'GmarketSans', fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF5A6BFF)))
    ),
  );
}

class TitleText extends StatelessWidget {
  const TitleText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.center,
      child: Text(
          this.text,
          style: TextStyle(color: Color(0xff5653ff), fontFamily: 'gmarketSans', fontSize: 18, fontWeight: FontWeight.w500)
      )
  );
}

class QuestionText extends StatelessWidget {
  const QuestionText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.centerLeft,
      child: Text(
          this.text,
          style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 16, fontWeight: FontWeight.w500)
      )
  );
}

class ProgressBar extends StatelessWidget {
  const ProgressBar(this.width);
  final double width;

  Widget build(BuildContext context) =>
      Stack(children: [
        Container(width: 97, height: 5, child:
        DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xffd2d9da),
              borderRadius: BorderRadius.circular(5),
            )
        )
        ),
        Container(width: this.width, height: 5, child:
        DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xff5653ff),
              borderRadius: BorderRadius.circular(5),
            )
        )
        ),
      ]);
}

class NoText extends StatelessWidget {
  const NoText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.centerLeft,
      child: Text(
          this.text,
          style: GoogleFonts.notoSans(color: Color(0xff858585), fontSize: 11, fontWeight: FontWeight.w500)
      )
  );
}

class JustText extends StatelessWidget {
  const JustText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.centerLeft,
      child: Text(
          this.text,
          style: GoogleFonts.notoSans(color: Color(0xff858585), fontSize: 16, fontWeight: FontWeight.w500)
      )
  );
}

class NotoSansText extends StatelessWidget {
  const NotoSansText(this.text, this.color, this.fontSize, this.fontWeight);
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.center,
      child: Text(
          this.text,
          style: GoogleFonts.notoSans(color: Color(0xff59597c), fontSize: fontSize, fontWeight: fontWeight)
      )
  );
}

class AdditionalText extends StatelessWidget {
  const AdditionalText(this.text);
  final String text;

  Widget build(BuildContext context) => Align(
      alignment: Alignment.centerLeft,
      child: Container(padding: EdgeInsets.only(left:20), child: Text(this.text, style: GoogleFonts.notoSans(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xff858585)))));
}

class OptionText extends StatelessWidget {
  const OptionText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.centerLeft,
      child: Text(
          this.text,
          style: GoogleFonts.notoSans(color: Color(0xff59597c), fontSize: 12, fontWeight: FontWeight.w500)
      )
  );
}

class ScoreCircle extends StatelessWidget {
  const ScoreCircle(this.score, this.color);
  final int score;
  final Color color;

  @override
  Widget build(BuildContext context) => CircularPercentIndicator(
    radius: 85.0,
    lineWidth: 5.0,
    percent: score/100,
    center: Text.rich(TextSpan(style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15), children: [
      TextSpan(text: score.toString(), style: TextStyle(fontSize:23, fontWeight: FontWeight.bold)),
      TextSpan(text: '점', style: TextStyle(fontSize:7, fontWeight: FontWeight.bold)),
    ])),
    progressColor: color,
    backgroundColor: Color(0xfff6f6f6),
  );
}

class ScoreCircle2 extends StatelessWidget {
  const ScoreCircle2(this.score, this.score2, this.color);
  final int score;
  final int score2;
  final Color color;

  @override
  Widget build(BuildContext context) => CircularPercentIndicator(
    radius: 85.0,
    lineWidth: 5.0,
    percent: score/100,
    center: Text.rich(TextSpan(style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15), children: [
      TextSpan(text: score2.toString(), style: TextStyle(fontSize:23, fontWeight: FontWeight.bold)),
      TextSpan(text: '개', style: TextStyle(fontSize:7, fontWeight: FontWeight.bold)),
    ])),
    progressColor: color,
    backgroundColor: Color(0xfff6f6f6),
  );
}

class CommentListBox extends StatefulWidget {
  CommentListBox(this.problems);

  List<Widget> problems = [];

  State createState() => CommentListBoxState();
}

class CommentListBoxState extends State<CommentListBox> {
  void initState() {
    super.initState();
    problems = widget.problems;
  }

  List<Widget> problems = [];

  int currentIndex = 0;
  CarouselController sliderController = CarouselController();

  @override
  Widget build(BuildContext context) => Container(width: 245, height:140,
      child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.05), blurRadius: 22)]),
          child: Row(children:
          [
            Container(
                width: 30,
                child: Visibility(
                    visible: currentIndex != 0,
                    child: MaterialButton(
                        onPressed: () => sliderController.previousPage(
                            duration: Duration(milliseconds: 300), curve: Curves.linear),
                        child: Icon(Icons.keyboard_arrow_left, color: Color(0xffa6a6c7), textDirection: TextDirection.ltr)
                    )
                )
            ),

            Container(width: 185,
            height:300,
                child: CarouselSlider(
                    items: problems,
                    carouselController: sliderController,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        enableInfiniteScroll: false,
                        aspectRatio: 2.0,
                        initialPage: 0,
                        onPageChanged: (int value, z) {
                          setState(() {
                            currentIndex = value;
                          });
                        }
                    ))),

            Container(width: 30,
                child: Visibility(
                    visible: currentIndex < problems.length-1,
                    child: MaterialButton(
                        onPressed: () => sliderController.nextPage(
                            duration: Duration(milliseconds: 300), curve: Curves.linear),
                        child: Icon(Icons.keyboard_arrow_right, color: Color(0xffa6a6c7), textDirection: TextDirection.rtl)
                    )
                )
            ),
          ])
      )
  );
}


class DropDown extends StatefulWidget {
  DropDown({required this.hint, required this.key, required this.value, required this.enabled, required this.validator, required this.items, required this.width}) : super(key: key);

  Key key;
  String hint;
  List<String> items;
  double width;
  String? value;
  bool enabled;
  final String? Function(String? value) validator;

  State createState() => DropDownState();
}

class DropDownState extends State<DropDown> {
  String? _value;
  String? get value => _value;
  set value (String? value) {
    _value = value;
  }

  bool _enabled = true;
  bool get enabled => _enabled;
  set enabled (bool enabled) {
    _enabled = enabled;
  }

  void initState() {
    super.initState();
    _value = widget.value;
    _enabled = widget.enabled;
  }

  @override
  Widget build(BuildContext context) => Container(
      width: widget.width,
      child: DropdownButtonFormField(
        isExpanded: true,
        validator: widget.validator,
        value: _value,
        items: widget.items.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Container(width: widget.width, child: Padding(padding: EdgeInsets.only(left: widget.width*0.1), child:Text(value, style: GoogleFonts.notoSans(color: Color(0xff59597c), fontWeight: FontWeight.w500, fontSize: 13.0), textAlign: TextAlign.center))),
          );
        }).toList(),
        hint: Container(width: widget.width, child: Padding(padding: EdgeInsets.only(left: widget.width*0.1), child: Text(widget.hint, style: GoogleFonts.notoSans(color: Color(0xffc1c1c1), fontSize: 13.0), textAlign: TextAlign.center))),
        onChanged: !_enabled ? null : (value) {
            setState(() {
              _value = value as String;
            });
        },
      )
  );
}

class SurveyField extends StatelessWidget {
  const SurveyField(this.hint, this.controller, this.validator, this.enabled, this.center);
  final String hint;
  final TextEditingController controller;
  final String? Function(String value) validator;
  final bool center;
  final bool enabled;

  @override
  Widget build(BuildContext context) => Container(
      child:TextFormField(
        obscureText: false,
        style: TextStyle(color: Color(0xff59597c), fontWeight: FontWeight.w500, fontFamily: 'gmarketSans', fontSize: 13.0),
        enabled: this.enabled,
        onChanged: this.validator,
        controller: this.controller,
        decoration: InputDecoration(
            hintText: this.hint,
            hintStyle: TextStyle(color: Color(0xffc1c1c1), fontFamily: 'gmarketSans', fontSize: 13.0),
            errorMaxLines: 2,
            errorStyle: TextStyle(fontSize: 12)
        ),
        validator: (value) {
          return this.validator(value!);
          },
        textAlign: this.center ? TextAlign.center : TextAlign.left,
      )
  );
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Color(0xFF9E9E9E),
    child: MaterialButton(
      //minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: this.onPressed,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0).copyWith(
              color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );
}

class AlertPopup extends StatelessWidget {
  AlertPopup();

  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      '실패',
      style: const TextStyle(fontFamily: 'gmarketSans', fontSize: 24),
    ),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(
            '모든 항목을 제대로 입력해 주세요.',
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
}

String? defaultValidator(String? value) {
  if (value == null || value.isEmpty) {
    return '';
    //return '값을 입력하세요!';
  }
  else {
    return null;
  }
}

String? numberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return '';
    //return '값을 입력하세요!';
  }
  else if (double.tryParse(value) == null) {
    return '';
    //return '잘못된 값이 입력되었습니다!';
  }
  else {
    return null;
  }
}

