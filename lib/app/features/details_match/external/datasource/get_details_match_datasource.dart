import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:live_score/app/core/shared/service/http/auth.dart';
import 'package:live_score/app/features/details_match/domain/entities/details_match_entity.dart';
import 'package:live_score/app/features/details_match/external/mapper/details_match_mapper.dart';
import 'package:live_score/app/features/details_match/infra/datasource/i_get_details_match_datasource.dart';

class GetDetailsMatchDatasource implements IGetDetailsMatchDatasource {
  @override
  Future<DetailsMatchEntity> call(int idMatch) async {
    final httpResponse = await http.get(
      Uri.parse('http://api.football-data.org/v4/matches/$idMatch'),
      headers: headers,
    );
    final data = jsonDecode(httpResponse.body);
    final result = List.from(data);
    return result.map((e) => DetailsMatchMapper.fromMap(e)).first;
  }
}
