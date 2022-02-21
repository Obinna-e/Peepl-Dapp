import 'package:flutter/material.dart';
import 'pages/layout.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF292B5E),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFB21EC1),
        ),
        textTheme:
            GoogleFonts.rubikTextTheme(Theme.of(context).textTheme.copyWith(
                  bodyText1: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .apply(color: Colors.white),
                  bodyText2: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .apply(color: Colors.white),
                )).apply(),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        scaffoldBackgroundColor: const Color(0xFF131028),
        canvasColor: const Color(0xFF1b162d),
      ),
      debugShowCheckedModeBanner: false,
      home: SiteLayout(),
    );
  }
}
