import 'package:flutter/material.dart';

class button2 extends StatelessWidget {
  button2({
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
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
            onPressed: onPressed,
            minWidth: width,
            height: height,
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 20,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
