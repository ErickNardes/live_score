import 'package:flutter/material.dart';
import 'package:live_score/app/core/shared/theme/theme.dart';

class CardNormalLiveMatch extends StatefulWidget {
  const CardNormalLiveMatch({super.key});

  @override
  State<CardNormalLiveMatch> createState() => _CardNormalLiveMatchState();
}

class _CardNormalLiveMatchState extends State<CardNormalLiveMatch> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: ThemeColors.secondBackgroud,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
