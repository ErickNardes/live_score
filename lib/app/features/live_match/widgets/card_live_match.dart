// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:live_score/app/core/shared/theme/theme.dart';

class CardLiveMatch extends StatefulWidget {
  final int index;
  const CardLiveMatch({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CardLiveMatch> createState() => _CardLiveMatchState();
}

class _CardLiveMatchState extends State<CardLiveMatch> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: widget.index == 0
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromRGBO(176, 106, 179, 100),
                  Color.fromRGBO(125, 69, 220, 100),
                ],
              ),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: ThemeColors.secondBackgroud,
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '60 : 22',
            style: TextStyle(color: Colors.white54),
          ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 50,
          //       child: SvgPicture.asset('lib/assets/icons/barcelona.svg'),
          //     ),
          //     const Text(
          //       '2 - 2',
          //       style: TextStyle(
          //         fontSize: 28,
          //         color: Colors.white70,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 50,
          //       child: SvgPicture.asset('lib/assets/icons/manunited.svg'),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
