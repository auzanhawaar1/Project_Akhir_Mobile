import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posttest5/animation_page.dart';
import 'package:posttest5/firebase_options.dart';
import 'package:posttest5/home_page.dart';
import 'package:posttest5/introduction_page.dart';
import 'package:posttest5/kategori_page.dart';
import 'package:posttest5/setting_screen.dart';
import 'package:provider/provider.dart';
import 'about_page.dart';
import 'package:posttest5/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            create: (context) => ThemeModeData(),
          ),
        ],
        child: Builder(builder: (ctx) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.light,
                textTheme: const TextTheme(
                  headlineLarge: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Serif",
                  ),
                  bodyLarge: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                )),
            darkTheme: ThemeData(
                useMaterial3: false,
                brightness: Brightness.dark,
                textTheme: const TextTheme(
                  headlineLarge: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Serif",
                  ),
                  bodyLarge: TextStyle(color: Colors.grey),
                )),
            themeMode: Provider.of<ThemeModeData>(ctx).themeMode,
            home: const IntroductionPage(),
            routes: {
              '/home': (context) => const MyHomePage(),
              '/input': (context) => KategoriPage(),
              '/about': (context) => const About(),
              '/animation': (context) => AnimationPage(),
              '/intro': (context) => IntroductionPage(),
              '/login': (context) => LoginPage()
            },
            initialRoute: '/intro',
          );
        })
        );
  }
}
