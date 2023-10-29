import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/src/features/home/presenter/controllers/home_controller.dart';
import 'package:weather_project/src/features/menu_navigation/menu_controller.dart';
import 'package:weather_project/src/features/menu_navigation/menu_navigation.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ListenableProvider(
            create: (context) => MenuNavigationController(),
          ),
          ListenableProvider(
            create: (context) => HomeController(),
          )
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MenuNavigation(),
    );
  }
}
