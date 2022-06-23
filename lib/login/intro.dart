import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_up_helper/main.dart';

import 'login_form.dart';

/// This is the stateless widget that the main application instantiates.
class IntroPage extends StatelessWidget {
  IntroPage({required this.appState});

  ApplicationState appState;

  void skip(BuildContext context) {
    appState.state = 'login';
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    controller.addListener(() {
      if (controller.page! > 3) {
        skip(context);
      }
    });
    return Scaffold(
        resizeToAvoidBottomInset : true,
        body: PageView(
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: <Widget>[
              IntroWidget(
                  title: '키 성장에 유전은 20%',
                  text1: '연구 결과에 따르면, 키 성장에 있어',
                  text2: '80%는 후천적 요소들로 결정된다고 해요.',
                  text3: '내 아이를 가장 잘 아는 건 엄마니까.',
                  text4: '아이에 대한 자세하고도 정밀한 문진을 통해',
                  text5: '키모아와 함께 키 크는 습관을 만들어봐요.',
                  imagePath: 'assets/intro1.png',
                  imageLeft: 61,
                  imageWidth: 333,
                  imageHeight: 321,
                  order: 1,),
              IntroWidget(
                  title: '누구나 다 똑같지는 않으니까',
                  text1: '같은 부모님 밑에서 태어나도 첫째, 둘째 다 다른데',
                  text2: '다른 아이들은 어떻겠어요?',
                  text3: '세상에 똑같은 아이들은 없기에.',
                  text4: '아이의 성향, 일과, 취향 등을 파악하여',
                  text5: '최적화된 맞춤 성장법을 추천해드려요.',
                  imagePath: 'assets/intro2.png',
                imageLeft: 35,
                imageWidth: 297,
                imageHeight: 290,
                  order: 2,),
              IntroWidget(
                  title: '공부를 대신 해줄수는 없으니까',
                  text1: '키모아는 철저한 엄마 중심의 관리를 지향해요.',
                  text2: '건강하고 좋은 습관을 유지하고 싶어도',
                  text3: '이미 바쁜 아이들에겐 스트레스가 될 수 있어요.',
                  text4: '아이에게 스트레스가 되지 않게',
                  text5: '엄마 선에서 미리미리 준비해주세요.',
                  imagePath: 'assets/intro3.png',
                imageLeft: 16,
                imageWidth: 362,
                imageHeight: 281,
                  order: 3,),
              IntroWidget(
                  title: '최선에 기준이 어딨겠어요?',
                  text1: '엄마들은 아이들을 위해 늘 최선을 다하죠.',
                  text2: '엄마들 각자에 있어 최선의 양은 다 다르지만',
                  text3: '그 최선을 위한 엄마의 노력을 알기에.',
                  text4: '키모아와 함께 목표 관리 시간과 키 설정으로',
                  text5: '나의 가장 최선을 다해봐요.',
                  imagePath: 'assets/intro4.png',
                imageLeft: 61,
                imageWidth: 327,
                imageHeight: 302,
                  order: 4,),
              IntroWidget(
                title: '최선에 기준이 어딨겠어요?',
                text1: '엄마들은 아이들을 위해 늘 최선을 다하죠.',
                text2: '엄마들 각자에 있어 최선의 양은 다 다르지만',
                text3: '그 최선을 위한 엄마의 노력을 알기에.',
                text4: '키모아와 함께 목표 관리 시간과 키 설정으로',
                text5: '나의 가장 최선을 다해봐요.',
                imagePath: 'assets/intro4.png',
                imageLeft: 61,
                imageWidth: 327,
                imageHeight: 302,
                order: 5,),
            ]
        )
    );
  }
}

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    required this.title, required this.text1, required this.text2,
    required this.text3, required this.text4, required this.text5,
    required this.imagePath, required this.order, required this.imageLeft,
    required this.imageWidth, required this.imageHeight
  });

  final String title;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String imagePath;
  final int order;
  final double imageLeft;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) =>
      Container(
          color: Colors.white,
          child: ListView(children:[Column(
            children: [
              SizedBox(height: 100.0),
              Container(
                height:330,
                  child:
              Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                SizedBox(width:imageLeft),
                    Image.asset(imagePath, width:imageWidth, height:imageHeight)
              ])),
              SizedBox(height: 15.0),
              Text(title, style: TextStyle(fontSize: 23, color: Color(0xFF5653FF), fontFamily: 'GmarketSans', fontWeight: FontWeight.w500)),
              SizedBox(height: 34.0),
              Text(text1, style: GoogleFonts.notoSans(color: Color(0xff59597c), fontSize: 15, fontWeight: FontWeight.w200)),
              SizedBox(height: 5.0),
              Text(text2, style: GoogleFonts.notoSans(color: Color(0xff59597c), fontSize: 15, fontWeight: FontWeight.w200)),
              SizedBox(height: 5.0),
              Text(text3, style: GoogleFonts.notoSans(color: Color(0xff59597c), fontSize: 15, fontWeight: FontWeight.w200)),
              SizedBox(height: 5.0),
              Text(text4, style: GoogleFonts.notoSans(color: Color(0xff59597c), fontSize: 15, fontWeight: FontWeight.w200)),
              SizedBox(height: 5.0),
              Text(text5, style: GoogleFonts.notoSans(color: Color(0xff59597c), fontSize: 15, fontWeight: FontWeight.w200)),
              SizedBox(height: 97.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: order == 1? 25.0 : 10.0,
                        height: 10.0,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: order == 1 ? Color(0xFF5653FF) : Color(0xFFC4C4C4))),
                    SizedBox(width: 10.0),
                    Container(width: order == 2? 25.0 : 10.0,
                        height: 10.0,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: order == 2 ? Color(0xFF5653FF) : Color(0xFFC4C4C4))),
                    SizedBox(width: 10.0),
                    Container(width: order == 3? 25.0 : 10.0,
                        height: 10.0,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: order == 3 ? Color(0xFF5653FF) : Color(0xFFC4C4C4))),
                    SizedBox(width: 10.0),
                    Container(width: order == 4? 25.0 : 10.0,
                        height: 10.0,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: order == 4 ? Color(0xFF5653FF) : Color(0xFFC4C4C4))),
                  ]
              )
            ],
          )])
      );
}