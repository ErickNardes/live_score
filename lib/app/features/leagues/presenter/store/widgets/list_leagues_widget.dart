import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:live_score/app/features/leagues/domain/entities/leagues_entity.dart';

class ListLeagueWidget extends StatefulWidget {
  final LeagueEntity leagueEntity;
  final int indexLeague;
  final int indexMatch;
  final Function()? onTap;
  const ListLeagueWidget({
    Key? key,
    required this.indexMatch,
    required this.leagueEntity,
    required this.indexLeague,
    this.onTap,
  }) : super(key: key);

  @override
  State<ListLeagueWidget> createState() => _ListLeagueWidgetState();
}

class _ListLeagueWidgetState extends State<ListLeagueWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.indexLeague == widget.indexMatch
            ? size.height * 0.9
            : size.height * 0.7,
        width: widget.indexLeague == widget.indexMatch
            ? size.width * 0.5
            : size.width * 0.48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: widget.indexLeague == widget.indexMatch
              ? const Color.fromARGB(255, 167, 15, 65)
              : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: widget.leagueEntity.emblem.contains('.png')
                    ? Image.network(widget.leagueEntity.emblem)
                    : SvgPicture.network(widget.leagueEntity.emblem),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.leagueEntity.name,
                  style: TextStyle(
                    color: widget.indexLeague == widget.indexMatch
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
