import 'package:flutter/material.dart';
import 'package:flutter_application_3/Thems/colors.dart';
import 'package:flutter_application_3/widget/main_screen/move_Widget/MoviWidget.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectTab = 0;

  void selectedTab(int index) {
    if (index == _selectTab) return;
    setState(() {
      _selectTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: IndexedStack(
        index: _selectTab,
        children: [
          Text('News'),
          MoviWidget(),
          Text('Сериалы'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Сериалы',
          ),
        ],
        onTap: selectedTab,
      ),
    );
  }
}
