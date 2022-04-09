part of 'employee_bloc.dart';

@immutable
abstract class EmployeeState {}

class EmployeeStateInitial extends EmployeeState {}
class EmployeeStateLoading extends EmployeeState {}
class EmployeeStateSuccess extends EmployeeState {
  EmployeeStateSuccess(this.employies);
  List<Employee> employies;
}
