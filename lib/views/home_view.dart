import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app3/constant.dart';
import 'package:note_app3/cubits/note_cubit/note_cubit.dart';
import 'package:note_app3/widgets/add_note_button_sheet.dart';
import 'package:note_app3/widgets/app_bar_widget.dart';
import 'package:note_app3/widgets/list_view_items.dart';
// import 'package:note_app3/widgets/note_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'home page';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NoteCubit>(context).fetchAllNote();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              sheetAnimationStyle: AnimationStyle(
                  reverseDuration: Durations.long2,
                  duration: Durations.extralong4),
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          color: kPrimaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            AppBarWidget(
              onPressed: () {},
              icon: const Icon(Icons.search),
              textAppBar: 'Notes',
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(
              child: ListViewItems(),
            ),
          ],
        ),
      ),
    );
  }
}
