import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sync_data/core/local_database/dao/dao.dart';
import 'package:sync_data/core/local_database/database/database.dart';
import 'package:sync_data/core/models/employee.dart';
import 'package:sync_data/core/repository/employee_repository.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeStateInitial()) {
    on<EmployeeEventInitDb>(_init);
    on<EmployeeEventFetch>(_fetch);
  }
  FutureOr<void> _init(EmployeeEventInitDb event, Emitter<EmployeeState> emit) async{
    final database = await $FloorEmployeeDatabase.databaseBuilder('app_database.db').build();

    final  personDao = database.employeeDao;
    final employee =Employee();
    employee.id=6;
    employee.firstName='Mero';
    employee.lastName='Mero';
    employee.password='258';
    employee.email='258';
    await personDao.insertEmployee(employee);
    emit(EmployeeStateLoading());
    personDao.findAllEmployees().listen((event) {
     add(EmployeeEventFetch(event));
    });
   await  Future.delayed(Duration(seconds: 5));
   List<Employee> employess =await EmployeeRepository.getAllEmployees();
   personDao.insertEmployees(employess);
  }

  FutureOr<void> _fetch(EmployeeEventFetch event, Emitter<EmployeeState> emit) async{
   emit(EmployeeStateSuccess(event.employies));
  }
}
