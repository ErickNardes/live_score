import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';

class ClubTableWidget extends StatefulWidget {
  final TableCampEntity tableCampEntity;
  const ClubTableWidget({
    Key? key,
    required this.tableCampEntity,
  }) : super(key: key);

  @override
  State<ClubTableWidget> createState() => _ClubTableWidgetState();
}

class _ClubTableWidgetState extends State<ClubTableWidget> {
  @override
  Widget build(BuildContext context) {

return L

    // return DataTable(
    //   columns: const [
    //     DataColumn(
    //       label: Text(
    //         '',
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     ),
    //     DataColumn(
    //       label: Text(
    //         '',
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     ),
    //     DataColumn(
    //       label: Text(
    //         'Pontos',
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     )
    //   ],
    //   rows: [
    //     DataRow(cells: [
    //       DataCell(
    //         Text(
    //           widget.tableCampEntity.position.toString(),
    //           style: const TextStyle(color: Colors.white),
    //         ),
    //       ),
    //       DataCell(
    //         Text(
    //           widget.tableCampEntity.listClub.name,
    //           style: const TextStyle(color: Colors.white),
    //         ),
    //       ),
    //       DataCell(
    //         Text(
    //           widget.tableCampEntity.score.toString(),
    //           style: const TextStyle(color: Colors.white),
    //         ),
    //       ),
    //     ])
    //   ],
    // );
  }
}
