import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/cubits/detail_cubit.dart';
import 'package:flutter_pokemon/cubits/home_cubit.dart';
import 'package:flutter_pokemon/screens/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<DetailCubit>(
          create: (context) => DetailCubit(),
        ),
      ],
      child: const MaterialApp(
        home: MyHomePage(title: 'Pokemon'),
      ),
    );
  }
}
