import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:live_score/app/core/shared/service/http/auth.dart';
import 'package:live_score/app/features/details_match/domain/entities/details_match_entity.dart';
import 'package:live_score/app/features/details_match/external/mapper/details_match_mapper.dart';
import 'package:live_score/app/features/details_match/infra/datasource/i_get_details_match_datasource.dart';

class GetDetailsMatchDatasource implements IGetDetailsMatchDatasource {
  @override
  Future<List<DetailsMatchEntity>> call(int idMatch) async {
    final httpResponse = await http.get(
      Uri.parse(
          'https://v3.football.api-sports.io/fixtures/statistics?fixture=$idMatch'),
      headers: headers,
    );
    final data = jsonDecode(httpResponse.body);
    final response = data['response'];

    if (response != null && response.isNotEmpty) {
      final detailsMatchMapList = response as List<dynamic>;
      final detailsMatchEntities = detailsMatchMapList
          .map((detailsMatchMap) => DetailsMatchMapper.fromMap(detailsMatchMap))
          .toList();

      return detailsMatchEntities;
    } else {
      throw Exception('No details match data available');
    }
  }
}
