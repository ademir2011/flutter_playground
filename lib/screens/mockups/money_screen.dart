import 'package:flutter/material.dart';

class MainMoneyScreen extends StatelessWidget {
  const MainMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MoneyScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w600,
            fontSize: 22.5,
          ),
          headline6: const TextStyle(
            color: Colors.white,
            fontSize: 17.5,
          ),
        ),
      ),
    );
  }
}

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const FlutterLogo(size: 95),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    'Get your Money Under Control',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Manage your expenses Seamlessly.',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90),
            Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Sign Up With Email ID'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF635ce5),
                  textStyle: const TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FlutterLogo(size: 20),
                    SizedBox(width: 10),
                    Text(
                      'Sign Up with Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  TextButton(
                    child: Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
