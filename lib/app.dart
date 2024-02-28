import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/features/home/domain/repositories/home_repository_impl.dart';
import 'package:flutter_pokemon/features/home/domain/usecases/home_usecase.dart';
import 'package:flutter_pokemon/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_pokemon/features/home/presentation/epub_view.dart';
import 'package:flutter_pokemon/features/home/presentation/home_view.dart';
import 'package:flutter_pokemon/features/home/presentation/pdf_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) {
            // Pass dependencies to Feature1Bloc constructor
            final HomeRepositoryImpl repository = HomeRepositoryImpl();
            final HomeUseCase useCase = HomeUseCase(repository);
            return HomeBloc(useCase);
          },
        ),
      ],
      child: MaterialApp(
        title: "TITLE",
        initialRoute: '/home',
        routes: <String, WidgetBuilder>{
          "/home": (context) => const HomeView(),
          "/my_epub_view": (context) => const MyEpubView(),
          "/my_pdf_view": (context) => const MyPdfView(),
        },
      ),
    );
  }
}
