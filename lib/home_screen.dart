import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'connection bloc/cubit/cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Home Screen'),
      ),
      body: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state is NotConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if(state is ConnectedState){
             return _textWidget(state.message);
          }else if (state is NotConnectedState){
             return _textWidget(state.message);
          }
          return SizedBox();
        },
      ),
    );
  }
}

Widget _textWidget(String message) {
  return Container(
    child: Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    ),
  );
}
