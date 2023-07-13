import 'dart:convert';

import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';
import 'package:live_score/app/features/table_camp/infra/datasource/i_get_table_camp_datasource.dart';
import 'package:http/http.dart' as http;

import '../mappers/get_table_mappers.dart';

class GetTableCampDatasource implements IGetTableCampDatasource {
  @override
  Future<List<TableCampEntity>> call(int id) async {
    final response = await http.get(
        Uri.parse('https://api.api-futebol.com.br/v1/campeonatos/10/tabela'),
        headers: {
          'Authorization': 'Bearer live_4e4e5659284c27e0ee16168f3ccf8e'
        });

    final dynamic result = jsonDecode(response.body);
    if (result is List) {
      return result.map((e) => GetTableCampMappers.fromMap(e)).toList();
    } else if (result is Map<String, dynamic>) {
      final entity = GetTableCampMappers.fromMap(result);
      return [entity];
    } else {
      throw Exception('Invalid response format');
    }
  }
}
