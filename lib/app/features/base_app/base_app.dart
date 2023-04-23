// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_score/app/core/shared/theme/theme.dart';
import 'package:live_score/app/features/home_page/pages/home_page.dart';

class BaseApp extends StatefulWidget {
  const BaseApp({super.key});

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    int currentIndex = 0;

    final pageController = PageController();
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ThemeColors.backgroundColor,
        elevation: 0,
        title: const Text(
          'LiveScore',
          style: TextStyle(
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
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.050,
              top: size.height * 0.012,
            ),
            child: SvgPicture.asset(
              'lib/assets/icons/sinal.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        backgroundColor: ThemeColors.secondBackgroud,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.house_sharp),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.menu_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person_outlined),
          ),
          // BottomNavigationBarItem(
          //   label: '',
          //   icon: Icon(Icons.person_outlined),
          // ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const HomePage(),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
