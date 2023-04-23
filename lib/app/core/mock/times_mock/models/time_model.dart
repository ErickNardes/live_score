// ignore_for_file: public_member_api_docs, sort_constructors_first
class Time {
  final String name;
  final String photo;
  Time({
    required this.name,
    required this.photo,
  });
}

Time barcelona = Time(name: 'Barcelona', photo: 'lib/assets/images/barcelona.png');
Time realmadrid = Time(name: 'Real Madrid', photo: 'lib/assets/images/real-madrid.png');
Time manuntd = Time(name: 'Man. United', photo: 'lib/assets/images/manunited.png');
Time mancity = Time(name: 'Man. City', photo: 'lib/assets/images/city.png');

final List<Time> listaTimes = [
  barcelona,
  realmadrid,
  mancity,
  manuntd,
];
