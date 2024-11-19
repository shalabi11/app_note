import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
// import 'package:note_app3/constant.dart';
import 'package:note_app3/cubits/note_cubit/note_cubit.dart';
import 'package:note_app3/model/note_model.dart';
import 'package:note_app3/widgets/note_item.dart';

class ListViewItems extends StatelessWidget {
  const ListViewItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notesList;
        BlocProvider.of<NoteCubit>(context).fetchAllNote();
        // Hive.box(kNotesBox).clear();
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: NotesItem(
                noteModel: notes[index],
              ),
            );
          },
        );
      },
    );
  }
}
