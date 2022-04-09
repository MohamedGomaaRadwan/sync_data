part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent {}
 class EmployeeEventInitDb extends EmployeeEvent{}
 class EmployeeEventFetch extends EmployeeEvent{
  EmployeeEventFetch(this.employies);
  List<Employee> employies;
 }
