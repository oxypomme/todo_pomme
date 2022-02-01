import 'package:faker/faker.dart';
import 'package:todo_pomme/classes/task.dart';

var _faker = Faker();
var tasks = List.generate(
    20, (int index) => Task(id: index, content: _faker.lorem.sentence()));
