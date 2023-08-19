// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/home_page/controler/home_controller.dart';

class TableCampPage extends StatefulWidget {
  final HomeController homeController;
  final String title;
  final String imageBar;

  const TableCampPage({
    Key? key,
    required this.homeController,
    required this.title,
    required this.imageBar,
  }) : super(key: key);

  @override
  State<TableCampPage> createState() => _TableCampPageState();
}

class _TableCampPageState extends State<TableCampPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(
              width: size.width * 0.09,
              height: size.height * 1,
              child: Image.network(widget.imageBar),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ScopedBuilder(
        store: widget.homeController.tableCampStore,
        onLoading: (context) => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.pink),
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
                columnSpacing: size.width * 0.1, // Espaço entre as colunas
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
                      item.rank.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataCell(Text(
                      item.nameTeam,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    DataCell(Text(
                      item.played.toString(),
                      style: const TextStyle(),
                    )),
                    DataCell(Text(item.goalFor.toString())),
                    DataCell(Text(item.points.toString())),
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
