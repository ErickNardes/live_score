import 'dart:convert';

import 'package:live_score/app/core/shared/service/http/auth.dart';
import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';
import 'package:live_score/app/features/matchs_live/infra/datasource/i_get_match_of_league_datasource.dart';
import 'package:http/http.dart' as http;

import '../mappers/match_mapper.dart';

class GetMatchOfLeagueDatasource implements IGetMatchOfLeagueDatasource {
  @override
  Future<List<MatchLiveEntity>> call() async {
    final response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/fixtures?live=all'),
        headers: headers);
    final result = jsonDecode(response.body);
    final data = List.from(result['response']);
    return data.map((e) => MatchMapper.fromMap(e)).toList();
  }
}
