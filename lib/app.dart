import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_pokemon/features/home/presentation/bloc/home_detail_bloc.dart';
import 'package:flutter_pokemon/features/home/presentation/home_detail_view.dart';
import 'package:flutter_pokemon/shared/widgets/epub_view.dart';
import 'package:flutter_pokemon/features/home/presentation/home_view.dart';
import 'package:flutter_pokemon/shared/widgets/pdf_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<HomeDetailBloc>(create: (context) => HomeDetailBloc()),
      ],
      child: MaterialApp(
        title: "TITLE",
        initialRoute: '/home',
        routes: <String, WidgetBuilder>{
          "/home": (context) => const HomeView(),
          "/productDetail": (context) => HomeDetailView(),
          "/my_epub_view": (context) => const MyEpubView(),
          "/my_pdf_view": (context) => const MyPdfView(),
        },
      ),
    );
  }
}
