import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MainTinderScreen extends StatelessWidget {
  const MainTinderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TinderScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> data = [
  {'icon': Icons.face, 'text': 'SIGN IN WITH APPLE'},
  {'icon': Icons.face, 'text': 'SIGN IN WITH FACEBOOK'},
  {'icon': Icons.face, 'text': 'SIGN IN WITH PHONE NUMBER'}
];

class TinderScreen extends StatelessWidget {
  const TinderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFe96f65), Color(0xFFe34675)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(
                Icons.arrow_back_ios,
                size: 35,
                color: Colors.white,
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FlutterLogo(size: 45),
                  Text(
                    'tinder',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        getRichText(context, text: 'By tapping Create Account or Sign In, you agree to our '),
                        getRichText(context, text: 'Terms', link: () {}),
                        getRichText(context, text: '. Learn how we process your data in our '),
                        getRichText(context, text: 'Privacy Policy', link: () {}),
                        getRichText(context, text: ' and '),
                        getRichText(context, text: 'Cookies Policy', link: () {}),
                        getRichText(context, text: '.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  ...data.map((data) => TButton(text: data['text'], icon: data['icon'])),
                  const SizedBox(height: 10),
                  Text(
                    'Trouble Singning In?',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

TextSpan getRichText(BuildContext context, {required String text, void Function()? link}) {
  return TextSpan(
    text: text,
    style: link != null
        ? Theme.of(context).textTheme.headline6!.copyWith(decoration: TextDecoration.underline)
        : Theme.of(context).textTheme.headline6,
    recognizer: link != null ? (TapGestureRecognizer()..onTap = link) : null,
  );
}

class TButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const TButton({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.button,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
