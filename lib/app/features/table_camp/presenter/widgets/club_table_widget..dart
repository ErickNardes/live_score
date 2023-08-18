// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';

class ClubTableWidget extends StatefulWidget {
  final TableCampEntity tableCampEntity;
  final int position;
  final String name;
  final String score;

  const ClubTableWidget({
    Key? key,
    required this.tableCampEntity,
    required this.position,
    required this.name,
    required this.score,
  }) : super(key: key);

  @override
  State<ClubTableWidget> createState() => _ClubTableWidgetState();
}

class _ClubTableWidgetState extends State<ClubTableWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: SizedBox(
        width: 25,
        child: widget.tableCampEntity.listClub.crestImage.contains('.png')
            ? Image.network(widget.tableCampEntity.listClub.crestImage)
            : SvgPicture.network(widget.tableCampEntity.listClub.crestImage),
      ),
      title: Text(
        widget.tableCampEntity.listClub.name,
        style: const TextStyle(fontSize: 14),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.tableCampEntity.score.toString(),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
