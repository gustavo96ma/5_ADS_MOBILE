import 'package:flutter/material.dart';

class DefaultInput extends StatefulWidget {
  final String label;
  const DefaultInput({super.key, required this.label});

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextField(
        decoration: InputDecoration(
          label: Text(
            widget.label,
            style: TextStyle(color: Color(0xff2b4612), fontSize: 16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2b4612)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2b4612)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2b4612)),
          ),
        ),
      ),
    );
  }
}
