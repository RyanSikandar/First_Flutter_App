
import 'package:isar/isar.dart';

part 'coffee.g.dart'; 

@Collection()
class Coffee {
  Id id = Isar.autoIncrement;

  late String name;
  late int strength;
  late int sugar;
}
