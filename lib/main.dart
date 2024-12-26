import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/application/authatication/controller/auth_countroller.dart';
import 'package:task_app/application/authatication/view/sign_in.dart';
import 'package:task_app/application/taks/controller/profile_controller.dart';
import 'package:task_app/application/taks/controller/task_controller.dart';
import 'package:task_app/application/taks/view/home_page.dart';
import 'package:task_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  final preference=await SharedPreferences.getInstance();
  final String? uid=preference.getString("userId");
  runApp( MyApp(userId: uid,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,  this.userId});
  final String?userId;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthCountroller()),
        ChangeNotifierProvider(create: (context)=>TaskController()),
        ChangeNotifierProvider(create:(context)=>ProfileController() )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: (userId!=null && userId!.isNotEmpty)?HomePage():SignInPage()),
    );
  }
}
