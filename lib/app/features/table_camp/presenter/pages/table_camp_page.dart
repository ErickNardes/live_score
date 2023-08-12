// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/home_page/controler/home_controller.dart';
import 'package:live_score/app/features/table_camp/presenter/widgets/club_table_widget..dart';

class TableCampPage extends StatefulWidget {
  final HomeController homeController;
  final String title;

  const TableCampPage({
    Key? key,
    required this.homeController,
    required this.title,
  }) : super(key: key);

  @override
  State<TableCampPage> createState() => _TableCampPageState();
}

class _TableCampPageState extends State<TableCampPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ScopedBuilder(
        store: widget.homeController.tableCampStore,
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
          return ListView.builder(
              itemCount:
                  widget.homeController.tableCampStore.state.tableCamp.length,
              itemBuilder: ((context, index) {
                final item =
                    widget.homeController.tableCampStore.state.tableCamp[index];
                return ClubTableWidget(tableCampEntity: item);
              }));
        },
      ),
    );
  }
}
