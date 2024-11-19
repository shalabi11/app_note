import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app3/constant.dart';
import 'package:note_app3/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) {
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>(kNotesBox);
      box.add(note);
      emit(AddNoteSucces());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
