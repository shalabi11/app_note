// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key,
      required this.textAppBar,
      required this.onPressed,
      required this.icon});
  final String textAppBar;
  final Function() onPressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textAppBar,
          style: const TextStyle(fontSize: 24),
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(onPressed: onPressed, icon: icon))
      ],
    );
  }
}
