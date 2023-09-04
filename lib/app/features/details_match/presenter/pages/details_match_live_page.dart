// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/details_match/presenter/widgets/card_match_widget.dart';
import 'package:live_score/app/features/details_match/presenter/widgets/statistics_progress_widget.dart';
import 'package:live_score/app/features/home_page/controler/home_controller.dart';
import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';

class DetailsMatchLivePage extends StatefulWidget {
  final HomeController controller;
  final MatchLiveEntity matchLive;
  const DetailsMatchLivePage({
    Key? key,
    required this.controller,
    required this.matchLive,
  }) : super(key: key);

  @override
  State<DetailsMatchLivePage> createState() => _DetailsMatchLivePageState();
}

class _DetailsMatchLivePageState extends State<DetailsMatchLivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          widget.matchLive.nameLeague,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ScopedBuilder(
        onError: (context, error) {
          return const Text('erro');
        },
        onLoading: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        store: widget.controller.detailsMatchLiveStore,
        onState: (context, state) {
          final dataHome = widget
              .controller.detailsMatchLiveStore.state.detailsMatchEntity.first;
          final dataAway = widget
              .controller.detailsMatchLiveStore.state.detailsMatchEntity.last;
          return SingleChildScrollView(
            child: Column(
              children: [
                CardDetailsMatchLiveWidget(
                  title: widget.matchLive.nameVanue,
                  nameHome: widget.matchLive.nameHomeTeam,
                  nameAway: widget.matchLive.nameAwayTeam,
                  imageHome: widget.matchLive.logoHomeTeam,
                  home: 'Casa',
                  away: 'Fora',
                  imageAway: widget.matchLive.logoAwayTeam,
                  pointsHome: widget.matchLive.goalHome,
                  pointsAway: widget.matchLive.goalAway,
                  time: widget.matchLive.statusElapsed,
                ),
                Card(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        StatisticsProgressWidget(
                          label: 'Chutes a gol',
                          valueHome: dataHome.totalShotsGoal,
                          valueAway: dataAway.totalShotsGoal,
                          isString: false,
                        ),
                        StatisticsProgressWidget(
                          label: 'Chutes no alvo',
                          valueHome: dataHome.shotsOnGoal,
                          valueAway: dataAway.shotsOnGoal,
                          isString: false,
                        ),
                        StatisticsProgressWidget(
                          label: 'Posse de bola',
                          valueHome: int.parse(
                              dataAway.possession.replaceAll('%', '')),
                          valueAway: int.parse(
                              dataHome.possession.replaceAll('%', '')),
                          isString: true,
                        ),
                        StatisticsProgressWidget(
                          label: 'Escanteios',
                          valueHome: dataHome.connerKicks,
                          valueAway: dataAway.connerKicks,
                          isString: false,
                        ),
                        StatisticsProgressWidget(
                          label: 'Cartões amarelos',
                          valueHome: dataHome.yellowCards,
                          valueAway: dataAway.yellowCards,
                          isString: false,
                        ),
                        StatisticsProgressWidget(
                          label: 'Cartões vermelhos',
                          valueHome: dataHome.redCards,
                          valueAway: dataAway.redCards,
                          isString: false,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
