// backend
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

// login
import 'login/intro.dart';
import 'login/login_form.dart';
import 'login/register_form.dart';
import 'login/logout.dart';

// survey
import 'survey/profile.dart';
import 'survey/survey1.dart';
import 'survey/survey2.dart';
import 'survey/survey3.dart';
import 'survey/survey4.dart';
import 'survey/survey5.dart';
import 'survey/survey6.dart';
import 'survey/survey_result.dart';
import 'survey/survey7.dart';
import 'survey/survey8.dart';
import 'survey/survey9.dart';
import 'survey/survey_result2_intro.dart';
import 'survey/survey_result2.dart';
import 'survey/goal_setting.dart';

// payment
import 'payment/payment1.dart';
import 'payment/payment2.dart';
import 'payment/payment3.dart';
import 'payment/device_register.dart';

// home
import 'home/home-alarm.dart';
import 'home/home.dart';
// management
import 'management/nutrient.dart';
import 'management/nutrient_saved_menu.dart';
import 'management/sleep.dart';
import 'management/exercise.dart';
import 'management/measure_height.dart';
import 'management/measure_height_api.dart';
import 'management/measure_height_result.dart';
import 'management/measure_height_post.dart';
import 'management/measure_height_posted.dart';
// history
import 'history/history.dart';
// community
import 'community/home.dart';
import 'community/posted.dart';
import 'community/board.dart';
import 'community/post.dart';
// mypage
import 'mypage/mypage.dart';
import 'mypage/profile.dart';
import 'mypage/setting.dart';


void main() {
  // Modify from here
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) =>
          MaterialApp(
            home: Consumer<ApplicationState>(
                builder: (context, appState, _) => InitPage()
            )
          ),
    ),
  );
  // to here.
}

