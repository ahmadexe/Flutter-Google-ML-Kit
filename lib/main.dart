import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ml_kit/firebase_options.dart';
import 'package:ml_kit/screens/dashboard.dart';
import 'package:provider/provider.dart';

import 'providers/app_providers.dart';

void main(List<String> args) async {
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
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: const MaterialApp(
        title: 'ML Kit',
        home: DashboardScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
