import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool onlyNumbers;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  const DefaultInput({
    super.key,
    required this.label,
    required this.controller,
    required this.onlyNumbers, 
    required this.validator, 
    required this.focusNode,
  });

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        focusNode: widget.focusNode,
        validator: widget.validator,
        inputFormatters:
            widget.onlyNumbers
                ? [FilteringTextInputFormatter.allow(RegExp('^\\d+\$'))]
                : [],
        controller: widget.controller,
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
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
