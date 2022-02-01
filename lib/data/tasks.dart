import 'package:faker/faker.dart';
import 'package:todo_pomme/classes/task.dart';

var f = Faker();
var list = List.generate(
    15, (int index) => Task(id: index, content: f.lorem.sentence()));
