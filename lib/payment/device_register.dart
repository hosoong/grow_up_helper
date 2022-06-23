import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';

import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';
import 'package:uni_links/uni_links.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

bool _initialUriIsHandled = false;

class DeviceRegisterPage extends StatefulWidget {
  DeviceRegisterPage({required this.appState});

  ApplicationState appState;

  @override
  _DeviceRegisterPageState createState() => _DeviceRegisterPageState();
}

class _DeviceRegisterPageState extends State<DeviceRegisterPage> {
  String url = 'https://www.fitbit.com/oauth2/authorize?response_type=token&client_id=23B98W&redirect_uri=myapp%3A%2F%2Fgrowup.app%2F&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=31536000';

  String? _latestUri = null;
  Object? _err;
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
  }

  Future<String> parse_uri(Uri? uri) async {
    var accessToken = uri.toString().split("#")[1];
    accessToken = accessToken.split("&")[0];
    accessToken = accessToken.split("=")[1];

    var url = Uri.https('api.fitbit.com', '/1/user/-/profile.json');

    //var url = Uri.https('api.fitbit.com', '/1/user/-/activities/date/2021-08-24.json');
    var response = await http.get(url, headers: {'Authorization': 'Bearer '+accessToken});
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);

      var userInfo = widget.appState.userInfo;

      userInfo['accessToken'] = accessToken;

      var child = null;
      var children = null;
      if (userInfo.containsKey('children')){
        children = userInfo['children'];

        child = Map.from(userInfo);
        child.remove('children');
      }
      else {
        children = [];
        child = Map.from(userInfo);
      }
      children.add(child);

      var nickname = userInfo['nickname'];
      var profileURL = userInfo['profileURL'];

      Map<String, dynamic> info = {
        'phase': 'home',
        'activeChildIndex': children.length-1,
        'nickname': nickname,
        'profileURL': profileURL,
        'children': children,
      };

      widget.appState.userInfo = info;

      widget.appState.setDB(info);

      widget.appState.state = 'home';
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return accessToken;
  }

  void _handleIncomingLinks() {
    if (true) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      _sub = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        print('got uri: $uri');
        setState(() {
          _latestUri = parse_uri(uri) as String;
          _err = null;
        });
      }, onError: (Object err) {
        if (!mounted) return;
        print('got err: $err');
        setState(() {
          _latestUri = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }

  Future<void> _handleInitialUri() async {
    // In this example app this is an almost useless guard, but it is here to
    // show we are not going to call getInitialUri multiple times, even if this
    // was a weidget that will be disposed of (ex. a navigation route change).
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;

      try {
        final uri = await getInitialUri();
        if (uri == null) {
          print('no initial uri');
        } else {
          print('got initial uri: $uri');
        }
        if (!mounted) return;
        setState(() => _latestUri = parse_uri(uri) as String);
      } catch(e) {
        // Platform messages may fail but we ignore the exception
        print('falied to get initial uri');
      }
    }
  }

  Future<void> _launchURL(BuildContext context) async {
    final theme = Theme.of(context);
    try {
      await launch(
        url,
        customTabsOption: CustomTabsOption(
          toolbarColor: theme.primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: theme.primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : true,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Colors.white,
        child:ListView(
          children:<Widget>[
            Column(
              children: <Widget>[
                SizedBox(height:80),
                TitleText('기기 등록'),

                SizedBox(height:20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children:[JustText('이미 기기를 구매하셨다면 등록 후 연결해주세요.')]),

                SizedBox(height:50),
                BlueButton(
                  width:194,
                  height:40,
                  text: '등록 후 관리 시작하기',
                  onPressed: () {
                    _launchURL(context);
                  }
                ),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}