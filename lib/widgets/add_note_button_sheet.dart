import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app3/cubits/add_note_cubit/add_note_cubit.dart';

import 'package:note_app3/widgets/add_note_form.dart';
// import 'package:note_app/views/home_view.dart';
// import 'package:note_app/widgets/custom-text_field.dart';
// import 'package:note_app/widgets/custom_text_botton.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child:
          BlocConsumer<AddNoteCubit, AddNoteState>(listener: (context, state) {
        if (state is AddNoteFailure) {
          print('there error ${state.error}');
        } else if (state is AddNoteSucces) {
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddNoteForm(),
            ),
          ),
        );
      }),
    );
  }
}
