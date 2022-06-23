import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_widgets.dart';
import 'dart:io';

import '../main.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.appState});

  ApplicationState appState;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _chartData;
  late TooltipBehavior _tooltipBehavior;
  late Color strokeColor;
  var _valueList = [];
  var _selectedValue = '';

  var _sex = '';

  bool expanded = false;
  var todoList2;
  var todoListChecked2;
  var todoCount2;
  var icon2;
  var j;
  var k;

  var deadline = [2230, 2055, 1700, 1530, 1430, 1245, 755, 750];
  var alarmList = [];

  var nutrientAlarmListChecked;
  var sleepAlarmListChecked;
  var exerciseAlarmListChecked;

  bool tooltip = false;

  @override
  void initState() {
    super.initState();

    var hm = int.parse(DateFormat('HHmm').format(DateTime.now()));

    var totalAlarmList = [
      '혜지가 잠에 들 시간이에요.\n조용한 수면 환경을 조성해주세요.',
      '자기 전 혜지와 함께 하루동안의 피곤함을\n풀어보아요. 폼롤러를 이용한 스트레칭 타임!',
      '저녁 메뉴를 고민하실 때에는\n관리 탭의 추천 메뉴도 확인해보세요.',
      '오늘 비타민이 부족해요.\n간식으로 비타민이 풍부한 사과는 어떨까요?',
      '학원가는 길에도 운동할 수 있다는 사실!\n2층 정도는 계단으로 올라가도록 해주세요.',
      '학교에서의 혜지의 활동량을 확인하세요.\n적당한 활동이 중요해요!',
      '오늘 등굣길은 차로 태워주는 것보다\n도보로 조금이라도 같이 걸어보는건 어때요?',
      '혜지가 일어날 시간이에요!\n혜지를 기분좋게 깨워주세요.',
    ];

    // activate alarms
    nutrientAlarmListChecked = [];
    sleepAlarmListChecked = [];
    exerciseAlarmListChecked = [];

    for (var i=0; i<totalAlarmList.length; i++) {
      if (hm > deadline[i]) {
        alarmList.add(totalAlarmList[i]);

        if (i == 2 || i == 3) {
          nutrientAlarmListChecked.add(false);
        }
        else if (i == 0 || i == 7) {
          sleepAlarmListChecked.add(false);
        }
        else {
          exerciseAlarmListChecked.add(false);
        }
      }
    }

    widget.appState.nutrientAlarmListChecked = List.from(nutrientAlarmListChecked);
    widget.appState.sleepAlarmListChecked = List.from(sleepAlarmListChecked);
    widget.appState.exerciseAlarmListChecked = List.from(exerciseAlarmListChecked);

    for (var child in widget.appState.userInfo['children']){
      if(_valueList.indexOf(child['name']) == -1)
        _valueList.add(child['name']);
    }
    var curr = widget.appState.userInfo['activeChildIndex'];
    _selectedValue = widget.appState.userInfo['children'][curr]['name'];
    _sex = widget.appState.userInfo['children'][curr]['sex'];

    j = [];
    k = [];

    _chartData = [
      ['task', widget.appState.todoScore, Color.fromRGBO(177, 123, 247, 1)],
      ['alarm', widget.appState.alarmScore,  Color.fromRGBO(108, 198, 247, 1)],
      ['manageTime', double.parse('50.0'),  Color.fromRGBO(65, 221, 146, 1)],
    ];
    _tooltipBehavior = TooltipBehavior(enable: true);

    Set<String> todoList = new Set();
    List<bool> todoListChecked = [];

    var nutritionProblemsDescription = [
      [],
      [],
      [],
      ['혜지용 식판에 꽉 채워 아침밥 주기', '혜지용 식판에 꽉 채워 저녁밥 주기', '저녁밥을 3/4 그릇 주기'],
      ['혜지용 식판에 꽉 채워 아침밥 주기', '혜지용 식판에 꽉 채워 저녁밥 주기', '저녁밥을 1그릇만 주기', '저녁 식사 후 30분동안 눕지 않고 방 청소 함께하기'],
      ['혜지용 식판에 꽉 채워 아침밥 주기', '혜지용 식판에 꽉 채워 저녁밥 주기', '저녁밥을 1그릇만 주기', '저녁밥 추가로 더 주지 않기'],
      ['오늘 저녁 요리는 저염 소금으로 간 하기', '저녁에 소고기 소금 없이 구워서 주기'],
      ['오늘 저녁 요리는 저염 소금으로 간 하기', '저녁 찌개 국물 끝까지 먹지 않도록 하기'],
      ['혜지가 저녁밥 먹는 시간 20분으로 늘리기', '혜지가 밥을 꼭꼭 씹어먹을 수 있도록 도와주기'],
      ['혜지가 저녁밥 먹는 시간 20분으로 늘리기', '혜지가 밥을 꼭꼭 씹어먹을 수 있도록 도와주기'],

      ['혜지가 저녁밥 먹는 시간 30분 이하로 줄이기', '혜지가 저녁밥 먹을 때 전자기기 사용하지 않도록 하기', '저녁밥 앉은 자리에서 다 먹을 수 있도록 하기', '혜지가 저녁밥 먹을 때 대화 적당히 하기'],
      ['오리모양 사과 깎아주기', '토끼 소세지 도시락 만들기', '아이와 함께 저녁 식사 만들기'],
      ['아이가 좋아하는 음식으로 식사 만들기', '아이가 제자리에서 밥을 먹을 수 있도록 대화 유도하기'],
      ['저녁 식사에 탄수화물, 단백질, 지방이 포함되는 음식 하나씩 넣기', '저녁 식사로 반찬 3개 이상 챙겨주기', '야채류 한가지 필수로 저녁식사에 포함하기', '필수영양소 관련된 강의 영상 1편 시청하기'],
      ['좋아하는 음식을 제외하고 한 번도 챙겨주지 않은 음식 요리해주기', '야채로 만들 수 있는 음식 레시피 영상 1편 이상 찾아서 시청하기', '야채류 한가지 필수로 저녁식사에 포함하기', '저녁 식사 식단에서 국 제외하고 챙겨주기'],
      ['저녁 식단 음식 직접 장보기', '오늘 하루는 외식하지 않기'],
      ['저녁 식단 음식 직접 장보기', '하루동안 배달 어플 들어가지 않기'],
      ['비타민 챙겨먹이기', '반찬 중 하나는 직접 만들어먹이기'],
      ['아이와 함께 패티 만들기', '아이와 함께 도넛 만들기', '아이와 함께 피자 만들기'],
      ['등교 시 물통 챙겨주기', '아이가 비교적 잘 마시는 물 종류 알아보기 (보리차 등)', '혜지가 하루 8컵 이상의 물 마시게 하기'],

      ['혜지 간식 주는 횟수 2회 이하로 제한하기', '과일, 야채, 견과류 위주의 간식 준비하기'],
      ['학원 끝날 4시쯤 혜지가 먹을 간식 준비해놓기 (간식 추천: 아몬드 10알)'],
      ['학원 끝날 4시쯤 혜지가 먹을 간식 준비해놓기 (간식 추천: 아몬드 10알)', '오늘 하루 내내 과자류 섭취하지 않게 하기'],
      ['학원 끝날 4시쯤 혜지가 먹을 간식 준비해놓기 (간식 추천: 아몬드 10알)'],
      ['학원 끝날 4시쯤 혜지가 먹을 간식 준비해놓기 (간식 추천: 사과(중) 1개)'],
      ['아이와 함께 저녁식사하기'],
      ['아이에게 오늘 학교에서 있었던 일 한가지 밥 먹으면서 물어보기'],
      ['혜지와 함께 건강한 간식 먹기 (아몬드 15알)', '오늘은 빵류 간식 먹지 않기'],
      ['가공식품을 사용하지 않은 식사 준비하기', '밀가루를 최대한 지양한 식사 준비하기'],
      ['아이와 당근케익 만들기', '아이와 오이냉국 만들기'],

      ['일정한 식사시간 정하고 그시간에는 아이의 식사부터 챙겨주기']
    ];

    if (widget.appState.nutrientTodoList.isEmpty){
      todoList = new Set();
      todoListChecked = [];

      var activeChild = widget.appState.userInfo['activeChildIndex'];
      var nutritionProblemsIndex = widget.appState.userInfo['children'][activeChild]['nutritionProblemsIndex'];

      //activate problems
      for (var i=3; i<nutritionProblemsIndex.length; i++) {
        if (nutritionProblemsIndex[i]) {
          for (var text in nutritionProblemsDescription[i]) {
            todoList.add(text);
          }
        }
      }

      for (var i=0; i<todoList.length; i++) {
        todoListChecked.add(false);
      }

      widget.appState.nutrientTodoList = List.from(todoList.toList());
      widget.appState.nutrientTodoListChecked = List.from(todoListChecked);
      widget.appState.nutrientTodoCount = List.from([0]);
    }

    var sleepProblemsDescription = [
      ['어플 내 수면 습관 확인하기', '어플 내 수면 정도 확인하기'],
      ['안정적인 수면 환경 조성해주기', '수면 유도 음악 틀어주기', '수면 유도 영상 틀어주기'],
      ['혜지 취침 시간에 외부 소음 차단하기', '혜지 취침 시간에 외부 불빛 차단하기', '혜지 취침 시간에 전자기기 멀리 떨어뜨려놓기'],
      ['일과 없는 4시에 혜지 낮잠 1시간 재우기', '낮잠 잘 때 조용한 환경 조성해주기'],
      ['00 10시 이전에 잠자리에 들게 하기', '10시 이전에 잠자리 환경 만들어주기'],
      ['00가 완전히 잠들기 30분 전에는 스마트폰 이용 자제하도록 교육하기', '00가 푹 잘 수 있도록 암막커튼 설치해주기'],
      ['아이가 잠들 때 까지는 tv소리 끄기', '아이가 잠들기까지 책 읽어주기', '아이가 잠들 때 까지 옆에 있어주기'],
      ['아이 방에 무드등 설치해주기', '아이 방에 가습기 설치 해주기'],
      ['아이가 잠들기까지 책 읽어주기', '아이가 잠들 때까지 옆에 있어주기'],
      ['수면 1시간 전부터 모든 전자기기 침대에서 10걸음 이상 떨어트려놓기'],

      ['아이와 함께 밤 10시 이전에 잠들기', '밤 10시 이후 거실 비우기'],
      ['7시간 이상 푹 자기'],
    ];

    if (widget.appState.sleepTodoList.isEmpty){
      todoList = new Set();
      todoListChecked = [];

      var activeChild = widget.appState.userInfo['activeChildIndex'];
      var sleepProblemsIndex = widget.appState.userInfo['children'][activeChild]['sleepProblemsIndex'];

      //activate problems
      for (var i=0; i<sleepProblemsIndex.length; i++) {
        if (sleepProblemsIndex[i]) {
          for (var text in sleepProblemsDescription[i]) {
            todoList.add(text);
          }
        }
      }

      for (var i=0; i<todoList.length; i++) {
        todoListChecked.add(false);
      }

      widget.appState.sleepTodoList = List.from(todoList.toList());
      widget.appState.sleepTodoListChecked = List.from(todoListChecked);
      widget.appState.sleepTodoCount = List.from([0]);
    }

    var activityProblemsDescription = [
      [''],
      [''],
      [''],
      [''],
      [''],
      ['줄넘기 게임놀이 하기', '신나는 노래와 함께 춤추기', '숨바꼭질 30분이상 하기'],
      ['00와 함께 나가서 줄넘기 100개 뛰기', '00와 함께 운동장 2바퀴 걷기', '00와 함께 분리수거하고 집까지 계단으로 걸어오기', '00와 함께 주말에 수영장 다녀오기'],
      ['혜지랑 집 앞에 산책 나가기', '혜지랑 근처 공원에서 배드민턴 치기'],
      ['목 저항운동 5분 하기', '공부시간에 독서대 사용하도록 하기'],
      ['장시간 앉아있을 때 옳은 자세에 대한 영상 1회 시청하기', '고관절에 좋은 스트레칭 00와 30분동안 함께 하기', '20분 이상 다리를 꼬고 앉아있을 때 00에게 가서 알려주기'],

      ['아이 가방 무게 분산하기', '어깨 스트레칭해주기', '어깨 마사지 해주기'],
      ['정형외과를 방문하여 정밀 검사 받아보기', '병원 처방에 따라 교정 치료 받기', '자기 전 어깨 스트레칭 하기'],
      ['정형외과를 방문하여 정밀 검사 받아보기', '혜지가 책상에 앉아있을 때 자세 확인하기', '자기 전 어깨 스트레칭 하기'],
      ['아침에 일어나 척추 교정 스트레칭 10분 하기', '자기 전 척추 교정 스트레칭 15분 하기', '혜지가 집에서 공부할 때 자세 주기적으로 잡아주기'],
      ['00 공부시간 최대 1시간으로 정해두고 숙제하기', '앉아서 할 수 있는 스트레칭 00와 함께 2회 하기'],
      ['혜지와 30분 동네 산책하기'],
      ['혜지와 30분 동네 산책하기'],
      ['혜지와 함께 주변 공원 가서 1시간 걷기'],
    ];

    if (widget.appState.exerciseTodoList.isEmpty){
      todoList = new Set();
      todoListChecked = [];

      var activeChild = widget.appState.userInfo['activeChildIndex'];
      var activityProblemsIndex = widget.appState.userInfo['children'][activeChild]['activityProblemsIndex'];

      //activate problems
      for (var i=5; i<activityProblemsIndex.length; i++) {
        if (activityProblemsIndex[i]) {
          for (var text in activityProblemsDescription[i]) {
            todoList.add(text);
          }
        }
      }

      for (var i=0; i<todoList.length; i++) {
        todoListChecked.add(false);
      }

      widget.appState.exerciseTodoList = List.from(todoList.toList());
      widget.appState.exerciseTodoListChecked = List.from(todoListChecked);
      widget.appState.exerciseTodoCount = List.from([0]);
    }

    todoList2 = [widget.appState.nutrientTodoList,  widget.appState.sleepTodoList, widget.appState.exerciseTodoList];
    todoListChecked2 = [widget.appState.nutrientTodoListChecked, widget.appState.sleepTodoListChecked, widget.appState.exerciseTodoListChecked];
    todoCount2 = [widget.appState.nutrientTodoCount,  widget.appState.sleepTodoCount, widget.appState.exerciseTodoCount];

  }

  void reset() {
    var hm = int.parse(DateFormat('HHmm').format(DateTime.now()));

    var totalAlarmList = [
      '혜지가 잠에 들 시간이에요.\n조용한 수면 환경을 조성해주세요.',
      '자기 전 혜지와 함께 하루동안의 피곤함을\n풀어보아요. 폼롤러를 이용한 스트레칭 타임!',
      '저녁 메뉴를 고민하실 때에는\n관리 탭의 추천 메뉴도 확인해보세요.',
      '오늘 비타민이 부족해요.\n간식으로 비타민이 풍부한 사과는 어떨까요?',
      '학원가는 길에도 운동할 수 있다는 사실!\n2층 정도는 계단으로 올라가도록 해주세요.',
      '학교에서의 혜지의 활동량을 확인하세요.\n적당한 활동이 중요해요!',
      '오늘 등굣길은 차로 태워주는 것보다\n도보로 조금이라도 같이 걸어보는건 어때요?',
      '혜지가 일어날 시간이에요!\n혜지를 기분좋게 깨워주세요.',
    ];

    // activate alarms
    nutrientAlarmListChecked = [];
    sleepAlarmListChecked = [];
    exerciseAlarmListChecked = [];

    for (var i=0; i<totalAlarmList.length; i++) {
      if (hm > deadline[i]) {
        alarmList.add(totalAlarmList[i]);

        if (i == 2 || i == 3) {
          nutrientAlarmListChecked.add(false);
        }
        else if (i == 0 || i == 7) {
          sleepAlarmListChecked.add(false);
        }
        else {
          exerciseAlarmListChecked.add(false);
        }
      }
    }

    widget.appState.nutrientAlarmListChecked = List.from(nutrientAlarmListChecked);
    widget.appState.sleepAlarmListChecked = List.from(sleepAlarmListChecked);
    widget.appState.exerciseAlarmListChecked = List.from(exerciseAlarmListChecked);

    for (var child in widget.appState.userInfo['children']){
      if(_valueList.indexOf(child['name']) == -1)
        _valueList.add(child['name']);
    }
    var curr = widget.appState.userInfo['activeChildIndex'];
    _selectedValue = widget.appState.userInfo['children'][curr]['name'];
    _sex = widget.appState.userInfo['children'][curr]['sex'];

    j = [];
    k = [];

    _chartData = [
      ['task', widget.appState.todoScore, Color.fromRGBO(177, 123, 247, 1)],
      ['alarm', widget.appState.alarmScore,  Color.fromRGBO(108, 198, 247, 1)],
      ['manageTime', double.parse('50.0'),  Color.fromRGBO(65, 221, 146, 1)],
    ];
    _tooltipBehavior = TooltipBehavior(enable: true);

    Set<String> todoList = new Set();
    List<bool> todoListChecked = [];

    var nutritionProblemsDescription = [
      [],
      [],
      [],
      ['혜지용 식판에 꽉 채워 아침밥 주기', '혜지용 식판에 꽉 채워 저녁밥 주기', '저녁밥을 3/4 그릇 주기'],
      ['혜지용 식판에 꽉 채워 아침밥 주기', '혜지용 식판에 꽉 채워 저녁밥 주기', '저녁밥을 1그릇만 주기', '저녁 식사 후 30분동안 눕지 않고 방 청소 함께하기'],
      ['혜지용 식판에 꽉 채워 아침밥 주기', '혜지용 식판에 꽉 채워 저녁밥 주기', '저녁밥을 1그릇만 주기', '저녁밥 추가로 더 주지 않기'],
      ['오늘 저녁 요리는 저염 소금으로 간 하기', '저녁에 소고기 소금 없이 구워서 주기'],
      ['오늘 저녁 요리는 저염 소금으로 간 하기', '저녁 찌개 국물 끝까지 먹지 않도록 하기'],
      ['혜지가 저녁밥 먹는 시간 20분으로 늘리기', '혜지가 밥을 꼭꼭 씹어먹을 수 있도록 도와주기'],
      ['혜지가 저녁밥 먹는 시간 20분으로 늘리기', '혜지가 밥을 꼭꼭 씹어먹을 수 있도록 도와주기'],

      ['혜지가 저녁밥 먹는 시간 30분 이하로 줄이기', '혜지가 저녁밥 먹을 때 전자기기 사용하지 않도록 하기', '저녁밥 앉은 자리에서 다 먹을 수 있도록 하기', '혜지가 저녁밥 먹을 때 대화 적당히 하기'],
      ['오리모양 사과 깎아주기', '토끼 소세지 도시락 만들기', '아이와 함께 저녁 식사 만들기'],
      ['아이가 좋아하는 음식으로 식사 만들기', '아이가 제자리에서 밥을 먹을 수 있도록 대화 유도하기'],
      ['저녁 식사에 탄수화물, 단백질, 지방이 포함되는 음식 하나씩 넣기', '저녁 식사로 반찬 3개 이상 챙겨주기', '야채류 한가지 필수로 저녁식사에 포함하기', '필수영양소 관련된 강의 영상 1편 시청하기'],
      ['좋아하는 음식을 제외하고 한 번도 챙겨주지 않은 음식 요리해주기', '야채로 만들 수 있는 음식 레시피 영상 1편 이상 찾아서 시청하기', '야채류 한가지 필수로 저녁식사에 포함하기', '저녁 식사 식단에서 국 제외하고 챙겨주기'],
      ['저녁 식단 음식 직접 장보기', '오늘 하루는 외식하지 않기'],
      ['저녁 식단 음식 직접 장보기', '하루동안 배달 어플 들어가지 않기'],
      ['비타민 챙겨먹이기', '반찬 중 하나는 직접 만들어먹이기'],
      ['아이와 함께 패티 만들기', '아이와 함께 도넛 만들기', '아이와 함께 피자 만들기'],
      ['등교 시 물통 챙겨주기', '아이가 비교적 잘 마시는 물 종류 알아보기 (보리차 등)', '혜지가 하루 8컵 이상의 물 마시게 하기'],

      ['혜지 간식 주는 횟수 2회 이하로 제한하기', '과일, 야채, 견과류 위주의 간식 준비하기'],
      ['학원 끝날 4시쯤 혜지가 먹을 간식 준비해놓기 (간식 추천: 아몬드 10알)'],
      ['학원 끝날 4시쯤 혜지가 먹을 간식 준비해놓기 (간식 추천: 아몬드 10알)', '오늘 하루 내내 과자류 섭취하지 않게 하기'],
      ['학원 끝날 4시쯤 혜지가 먹을 간식 준비해놓기 (간식 추천: 아몬드 10알)'],
      ['학원 끝날 4시쯤 혜지가 먹을 간식 준비해놓기 (간식 추천: 사과(중) 1개)'],
      ['아이와 함께 저녁식사하기'],
      ['아이에게 오늘 학교에서 있었던 일 한가지 밥 먹으면서 물어보기'],
      ['혜지와 함께 건강한 간식 먹기 (아몬드 15알)', '오늘은 빵류 간식 먹지 않기'],
      ['가공식품을 사용하지 않은 식사 준비하기', '밀가루를 최대한 지양한 식사 준비하기'],
      ['아이와 당근케익 만들기', '아이와 오이냉국 만들기'],

      ['일정한 식사시간 정하고 그시간에는 아이의 식사부터 챙겨주기']
    ];

    if (true){
      todoList = new Set();
      todoListChecked = [];

      var activeChild = widget.appState.userInfo['activeChildIndex'];
      var nutritionProblemsIndex = widget.appState.userInfo['children'][activeChild]['nutritionProblemsIndex'];

      //activate problems
      for (var i=3; i<nutritionProblemsIndex.length; i++) {
        if (nutritionProblemsIndex[i]) {
          for (var text in nutritionProblemsDescription[i]) {
            todoList.add(text);
          }
        }
      }

      for (var i=0; i<todoList.length; i++) {
        todoListChecked.add(false);
      }

      widget.appState.nutrientTodoList = List.from(todoList.toList());
      widget.appState.nutrientTodoListChecked = List.from(todoListChecked);
      widget.appState.nutrientTodoCount = List.from([0]);
    }

    var sleepProblemsDescription = [
      ['어플 내 수면 습관 확인하기', '어플 내 수면 정도 확인하기'],
      ['안정적인 수면 환경 조성해주기', '수면 유도 음악 틀어주기', '수면 유도 영상 틀어주기'],
      ['혜지 취침 시간에 외부 소음 차단하기', '혜지 취침 시간에 외부 불빛 차단하기', '혜지 취침 시간에 전자기기 멀리 떨어뜨려놓기'],
      ['일과 없는 4시에 혜지 낮잠 1시간 재우기', '낮잠 잘 때 조용한 환경 조성해주기'],
      ['00 10시 이전에 잠자리에 들게 하기', '10시 이전에 잠자리 환경 만들어주기'],
      ['00가 완전히 잠들기 30분 전에는 스마트폰 이용 자제하도록 교육하기', '00가 푹 잘 수 있도록 암막커튼 설치해주기'],
      ['아이가 잠들 때 까지는 tv소리 끄기', '아이가 잠들기까지 책 읽어주기', '아이가 잠들 때 까지 옆에 있어주기'],
      ['아이 방에 무드등 설치해주기', '아이 방에 가습기 설치 해주기'],
      ['아이가 잠들기까지 책 읽어주기', '아이가 잠들 때까지 옆에 있어주기'],
      ['수면 1시간 전부터 모든 전자기기 침대에서 10걸음 이상 떨어트려놓기'],

      ['아이와 함께 밤 10시 이전에 잠들기', '밤 10시 이후 거실 비우기'],
      ['7시간 이상 푹 자기'],
    ];

    if (true){
      todoList = new Set();
      todoListChecked = [];

      var activeChild = widget.appState.userInfo['activeChildIndex'];
      var sleepProblemsIndex = widget.appState.userInfo['children'][activeChild]['sleepProblemsIndex'];

      //activate problems
      for (var i=0; i<sleepProblemsIndex.length; i++) {
        if (sleepProblemsIndex[i]) {
          for (var text in sleepProblemsDescription[i]) {
            todoList.add(text);
          }
        }
      }

      for (var i=0; i<todoList.length; i++) {
        todoListChecked.add(false);
      }

      widget.appState.sleepTodoList = List.from(todoList.toList());
      widget.appState.sleepTodoListChecked = List.from(todoListChecked);
      widget.appState.sleepTodoCount = List.from([0]);
    }

    var activityProblemsDescription = [
      [''],
      [''],
      [''],
      [''],
      [''],
      ['줄넘기 게임놀이 하기', '신나는 노래와 함께 춤추기', '숨바꼭질 30분이상 하기'],
      ['00와 함께 나가서 줄넘기 100개 뛰기', '00와 함께 운동장 2바퀴 걷기', '00와 함께 분리수거하고 집까지 계단으로 걸어오기', '00와 함께 주말에 수영장 다녀오기'],
      ['혜지랑 집 앞에 산책 나가기', '혜지랑 근처 공원에서 배드민턴 치기'],
      ['목 저항운동 5분 하기', '공부시간에 독서대 사용하도록 하기'],
      ['장시간 앉아있을 때 옳은 자세에 대한 영상 1회 시청하기', '고관절에 좋은 스트레칭 00와 30분동안 함께 하기', '20분 이상 다리를 꼬고 앉아있을 때 00에게 가서 알려주기'],

      ['아이 가방 무게 분산하기', '어깨 스트레칭해주기', '어깨 마사지 해주기'],
      ['정형외과를 방문하여 정밀 검사 받아보기', '병원 처방에 따라 교정 치료 받기', '자기 전 어깨 스트레칭 하기'],
      ['정형외과를 방문하여 정밀 검사 받아보기', '혜지가 책상에 앉아있을 때 자세 확인하기', '자기 전 어깨 스트레칭 하기'],
      ['아침에 일어나 척추 교정 스트레칭 10분 하기', '자기 전 척추 교정 스트레칭 15분 하기', '혜지가 집에서 공부할 때 자세 주기적으로 잡아주기'],
      ['00 공부시간 최대 1시간으로 정해두고 숙제하기', '앉아서 할 수 있는 스트레칭 00와 함께 2회 하기'],
      ['혜지와 30분 동네 산책하기'],
      ['혜지와 30분 동네 산책하기'],
      ['혜지와 함께 주변 공원 가서 1시간 걷기'],
    ];

    if (true){
      todoList = new Set();
      todoListChecked = [];

      var activeChild = widget.appState.userInfo['activeChildIndex'];
      var activityProblemsIndex = widget.appState.userInfo['children'][activeChild]['activityProblemsIndex'];

      //activate problems
      for (var i=5; i<activityProblemsIndex.length; i++) {
        if (activityProblemsIndex[i]) {
          for (var text in activityProblemsDescription[i]) {
            todoList.add(text);
          }
        }
      }

      for (var i=0; i<todoList.length; i++) {
        todoListChecked.add(false);
      }

      widget.appState.exerciseTodoList = List.from(todoList.toList());
      widget.appState.exerciseTodoListChecked = List.from(todoListChecked);
      widget.appState.exerciseTodoCount = List.from([0]);
    }

    todoList2 = [widget.appState.nutrientTodoList,  widget.appState.sleepTodoList, widget.appState.exerciseTodoList];
    todoListChecked2 = [widget.appState.nutrientTodoListChecked, widget.appState.sleepTodoListChecked, widget.appState.exerciseTodoListChecked];
    todoCount2 = [widget.appState.nutrientTodoCount,  widget.appState.sleepTodoCount, widget.appState.exerciseTodoCount];

  }

  static Matrix4 _pmat(num pv) {
    return new Matrix4(
      1.0,
      0.0,
      0.0,
      0.0,
      //
      0.0,
      1.0,
      0.0,
      0.0,
      //
      0.0,
      0.0,
      1.0,
      pv * 0.001,
      //
      0.0,
      0.0,
      0.0,
      1.0,
    );
  }

  Matrix4 perspective = _pmat(1.0);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
        index: 3,
        appState: widget.appState,
            body: GestureDetector(
        onTap: () {
      setState(() {
        if (tooltip)
          tooltip = !tooltip;
      });
    },
    child:ListView(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              children: <Widget>[
    Stack(children:[
      Container(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child:
    Column(crossAxisAlignment: CrossAxisAlignment.end,
      children:[
                SizedBox(height:40),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(child:Icon(Icons.help_outline, color: Color(0xffa6a6c7), size:30), onPressed: () {
                        setState(() {
                          tooltip = !tooltip;
                        });
                      }),

                          TextButton(
                            child:
                            FaIcon(FontAwesomeIcons.bell, color: Colors.grey, size:24),
                            onPressed: () {
                              widget.appState.state = 'homeAlarm';
                            }
                          )
                    ]),
                ),

                SizedBox(height:10),
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                            child: Center(
                                child: DropdownButton(
                                  value: _selectedValue,
                                  items: _valueList.map(
                                        (value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value,
                                            style: TextStyle(
                                                color: Color(0xff59597c),
                                                fontFamily: 'gmarketSans',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500)),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      widget.appState.userInfo['activeChildIndex'] = _valueList.indexOf(value);
                                      reset();
                                      //_selectedValue = value as String;
                                    });
                                  },
                                )),
                          ),
                          Text('맘님,',
                              style: TextStyle(
                                  color: Color(0xff59597c),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                        SizedBox(width:15),
                          Text('오늘 관리점수는 ',
                              style: TextStyle(
                                  color: Color(0xff59597c),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500)),
                          Text(widget.appState.overallScore.toString(),
                              style: TextStyle(
                                  color: Color(0xff59597c),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800)),
                          Text(' 점 입니다.',
                              style: TextStyle(
                                  color: Color(0xff59597c),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(height:5),
                      Row(
                        children: <Widget>[
                        SizedBox(width:15),
                          Text('반이나 왔어요!',
                              style: TextStyle(
                                  color: Color(0xff59597c),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height:20),

                Container(
                  width: MediaQuery.of(context).size.width-40,
                  height: 370,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left:0,
                        top: 180,
                          child: new Transform(
                              child:  Container(
                                  width: 250,
                                  height: 250,
                                  child: SfCircularChart(
                                    tooltipBehavior: _tooltipBehavior,
                                    series: <CircularSeries>[
                                      RadialBarSeries<List, String>(
                                        radius:'100%',
                                        gap: '15%',
                                          dataSource: _chartData,
                                          xValueMapper: (List data, _) => data[0],
                                          yValueMapper: (List data, _) => data[1],
                                          pointColorMapper: (List data, _) => data[2],
                                          //dataLabelSettings: DataLabelSettings(isVisible: true),
                                          enableTooltip: false,
                                          maximumValue: 100)
                                    ],
                                  ),
                                ),

                              alignment: FractionalOffset.center,
                              transform: perspective.scaled(1.0, 1.0, 1.0)
                                ..rotateX(3.14*0.62)
                                ..rotateY(3.14)
                                ..rotateZ(3.14*1.13)),

                      ),
                      Positioned(
                          left: _sex == 'M' ? 35 : 20,
                          top: 10,
                          child:
                              Container(
                                alignment: AlignmentDirectional.topStart,
                                width: 350,
                                height: 274*350/284,
                                child: Image.asset(_sex == 'M' ? 'assets/imageman.png' : 'assets/imagewoman.png', fit:BoxFit.fill),
                              ),
                      ),

                      Positioned(
                        left: 215,
                        top: 30,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 140,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('목표 시간 도달률',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500)),
                                      Text('50%',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 13.25,
                                              fontWeight: FontWeight.w800))
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                      children:[
                                  new LinearPercentIndicator(
                                    padding: EdgeInsets.all(0),
                                    width: 138,
                                    lineHeight: 5,
                                    percent: 0.5,
                                    progressColor: Color(0xff38C682),
                                    backgroundColor: Color(0xffe9e9e9),
                                  )]),
                                  SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      FaIcon(FontAwesomeIcons.clock,
                                          color:Color(0xff38C682), size:12),
                                      Text(' 1시간 / 2시간',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('알림 확인율',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500)),
                                      Text(widget.appState.alarmScore.toString()+'%',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 13.25,
                                              fontWeight: FontWeight.w800))
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  new LinearPercentIndicator(
                                    padding: EdgeInsets.all(0),
                                    width: 138,
                                    lineHeight: 5,
                                    percent: widget.appState.alarmScore/100,
                                    progressColor: Color(0xff18ACFF),
                                    backgroundColor: Color(0xffe9e9e9),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      FaIcon(FontAwesomeIcons.bell, size:12, color: Color(0xff18ACFF)),
                                      Text(' ' + (widget.appState.nutrientAlarmCount[0]
                                          + widget.appState.exerciseAlarmCount[0]
                                          + widget.appState.sleepAlarmCount[0]).toString()
                                          +'회 / '
                                          +(widget.appState.nutrientAlarmListChecked.length
                                              + widget.appState.exerciseAlarmListChecked.length
                                              + widget.appState.sleepAlarmListChecked.length).toString()+'회',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('할 일 달성률',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500)),
                                      Text(widget.appState.todoScore.toString()+'%',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 13.25,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                  SizedBox(height: 8),
                                  new LinearPercentIndicator(
                                    padding: EdgeInsets.all(0),
                                    width: 138,
                                    lineHeight: 5,
                                    percent: widget.appState.todoScore/100,
                                    progressColor: Color(0xffB88DF6),
                                    backgroundColor: Color(0xffe9e9e9),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      FaIcon(FontAwesomeIcons.cog, size: 12, color: Color(0xffB88DF6)),
                                      Text( ' ' + (widget.appState.nutrientTodoCount[0]
                                          + widget.appState.exerciseTodoCount[0]
                                          + widget.appState.sleepTodoCount[0]).toString()
                                          +'개 / '
                                          +(widget.appState.nutrientTodoListChecked.length
                                              + widget.appState.exerciseTodoListChecked.length
                                              + widget.appState.sleepTodoListChecked.length).toString()+'개',
                                          style: TextStyle(
                                              color: Color(0xff59597c),
                                              fontFamily: 'gmarketSans',
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500)),
                                    ]),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height:20),
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(children:[
                            FaIcon(FontAwesomeIcons.clock,
                                color:Color(0xff38C682), size:16),
                            Text(' 관리 시간',
                                style: TextStyle(
                                    color: Color(0xff59597c),
                                    fontFamily: 'gmarketSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ]),
                          Text('1시간',
                              style: TextStyle(
                                  color: Color(0xff59597c),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                      SizedBox(height:12),
                      Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                          Container(
                              width: (MediaQuery.of(context).size.width-40),
                              height: 20.0,
                              child:
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xff45d892),
                                ),
                                child:
                                Container(padding: EdgeInsets.fromLTRB(175.0*4/13,3,0,0),
                                    child: Opacity(opacity:0.6, child: FaIcon(FontAwesomeIcons.appleAlt, color: Colors.black, size:12))),
                              )
                          ),
                          Container(
                              width: (MediaQuery.of(context).size.width-40)*9/13,
                              height:20,
                              child:DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xffb0eccf),
                                ),
                                child: Container(padding: EdgeInsets.fromLTRB(175.0*3/13,3,0,0),
                                    child: Opacity(opacity:0.6, child:FaIcon(FontAwesomeIcons.shoePrints, color: Colors.black, size:12))),
                              )
                          ),
                          Container(
                              width: (MediaQuery.of(context).size.width-40)*6/13,
                              height: 20.0,
                              child:DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color(0xffdffbed),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child:
                                Container(
                                    alignment:Alignment.center,
                                    child: Opacity(opacity:0.6, child:FaIcon(FontAwesomeIcons.solidMoon, color: Colors.black, size:12))),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height:27),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(children:[
                            FaIcon(FontAwesomeIcons.bell, color: Color(0xff18ACFF), size:16),
                            Text(' 알림 확인',
                                style: TextStyle(
                                    color: Color(0xff59597c),
                                    fontFamily: 'gmarketSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ]),
                          Text((widget.appState.nutrientAlarmCount[0] + widget.appState.exerciseAlarmCount[0] + widget.appState.sleepAlarmCount[0]).toString()+'회',
                              style: TextStyle(
                                  color: Color(0xff59597c),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                      SizedBox(height:12),
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: <Widget>[
                          Container(
                              width: (MediaQuery.of(context).size.width-40),
                              height: 20.0,
                              child:
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xff169ce7),
                                ),
                                child:
                                Container(padding: EdgeInsets.fromLTRB(175.0*((widget.appState.nutrientAlarmCount[0]+1) / (3+widget.appState.nutrientAlarmCount[0] + widget.appState.exerciseAlarmCount[0] + widget.appState.sleepAlarmCount[0])),3,0,0),
                                    child: Opacity(opacity:0.6, child:FaIcon(FontAwesomeIcons.appleAlt, color: Colors.black, size:12))),
                              )
                          ),
                          Container(
                              width: (MediaQuery.of(context).size.width-40)*((widget.appState.sleepAlarmCount[0] + widget.appState.exerciseAlarmCount[0]+2) / (3+widget.appState.nutrientAlarmCount[0] + widget.appState.exerciseAlarmCount[0] + widget.appState.sleepAlarmCount[0])),
                              height:20,
                              child:DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xff70c6f5),
                                ),
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(175.0*((widget.appState.exerciseAlarmCount[0]+1) / (3+widget.appState.nutrientAlarmCount[0] + widget.appState.exerciseAlarmCount[0] + widget.appState.sleepAlarmCount[0])),3,0,0),
                                    child: Opacity(opacity:0.6, child:FaIcon(FontAwesomeIcons.shoePrints, color: Colors.black, size:12))),
                              )
                          ),
                          Container(
                              width: (MediaQuery.of(context).size.width-40)*((widget.appState.sleepAlarmCount[0]+1) / (3+widget.appState.nutrientAlarmCount[0] + widget.appState.exerciseAlarmCount[0] + widget.appState.sleepAlarmCount[0])),
                              height: 20.0,
                              child:DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color(0xffc8ebff),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child:
                                Container(
                                    alignment:Alignment.center,
                                    child: Opacity(opacity:0.6, child:FaIcon(FontAwesomeIcons.solidMoon, color: Colors.black, size:12))),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height:27),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(children:[
                            FaIcon(FontAwesomeIcons.cog, color: Color(0xffB88DF6), size:16),
                            Text(' 완료한 일',
                                style: TextStyle(
                                    color: Color(0xff59597c),
                                    fontFamily: 'gmarketSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ]),
                          Text((widget.appState.nutrientTodoCount[0] + widget.appState.exerciseTodoCount[0] + widget.appState.sleepTodoCount[0]).toString()+'개',
                              style: TextStyle(
                                  color: Color(0xff59597c),
                                  fontFamily: 'gmarketSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                      SizedBox(height:12),
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width-40,
                            height: 20.0,
                                  child:
                                  DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xff9877da),
                                      ),
                                    child:
                                        Container(padding: EdgeInsets.fromLTRB(175.0*((widget.appState.nutrientTodoCount[0]+1) / (3+widget.appState.nutrientTodoCount[0] + widget.appState.exerciseTodoCount[0] + widget.appState.sleepTodoCount[0])),3,0,0),
                                            child: Opacity(opacity:0.6, child: FaIcon(FontAwesomeIcons.appleAlt, color: Colors.black, size:12))),
                                  )
                          ),
                          Container(
                                width: (MediaQuery.of(context).size.width-40)*((widget.appState.sleepTodoCount[0] + widget.appState.exerciseTodoCount[0]+2) / (3+widget.appState.nutrientTodoCount[0] + widget.appState.exerciseTodoCount[0] + widget.appState.sleepTodoCount[0])),
                                height:20,
                                child:DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xffc4aef2),
                                    ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(175.0*((widget.appState.exerciseTodoCount[0]+1) / (3+widget.appState.nutrientTodoCount[0] + widget.appState.exerciseTodoCount[0] + widget.appState.sleepTodoCount[0])),3,0,0),
                                      child: Opacity(opacity:0.6, child:FaIcon(FontAwesomeIcons.shoePrints, color: Colors.black, size:12))),
                                )
                              ),
                          Container(
                                width: (MediaQuery.of(context).size.width-40)*((widget.appState.sleepTodoCount[0]+1) / (3+widget.appState.nutrientTodoCount[0] + widget.appState.exerciseTodoCount[0] + widget.appState.sleepTodoCount[0])),
                                height: 20.0,
                                  child:DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Color(0xffe4d8ff),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    child:
                                    Container(
                                      alignment:Alignment.center,
                                        child: Opacity(opacity:0.6, child:FaIcon(FontAwesomeIcons.solidMoon, color: Colors.black, size:12))),
                                  )
                              ),
                        ])
                    ]),
                ),


                SizedBox(height:40),
                Row(children:[
                  Text('오늘 할 일',
                      style: TextStyle(
                          color: Color(0xff59597c),
                          fontFamily: 'gmarketSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w500))
                ]),
                SizedBox(height: 10),
                Column(
                    children:[
                  Container(
                  
                      height: !expanded ? 210 : 300,
                      child: ListView.builder(
                        padding: EdgeInsets.all(3),
                        itemCount: widget.appState.nutrientTodoList.length + widget.appState.sleepTodoList.length + widget.appState.exerciseTodoList.length,
                        itemBuilder: (context, i) {
                          if (i < widget.appState.nutrientTodoList.length){
                            icon2 = Container(
                          padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          decoration: BoxDecoration(
                          color: Color(0xffE9E9FF),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: FaIcon(FontAwesomeIcons.appleAlt, size:11, color: Color(0xff5653FF)));
                            k.add(0);
                            j.add(i);
                          }
                          else if (i < widget.appState.nutrientTodoList.length + widget.appState.sleepTodoList.length){
                            icon2 = Container(
                                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                decoration: BoxDecoration(
                                    color: Color(0xffE9E9FF),
                                    borderRadius: BorderRadius.all(Radius.circular(30))),
                                child: FaIcon(FontAwesomeIcons.solidMoon, size:11, color: Color(0xff5653FF)));
                            k.add(1);
                            j.add(i % widget.appState.nutrientTodoList.length.round());
                          }
                          else {
                            icon2 = Container(
                                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                decoration: BoxDecoration(
                                    color: Color(0xffE9E9FF),
                                    borderRadius: BorderRadius.all(Radius.circular(30))),
                                child: FaIcon(FontAwesomeIcons.shoePrints, size:11, color: Color(0xff5653FF)));
                            k.add(2);
                            j.add((i % (widget.appState.nutrientTodoList.length + widget.appState.sleepTodoList.length)).round());
                          }
                          return Stack(
                            children: [
                              Visibility(
                                  visible: i < 3 || expanded,
                                  child:
                                  Container(
                                    height:54,
                                    margin: EdgeInsets.fromLTRB(0,8,0,6),
                                    //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(16)),
                                        boxShadow: [BoxShadow(
                                            color: Color(0xffe3e3e3).withOpacity(0.6),
                                            offset: Offset(3,3),
                                            blurRadius: 2.0,
                                            spreadRadius: 2
                                        )]

                                    ),
                                    child:
                                    Container(
                                        child:
                                        CheckboxListTile(
                                          title: Text(todoList2[k[i]][j[i]], style: TextStyle(fontFamily: 'gmarketSans', fontSize: 13)),
                                          value: todoListChecked2[k[i]][j[i]],
                                          onChanged: (value) {
                                            setState(() {
                                              if (todoListChecked2[k[i]][j[i]]) {
                                                todoCount2[k[i]][0] -= 1;
                                              }
                                              else {
                                                todoCount2[k[i]][0] += 1;
                                              }

                                              todoListChecked2[k[i]][j[i]] = !todoListChecked2[k[i]][j[i]];

                                              widget.appState.notify();

                                              _chartData = [
                                                ['task', widget.appState.todoScore, Color.fromRGBO(177, 123, 247, 1)],
                                                ['alarm', widget.appState.alarmScore,  Color.fromRGBO(108, 198, 247, 1)],
                                                ['manageTime', double.parse('50.0'),  Color.fromRGBO(65, 221, 146, 1)],
                                              ];

                                            });
                                            },
                                          secondary: icon2,
                                          activeColor: Color(0xffe3e3e3),
                                          checkColor: Colors.blue,
                                          selected: todoListChecked2[k[i]][j[i]],
                                          tileColor: Colors.white,
                                        )),
                                  )
                              ),
                            ],
                          );
                          },
                      )),

                      MaterialButton(child: Icon(!expanded ? Icons.expand_more : Icons.expand_less, color:Color(0xff7879f1), size:35),
                      onPressed: () {
                    setState((){
                      expanded = !expanded;
                    });
                  }),
                ]),


                SizedBox(height:15),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                                        Text('관리 점수 랭킹',
                      style: TextStyle(
                          color: Color(0xff59597c),
                          fontFamily: 'gmarketSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                      SizedBox(height:8),
                      Row(
                        children:<Widget> [
                          Text("커뮤니티 평균 관리 점수",style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 13, fontWeight: FontWeight.w200)),
                          Text(" 95점",style: TextStyle(color: Color(0xff5772FF), fontFamily: 'gmarketSans', fontSize: 13.42, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height:25),
                Container(
                  padding: EdgeInsets.fromLTRB(10,5,10,5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe3e3e3).withOpacity(0.6),
                            offset: Offset(3, 3),
                            blurRadius: 2.0,
                            spreadRadius: 2)
                      ]),
                  child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 18,
                          child: widget.appState.userInfo['profileURL'] != null
                              ? Container(
                              width: 36.0,
                              height: 36.0,

                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    //image: CachedNetworkImageProvider(appState.userInfo['profileURL'])
                                    image: NetworkImage(widget.appState.userInfo['profileURL']),
                                  )
                              )
                          )
                              : Container(
                            width: 36.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                                color: Color(0xffb9c1d9),
                                shape: BoxShape.circle),
                            child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 24
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(width:295,height:26, child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Container(child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Container(child:Row(children:[
                                      Text('48',style: TextStyle(color: Color(0xff9048ed), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(_selectedValue+'맘',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))
                                    ])),

                                    Container(child:Text(widget.appState.overallScore.toString()+'점   ',style: TextStyle(color: Color(0xff5772FF), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))),
                                  ])),
                            ])),
                      ]),
                ),

                SizedBox(height:15),
                Container(
                  padding: EdgeInsets.fromLTRB(10,5,10,5),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                      radius: 18,
                      child: Container(
                          width: 36.0,
                          height: 36.0,

                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/young.png'),
                              )
                          )
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Container(width:295, child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            SizedBox(height:0),
                            Container(child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Container(child:Row(children:[
                                    Text('  1 ',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('영차엉',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))
                                  ])),

                                  Container(child:Text('100점   ',style: TextStyle(color: Color(0xff5772FF), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))),
                            ])),
                            
                      ])),
                    ]),
                ),

                SizedBox(height:5),
                Container(
                  padding: EdgeInsets.fromLTRB(10,5,10,5),
                  child: Row(
                      children: <Widget>[
                                              CircleAvatar(
                      radius: 18,
                      child: Container(
                          width: 36.0,
                          height: 36.0,

                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/young2.png'),
                              )
                          )
                      )),
                        SizedBox(
                          width: 20,
                        ),
                        Container(width:295, child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              SizedBox(height:0),
                              Container(child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Container(child:Row(children:[
                                      Text('  2 ',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('배노십',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))
                                    ])),

                                    Container(child:Text('99점   ',style: TextStyle(color: Color(0xff5772FF), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))),
                                  ])),
                              
                            ])),
                      ]),
                ),

                SizedBox(height:5),
                Container(
                  padding: EdgeInsets.fromLTRB(10,5,10,5),
                  child: Row(
                      children: <Widget>[
                                              CircleAvatar(
                      radius: 18,
                      child: Container(
                          width: 36.0,
                          height: 36.0,

                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/young3.png'),
                              )
                          )
                      )),
                        SizedBox(
                          width: 20,
                        ),
                        Container(width:295, child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              SizedBox(height:0),
                              Container(child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Container(child:Row(children:[
                                      Text('  3 ',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('편슈니',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))
                                    ])),

                                    Container(child:Text('98점   ',style: TextStyle(color: Color(0xff5772FF), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))),
                                  ])),
                              
                            ])),
                      ]),
                ),

                SizedBox(height:5),
                Container(
                  padding: EdgeInsets.fromLTRB(10,5,10,5),
                  child: Row(
                      children: <Widget>[
                                              CircleAvatar(
                      radius: 18,
                      child: Container(
                          width: 36.0,
                          height: 36.0,

                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/young4.png'),
                              )
                          )
                      )),
                        SizedBox(
                          width: 20,
                        ),
                        Container(width:295, child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              SizedBox(height:0),
                              Container(child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Container(child:Row(children:[
                                      Text('  4 ',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('워매웜',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))
                                    ])),

                                    Container(child:Text('97점   ',style: TextStyle(color: Color(0xff5772FF), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))),
                                  ])),
                              
                            ])),
                      ]),
                ),

                SizedBox(height:5),
                Container(
                  padding: EdgeInsets.fromLTRB(10,5,10,5),
                  child: Row(
                      children: <Widget>[
                                              CircleAvatar(
                      radius: 18,
                      child: Container(
                          width: 36.0,
                          height: 36.0,

                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/young5.png'),
                              )
                          )
                      )),
                        SizedBox(
                          width: 20,
                        ),
                        Container(width:295, child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              SizedBox(height:0),
                              Container(child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Container(child:Row(children:[
                                      Text('  5 ',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('이유아',style: TextStyle(color: Color(0xff59597c), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))
                                    ])),

                                    Container(child:Text('96점   ',style: TextStyle(color: Color(0xff5772FF), fontFamily: 'gmarketSans', fontSize: 15, fontWeight: FontWeight.w500))),
                                  ])),
                              
                            ])),
                      ]),
                ),

                SizedBox(height:20),
              ],
            )),

      Visibility(
          visible: tooltip,
          child: Opacity(
              opacity: 0.8,
              child: Container(width:MediaQuery.of(context).size.width, height:1600, color: Colors.grey,
                  child: Image.asset('assets/tooltip0.png', fit: BoxFit.fill)))
      ),
    ])])));
  }

}

