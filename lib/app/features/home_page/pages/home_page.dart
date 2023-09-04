// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/home_page/controler/home_controller.dart';

import '../../matchs_live/presenter/widgets/list_tile_live_match_widget.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;
  const HomePage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateLive() {
    Timer.periodic(const Duration(minutes: 1), (time) {
      if (widget.homeController.matchStore.state.matchLiveList.isNotEmpty) {
        // widget.homeController.matchStore.getMatchLive();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.homeController.leagueStore.getLeagues();
    widget.homeController.matchStore.getMatchLive();
    // updateLive();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.04,
              left: size.width * 0.05,
              right: size.width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.015,
                ),
                SizedBox(
                  height: size.height * 0.75,
                  child: ScopedBuilder(
                      store: widget.homeController.leagueStore,
                      onError: (context, error) => const Text('Error'),
                      onLoading: (context) => const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.pink),
                            ),
                          ),
                      onState: (context, state) {
                        return ValueListenableBuilder(
                          valueListenable:
                              widget.homeController.matchStore.selectState,
                          builder: (context, value, child) {
                            return SizedBox(
                                height: size.height,
                                child: ListTileLiveMatchWidget(
                                  homeController: widget.homeController,
                                ));
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
