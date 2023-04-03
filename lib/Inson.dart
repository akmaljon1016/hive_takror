import 'package:hive/hive.dart';
part 'Inson.g.dart';
@HiveType(typeId: 0)
class Inson{
  @HiveField(0)
  String ism;
  @HiveField(1)
 String tel;

  Inson(this.ism, this.tel);
}