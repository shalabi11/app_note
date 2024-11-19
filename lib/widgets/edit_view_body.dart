// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app3/cubits/note_cubit/note_cubit.dart';
import 'package:note_app3/model/note_model.dart';
import 'package:note_app3/widgets/app_bar_widget.dart';
// import 'package:note_app3/widgets/custom_text_button.dart';
import 'package:note_app3/widgets/custom_text_field.dart';
// import 'package:note_app/widgets/app_bar_widget.dart';
// import 'package:note_app/widgets/custom-text_field.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({
    super.key,
  });

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  @override
  Widget build(BuildContext context) {
    String? tilte, subTitle;
    // GlobalKey<FormState> formKey = GlobalKey();
    NoteModel noteModel =
        ModalRoute.of(context)!.settings.arguments as NoteModel;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          AppBarWidget(
            onPressed: () {
              noteModel.title = tilte ?? noteModel.title;
              noteModel.subTitle = subTitle ?? noteModel.subTitle;
              // noteModel.date = DateFormat(DateTime.now().toString()).add_yM();
              BlocProvider.of<NoteCubit>(context).fetchAllNote();

              noteModel.save();

              Navigator.pop(context);
            },
            icon: const Icon(Icons.done),
            textAppBar: 'Edit Notes',
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            hintText: 'Title',
            onChanged: (p0) {
              tilte = p0;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hintText: 'content',
            maxLines: 4,
            onChanged: (p0) {
              subTitle = p0;
            },
          ),
          // CustomTextButton(
          //   onTap: () {
          //     if (formKey.currentState!.validate()) {
          //       formKey.currentState!.save();
          //       noteModel.title = tilte!;
          //       noteModel.subTitle = subTitle!;
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
