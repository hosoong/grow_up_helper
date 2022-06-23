import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../main.dart';

import '../survey/survey_widgets.dart';

class SurveyResultPage extends StatefulWidget {
  SurveyResultPage({required this.appState});

  ApplicationState appState;

  _SurveyResultPageState createState() => _SurveyResultPageState();
}

class _SurveyResultPageState extends State<SurveyResultPage> {

  @override
  void initState() {
    super.initState();

    var info = widget.appState.userInfo;

    //compute height prediction
    var sex = info['sex'];
    var motherHeight = info['motherHeight'];
    var fatherHeight = info['fatherHeight'];
    var motherFatherHeight = info['motherFatherHeight'];
    var motherMotherHeight = info['motherMotherHeight'];
    var fatherMotherHeight = info['fatherMotherHeight'];
    var fatherFatherHeight = info['fatherFatherHeight'];

    var x = double.parse(motherHeight);
    var y = double.parse(fatherHeight);
    double a = 0;
    double b = 0;
    if (!motherFatherHeight.isEmpty && !motherMotherHeight.isEmpty) {
      a = double.parse(motherFatherHeight)/2 + double.parse(motherMotherHeight)/2;
      if (a>x)
        x = x/2 + a/2;
    }
    if (!fatherFatherHeight.isEmpty && !fatherMotherHeight.isEmpty) {
      b = double.parse(fatherFatherHeight)/2 + double.parse(fatherMotherHeight)/2;
      if (b>y)
        y = y/2 + b/2;
    }
    if (sex == 'M')
      height = ((x+y)/2 + 6.5).round();
    else
      height = ((x+y)/2 - 6.5).round();

    //initialize indexes
    for(var i=0; i<nutritionProblemsDescription.length; i++)
      nutritionProblemsIndex.add(false);
    for(var i=0; i<sleepProblemsDescription.length; i++)
      sleepProblemsIndex.add(false);
    for(var i=0; i<activityProblemsDescription.length; i++)
      activityProblemsIndex.add(false);

    //select indexes based on user response
    double currentHeight = double.parse(info['currentHeight']) / 100;
    var currentWeight = double.parse(info['currentWeight']);
    var bmi = currentWeight/(currentHeight*currentHeight);

    if (bmi>25 && bmi<30){
      nutritionProblemsIndex[0] = true;
      activityProblemsIndex[0] = true;
    }
    else if (bmi<40){
      nutritionProblemsIndex[1] = true;
      activityProblemsIndex[1] = true;
    }
    else if (bmi>=40){
      nutritionProblemsIndex[2] = true;
      activityProblemsIndex[2] = true;
    }

    var hairGrowth = int.parse(info['hairGrowth']);
    var periodStartYear = info['periodStartYear'];
    if (hairGrowth>=3 || !periodStartYear.isEmpty){
      activityProblemsIndex[4] = true;
    }
    else if (hairGrowth==2){
      activityProblemsIndex[3] = true;
    }

    var eatingAmount = info['eatingAmount'];
    if (eatingAmount == '1/4' || eatingAmount == '1/2'){
      nutritionProblemsIndex[3] = true;
    }
    else if (eatingAmount =='2'){
      nutritionProblemsIndex[4] = true;
    }
    else if (eatingAmount =='3+'){
      nutritionProblemsIndex[5] = true;
    }

    var eatingHabit = info['eatingHabit'];
    if (eatingHabit == '반찬을 많이 먹는'){
      nutritionProblemsIndex[6] = true;
    }
    else if (eatingHabit == '국물을 많이 먹는'){
      nutritionProblemsIndex[7] = true;
    }

    var eatingTime = info['eatingTime'];
    if (eatingTime == '1'){
      nutritionProblemsIndex[8] = true;
    }
    else if (eatingTime == '2'){
      nutritionProblemsIndex[9] = true;
    }
    else if (eatingTime == '4'){
      nutritionProblemsIndex[10] = true;
    }

    var eatingHabits = info['eatingHabits'];
    print(eatingHabits);
    if (eatingHabits[1] == '1' || eatingHabits[2] == '1' || eatingHabits[4] == '1'){
      nutritionProblemsIndex[11] = true;
    }
    if (eatingHabits[3] == '1'){
      nutritionProblemsIndex[12] = true;
    }

    var hateFood = info['hateFood'];
    for (var i=0; i<hateFood.length; i++){
      if (['14', '23', '25', '26', '27', '28', '29'].indexOf(i.toString()) == -1){
        if (hateFood[i] == '1'){
          nutritionProblemsIndex[13] = true;
        }
      }
    }

    var likeFood = info['likeFood'];
    for (var i=0; i<likeFood.length; i++){
      if (['14', '23', '25', '26', '27', '28', '29'].indexOf(i.toString()) != -1){
        if (likeFood[i] == '1'){
          nutritionProblemsIndex[14] = true;
        }
      }
    }

    var eatoutFrequency = info['eatoutFrequency'];
    if (eatoutFrequency == '3+'){
      nutritionProblemsIndex[15] = true;
    }
    var deliveryFrequency = info['deliveryFrequency'];
    if (eatoutFrequency == '3+'){
      nutritionProblemsIndex[16] = true;
    }
    var instantFrequency = info['instantFrequency'];
    if (instantFrequency == '3+'){
      nutritionProblemsIndex[17] = true;
    }
    var fastfoodFrequency = info['fastfoodFrequency'];
    if (fastfoodFrequency == '3+' || fastfoodFrequency == '2'){
      nutritionProblemsIndex[18] = true;
    }
    var waterCup = info['waterCup'];
    if (waterCup != '6+'){
      nutritionProblemsIndex[19] = true;
    }
    var snackFrequency = info['snackFrequency'];
    if (snackFrequency == '3' || snackFrequency == '4') {
      nutritionProblemsIndex[20] = true;
    }
    var snacks = info['snacks'];
    if (snacks[1] == '1') {
      nutritionProblemsIndex[21] = true;
    }
    if (snacks[2] == '1' || snacks[3] == '1') {
      nutritionProblemsIndex[22] = true;
    }
    if (snacks[4] == '1' || snacks[5] == '1') {
      nutritionProblemsIndex[23] = true;
    }
    if (snacks[0] == '1') {
      nutritionProblemsIndex[24] = true;
    }

    var activityAmount = info['activityAmount'];
    if (activityAmount == '1' || activityAmount == '2'){
      activityProblemsIndex[5] = true;
    }
    var exerciseFrequency = info['exerciseFrequency'];
    if (exerciseFrequency.isEmpty || int.parse(exerciseFrequency) < 3) {
      activityProblemsIndex[6] = true;
    }
    var outdoorActivityAmount = info['outdoorActivityAmount'];
    if (outdoorActivityAmount == '1'){
      activityProblemsIndex[7] = true;
    }
    var neckPosture = info['neckPosture'];
    if (neckPosture != '0'){
      activityProblemsIndex[8] = true;
    }
    var legPosture = info['legPosture'];
    if (legPosture == '4' || legPosture == '5'){
      activityProblemsIndex[9] = true;
    }
    var bagWeight = info['bagWeight'];
    if (bagWeight == '4+'){
      activityProblemsIndex[10] = true;
    }
    var shoulderPosture = info['shoulderPosture'];
    if (shoulderPosture == '1' || shoulderPosture == '5'){
      activityProblemsIndex[11] = true;
    }
    else if (shoulderPosture == '2' || shoulderPosture == '4'){
      activityProblemsIndex[12] = true;
    }
    var backPosture = info['backPosture'];
    if (backPosture == '3' || backPosture == '4'){
      activityProblemsIndex[13] = true;
    }
    var dailySittingHour = int.parse(info['dailySittingHour']);
    if (dailySittingHour >= 4) {
      activityProblemsIndex[14] = true;
    }
    var sleepHabits = info['sleepHabits'];
    if (sleepHabits[0] == '1' || sleepHabits[1] == '1' || sleepHabits[2] == '1' || sleepHabits[3] == '1') {
      sleepProblemsIndex[0] = true;
    }
    var timeUntilSleep = info['timeUntilSleep'];
    if (timeUntilSleep == '1') {
      sleepProblemsIndex[1] = true;
    }
    else if (timeUntilSleep == '3' || timeUntilSleep == '4'){
      sleepProblemsIndex[2] = true;
    }
    var napHour = info['napHour'];
    if (!napHour.isEmpty && int.parse(napHour) >= 2) {
      sleepProblemsIndex[3] = true;
    }
    var weekdaySleepHour = int.parse(info['weekdaySleepHour']);
    if (weekdaySleepHour >= 10) {
      sleepProblemsIndex[4] = true;
    }
    var weekdayWakeHour = int.parse(info['weekdayWakeHour']);
    var sleepDuration = weekdayWakeHour - weekdaySleepHour;
    if (sleepDuration < 0)
      sleepDuration += 12;
    if (sleepDuration < 8) {
      sleepProblemsIndex[5] = true;
    }
    var whenKidSleep = info['whenKidSleep'];
    if (whenKidSleep != '5'){
      sleepProblemsIndex[6] = true;
    }
    var tossAndTurn = info['tossAndTurn'];
    if (tossAndTurn == '4' || tossAndTurn == '5'){
      sleepProblemsIndex[7] = true;
    }
    var electronicDevice = info['electronicDevice'];
    if (!electronicDevice.isEmpty) {
      sleepProblemsIndex[8] = true;
      var electronicDeviceDistance = info['electronicDeviceDistance'];
      if (electronicDeviceDistance != '열걸음 이상'){
        sleepProblemsIndex[9] = true;
      }
    }

    //compute score
      int temp = 0;
      for(var flag in nutritionProblemsIndex){
        if(flag)
          temp += 1;
      }
      var length = nutritionProblemsIndex.length;
      nutritionScore = (100-temp*100/length).round();

      temp = 0;
      for(var flag in sleepProblemsIndex){
        if(flag)
          temp += 1;
      }
      length = sleepProblemsIndex.length;
      sleepScore = (100-temp*100/length).round();

      temp = 0;
      for(var flag in activityProblemsIndex){
        if(flag)
          temp += 1;
      }
      length = activityProblemsIndex.length;
      activityScore = (100-temp*100/length).round();

      //activate problems
      for (var i=0; i<nutritionProblemsIndex.length; i++) {
        if (nutritionProblemsIndex[i]) {
          nutritionProblems.add(Column(mainAxisAlignment: MainAxisAlignment.center, children: [Align(alignment: Alignment.centerLeft, child: Text(nutritionProblemsDescription[i], style: GoogleFonts.notoSans(fontSize: 11)))]));
        }
      }
      for (var i=0; i<sleepProblemsIndex.length; i++) {
        if (sleepProblemsIndex[i]) {
          sleepProblems.add(Column(mainAxisAlignment: MainAxisAlignment.center, children: [Align(alignment: Alignment.centerLeft, child: Text(sleepProblemsDescription[i], style: GoogleFonts.notoSans(fontSize: 11)))]));
        }
      }
      for (var i=0; i<activityProblemsIndex.length; i++) {
        if (activityProblemsIndex[i]) {
          activityProblems.add(Column(mainAxisAlignment: MainAxisAlignment.center, children: [Align(alignment: Alignment.centerLeft, child: Text(activityProblemsDescription[i], style: GoogleFonts.notoSans(fontSize: 11)))]));
        }
      }
    }

