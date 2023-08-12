import 'dart:convert';

import 'package:live_score/app/core/shared/service/http/auth.dart';
import 'package:live_score/app/features/matchs_league/domain/entities/macthe_entity.dart';
import 'package:live_score/app/features/matchs_league/external/mappers/match_mapper.dart';
import 'package:live_score/app/features/matchs_league/infra/datasource/i_get_match_of_league_datasource.dart';
import 'package:http/http.dart' as http;

class GetMatchOfLeagueDatasource implements IGetMatchOfLeagueDatasource {
  @override
  Future<List<MatchEntity>> call(int id) async {
    final response = await http.get(
        Uri.parse('http://api.football-data.org/v4/competitions/$id/matches'),
        headers: headers);
    final result = jsonDecode(response.body);
    final data = List.from(result['matches']);
    return data.map((e) => MatchMapper.fromMap(e)).toList();
  }
}
