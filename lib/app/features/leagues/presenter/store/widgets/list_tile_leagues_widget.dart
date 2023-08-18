// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:live_score/app/features/leagues/presenter/store/league_store.dart';

class ListTileWidget extends StatefulWidget {
  final LeagueStore leagueStore;

  const ListTileWidget({
    Key? key,
    required this.leagueStore,
  }) : super(key: key);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.leagueStore.state.listLeague.length,
        itemBuilder: (context, index) {
          final league = widget.leagueStore.state.listLeague[index];
          return ExpansionTile(title: Text(league.name));
        });
  }
}
