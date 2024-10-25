import 'package:flutter/material.dart';

class button extends StatelessWidget {
  button({
    required this.width,
    required this.height,
    required this.color,
    required this.title,
    required this.onPressed,
  });
  final double width;
  final double height;
  final Color color;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Material(
        elevation: 5,
        color: color,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: height,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Color.fromRGBO(249, 180, 1, 1),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
