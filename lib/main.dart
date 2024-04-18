import 'package:flutter/material.dart';
import 'package:flutter_exam_crud_operation/controller/home_screen_controller.dart';
import 'package:flutter_exam_crud_operation/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context) => HomeScreenController(),
        )
        ],
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home:HomeScreen() ,
      ),
    );
  }
}
