import 'package:floor/floor.dart';

@entity
class Employee {
  @primaryKey
  int? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;

  Employee({this.id, this.email, this.password, this.firstName, this.lastName});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}