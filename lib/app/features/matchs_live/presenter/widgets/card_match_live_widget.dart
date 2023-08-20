import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';

class CardMatchLiveWidget extends StatefulWidget {
  final MatchLiveEntity matchEntity;
  final Function() onTap;

  const CardMatchLiveWidget({
    Key? key,
    required this.matchEntity,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CardMatchLiveWidget> createState() => _CardMatchLiveWidgetState();
}

class _CardMatchLiveWidgetState extends State<CardMatchLiveWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        child: Stack(
          children: [
            Card(
              color: const Color.fromARGB(255, 167, 15, 65),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                  horizontal: size.width * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.matchEntity.logoHomeTeam.contains('.png')
                                  ? SizedBox(
                                      height: size.height * 0.06,
                                      width: size.width * 0.1,
                                      child: Image.network(
                                          widget.matchEntity.logoHomeTeam))
                                  : SizedBox(
                                      height: size.height * 0.05,
                                      width: size.width * 0.1,
                                      child: SvgPicture.network(
                                          widget.matchEntity.logoHomeTeam),
                                    ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                widget.matchEntity.logoHomeTeam,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'CASA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: size.height * 0.014),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          widget.matchEntity.goalHome.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.04,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ':',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.04,
                                  color: Colors.white),
                            ),
                            // Text(
                            //   widget.matchEntity.,
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: size.height * 0.04,
                            //       color: Colors.white),
                            // ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          widget.matchEntity.goalAway.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.04,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.matchEntity.logoHomeTeam.contains('.png')
                                  ? SizedBox(
                                      height: size.height * 0.06,
                                      width: size.width * 0.1,
                                      child: Image.network(
                                          widget.matchEntity.logoHomeTeam))
                                  : SizedBox(
                                      height: size.height * 0.05,
                                      width: size.width * 0.1,
                                      child: SvgPicture.network(
                                          widget.matchEntity.logoHomeTeam),
                                    ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                widget.matchEntity.nameHomeTeam,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'FORA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: size.height * 0.014),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