class InitPage extends StatefulWidget {
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () =>
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LandingPage())
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
        child: SizedBox(
            width: 116.37,
            height: 126.01,
            child: Image(image: AssetImage('assets/logo.png'), fit: BoxFit.fill)
        )
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'grow up helper',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
      home:
          Consumer<ApplicationState>(
            builder: (context, appState, _) {
              switch (appState.state) {
                //login
                case 'loggedOut':
                  return IntroPage(appState: appState);
                case 'login':
                  return LoginForm(appState: appState);
                case 'register':
                  return RegisterForm(appState: appState);

                //survey1
                case 'profile':
                  return ProfilePage(appState: appState);
                case 'survey1intro':
                  return SurveyPage1Intro(appState: appState);
                case 'survey1':
                  return SurveyPage1(appState: appState);
                case 'survey2':
                  return SurveyPage2(appState: appState);
                case 'survey3intro':
                  return SurveyPage3Intro(appState: appState);
                case 'survey3':
                  return SurveyPage3(appState: appState);
                case 'survey4':
                  return SurveyPage4(appState: appState);
                case 'survey5':
                  return SurveyPage5(appState: appState);
                case 'survey6':
                  return SurveyPage6(appState: appState);
                case 'surveyResult':
                  return SurveyResultPage(appState: appState);

                //payment
                case 'payment1':
                  return PaymentPage1(appState: appState);
                case 'payment2':
                  return PaymentPage2(appState: appState);
                case 'payment3':
                  return PaymentPage3(appState: appState);

                //survey2
                case 'survey7intro':
                  return SurveyPage7Intro(appState: appState);
                case 'survey7':
                  return SurveyPage7(appState: appState);
                case 'survey8':
                  return SurveyPage8(appState: appState);
                case 'survey9':
                  return SurveyPage9(appState: appState);
                case 'surveyResult2intro':
                  return SurveyResultPage2Intro(appState: appState);
                case 'surveyResult2':
                  return SurveyResultPage2(appState: appState);
                case 'goalSetting':
                  return GoalSettingPage(appState: appState);
                case 'deviceRegister':
                  return DeviceRegisterPage(appState: appState);

                //home
                case 'home':
                  return HomePage(appState: appState);
                case 'homeAlarm':
                  return HomeAlarmPage(appState: appState);

                //manage
                case 'manageNutrient':
                  return ManageNutrientPage(appState: appState);
                case 'savedMenu':
                  return SavedMenuPage(appState: appState);
                case 'manageExercise':
                  return ManageExercisePage(appState: appState);
                case 'manageSleep':
                  return ManageSleepPage(appState: appState);
                case 'manageMeasure':
                  return ManageMeasurePage(appState: appState);
                case 'measure':
                  return MeasurePage(appState: appState);
                case 'manageMeasure2':
                  return ManageMeasurePage2(appState: appState);
                case 'manageMeasure3':
                  return ManageMeasurePage3(appState: appState);
                case 'manageMeasure4':
                  return ManageMeasurePage4(appState: appState);

                //history
                case 'historyNutrient':
                  return HistoryNutrientPage(appState: appState);

                //community
                case 'community':
                  return CommunityPage(appState: appState);
                case 'communityExample':
                  return CommunityExamplePage(appState: appState);
                case 'communityGossip':
                  return CommunityGossipPage(appState: appState);
                case 'communityWriting':
                  return CommunityWritingPage(appState: appState);

                //mypage
                case 'mypage':
                  return MypagePage(appState: appState);
                case 'mypageProfile':
                  return MypageProfilePage(appState: appState);
                case 'mypageSetting':
                  return MypageSettingPage(appState: appState);

                case 'logout': //a page with logout button for debugging.
                  return LogoutPage(appState: appState);
                default:
                  return Row(
                    children: const [
                      Text("내부적인 에러 발생.."),
                    ],
                  );
              }
            })
    );
  }
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _userId = user.uid.toString();
        print(_userId);
        // Add from here
        _streamSub = FirebaseFirestore.instance
            .collection('userInfo')
            .doc(_userId)
            .snapshots()
            .listen((snapshot) {
          var data = snapshot.data();
          if (data != null) {
            _userInfo = data;
            print(_userInfo);
            if (!_userInfo.containsKey('phase'))
              _state = 'profile';
            else {
              if (_state == 'loggedOut') {
                _state = _userInfo['phase'];
              }
            }
          }
          else {
            _state = 'profile';
          }
          notifyListeners();
        });
        // To here
      } else {
        _userId = null;
        _userInfo = new Map();
        _state = 'loggedOut';
      }
      notifyListeners();
    });
  }

  late StreamSubscription<DocumentSnapshot> _streamSub;
  StreamSubscription<DocumentSnapshot> get streamSub => _streamSub;

  String? _userId;
  String? get userId => _userId;

  get overallScore => computeOverallScore();
  int computeOverallScore() {
    return ((todoScore + alarmScore + 50) / 3).round();
  }

  get todoScore => computeTodoScore();
  int computeTodoScore() {
    var nutrientTotalCount = nutrientTodoListChecked.length;
    var exerciseTotalCount = exerciseTodoListChecked.length;
    var sleepTotalCount = sleepTodoListChecked.length;

    if ((nutrientTotalCount + exerciseTotalCount + sleepTotalCount) == 0){
      return 100;
    }
    var overallScore = (100*(nutrientTodoCount[0] + exerciseTodoCount[0] + sleepTodoCount[0]) / (nutrientTotalCount + exerciseTotalCount + sleepTotalCount)).round();

    return overallScore;
  }

  get alarmScore => computeAlarmScore();
  int computeAlarmScore() {
    var nutrientTotalCount = nutrientAlarmListChecked.length;
    var exerciseTotalCount = exerciseAlarmListChecked.length;
    var sleepTotalCount = sleepAlarmListChecked.length;

    if ((nutrientTotalCount + exerciseTotalCount + sleepTotalCount) == 0){
      return 100;
    }
    var overallScore = (100*(nutrientAlarmCount[0] + exerciseAlarmCount[0] + sleepAlarmCount[0]) / (nutrientTotalCount + exerciseTotalCount + sleepTotalCount)).round();

    return overallScore;
  }

  var nutrientTodoList = [];
  var exerciseTodoList = [];
  var sleepTodoList = [];

  var nutrientTodoListChecked = [];
  var exerciseTodoListChecked = [];
  var sleepTodoListChecked = [];

  var nutrientTodoCount = [0];
  var exerciseTodoCount = [0];
  var sleepTodoCount = [0];

  var nutrientAlarmList = [];
  var exerciseAlarmList = [];
  var sleepAlarmList = [];

  var nutrientAlarmListChecked = [];
  var exerciseAlarmListChecked = [];
  var sleepAlarmListChecked = [];
  var alarmListChecked = [];

  var nutrientAlarmCount = [0];
  var exerciseAlarmCount = [0];
  var sleepAlarmCount = [0];

  Map _userInfo = new Map();
  Map get userInfo => _userInfo;
  set userInfo(Map userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }

  String _state = 'loggedOut';
  String get state => _state;
  set state(String state) {
    _state = state;
    notifyListeners();
  }

  void notify(){
    notifyListeners();
  }

  void writeDB(Map<String, dynamic> info) {
    FirebaseFirestore.instance.collection('userInfo')
        .doc(userId)
        .set(info, SetOptions(merge: true));
  }

  void setDB(Map<String, dynamic> info) {
    FirebaseFirestore.instance.collection('userInfo')
        .doc(userId)
        .set(info, SetOptions(merge: false));
  }

  void registerAccount(String email, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
          try {
            var credential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(email: email, password: password);
          } on FirebaseAuthException catch (e) {
            errorCallback(e);
          }
  }

  void signInWithEmailAndPassword(
      String email,
      String password,
      void Function(FirebaseAuthException e) errorCallback,
      ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    _state = 'loggedOut';
    notifyListeners();
  }
}



