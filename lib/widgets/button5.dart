import 'package:flutter/material.dart';

class MyButton5 extends StatelessWidget {
  MyButton5({
    required this.color,
    required this.title,
    required this.onPressed,
  });
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
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
            onPressed: onPressed,
            minWidth: 120,
            height: 42,
            child: Row(
              children: [
                Icon(Icons.edit, color: Colors.white),
                SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
