import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:live_score/app/features/home_page/controler/home_controller.dart';
import 'package:live_score/app/features/matchs_live/presenter/widgets/card_row_match_widget.dart';

class ListTileLiveMatchWidget extends StatefulWidget {
  final HomeController homeController;
  const ListTileLiveMatchWidget({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  State<ListTileLiveMatchWidget> createState() =>
      _ListTileLiveMatchWidgetState();
}

class _ListTileLiveMatchWidgetState extends State<ListTileLiveMatchWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final matchsByCountry =
        widget.homeController.matchStore.state.matchForCountry;
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: matchsByCountry.keys.length,
      itemBuilder: (context, countryIndex) {
        final countryCode = matchsByCountry.keys.toList()[countryIndex];
        final matchesInCountry = matchsByCountry[countryCode]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              color: Colors.blue[100],
              child: Row(
                children: [
                  SizedBox(
                      height: size.width * 0.1,
                      width: size.width * 0.08,
                      child: matchesInCountry
                              .map((e) => e.flagLeague)
                              .first
                              .contains('.svg')
                          ? SvgPicture.network(
                              matchesInCountry.map((e) => e.flagLeague).first)
                          : Image.network(
                              matchesInCountry.map((e) => e.flagLeague).first)),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    countryCode,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: matchesInCountry.map((match) {
                return CardRowMatchWidget(
                  matchEntity: match,
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
