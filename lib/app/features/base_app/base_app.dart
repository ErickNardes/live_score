// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_score/app/features/home_page/controler/home_controller.dart';
import 'package:live_score/app/features/home_page/pages/home_page.dart';
import 'package:live_score/app/features/leagues/presenter/pages/league_page.dart';
import 'package:live_score/app/features/table_camp/presenter/pages/list_leagues_page.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      'lib/assets/icons/live_menu.svg',
                      color: Colors.white,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'N Score',
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            HomePage(
              homeController: controller,
            ),
            LeaguesPage(homeController: controller),
            ListLeaguesPage(
              controller: controller,
            ),
            ListLeaguesPage(
              controller: controller,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          iconSize: size.height * 0.03,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.jumpToPage(index);
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'HOME',
              icon: Icon(Icons.menu),
            ),
            BottomNavigationBarItem(
              label: 'LIGAS',
              icon: Icon(Icons.emoji_events),
            ),
            BottomNavigationBarItem(
              label: 'NEWS',
              icon: Icon(Icons.newspaper),
            ),
            BottomNavigationBarItem(
              label: 'PERFIL',
              icon: Icon(Icons.person),
            ),
          ],
        ));
  }
}
