import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_home.dart';
import 'package:moo_zf_flutter/pages/home/tab_info/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<Widget> tabList = [
  TabHomePage(),
  TabHomePage(),
  TabInfo(),
  TabHomePage()
];

List<BottomNavigationBarItem> itemContent = [
  BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home )),
  BottomNavigationBarItem(title: Text('搜索'), icon: Icon(Icons.search )),
  BottomNavigationBarItem(title: Text('资讯'), icon: Icon(Icons.info )),
  BottomNavigationBarItem(title: Text('我的'), icon: Icon(Icons.account_circle )),
];
int _selectedIndex = 0;
class _HomePageState extends State<HomePage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: itemContent,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}