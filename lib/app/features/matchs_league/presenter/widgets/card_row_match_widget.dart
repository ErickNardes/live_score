import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:live_score/app/features/matchs_league/domain/entities/macthe_entity.dart';
import 'package:intl/intl.dart';

class CardRowMatchWidget extends StatefulWidget {
  final MatchEntity matchEntity;
  const CardRowMatchWidget({
    Key? key,
    required this.matchEntity,
  }) : super(key: key);

  @override
  State<CardRowMatchWidget> createState() => _CardRowMatchWidgetState();
}

class _CardRowMatchWidgetState extends State<CardRowMatchWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.096,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.matchEntity.shortNameHomeTeam,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
              widget.matchEntity.crestHomeTeam.contains('.png')
                  ? Expanded(
                      child: SizedBox(
                          height: size.height * 0.04,
                          width: size.width * 0.1,
                          child:
                              Image.network(widget.matchEntity.crestHomeTeam)),
                    )
                  : Expanded(
                      child: SizedBox(
                        height: size.height * 0.04,
                        width: size.width * 0.1,
                        child: SvgPicture.network(
                            widget.matchEntity.crestHomeTeam),
                      ),
                    ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('dd/MM').format(DateTime.parse(
                        widget.matchEntity.utcDate.toString(),
                      )),
                      style: const TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              widget.matchEntity.crestAwayTeam.contains('.png')
                  ? Expanded(
                      child: SizedBox(
                          height: size.height * 0.04,
                          width: size.width * 0.1,
                          child:
                              Image.network(widget.matchEntity.crestAwayTeam)),
                    )
                  : Expanded(
                      child: SizedBox(
                        height: size.height * 0.04,
                        width: size.width * 0.1,
                        child: SvgPicture.network(
                            widget.matchEntity.crestAwayTeam),
                      ),
                    ),
              Expanded(
                child: Text(
                  widget.matchEntity.shortNameAwayTeam,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
