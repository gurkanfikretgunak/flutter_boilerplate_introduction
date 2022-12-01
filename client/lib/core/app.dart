import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp(
        title: "Flutter Boilerplate : ${Flavor.I.getString(Keys.appTitle)}",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
