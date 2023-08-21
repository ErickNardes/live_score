import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';
import 'package:intl/intl.dart';

class CardRowMatchWidget extends StatefulWidget {
  final MatchLiveEntity matchEntity;
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
                          child:
                              Image.network(widget.matchEntity.logoHomeTeam)),
                    )
                  : Expanded(
                      child: SizedBox(
                        height: size.height * 0.04,
                        width: size.width * 0.1,
                        child:
                            SvgPicture.network(widget.matchEntity.logoHomeTeam),
                      ),
                    ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('dd/MM').format(DateTime.parse(
                        widget.matchEntity.dateMatch.toString(),
                      )),
                      style: const TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              widget.matchEntity.logoHomeTeam.contains('.png')
                  ? Expanded(
                      child: SizedBox(
                          height: size.height * 0.04,
                          width: size.width * 0.1,
                          child:
                              Image.network(widget.matchEntity.logoHomeTeam)),
                    )
                  : Expanded(
                      child: SizedBox(
                        height: size.height * 0.04,
                        width: size.width * 0.1,
                        child:
                            SvgPicture.network(widget.matchEntity.logoHomeTeam),
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
      ),
    );
  }
}