  @override
  void dispose() {
    super.dispose();
  }

  int height = 0;

  int score = 0;
  String scoreMessage = '';

  int nutritionScore = 0;
  int sleepScore = 0;
  int activityScore = 0;

  List<String> nutritionProblemsDescription = [
    '아이는 현재 과체중(1도비만) 상태예요. 무조건 많이 먹이는 것 보다는 적당히 올바른 영양소만 섭취할 수 있도록 해주세요.',
    '아이는 현재 비만(2도비만)상태예요. 필요한 영양소를 골고루 섭취하며 진행할 수 있는 식이요법들이 필요해요.',
    '아이는 현재 고도비만 상태예요. 무리한 다이어트는 성장을 방해하는 영양 부족을 일으킬 수 있으니 적절한 체중감량 식단이 필요해요.',
    '비슷한 나이, 신장을 가진 아이들에 비해 밥을 적게 먹고 있어요. 적당한 식사로 영양소를 채우고, 하루를 위한 에너지를 공급해주세요.',
    '또래 아이들에 비해 밥을 많이 먹는 편이예요. 아이가 활동량이 많다면 괜찮지만 적다면 그에 맞는 밥 양 조절이 필요해요.',
    '또래 아이들에 비해 밥을 과하게 먹는 편이예요. 아이에게 맞는 밥 양 조절이 필요해요.',
    '나트륨 과다 섭취는 특히 어린아이의 성장에 부정적 영향을 미쳐 키가 크지 않는 원인이 되기도 해요. 짠 반찬을 많이 먹는 습관은 반드시 고쳐야해요.',
    '나트륨 과다 섭취는 특히 어린아이의 성장에 부정적 영향을 미쳐 키가 크지 않는 원인이 되기도 하므로 짠 국물을 많이 먹는 습관은 반드시 고쳐야해요.',
    '밥을 먹는 시간이 너무 짧아요. 너무 빨리 먹게되면 포만감을 느끼게 되어 과식으로 이어지기 쉬워요.',
    '밥을 먹는 시간이 권장시간에 비해 조금 짧아요. 천천히 꼭꼭 씹어 먹는 습관이 필요해요.',

    '아이가 천천히 오래 꼭꼭 먹는 것은 좋지만 중간에 방해가 되는 요소가 있는 것은 아닌지	확인해볼 필요가 있어요.',
    '식사중 아이의 시선이 분산되면 음식물을 대충 삼키게 되어 위에 무리가 갈 수 있어요. 되도록 밥을 먹을 때는 방해요소가 없도록 해주세요.',
    '아이가 먹는 것을 싫어하진 않나요? 제 시간에 아이가 먹을 양을 꼭꼭 씹어 먹는 것은 중요해요. 힘들더라도 아이가 앉은 자리에서 식사를 마칠 수 있도록 해봐요.',
    '아이가 편식하는 음식에 성장에 도움이 되는 음식이 포함되어 있어요. 모든 영양소를 골고루 섭취하는것이 중요하니 편식 습관을 개선할 필요가 있어요.',
    '아이가 좋아하는 음식에 성장을 방해하는 음식이 포함되어 있어요. 좋아하는 음식만 많이 먹는 것보다는, 건강한 식습관을 통해 균형잡힌 영양을 섭취하는 것이 중요해요.',
    '식당 요리는 주로 성인 입맛에 맞춘 자극적인 요리들이 많아요. 과다한 당, 나트륨 섭취는 영양 불균형으로 인해 키 성장에 방해가 될 수 있으니 주의해주세요.',
    '배달 음식은 주로 단일 메뉴인 경우가 많고, 이 경우에 아이가 균형 잡힌 영양소를 섭취하기 힘들어요. 조금 힘들더라도 집에서 아이를 위해 직접 요리해주세요.',
    '인스턴트 음식은 열량은 높지만 비타민이나 무기질등의 결핍을 유발하여 성장에 지장을 줍니다. 조금 힘들더라도 집에서 아이를 위해 직접 요리해주세요.',
    '패스트푸드는 동물성 지방이 많이 들어있어 성장호르몬 분비에 부정적인 영향을 줍니다. 패스트푸드는 가급적이면 피하는 것이 좋아요.',
    '아이가 마시는 물의 양이 너무 적어요. 성장을 위해서는 수분 섭취가 필수적이에요. 성장기 아이들은 성인보다 더 많은 수분 섭취량을 필요로 한답니다.',

    '간식을 너무 자주 먹게 되면 규칙적인 식사가 어려워질 수 있고, 아이의 식사량도 적어질 수 있어요.',
    '견과류에는 칼슘뿐만 아니라 성장기 어린이에게 꼭 필요한 영양소인 칼륨,철분,오메가 3등의 영양소도 풍부하게 함유되어 있어 꾸준히 섭취해주는게 좋아요. 그러나 많이 섭취할 경우 위장의 소화흡수가 잘 안되며, 지방의 함량이 높아서 살이 찔 수 있기때문에 적당히 먹어야 해요!',
    '과자, 초콜릿, 젤리, 사탕 등의 당이 높은 음식은 아이를 살찌우기 쉽고, 이는 키 성장에 방해가 됩니다. 섭취량을 확 줄이는 것이 중요해요.',
    '빵, 떡등의 주요 성분인 탄수화물과 지방은 키 성장에 필요한 근육이나 뼈는 만들지 않고 필요 이상의 체지방을 만들며, 영양 불균형을 초래하여 정상적인 성장을 방해하게 되니 아이의 섭취량을 주의하셔야 해요.',
    '과일엔 당분이 높아 과잉섭취 시 혈당이 높아져 성장호르몬 분비를 방해해요. 필요이상의 당분은 지방으로 전환되어 몸에 쌓이게 되니 간식으로 적당량 섭취하도록 해요.',
  ];
  List<String> sleepProblemsDescription = [
    '아이가 수면에 있어 어려움을 겪고있어요. 편안한 숙면 또한 아이의 키 성장에 중요한 요소가 된다는 사실!	아이의 수면의 질을 높일 수 있는 환경 조성이 필요해요.',
    '잠에 드는 시간이 지나치게 빠른 것은 잠을 잘 자는 체질이 아니라 수면 부족으로 졸린 상황이기 때문에 금방 잠에 드는 것일 가능성이 커요. 자녀가 올바른 수면 습관을 형성할 수 있도록 힘써주세요.',
    '잠에 드는 시간이 30분 이상 걸리면 심각한 경우 불면증이라고 판단할 수 있어요. 아이의 수면을 방해하는 요소가 있는지 수면 환경을 점검해보고, 문제를 개선해주세요.',
    '적당한 낮잠은 아이들의 정서에도 좋지만, 낮잠을 너무 길게 자면 밤에 깊은 수면을 못하게 되어요. 키 성장은 많은 수면이 아닌 질 좋은 수면에서 비롯되니 낮잠시간을 줄이는 것이 필요해보여요.',
    '보통 성장 호르몬이 왕성하게 분비되는 시간이 밤 10시에서 새벽 2시까지라고 해요. 키가 조금이라도 더 클 수 있게 10시 이전에는 잠자리에 들도록 해주는 것이 좋아요.',
    '잠자리에 드는 시간도 중요하지만 최소한의 수면시간은 보장되어야 해요. 8시간 이하로 자게 되면 뼈도 약해질 뿐더러 다음날 건강한 하루를 보내는데 큰 방해요소가 됩니다.',
    '아이가 잠 들때에 다른 가족들의 소음은 아이의 수면에 방해가 될 수 있으니 아이가 잠이 들 때에는 부모님도 가능한 조용한 수면환경을 조성해줘야해요.',
    '잠을 잘 때 많이 뒤척인다는 것은 깊은 잠에 들지 못한다는 뜻이에요. 수면의 질이 떨어지면 스트레스 또한 누적되어 아이들의 성장에도 방해가 될 수 있어요.',
    '수면 전 전자기기 사용은 아이가 깊은 잠을 자는데에 방해요소로 작용해요. 자기 전 아이가 전자기기를 사용하는 것을 최대한 자제시키는 것이 필요해요.',
    '아이와 전자기기 거리가 너무 가까워요. 전자기기의 전자파에 장시간 노출되면 숙면 호르몬인 멜라토닌이 감소해 성장에 영향을 줘요.',
  ];
  List<String> activityProblemsDescription = [
    '적당한 운동은 비만예방에 도움이 되어요. 꾸준한 운동습관을 길러보아요.',
    '고도비만까지 가지 않도록 아이의 활동량을 서서히 늘려가며 체중을 감량하는 것이 필요해보여요.',
    '고도비만에서의 무리한 운동은 독이 될 수 있어요. 차근차근 아이의 체중을 감량하며 키를 키우는 것이 중요해요.',
    '2차 성징이 시작되고 있어요. 사춘기가 시작되면 성장할 수 있는 기간이 줄어들게 되니 지금부터 꾸준한 성장관리가 필요해요.',
    '2차 성징이 눈에 띄게 보이는 것은 사춘기가 시작되었다는 의미예요. 사춘기가 시작한 시점부터 성장판이 점점 닫히게 되니 지금부터 각별한 성장관리가 필요해요.',
    '아이의 활동량이 너무 적어요. 몸에 적절한 자극이 되는 유산소 운동과 꾸준한 운동은 아이의 성장판을 적절히 자극시켜 성장에 필수적입니다. 급작스런 활동량 증진시에는 무리가 갈 수 있으니 조금씩 활동량을 꾸준히 늘려나가는 것이 필요해요.',
    '매일 약간의 운동은 아이들의 성장판 촉진에 도움이 된답니다. 거창한 운동이 아니어도 조금씩 움직이는 습관을 들여보아요.',
    '주말 야외활동 시간이 다소 적은 것 같네요. 야외활동 시 발생하는 비타민 D는 혈중 칼슘과 인 농도를 높이는 작용과 함께 골밀도를 유지하는 작용을 하여 아이들의 성장에 도움을 줘요.',
    '아이가 현재 거북목의 증상을 보이는 듯 해요. 이를 교정하지않고 방치할 경우 그 밑으로 이어진 척추와 골반, 무릎에 까지 많은 영향을 주게 되어 키성장에도 방해를 주게 됩니다. 거북목이 생기지 않도록 바른 자세를 유지할 수 있도록 해야해요.',
    '다리를 자주 꼬면 골반이 틀어지고 몸의 균형도 깨지게 됩니다. 아직 성장 중인 아이들의 경우에 다리 꼬는 행동이 습관화되지 않게 바로잡아주세요.',

    '성장기의 아이에게 너무 무거운 가방은 성장에 방해가 되는 요소예요! 평소 아이가 매고 다니는 가방의 무게를 최소화 해주시고 불가피한 경우에는 아이가 무거운 가방을 매는 시간을 최소화해주세요.',
    '아이의 어깨가 심각하게 기울어져 있네요. 성장기 아이의 어깨 높이가 다른 것은 척추측만증의 증상인데요, 이 경우 아이의 집중력이 저하되고 성장에도 악영향을 끼칠 수 있답니다. 병원에 가서 정밀 검사를 받아보시는 건 어떨까요?',
    '어깨가 눈에 띄게 기울어져 있네요. 성장기 아이의 어깨 높이가 다른 것은 척추측만증의 증상인데요, 이 경우 아이의 집중력이 저하되고 성장에도 악영향을 끼칠 수 있답니다. 평소 아이의 자세를 눈여겨 보시고, 항상 올바른 자세를 유지할 수 있도록 신경써주세요.',
    '성장기와 청소년기는 갑작스러운 키 성장으로 인해 척추뼈가 약해진 경우가 많은데, 이를 제대로 교정하지 않으면 아이의 건강한 성장을 방해할 뿐 아니라 체형변화로 이어질 수 있어요.',
    '오래 앉아있을수록 자세가 틀어지기 쉬워요. 또한 움직이지 않고 장시간 앉아있는 것은 혈액순환에도 방해가 됩니다. 틈틈이 스트레칭을 해주거나 일어서는 습관이 성장에 도움이 될 거예요.',
  ];

