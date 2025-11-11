import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_001/views/data/fetch_post_provider.dart';
import 'package:test_flutter_001/views/data/notifiers.dart';
import 'package:test_flutter_001/views/data/number_list_provider.dart';
import 'package:test_flutter_001/views/pages/WelcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter_001/views/widgets/ConstantValues.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NumberListProvider()),
        ChangeNotifierProvider(create: (_) => FetchListProvider()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int selectedIndex=0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    initPreference();
  }

  Future<void> initPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isDark = prefs.getBool(ConstantValues.isDarkKey);
    darkModeNotifier.value= isDark?? false;
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeNotifier,
      builder: (context, bool isDarkMode, child) {

        final colorScheme = ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
        );

        return MaterialApp(
          title: "Ashik",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: colorScheme,
            useMaterial3: true, // optional, looks better
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}

