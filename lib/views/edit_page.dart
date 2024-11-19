import 'package:flutter/material.dart';
import 'package:note_app3/widgets/edit_view_body.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});
  static String id = 'edit view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditViewBody(),
    );
  }
}
