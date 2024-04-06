import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/features/Reporting/presentation/screen/reporting_screen.dart';
import 'package:moneyapp/features/camera/presentation/screen/camera_screen.dart';
import 'package:moneyapp/features/exchange/presentation/bloc/exchange_state.dart';
import 'package:moneyapp/features/exchange/presentation/screen/exchange_screen.dart';
import 'package:moneyapp/features/more/presentation/screen/more_screen.dart';

import '../../../exchange/presentation/bloc/exchange_cubic.dart';
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
    return BlocConsumer<ExchangeCubic, ExchangeState>(
      listener: (context, state) {},
      builder: (context, state) {
       var cubic = ExchangeCubic.get(context);

        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;



        return Scaffold(
          body: PageView(
            children: _buildThreePageViewChildren(),
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(
                    () {
                  _pageIndex = index;

                  cubic.getLocation();
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
            currentIndex: _pageIndex,unselectedItemColor:  AppColors.gray2,
            unselectedIconTheme: const IconThemeData(color:  AppColors.gray2),
            fixedColor: AppColors.colorPrimary,backgroundColor: Colors.white,

          ),
        );
      },
    );

  }

  List<Widget> _buildThreePageViewChildren() {
    return <Widget>[
      const CameraScreen(),
      const ReportingScreen(),
      const ExchangeScreen(),
      const MoreScreen(),
    ];
  }

  List<BottomNavigationBarItem> _buildThreeItems() {
    return  <BottomNavigationBarItem>[
       BottomNavigationBarItem(
        backgroundColor: Colors.white,

        icon: Column(
          children: [
            _pageIndex==0?  SizedBox(height: 30.h,width: 80.w,
                child: Image.asset(ImageAssets.Union,)):SizedBox(),
            const Icon(Icons.document_scanner_outlined),
          ],
        ),
        label: 'Scan',
      ),
       BottomNavigationBarItem(
        backgroundColor: Colors.white,

        icon: Column(
          children: [
            _pageIndex==1?  SizedBox(height: 30.h,width: 80.w,child:
            Image.asset(ImageAssets.Union,)):SizedBox(),
            Icon(Icons.location_on_outlined),
          ],
        ),
        label: 'Reporting',
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.white,

        icon: Column(
          children: [
            _pageIndex==2?  SizedBox(height: 30.h,width: 80.w,child: Image.asset(ImageAssets.Union,)):SizedBox(),

            SizedBox(height: 30.h,width: 35.w,child: Image.asset(ImageAssets.exchange,)),
          ],
        ),
        label: 'Exchange',
      ),    BottomNavigationBarItem(
        backgroundColor: Colors.white,

        icon: Column(
          children: [
            _pageIndex==3?  SizedBox(height: 30.h,width: 80.w,child: Image.asset(ImageAssets.Union,)):SizedBox(),

            Icon(Icons.menu),
          ],
        ),
        label: 'More',
      ),
    ];
  }
}
