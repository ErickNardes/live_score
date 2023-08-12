import 'dart:convert';

import 'package:live_score/app/core/shared/service/http/auth.dart';
import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';
import 'package:live_score/app/features/table_camp/infra/datasource/i_get_table_camp_datasource.dart';
import 'package:http/http.dart' as http;

import '../../domain/params/get_table_camp_params.dart';
import '../mappers/get_table_mappers.dart';

class GetTableCampDatasource implements IGetTableCampDatasource {
  @override
  Future<List<TableCampEntity>> call(GetTableCampParams params) async {
    final response = await http.get(
      Uri.parse(
          'https://api.football-data.org/v4/competitions/${params.idCamp}/standings'),
      headers: headers,
    );
    final result = jsonDecode(response.body);
    final data = List.from(result['standings']);
    return data.map((e) => GetTableCampMappers.fromMap(e)).first;
  }
}
