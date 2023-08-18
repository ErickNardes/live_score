// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/home_page/controler/home_controller.dart';

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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('J')),
                  DataColumn(label: Text('SG')),
                  DataColumn(label: Text('P')),
                ],
                rows: widget.homeController.tableCampStore.state.tableCamp
                    .map((item) {
                  return DataRow(cells: [
                    DataCell(Text(
                      item.positionClub.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataCell(Text(
                      item.listClub.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    DataCell(Text(
                      item.listClub.playedGames.toString(),
                      style: const TextStyle(),
                    )),
                    DataCell(Text(item.listClub.goalDifference.toString())),
                    DataCell(Text(item.score.toString())),
                    // ... Add more cells as needed
                  ]);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
