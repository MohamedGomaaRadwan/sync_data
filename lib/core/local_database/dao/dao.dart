import 'package:floor/floor.dart';
import 'package:sync_data/core/models/employee.dart';

@dao
abstract class EmployeeDao {

  @Query('SELECT * FROM Employee')
  Stream<List<Employee>> findAllEmployees();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEmployee(Employee employee);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEmployees(List<Employee> employee);

}