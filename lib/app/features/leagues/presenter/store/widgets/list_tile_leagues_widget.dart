// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:live_score/app/features/home_page/controler/home_controller.dart';
import 'package:live_score/app/features/leagues/presenter/store/league_store.dart';

import '../../../../table_camp/presenter/pages/table_camp_page.dart';

class ListTileWidget extends StatefulWidget {
  final HomeController homeController;
  final LeagueStore leagueStore;

  const ListTileWidget({
    Key? key,
    required this.homeController,
    required this.leagueStore,
  }) : super(key: key);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final leaguesByCountry = widget.leagueStore.state.leaguesByCountry;
    return ListView.builder(
      itemCount: leaguesByCountry.keys.length,
      itemBuilder: (context, countryIndex) {
        final countryCode = leaguesByCountry.keys.toList()[countryIndex];
        final leaguesInCountry = leaguesByCountry[countryCode]!;

        return ExpansionTile(
          collapsedIconColor: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          iconColor: Colors.white,
          leading: SizedBox(
            width: size.width * 0.06,
            child:
                SvgPicture.network(leaguesInCountry.map((e) => e.flag).first),
          ),
          title: Text(
            leaguesInCountry.first.cuntry,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Column(
              children: leaguesInCountry.map((league) {
                return ListTile(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return TableCampPage(
                        homeController: widget.homeController,
                        title: '',
                      );
                    }));
                    await widget.homeController.getTableCamp(league.id);
                  },
                  iconColor: Colors.white,

                  leading: SizedBox(
                    width: 20,
                    child: Image.network(league.emblem),
                  ),
                  title: Text(
                    league.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  // Resto do conteúdo do ListTile conforme necessário
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
