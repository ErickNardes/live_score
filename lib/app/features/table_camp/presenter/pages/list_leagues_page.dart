// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:live_score/app/features/table_camp/presenter/pages/table_camp_page.dart';

import '../../../home_page/controler/home_controller.dart';

class ListLeaguesPage extends StatefulWidget {
  final HomeController controller;
  const ListLeaguesPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ListLeaguesPage> createState() => _ListLeaguesPageState();
}

class _ListLeaguesPageState extends State<ListLeaguesPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.leagueStore.getLeagues();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView.builder(
            itemCount: widget.controller.leagueStore.state.listLeague.length,
            itemBuilder: (context, index) {
              final league =
                  widget.controller.leagueStore.state.listLeague[index];
              return InkWell(
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return TableCampPage(
                      homeController: widget.controller,
                      title: league.name,
                    );
                  }));
                  await widget.controller.getTableCamp(league.id);
                },
                child: ListTile(
                  title: Text(
                    league.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: league.logo.contains('.png')
                      ? SizedBox(
                          height: size.height * 0.04,
                          width: size.width * 0.1,
                          child: Image.network(league.logo))
                      : SizedBox(
                          height: size.height * 0.04,
                          width: size.width * 0.1,
                          child: SvgPicture.network(league.logo),
                        ),
                ),
              );
            }));
  }
}
