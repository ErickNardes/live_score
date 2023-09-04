// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';

class CardRowMatchWidget extends StatefulWidget {
  final MatchLiveEntity matchEntity;
  final Function() onTap;
  const CardRowMatchWidget({
    Key? key,
    required this.matchEntity,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CardRowMatchWidget> createState() => _CardRowMatchWidgetState();
}

class _CardRowMatchWidgetState extends State<CardRowMatchWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: size.height * 0.12,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.matchEntity.nameLeague,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.matchEntity.nameHomeTeam,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    widget.matchEntity.logoHomeTeam.contains('.png')
                        ? Expanded(
                            child: SizedBox(
                                height: size.height * 0.04,
                                width: size.width * 0.1,
                                child: Image.network(
                                    widget.matchEntity.logoHomeTeam)),
                          )
                        : Expanded(
                            child: SizedBox(
                              height: size.height * 0.04,
                              width: size.width * 0.1,
                              child: SvgPicture.network(
                                  widget.matchEntity.logoHomeTeam),
                            ),
                          ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.matchEntity.goalHome.toString(),
                              style: const TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(' - '),
                            Text(
                              widget.matchEntity.goalAway.toString(),
                              style: const TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Align(
                          child: widget.matchEntity.statusShort == 'HT'
                              ? Text(
                                  'Intervalo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.025,
                                      color: Colors.blue),
                                )
                              : Text(
                                  '${widget.matchEntity.statusElapsed.toString()}"',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.025),
                                ),
                        )
                      ],
                    ),
                    widget.matchEntity.logoAwayTeam.contains('.png')
                        ? Expanded(
                            child: SizedBox(
                                height: size.height * 0.04,
                                width: size.width * 0.1,
                                child: Image.network(
                                    widget.matchEntity.logoAwayTeam)),
                          )
                        : Expanded(
                            child: SizedBox(
                              height: size.height * 0.04,
                              width: size.width * 0.1,
                              child: SvgPicture.network(
                                  widget.matchEntity.logoAwayTeam),
                            ),
                          ),
                    Expanded(
                      child: Text(
                        widget.matchEntity.nameAwayTeam,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
