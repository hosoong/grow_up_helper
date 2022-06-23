import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../main.dart';

import '../survey/survey_widgets.dart';

class SurveyResultPage2 extends StatefulWidget {
  SurveyResultPage2({required this.appState});

  ApplicationState appState;

  _SurveyResultPage2State createState() => _SurveyResultPage2State();
}

class _SurveyResultPage2State extends State<SurveyResultPage2> {

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
    height = (height*1.05).round();

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

    var motherNightShiftFrequency = info['motherNightShiftFrequency'];
    if(motherNightShiftFrequency.isNotEmpty && int.parse(motherNightShiftFrequency) > 3){
      nutritionProblemsIndex[25] = true;
    }
    var motherWeekdaySleepHour = int.parse(info['motherWeekdaySleepHour']);
    if(motherWeekdaySleepHour >= 10){
      sleepProblemsIndex[10] = true;
    }
    var motherWeekdayWakeHour = int.parse(info['motherWeekdayWakeHour']);
    var motherSleepDuration = motherWeekdayWakeHour - motherWeekdaySleepHour;
    if (motherSleepDuration < 0)
      motherSleepDuration += 12;
    if (motherSleepDuration < 8) {
      sleepProblemsIndex[11] = true;
    }
    var motherPhoneHour = int.parse(info['motherPhoneHour']);
    if (motherPhoneHour >= 3){
      activityProblemsIndex[15] = true;
    }
    var motherTVHour = int.parse(info['motherTVHour']);
    if (motherTVHour >= 2){
      activityProblemsIndex[16] = true;
    }
    var motherEatTime = int.parse(info['motherEatTime']);
    if (motherEatTime <= 2){
      nutritionProblemsIndex[26] = true;
    }
    var motherSnackFrequency = int.parse(info['motherSnackFrequency']);
    if (motherSnackFrequency >=3){
      nutritionProblemsIndex[27] = true;
    }
    var motherLikeFood = info['motherLikeFood'];
    for (var i=0; i<motherLikeFood.length; i++){
      if (['14', '23', '25', '26', '27', '28', '29'].indexOf(i.toString()) != -1){
        if (motherLikeFood[i] == '1'){
          nutritionProblemsIndex[28] = true;
        }
      }
    }
    var motherHateFood = info['motherHateFood'];
    for (var i=0; i<motherHateFood.length; i++){
      if (['14', '23', '25', '26', '27', '28', '29'].indexOf(i.toString()) == -1){
        if (motherHateFood[i] == '1'){
          nutritionProblemsIndex[29] = true;
        }
      }
    }
    var motherTogetherHour = int.parse(info['motherTogetherHour']);
    if (motherTogetherHour <= 3){
      nutritionProblemsIndex[30] = true;
    }
    var motherSatisfaction = int.parse(info['motherSatisfaction']);
    if (motherSatisfaction <= 3){
      activityProblemsIndex[17] = true;
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
    for (var i=3; i<nutritionProblemsIndex.length; i++) {
      if (nutritionProblemsIndex[i]) {
        nutritionProblems.add(Column(mainAxisAlignment: MainAxisAlignment.center,children: [Align(alignment: Alignment.centerLeft, child: Text(nutritionProblemsDescription[i], style: GoogleFonts.notoSans(fontSize: 11)))]));
      }
    }
    for (var i=0; i<sleepProblemsIndex.length; i++) {
      if (sleepProblemsIndex[i]) {
        sleepProblems.add(Column(mainAxisAlignment: MainAxisAlignment.center,children: [Align(alignment: Alignment.centerLeft, child: Text(sleepProblemsDescription[i], style: GoogleFonts.notoSans(fontSize: 11)))]));
      }
    }
    for (var i=5; i<activityProblemsIndex.length; i++) {
      if (activityProblemsIndex[i]) {
        activityProblems.add(Column(mainAxisAlignment: MainAxisAlignment.center,children: [Align(alignment: Alignment.centerLeft, child: Text(activityProblemsDescription[i], style: GoogleFonts.notoSans(fontSize: 11)))]));
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
    '',
    '',
    '',
    '아이가 밥을 먹는 양이 너무 적으므로 양을 늘려나가는 것이 최우선이에요. 조금씩 자주 다양한 것을 시도하고 원래 하나 먹을 수 있다면 하나 반을 먹는 습관을 들여 봐요. 처음부터 음식을 너무 적게 주는 것도 개선해요.',
    '과식으로 인한 열량 섭취 과다는 소아비만의 원인이 될 수 있어요. 아이가 먹는 밥 양을 조금씩 줄여보고, 더 많은 활동을 할 수 있도록 해요',
    '과식으로 인한 열량 섭취 과다는 소아비만의 원인이 될 수 있어요. 아이가 먹는 밥 양을 조금씩 줄여보고, 추가적으로 밥을 더 주기보다는 처음에 준 양만을 먹을 수 있도록 해요.',
    '짠 반찬보다는 저염 반찬으로, 키 성장에 도움이 되는 반찬을 만들어 아이에게 먹여봐요. 과식은 금물!',
    '아이가 섭취하는 국물의 양을 줄일 수 있도록 하고, 국 간을 할 때에는 저염식으로 과하지 않게 간하도록 해요.',
    '아이가 밥을 꼭꼭 씹어 먹을 수 있도록, 그리고 식사 시간이 약 20분 정도를 유지할 수 있도록 해야 해요.',
    '아이가 밥을 꼭꼭 씹어 먹을 수 있도록, 그리고 식사 시간이 약 20분에서 30분 사이를 유지할 수 있도록 해야 해요.',

    '아이가 밥 먹는데 오롯이 집중할 수 있도록 방해 요소를 제거하여 식사 시간이 30분을 넘기지 않도록 조절해야 해요. ',
    '아이가 밥을 먹을 때는 오로지 밥을 먹는 행위에 집중할 수 있도록 해주셔야해요. 핸드폰이나 책 tv를 보면서 먹지 않도록 해주세요.',
    '아이가 식사에 집중할 수 있도록 주변 환경을 아이가 시선이 빼앗기지 않도록 시선을 빼앗길 만한 요소는 치워주세요.',
    '편식이 습관화된다면 영양소가 골고루 섭취되기가 어려워 아이의 성장이 더뎌질거예요. 모든걸 고려하지 않아도 괜찮아요. 챙길 수 있는 영양소들은 꼭 챙겨주세요.',
    '아이가 좋아하는 음식을 챙겨주는 것도 좋지만, 골고루 먹는 식사 습관을 들일 수 있게 해주세요. 모든걸 고려하지 않아도 괜찮아요. 챙길 수 있는 영양소들은 꼭 챙겨주세요.',
    '외식을 조금 줄일 필요가 있어요. 외식은 과다한 당, 나트륨 섭취로 이어지기 때문에, 번거롭더라도 아이의 성장을 위해 직접 요리해서 집밥으로 한 끼를 챙겨줄 필요가 있어요.',
    '배달을 조금 줄일 필요가 있어요. 배달은 주로 단일 메뉴로 구성되어있기 때문에 균형잡힌 영양소 섭취가 힘들어요. 번거롭더라도 아이의 성장을 위해 직접 요리해서 집밥으로 한 끼를 챙겨줄 필요가 있어요.',
    '성장기의 아이에게 인스턴트 음식은 좋지 않으니 어머니께서 직접 요리를 해서 아이에게 필요한 성분 요리를 제공해주세요.',
    '패스트 푸드를 좋아하는 아이라면 패스트 푸드 대신 집에서 직접 만들어서 아이가 좋아할 만한 음식을 제공해주시는 것이 좋습니다.',
    '아이의 원활한 성장을 돕기 위해 수분을 충분히 섭취할 수 있도록 해야 해요. 하루에 종이컵 기준으로 최소 8컵 이상의 물을 마실 수 있게 해주세요.',

    '식사로는 미처 채우지 못한 영양분을 채워줄 수 있는 간식 위주로 하루 1~2회 정도만 챙겨주세요.',
    '견과류를 간식으로 주는 것은 큰 문제가 되지 않지만, 적당한 양을 주는 것이 중요해요. 또한 양념이 가미된 견과류는 피하도록 해요.',
    '건강하지 않은 간식의 섭취량을 확 줄이고, 건강한 간식으로 대체해야 해요.',
    '탄수화물 위주의 간식 섭취를 줄이고, 건강하고 키 성장에 도움이 되는 간식으로 대체해야 해요.',
    '많은 당이 포함되어있는 과일은 하루 적당량 섭취가 중요해요.',
    '아이의 꾸준한 식사가 이뤄질 수 있도록 저녁 시간을 함께해주세요.',
    '식사시간을 좀 더 느긋하게 가져보아요. 평소 못했던 대화를 해도 좋고, 아이의 일상을 물어봐도 좋아요. 밥을 먹으면서 아이에게 소화시킬 시간을 함께 주는거죠.',
    '엄마가 군것질을 좋아하시는 편이네요. 군것질은 부족한 영양소를 보충할 수 있는 좋은 방편이 될 수 있지만 한편으로는 불필요한 칼로리를 섭취할 가능성도 높아져요. 아이와 함께 균형 잡힌 군것질 횟수를 줄여보는 것은 어떨까요?',
    '식사가 엄마가 좋아하는 음식에 치중하지 않고 다양한 종류의 음식들로 이루어질 수 있도록 해보아요.',
    '아이가 편식하는 음식도 잘 먹을 수 있도록 싫어하는 음식으로 재미난 모양으로 만든 음식으로 편식음식을 좋아할 수 있도록 요리를 해주세요.',

    '엄마의 야근이 잦아질수록 아이의 식사시간이 늦어지거나 야식을 먹을 확률이 높아져요! 아이가 건강한 식습관을 들일 수 있게 엄마의 노력이 필요해요.',
  ];
  List<String> sleepProblemsDescription = [
    '수면습관에 방해가 되는 요소가 있는지 확인해보고 그에 맞는 적절한 관리법이 필요합니다.',
    '깊은 수면에 들기까지 적정 시간을 유지할 수 있어야 해요. 수면 유도 음악 및 영상을 통해 자연스러운 수면 유도를 도와요.',
    '잠에 드는 적정 시간은 약 15분에서 30분 사이에요. 아이가 좀 더 빠르게 잠에 들 수 있도록 안정적인 수면 환경을 조성해주어야 해요.',
    '키 성장은 많은 수면이 아닌 질 좋은 수면에서 비롯되니 낮잠시간을 줄이는 것이 필요해보여요. 아이의 낮잠 시간을 하루 최대 1시간으로, 가능하면 30분까지 줄여야 해요.',
    '키가 조금이라도 더 클 수 있게 10시 이전에는 최대한 잠자리에 들도록 해주세요. 아이가 학원을 다니고 있다면 최대한 10시 이후는 피해주시고, 숙제도 10시 이후에 해야하는 숙제라면 줄여주세요.',
    '8시간 이하로 자게 되면 아이의 성장은 눈에 띄게 더뎌져요. 아이가 자기 전에 스마트폰을 너무 많이 하진 않는지, 잠을 깊이 못자서 수면시간이 부족한지 그 원인을 정확히 아는 것이 중요해요. 원인을 아는 것이 성장을 위한 첫걸음이랍니다.',
    '아이가 잠들때는 소음을 줄이고 아이가 푹 잘 수 있도록 조용한 수면환경을 조성해야합니다.',
    '수면의 질은 성장호르몬 분비에 많은 영향을 미쳐요. 깊은 잠을 잘 수 있는 환경 조성이 무엇보다 중요해요.',
    '아이가 전자기기를 사용하지 않도록 옆에서 잘 관리해주시는 것이 중요합니다.',
    '전자기기의 전자파에 장시간 노출되면 숙면 호르몬인 멜라토닌이 감소해 성장에 영향을 줘요. 아이의 잠자리와 전자기기의 거리를 열걸음 이상 배치해주세요.',

    '어린 아이들은 엄마의 행동을 그대로 따라하곤 해요. 엄마가 일찍 잠들면 아이도 일찍 잠들게 될거에요.',
    '엄마가 건강한 수면 습관을 통해 아이에게 본보기를 보이는 것이 중요해요. 하루 7시간 가량의 수면을 취해보세요.',
  ];
  List<String> activityProblemsDescription = [
    '',
    '',
    '',
    '',
    '',
    '갑작스런 운동량을 늘리는 것보다는 아이가 좋아하는 놀이 위주로 먼저 운동량을 늘려보세요.',
    '아이들에게 적당한 운동은 성장판을 자극시켜줄 수 있어요. 아이 혼자, 친구들과 함께, 부모님과 함께. 뭐든 좋아요. 아이가 운동을 주기적으로 할 수 있게 옆에서 도와줘야 해요.',
    '성장판 자극을 위해 적당한 활동은 필수적이에요. 아이가 충분한 활동을 할 수 있는 경로를 제공해주세요.',
    '바른 자세 교정으로 바른 목 자세를 유지해야 해요. 바른 자세는 키 성장의 핵심이예요.',
    '다리를 자주 꼬지 않게 해주는 것이 가장 중요해요. 아이에게 스트레스를 주지 않는 선에서 옳은 자세에 대한 교육이 필요해요. 물론 왜 옳은 자세가 중요한지부터 설명해줘야겠죠!',

    '아이에게 무거운 가방은 좋지 않으니 가방의 무게를 최소화해주는 것이 좋습니다.',
    '자세 교정을 통해 어깨의 균형을 바로 잡아야 해요. 신체 밸런스를 맞추는 것은 키 성장 만큼이나 중요해요.',
    '자세 교정을 통해 어깨의 균형을 바로 잡아야 해요. 신체 밸런스를 맞추는 것은 키 성장 만큼이나 중요해요.',
    '올바른 자세 교정으로 곧은 척추를 유지해야 해요. 바른 자세는 키 성장의 핵심이예요.',
    '오래 앉아있는 습관은 자세가 틀어지기 쉬워요. 자주자주 스트레칭해주고, 일어나서 주변을 환기시켜주는 것이 좋아요.',
    '아이 앞에서는 엄마의 행동도 조심해야해요. 아이의 전자기기 사용 시간을 줄이며 엄마도 아이와 함께 전자기기 사용시간을 줄이고 아이와 재밌는 활동을 해보세요.',
    '아이 앞에서는 엄마의 행동도 조심해야해요. Tv 시청 시간을 줄이며 아이와 재밌는 활동을 해보세요.',
    '자녀와 함께 하는 시간이 짧다고 느껴졌다면 조금 더 시간을 내서 자녀와 함께 해보는건 어떨까요? 생각보다 다양한 자녀와 함께 할 수 있는 활동들이 있답니다.',
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
                TitleText(widget.appState.userInfo['name']+'를 위한 성장 관리법'),

                SizedBox(height: 22),
                Text('추천 성장 관리법을 꾸준히 실행했을 때,', style: TextStyle(fontFamily: 'gmarketSans',
                    fontSize: 15)),

                SizedBox(height: 8),
                Text.rich(TextSpan(style: TextStyle(fontFamily: 'gmarketSans', fontSize: 15), children: [
                  TextSpan(text: widget.appState.userInfo['name']+'가 성장할 수 있는 예상 키는 ',),
                  TextSpan(text: height.toString()+'cm', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '에요.'),
                ])),

                SizedBox(height: 35),
                Row(
                    children:
                    [
                      FaIcon(FontAwesomeIcons.appleAlt, color: Color(0xff41e496), size:16),
                      Text(' 영양', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 16)),
                      Text(' ('+nutritionProblems.length.toString()+'개의 솔루션이 있어요.)', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 11)),
                    ]),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      ScoreCircle2(nutritionScore, nutritionProblems.length, Color(0xff41e496)),
                      SizedBox(width: 20),
                      CommentListBox(nutritionProblems),
                    ]),

                SizedBox(height: 30),
                Row(
                    children:
                    [
                      FaIcon(FontAwesomeIcons.solidMoon, color: Color(0xff9bd5f6), size:16),
                      Text(' 수면', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 16)),
                      Text(' ('+sleepProblems.length.toString()+'개의 솔루션이 있어요.)', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 11)),
                    ]),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      ScoreCircle2(sleepScore, sleepProblems.length, Color(0xff9bd5f6)),
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
                      Text(' ('+activityProblems.length.toString()+'개의 솔루션이 있어요.)', style: TextStyle(fontFamily: 'gmarketSans', fontSize: 11)),
                    ]),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      ScoreCircle2(activityScore, activityProblems.length, Color(0xffb77eff)),
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
                                widget.appState.state = 'survey9';
                          }
                      ),
                      SizedBox(width:15),
                      BlueButton(
                          width:128,
                          height:38,
                          text: '목표 설정하기',

                          onPressed: () async {
                            if (true) {
                              Map<String, dynamic> info = {
                                'phase': 'goalSetting',

                                'goalHeight': height,

                                'nutritionProblemsIndex': nutritionProblemsIndex,
                                'activityProblemsIndex': activityProblemsIndex,
                                'sleepProblemsIndex': sleepProblemsIndex,
                              };

                              print(info);

                              widget.appState.userInfo.addAll(info);

                              widget.appState.writeDB(info);

                              widget.appState.state = 'goalSetting';

                            }
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
