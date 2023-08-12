// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_score/app/features/home_page/controler/home_controller.dart';
import 'package:live_score/app/features/home_page/pages/home_page.dart';
import 'package:live_score/app/features/table_camp/presenter/pages/table_camp_page.dart';

import '../../core/shared/helpers/svg_icon.dart';

class BaseApp extends StatefulWidget {
  const BaseApp({super.key});

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();
    final size = MediaQuery.of(context).size;

    int currentIndex = 0;

    final pageController = PageController();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Center(
          child: SvgPicture.asset(
            'lib/assets/icons/live_menu.svg',
            color: Colors.white,
            height: 30,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'LiveScore',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.080,
            top: size.height * 0.012,
          ),
          child: SvgPicture.asset(
            'lib/assets/icons/menu.svg',
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.050,
              top: size.height * 0.012,
            ),
            child: SvgPicture.asset(
              'lib/assets/icons/news.svg',
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomePage(
            homeController: controller,
          ),
          TableCampPage(
            homeController: controller,
            title: '',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        iconSize: size.height * 0.03,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: SvgIcon(
              assetName: 'lib/assets/icons/home_icon.svg',
              color: currentIndex == 0 ? Colors.pink : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgIcon(
              assetName: 'lib/assets/icons/profile_icon.svg',
              color: currentIndex == 1 ? Colors.pink : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
