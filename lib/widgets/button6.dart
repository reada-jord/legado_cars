import 'package:flutter/material.dart';

class MyButton6 extends StatelessWidget {
  MyButton6({
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
            minWidth: 40,
            height: 42,
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.navigate_next, color: Color.fromRGBO(0, 0, 0, 1)),
              ],
            )),
      ),
    );
  }
}
