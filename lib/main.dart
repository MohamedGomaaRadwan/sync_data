import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sync_data/core/bloc/employee_bloc.dart';
import 'package:sync_data/my_home_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => EmployeeBloc()..add(EmployeeEventInitDb()),
        child: MyHomePage(),
      ),
    );
  }
}


