// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
          horizontal:
              16), // Ajuste o espaçamento horizontal conforme necessário
      leading: SizedBox(
        width: 25, // Ajuste a largura conforme necessário
        child: widget.tableCampEntity.listClub.crestImage.contains('.png')
            ? Image.network(widget.tableCampEntity.listClub.crestImage)
            : SvgPicture.network(widget.tableCampEntity.listClub.crestImage),
      ),
      title: Text(
        widget.tableCampEntity.listClub.name,
        style: const TextStyle(fontSize: 14),
      ),
      trailing: Text(
        widget.tableCampEntity.score.toString(),
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
