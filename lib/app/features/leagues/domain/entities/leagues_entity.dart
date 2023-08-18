// ignore_for_file: public_member_api_docs, sort_constructors_first
class LeagueEntity {
  final int id;
  final String name;
  final String logo;
  final String emblem;
  final String cuntry;
  final String code;
  final String type;
  final String flag;
  final bool? odds;
  bool selected;

  LeagueEntity({
    required this.id,
    required this.name,
    required this.logo,
    required this.emblem,
    required this.cuntry,
    required this.code,
    required this.type,
    required this.flag,
    this.odds,
    required this.selected,
  });
}
