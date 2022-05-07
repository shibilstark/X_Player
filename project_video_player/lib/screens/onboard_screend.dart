import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_video_player/common/common_functions.dart';
import 'package:project_video_player/screens/splash_screen.dart';
import 'package:project_video_player/test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/permission.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

const SAVE_KEY = "OneceLogged";

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    askPermission();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome To X Player',
          body: 'Hello hi welcome have a nice day',
          // image:Container(
          //   width: double.infinity,
          //   height: 300,
          // ) ,
          footer: ElevatedButton(
            onPressed: () {
              setStatus();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => SplashScreen()));
              // pushToScreen(context: context, page: TestScreen());
            },
            child: Text("Get Start"),
          ),
        ),

        // PageViewModel(
        //     title: 'Welcome To X Player',
        //     body: 'Hello hi welcome have a nice day'),
      ],
      showSkipButton: false,
      showDoneButton: false,
      showNextButton: false,
    );
  }
}

checkStatus(BuildContext context) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final onceChecked = sharedPreferences.getBool(SAVE_KEY);

  if (onceChecked == null || onceChecked == false) {
    pushToScreen(context: context, page: OnboardScreen());
  } else {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => SplashScreen()));
  }
}

setStatus() async {
  final _sharedPrefs = await SharedPreferences.getInstance();
  _sharedPrefs.setBool(SAVE_KEY, true);
}
