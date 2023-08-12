import 'dart:convert';

import 'package:live_score/app/features/leagues/domain/entities/leagues_entity.dart';
import 'package:live_score/app/features/leagues/external/end_point/get_leagues_end_point.dart';
import 'package:live_score/app/features/leagues/external/mappers/league_mappers.dart';
import 'package:live_score/app/features/leagues/infra/datasource/i_get_leagues_datasource.dart';
import 'package:http/http.dart' as http;

class GetLeagueDatasource implements IGetLeagueDatasource {
  @override
  Future<List<LeagueEntity>> call() async {
    final response = await http.get(
      Uri.parse(
        getLeaguesEndPoint,
      ),
      headers: {
        'X-Auth-Token': 'ec14d25454444a03b86d158e7a94820f',
      },
    );

    final result = jsonDecode(response.body);
    final data = List.from(result['competitions']);

    return data.map((e) => LeaguesMapper.fromMap(e)).toList();
  }
}
