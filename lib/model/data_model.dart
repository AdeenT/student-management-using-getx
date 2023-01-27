import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class Studentmodel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String admissionNumber;
  @HiveField(4)
  final String email;
  

  Studentmodel({
    required this.name,
    required this.age,
    required this.admissionNumber,
    required this.email,
    this.id,
  });
}
