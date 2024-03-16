import 'package:flutter/material.dart';
import 'package:flutter_application_3/widget/auth/auth_widget.dart';
import 'package:flutter_application_3/widget/main_screen/main_screen.dart';
import 'package:flutter_application_3/Thems/colors.dart';
import 'package:flutter_application_3/widget/ErrorPage/ErrorPage.dart';
import 'package:flutter_application_3/widget/main_screen/move_Widget/deteilmovie/deteilMovieWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
            backgroundColor: AppColors.mainColor),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromARGB(255, 89, 177, 248)),
      ),
      routes: {
        '/': (context) => Auth_Widget(),
        '/main_screen': (context) => MainWidget(),
        '/main_screen/deteil_movie_info': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args != null) {
            return DeteilMovieWidget(
              movieID: args,
            );
          } else {
            return ErrorPage();
          }
        },
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Error Page'),
            ),
            body: Center(
              child: Text('Some gone wrong'),
            ),
          );
        });
      },
    );
  }
}
