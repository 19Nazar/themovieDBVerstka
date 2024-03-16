import 'package:flutter/material.dart';

class Auth_Widget extends StatefulWidget {
  const Auth_Widget({super.key});

  @override
  State<Auth_Widget> createState() => _Auth_WidgetState();
}

class _Auth_WidgetState extends State<Auth_Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login to Your acc')),
      ),
      body: ListView(children: [
        _HeaderWidget(),
      ]),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 17,
    );
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 25, right: 30),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. ',
              style: style,
            ),
            TextButton(onPressed: () {}, child: Text('Regist')),
            Text(
              'Если Вы зарегистрировались, но не получили письмо для подтверждения, чтобы отправить письмо повторно. ',
              style: style,
            ),
            TextButton(onPressed: () {}, child: Text('Verify Email')),
            _FormInnput(),
          ],
        ),
      ),
    );
  }
}

class _FormInnput extends StatefulWidget {
  const _FormInnput({super.key});

  @override
  State<_FormInnput> createState() => _FormInnputState();
}

class _FormInnputState extends State<_FormInnput> {
  var textError = null;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: Color(0xFF212529),
      fontSize: 15,
    );

    final padding = EdgeInsets.symmetric(vertical: 5, horizontal: 10);

    final enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide:
          BorderSide(color: Colors.grey), // Цвет границы в нормальном состоянии
    );

    final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: Color.fromARGB(
              144, 1, 88, 187)), // Цвет границы во время фокусировки
    );

    final loginController = TextEditingController(text: 'admin');

    final passwordController = TextEditingController(text: '12345');

    void _auth() {
      if (loginController.text == 'admin' &&
          passwordController.text == '12345') {
        Navigator.of(context).pushReplacementNamed('/main_screen');
      } else {
        setState(() {
          textError = "Not good!!!";
        });
      }
    }

    void reset() {
      print("reset yor password");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textError != null) Text(textError),
        Text(
          'Имя пользователя',
          style: style,
        ),
        TextField(
          controller: loginController,
          decoration: InputDecoration(
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            contentPadding: padding,
            isCollapsed: true,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Пароль',
          style: style,
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            contentPadding: padding,
            isCollapsed: true,
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Установите радиус по вашему желанию
                      ),
                    ),
                    side: MaterialStateProperty.all(BorderSide(width: 1)),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(237, 3, 173, 252))),
                onPressed: _auth,
                child: Text(
                  'Войти',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              width: 10,
            ),
            TextButton(
                onPressed: reset,
                child: Text(
                  'Сбросить пароль',
                )),
          ],
        ),
      ],
    );
  }
}
