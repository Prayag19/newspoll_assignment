
import 'package:flutter/material.dart';
import 'package:newspoll/ui/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
        );
      },
      title: 'News Polls',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "assets/fonts/Lato-Regular.ttf"
      ),
      home:const MainPage(),
    );
  }
}

