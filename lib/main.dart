import 'package:flutter/material.dart';

import 'theme.dart';
import 'views/home.dart';
import 'views/login.dart';

void main() {
  runApp(const PandemicMonitor());
}

class PandemicMonitor extends StatelessWidget {
  const PandemicMonitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minhas Contas',
      theme: CustomizedTheme(kThemes.dark).getCustomizedTheme(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const Home(),
        '/home': (BuildContext context) => const Home(),
      },
    );
  }
}
