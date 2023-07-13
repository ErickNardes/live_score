// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/core/shared/theme/theme.dart';
import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';
import 'package:live_score/app/features/table_camp/presenter/store/table_camp_store.dart';
import 'package:live_score/app/features/table_camp/presenter/widgets/club_table_widget..dart';

class TableCampPage extends StatefulWidget {
  final TableCampStore tableCampStore;
  TableCampPage({
    Key? key,
    required this.tableCampStore,
  }) : super(key: key);

  @override
  State<TableCampPage> createState() => _TableCampPageState();
}

class _TableCampPageState extends State<TableCampPage> {
  @override
  void initState() {
    super.initState();
    widget.tableCampStore.getTableCamp(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ThemeColors.backgroundColor,
        title: const Text(
          'Brasileirão',
          style: TextStyle(color: Colors.pink),
        ),
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: ScopedBuilder(
        store: widget.tableCampStore,
        onLoading: (context) => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
        onError: (context, error) => const Center(
          child: Text(
            'Error',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onState: (context, state) {
          ClubTableWidget(tableCampEntity: widget.tableCampStore.state.tableCamp.);
        },
      ),
    );
  }
}
