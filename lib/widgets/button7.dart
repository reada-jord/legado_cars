import 'package:flutter/material.dart';

class MyButton7 extends StatelessWidget {
  MyButton7({
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
            minWidth: 100,
            height: 42,
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
