import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app3/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app3/cubits/note_cubit/note_cubit.dart';
import 'package:note_app3/model/note_model.dart';
import 'package:note_app3/widgets/custom_text_button.dart';
import 'package:note_app3/widgets/custom_text_field.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
// import 'package:note_app/model/note_model.dart';
// import 'package:note_app/widgets/custom-text_field.dart';
// import 'package:note_app/widgets/custom_text_botton.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(children: [
        const SizedBox(
          height: 32,
        ),
        CustomTextField(
          hintText: 'Title',
          onSaved: (p0) {
            title = p0;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          hintText: 'content',
          onSaved: (p0) => subTitle = p0,
          maxLines: 4,
        ),
        const SizedBox(
          height: 20,
        ),
        // const ColorsListView(),
        // const SizedBox(
        //   height: 20,
        // ),
        BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return CustomTextButton(
              isLoading: state is AddNoteLoading ? true : false,
              onTap: () {
                addNoteMethod(context);
              },
            );
          },
        ),
      ]),
    );
  }

  void addNoteMethod(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var currentDate = DateTime.now();
      var formatCurrentDate = DateFormat.yMd().format(currentDate);
      NoteModel addNote = NoteModel(
          title: title!,
          subTitle: subTitle!,
          date: formatCurrentDate,
          color: Colors.red.value);
      BlocProvider.of<AddNoteCubit>(context).addNote(addNote);
      BlocProvider.of<NoteCubit>(context).fetchAllNote();
    } else {
      AutovalidateMode.always;
    }
    setState(() {});
  }
}

class Color extends StatelessWidget {
  const Color({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
    );
  }
}

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Color(),
          );
        },
      ),
    );
  }
}
