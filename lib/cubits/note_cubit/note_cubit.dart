// import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app3/constant.dart';
import 'package:note_app3/model/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  List<NoteModel> notesList = [];

  fetchAllNote() {
    var box = Hive.box<NoteModel>(kNotesBox);
    notesList = box.values.toList();
    emit(NoteSuccess());
  }
}
