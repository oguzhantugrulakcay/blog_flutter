import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.green,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                backgroundColor: color),
            onPressed: () {},
            child: Text(
              text,
              style: TextStyle(color: textColor),
            )),
      ),
    );
  }
}
