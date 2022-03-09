import 'dart:convert';

import 'package:faker/faker.dart';
import '../classes/task.dart';
import 'package:http/http.dart' as http;

// var _faker = Faker();
// var tasks = List.generate(
//     20, (int index) => Task(id: index, content: _faker.lorem.sentence()));

Future<List<Task>> fetchTodos() async {
  try {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      List<Task> tasks = [];
      for (Map<String, dynamic> json in jsonDecode(response.body)) {
        tasks.add(Task.fromJson(json));
      }
      return tasks;
    } else {
      throw Exception("Failed to load todos");
    }
  } catch (error) {
    final faker = Faker();
    return List.generate(
        20, (int index) => Task(id: index, content: faker.lorem.sentence()));
  }
}
