// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/home_page/controler/home_controller.dart';
import 'package:live_score/app/features/leagues/presenter/store/widgets/list_leagues_widget.dart';
import 'package:live_score/app/features/live_match/widgets/card_live_match.dart';
import 'package:live_score/app/features/matchs_league/presenter/widgets/card_row_match_widget.dart';
import 'package:live_score/app/features/table_camp/domain/params/get_table_camp_params.dart';

import '../../matchs_league/presenter/widgets/card_match_live_widget.dart';

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
  @override
  void initState() {
    super.initState();
    widget.homeController.leagueStore.getLeagues();
    widget.homeController.matchStore.getMatchOfLeague(
        widget.homeController.leagueStore.state.leagueSelected);
    widget.homeController.matchStore
        .getMatchLive(widget.homeController.leagueStore.state.leagueSelected);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.04,
              left: size.width * 0.05,
              right: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.015,
              ),
              ScopedBuilder(
                store: widget.homeController.leagueStore,
                onError: (context, error) => const Text('Error'),
                onLoading: (context) => const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.pink),
                  ),
                ),
                onState: (context, state) {
                  return SizedBox(
                    height: size.height * 0.06,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: size.width * 0.03,
                          );
                        },
                        itemCount: widget
                            .homeController.leagueStore.state.listLeague.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          final league = widget.homeController.leagueStore.state
                              .listLeague[index];
                          return ListLeagueWidget(
                            leagueEntity: league,
                            onTap: () async {
                              await widget.homeController.leagueStore
                                  .selectedLeague(league.id);
                              await widget.homeController.matchStore
                                  .getMatchOfLeague(league.id);
                              await widget.homeController.matchStore
                                  .getMatchLive(widget.homeController
                                      .leagueStore.state.leagueSelected);
                            },
                            indexLeague: league.id,
                            indexMatch: widget.homeController.leagueStore.state
                                .leagueSelected,
                          );
                        }),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              ScopedBuilder(
                onError: (context, error) => const Text('Error'),
                store: widget.homeController.matchStore,
                onState: (context, state) {
                  return Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'AO VIVO',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.red,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.25,
                        child: widget.homeController.matchStore.state
                                .matchLiveList.isNotEmpty
                            ? ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final match = widget.homeController.matchStore
                                      .state.matchLiveList[index];
                                  return SizedBox(
                                    width: size.width * 0.7,
                                    child: CardMatchLiveWidget(
                                      matchEntity: match,
                                      onTap: () {
                                        print(match.id);
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder: (_, __) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount: widget.homeController.matchStore
                                    .state.matchLiveList.length)
                            : Container(),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Próximas partidas',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05),
                  ),
                  Text(
                    'ver mais',
                    style: TextStyle(
                      fontSize: size.width * 0.033,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ScopedBuilder(
                store: widget.homeController.matchStore,
                onState: (context, state) {
                  return SizedBox(
                    width: size.width,
                    height: size.height * 0.7,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final match = widget.homeController.matchStore.state
                              .matchFutureList[index];
                          return CardRowMatchWidget(matchEntity: match);
                        },
                        separatorBuilder: (_, __) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: widget.homeController.matchStore.state
                                    .matchFutureList.length >
                                10
                            ? 15
                            : widget.homeController.matchStore.state
                                .matchFutureList.length),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
