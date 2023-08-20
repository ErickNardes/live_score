// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'package:live_score/app/features/home_page/controler/home_controller.dart';

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
    // widget.homeController.matchStore.getMatchOfLeague(
    //     widget.homeController.leagueStore.state.leagueSelected);
    // widget.homeController.matchStore
    //     .getMatchLive(widget.homeController.leagueStore.state.leagueSelected);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
              // ScopedBuilder(
              //   store: widget.homeController.leagueStore,
              //   onError: (context, error) => const Text('Error'),
              //   onLoading: (context) => const Center(
              //     child: CircularProgressIndicator(
              //       valueColor: AlwaysStoppedAnimation(Colors.pink),
              //     ),
              //   ),
              //   onState: (context, state) {
              //     return SizedBox(
              //       height: size.height * 0.06,
              //       child: ListView.separated(
              //           separatorBuilder: (context, index) {
              //             return SizedBox(
              //               width: size.width * 0.03,
              //             );
              //           },
              //           itemCount: widget
              //               .homeController.leagueStore.state.listLeague.length,
              //           scrollDirection: Axis.horizontal,
              //           itemBuilder: (ctx, index) {
              //             final league = widget.homeController.leagueStore.state
              //                 .listLeague[index];
              //             return ListLeagueWidget(
              //               leagueEntity: league,
              //               onTap: () async {
              //                 await widget.homeController.leagueStore
              //                     .selectedLeague(league.id);
              //                 await widget.homeController.matchStore
              //                     .getMatchOfLeague(league.id);
              //                 await widget.homeController.matchStore
              //                     .getMatchLive(widget.homeController
              //                         .leagueStore.state.leagueSelected);
              //               },
              //               indexLeague: league.id,
              //               indexMatch: widget.homeController.leagueStore.state
              //                   .leagueSelected,
              //             );
              //           }),
              //     );
              //   },
              // ),
              SizedBox(
                height: size.height * 0.05,
              ),
              // ScopedBuilder(
              //   onLoading: (context) => const Text(''),
              //   onError: (context, error) => const Text('Error'),
              //   store: widget.homeController.matchStore,
              //   onState: (context, state) {
              //     return widget.homeController.matchStore.state.matchLiveList
              //             .isNotEmpty
              //         ? Column(
              //             children: [
              //               const Row(
              //                 children: [
              //                   Text(
              //                     'AO VIVO',
              //                     style: TextStyle(fontWeight: FontWeight.bold),
              //                   ),
              //                   Icon(
              //                     Icons.circle,
              //                     color: Colors.red,
              //                   )
              //                 ],
              //               ),
              //               // SizedBox(
              //               //     height: size.height * 0.25,
              //               //     child: ListView.separated(
              //               //         scrollDirection: Axis.horizontal,
              //               //         itemBuilder: (context, index) {
              //               //           final match = widget
              //               //               .homeController
              //               //               .matchStore
              //               //               .state
              //               //               .matchLiveList[index];
              //               //           return SizedBox(
              //               //             width: size.width * 0.7,
              //               //             child: CardMatchLiveWidget(
              //               //               matchEntity: match,
              //               //               onTap: () {
              //               //                 print(match.id);
              //               //               },
              //               //             ),
              //               //           );
              //               //         },
              //               //         separatorBuilder: (_, __) {
              //               //           return const SizedBox(
              //               //             height: 20,
              //               //           );
              //               //         },
              //               //         itemCount: widget.homeController.matchStore
              //               //             .state.matchLiveList.length)),
              //             ],
              //           )
              //         : Container();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
