import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _buildThreePageViewChildren(),
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(
                () {
              _pageIndex = index;
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(elevation: 0.0,
        items: _buildThreeItems(),
        onTap: (int index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
        currentIndex: _pageIndex,unselectedItemColor:  AppColors.gray2,unselectedIconTheme: IconThemeData(color:  AppColors.gray2),
        fixedColor: AppColors.colorPrimary,backgroundColor: Colors.white,

      ),
    );
  }

  List<Widget> _buildThreePageViewChildren() {
    return <Widget>[
      Container(color: Colors.white),
      Container(color: Colors.blue),
      Container(color: Colors.green),
      Container(color: Colors.red),
    ];
  }

  List<BottomNavigationBarItem> _buildThreeItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.report_gmailerrorred),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.currency_exchange),
        label: 'currency_exchange',
      ),   BottomNavigationBarItem(
        icon: Icon(Icons.menu),
        label: 'Profile',
      ),
    ];
  }
}
