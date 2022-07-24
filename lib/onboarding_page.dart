import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project/root_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

const style = TextStyle(fontWeight: FontWeight.w600);

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  void _onIntroEnd(context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const RootApp()),
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    // if (seen) {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (_) => const RootApp()),
    //   );
    // }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  List<PageViewModel> pages = [
    PageViewModel(
      title: "Disease detecting app",
      body: "Detect the most chronic diseases in seconds",
      image: Center(
        child: SvgPicture.asset(
          'images/virus.svg',
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    ),
    PageViewModel(
      title: "It's free for all",
      body: "No payment required, just your camera and you're good to go ",
      image: Center(
        child: SvgPicture.asset(
          'images/online-payment.svg',
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    ),
    PageViewModel(
      title: "Get Ready",
      body: "You're just a click away from detecting your plant diseases ",
      image: Center(
        child: SvgPicture.asset(
          'images/start.svg',
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      onDone: () => _onIntroEnd(context),
      done: const Text(
        "Done",
        style: style,
      ),
      next: const Text(
        "Next",
        style: style,
      ),
      skip: const Text(
        "Skip",
        style: style,
      ),
      curve: Curves.easeInOutCubicEmphasized,
      showSkipButton: true,
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Colors.indigo,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
