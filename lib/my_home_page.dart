import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sync_data/core/bloc/employee_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _buildList()),
      appBar: AppBar(
        title: Text("Hello"),
      ),);
  }

  Widget _buildList() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        if(state is EmployeeStateSuccess)
       {
         return ListView(
           children: state.employies.map((e) => Container(
             padding: EdgeInsets.all(16),
             child:Text('id:${e.id}\nFirstName:${e.firstName}\nLastName:${e.lastName}')
           )).toList(),
         );
       }

        if(state is EmployeeStateLoading)return Center(child: CircularProgressIndicator(),);
        return Container();
      },
    );
  }
}
