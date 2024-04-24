import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/bloc/internet_bloc/internet_bloc.dart';
import 'package:project2/bloc/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetConnectState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Connected"),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Lost"),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state is InternetConnectState) {
              return Text(
                "Connected!",
                style: TextStyle(color: Colors.green.shade400),
              );
            } else if (state is InternetLostState) {
              return Text(
                "Device not connected to internet",
                style: TextStyle(color: Colors.red),
              );
            } else {
              return Text("Loading...!");
            }
          },
        ),

        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        // if (state is InternetConnectState) {
        //   return Text(
        //     "Connected!",
        //     style: TextStyle(color: Colors.green.shade400),
        //   );
        // } else if (state is InternetLostState) {
        //   return Text(
        //     "Device not connected to internet",
        //     style: TextStyle(color: Colors.red),
        //   );
        // } else {
        //   return Text("Loading...!");
        // }
        //   },
        // ),
      )),
    );
  }
}
