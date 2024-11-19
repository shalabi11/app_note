// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app3/constant.dart';
import 'package:note_app3/cubits/note_cubit/note_cubit.dart';
import 'package:note_app3/model/note_model.dart';
import 'package:note_app3/simple_bloc_observer.dart';

import 'package:note_app3/views/edit_page.dart';
import 'package:note_app3/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(
    NoteModelAdapter(),
  );
  await Hive.openBox<NoteModel>(kNotesBox);
  // box.get(box);
  // Hive.deleteFromDisk();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeView.id,
        routes: {
          HomeView.id: (context) => const HomeView(),
          EditView.id: (context) => const EditView(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
