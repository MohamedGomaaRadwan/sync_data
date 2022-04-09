import 'package:dio/dio.dart';
import 'package:sync_data/core/models/employee.dart';

class EmployeeRepository {

  static Future<List<Employee>> getAllEmployees() async {
    var url = "https://mocki.io/v1/89843915-8cea-4c10-a46a-9ef3e3a13e34";
    Response response = await Dio().get(url);

    return (response.data['data'] as List).map((employee) {
     return Employee.fromJson(employee);
    }).toList();

  }
}