  List<bool> nutritionProblemsIndex = [];
  List<bool> sleepProblemsIndex = [];
  List<bool> activityProblemsIndex = [];

  List<Widget> nutritionProblems = [];
  List<Widget> sleepProblems = [];
  List<Widget> activityProblems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : true,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Colors.white,
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height: 30),
                  TitleText(widget.appState.userInfo['name']+'의 성장 진단 결과'),

                  SizedBox(height: 22),
                  Text('유전적 정보와 현 상태를 계산했을 때,', style: TextStyle(fontFamily: 'gmarketSans',
                  fontSize: 15)),

                  SizedBox(height: 8),
                  Text.rich(TextSpan(style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15), children: [
                    TextSpan(text: widget.appState.userInfo['name']+'가 성장할 수 있는 최종 키는 ',),
                    TextSpan(text: height.toString()+'cm', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '에요.'),
                  ])),

                  SizedBox(height: 35),
                  Row(
                      children:
                      [
                        FaIcon(FontAwesomeIcons.appleAlt, color: Color(0xff41e496), size:16),
                        Text(' 영양', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 16)),
                        Text(' ('+nutritionProblems.length.toString()+'개의 문제를 발견했어요.)', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 11)),
                      ]),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                      [
                        ScoreCircle(nutritionScore, Color(0xff41e496)),
                        SizedBox(width: 20),
                        CommentListBox(nutritionProblems),
                      ]),

                  SizedBox(height: 30),
                  Row(
                      children:
                      [
                        FaIcon(FontAwesomeIcons.solidMoon, color: Color(0xff9bd5f6), size:16),
                        Text(' 수면', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 16)),
                        Text(' ('+sleepProblems.length.toString()+'개의 문제를 발견했어요.)', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 11)),
                      ]),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                      [
                        ScoreCircle(sleepScore, Color(0xff9bd5f6)),
                        SizedBox(width: 20),
                        CommentListBox(sleepProblems),
                      ]),

                  SizedBox(height: 30),
                  Row(
                      children:
                      [
                        Transform.rotate(
                          angle: 300 * 3.14 / 180,
                          child: FaIcon(FontAwesomeIcons.shoePrints, color: Color(0xffb77eff), size:16),
                        ),
                        Text(' 운동', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 16)),
                        Text(' ('+activityProblems.length.toString()+'개의 문제를 발견했어요.)', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 11)),
                      ]),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                      [
                        ScoreCircle(activityScore, Color(0xffb77eff)),
                        SizedBox(width: 20),
                        CommentListBox(activityProblems),
                      ]),

                  SizedBox(height:40),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WhiteButton(
                            width:128,
                            height:38,
                            text: '이전 단계로',

                            onPressed: () {
                                widget.appState.state = 'survey6';
                            }
                        ),
                        SizedBox(width:15),
                        BlueButton(
                            width:128,
                            height:38,
                            text: '관리시작하기',

                            onPressed: () {
                              widget.appState.state = 'payment1';

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
    );
  }
}
