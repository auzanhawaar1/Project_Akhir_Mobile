import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posttest5/pages/about_page.dart';
import 'package:posttest5/pages/animation_page.dart';
import 'package:posttest5/pages/home_page.dart';
import 'package:posttest5/pages/crud/kategori_page.dart';
import 'package:posttest5/pages/crud/lihat_kategori.dart';
import 'package:posttest5/pages/crud/lihatbike.dart';
import 'package:posttest5/pages/auth/login_page.dart';
import 'package:posttest5/pages/introduction_page.dart';
import 'package:provider/provider.dart';
import 'package:posttest5/pages/auth/firebase_options.dart';
import 'package:posttest5/provider/setting_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeModeData(),
        ),
      ],
      child: Builder(builder: (ctx) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                  ),
                ),
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
                  ),
                ),
                themeMode: Provider.of<ThemeModeData>(ctx).themeMode,
                home: const MyHomePage(),
                routes: {
                  '/home': (context) => const MyHomePage(),
                  '/input': (context) => KategoriPage(),
                  '/about': (context) => const About(),
                  '/animation': (context) => AnimationPage(),
                  '/intro': (context) => IntroductionPage(),
                  '/login': (context) => LoginPage(),
                  '/lihat': (context) => LihatData(),
                  '/lihatkategori':(context) => LihatKategoriPage()
                },
                initialRoute: '/home',
              );
            } else {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                home: IntroductionPage(),
              );
            }
          },
        );
      }),
    );
  }
}
