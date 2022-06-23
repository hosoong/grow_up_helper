import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'survey_widgets.dart';

class SurveyResultPage2IntroText extends StatelessWidget {
  const SurveyResultPage2IntroText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.center,
      child: Text(
          this.text,
          style: GoogleFonts.notoSans(color: Color(0xff59597c), fontSize: 15, fontWeight: FontWeight.w200)
      )
  );
}

class SurveyResultPage2Intro extends StatelessWidget {
  SurveyResultPage2Intro({required this.appState});

  ApplicationState appState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : true,
        body: Container(
            color: Colors.white,
            child: Center(
                child: Column(
                    children: [
                      SizedBox(height: 230),
                      Text('수고하셨어요!', style: TextStyle(color: Color(0xff5653ff), fontFamily: 'gmarketSans', fontSize: 23, fontWeight: FontWeight.w500)),
                      SizedBox(height: 30),
                      SurveyResultPage2IntroText('모든 설문을 마치셨습니다.'),
                      SizedBox(height: 5),
                      SurveyResultPage2IntroText('입력해주신 정보를 기반으로'),
                      SizedBox(height: 5),
                      SurveyResultPage2IntroText('자녀의 키 성장 결과를 분석 중입니다.'),
                      SizedBox(height: 5),
                      SurveyResultPage2IntroText('잠시만 기다려주세요.'),
                      SizedBox(height: 50),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WhiteButton(
                              width:128,
                              height:38,
                              text: '이전 단계로',
                              onPressed: () {
                                appState.state = 'survey9';
                              }
                            ),
                            SizedBox(width:15),
                            BlueButton(
                                width:128,
                                height:41,
                                text: '결과 보기',

                                onPressed: () {
                                  appState.state = 'surveyResult2';
                                }
                            ),
                          ]
                      ),
                    ]
                )
            )
        )
    );
  }
}




