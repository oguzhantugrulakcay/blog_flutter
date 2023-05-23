import 'package:flutter/material.dart';

import '../constraints.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hitText;
  final IconData icon;
  final ValueChanged<String> onChange;
  const RoundedInputField({
    Key? key,
    required this.hitText,
    required this.icon,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        decoration: InputDecoration(
            hintText: hitText,
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
        onChanged: onChange,
      ),
    );
  }
}
