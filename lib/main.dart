import 'package:flutter/material.dart';
import 'package:my_flutter_web_project/features/login/controller.dart';
import 'package:my_flutter_web_project/routes/route_generator.dart';
import 'package:my_flutter_web_project/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserController>(
          create: (context) =>
              UserController(), // Initialize your UserViewModel here
        ),

        // Add your providers here if needed
      ],
      child: const MaterialApp(
        title: 'BID TEMPLATE',
        initialRoute: Routes.login,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
