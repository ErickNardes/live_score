// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:live_score/app/core/shared/theme/theme.dart';
import 'package:live_score/app/features/live_match/card_normal_live_match.dart';
import 'package:live_score/app/features/table_camp/presenter/store/table_camp_store.dart';

import '../../../core/mock/times_mock/models/time_model.dart';
import '../../live_match/widgets/card_live_match.dart';

class HomePage extends StatefulWidget {
  final TableCampStore store;
  const HomePage({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.04,
              left: size.width * 0.05,
              right: size.width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.22,
                width: size.width,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (contex, index) {
                    final times = listaTimes[index];
                    return CardLiveMatch(
                      index: index,
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                    width: 20,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Jogos de hoje',
                      style: TextStyle(fontSize: 18, color: Colors.white54),
                    ),
                    Text(
                      'Ver todos',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color.fromRGBO(210, 181, 255, 100),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              SizedBox(
                height: size.height,
                width: size.width,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (contex, index) {
                    final times = listaTimes[index];
                    return CardNormalLiveMatch();
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 20,
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
