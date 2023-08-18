// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/home_page/controler/home_controller.dart';

import '../store/widgets/list_tile_leagues_widget.dart';

class LeaguesPage extends StatefulWidget {
  final HomeController homeController;
  const LeaguesPage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  State<LeaguesPage> createState() => _LeaguesPageState();
}

class _LeaguesPageState extends State<LeaguesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScopedBuilder(
        store: widget.homeController.leagueStore,
        onState: (context, state) {
          return SizedBox(
              width: size.width,
              height: size.height,
              child: ListTileWidget(
                homeController: widget.homeController,
                leagueStore: widget.homeController.leagueStore,
              ));
        },
      ),
    );
  }
}
