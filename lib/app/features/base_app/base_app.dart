// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_score/app/features/home_page/controler/home_controller.dart';
import 'package:live_score/app/features/home_page/pages/home_page.dart';
import 'package:live_score/app/features/table_camp/presenter/pages/list_leagues_page.dart';

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

    void setIndex(index) {
      setState(() {
        currentIndex = index;
      });
    }

    final pageController = PageController();
    return Scaffold(
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
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            HomePage(
              homeController: controller,
            ),
            ListLeaguesPage(
              controller: controller,
            ),
            ListLeaguesPage(
              controller: controller,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          iconSize: size.height * 0.03,
          currentIndex: currentIndex,
          onTap: (index) {
            setIndex(index);
            currentIndex = index;
            pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
              label: 'MENU',
              icon: SvgIcon(
                assetName: 'lib/assets/icons/home_icon.svg',
                color: currentIndex == 0 ? Colors.pink : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'LIGAS',
              icon: SvgIcon(
                assetName: 'lib/assets/images/tabela.svg',
                color: currentIndex == 1 ? Colors.pink : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'TABELAS',
              icon: SvgIcon(
                assetName: 'lib/assets/images/tabela.svg',
                color: currentIndex == 1 ? Colors.pink : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'PERFIL',
              icon: SvgIcon(
                assetName: 'lib/assets/icons/profile_icon.svg',
                color: currentIndex == 2 ? Colors.pink : Colors.grey,
              ),
            ),
          ],
        ));
  }
}
