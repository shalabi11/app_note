// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app3/cubits/note_cubit/note_cubit.dart';
import 'package:note_app3/model/note_model.dart';
import 'package:note_app3/views/edit_page.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // Swipe from left to right
          Scaffold.of(context).openDrawer(); // فتح السحبة الجانبية
        }
      },
      onTap: () {
        Navigator.of(context).pushNamed(EditView.id, arguments: noteModel);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 12),
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.7),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                noteModel.title,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
              subtitle: Text(
                noteModel.subTitle,
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(.4)),
              ),
              trailing: IconButton(
                  color: Colors.black,
                  iconSize: 32,
                  onPressed: () {
                    noteModel.delete();
                    BlocProvider.of<NoteCubit>(context).fetchAllNote();
                  },
                  icon: const Icon(Icons.delete_rounded)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                noteModel.date,
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(.4)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
