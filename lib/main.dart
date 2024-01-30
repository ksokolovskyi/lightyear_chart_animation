import 'package:flutter/material.dart' hide AppBar;
import 'package:lightyear_chart_animation/app_bar.dart';
import 'package:lightyear_chart_animation/body.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(),
        body: SafeArea(
          child: Body(),
        ),
      ),
    );
  }
}
