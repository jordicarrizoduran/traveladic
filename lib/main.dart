import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveladic_app/firebase_options.dart';
import 'package:traveladic_app/providers/preferences_provider.dart';
import 'package:traveladic_app/providers/trips_data.dart';
import 'package:traveladic_app/styles/app_styles.dart';

import 'screens/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => PreferencesProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => TripsData(),
        ),
      ],
      child: MaterialApp(
        title: 'Travelàdic App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              foregroundColor: Colors.white,
              backgroundColor: AppStyles.principal,
              centerTitle: true,
            )),
        home: const Splash(),
      ),
    );
  }
}
