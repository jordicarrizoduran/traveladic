import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:traveladic_app/styles/app_styles.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String status = 'A punt per viatjar?';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppStyles.principal,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Travelàdic',
              style: AppStyles.bigTitle.copyWith(color: AppStyles.whiteColor),
            ),
            Text(status, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    ));
  }

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (FirebaseAuth.instance.currentUser == null) {
      final providers = [EmailAuthProvider()];
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignInScreen(
              providers: providers,
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                }),
                AuthStateChangeAction<UserCreated>((context, state) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                }),
              ],
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      }
    }
    status = 'Carregant (100%)';
    setState(() {});
  }
}
