import 'package:flutter/material.dart';
import 'package:note_app3/constant.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:note_app/constant.dart';
// import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onTap, this.isLoading = true});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : const Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))),
    );
  }
}
