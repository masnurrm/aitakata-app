import 'package:flutter/material.dart';

class BasicCheckbox extends StatefulWidget {
  final String title;
  bool isChecked;
  final VoidCallback onCheck;

  BasicCheckbox(
      {super.key,
      required this.title,
      required this.isChecked,
      required this.onCheck});

  @override
  State<BasicCheckbox> createState() => _BasicCheckboxState();
}

class _BasicCheckboxState extends State<BasicCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      value: widget.isChecked,
      checkColor: Colors.white,
      activeColor: const Color(0xFF15CDC3),
      title: Text(
        widget.title,
        style: TextStyle(
            color: widget.isChecked ? const Color(0xFF8E8E8E) : Colors.black,
            fontSize: 14.0,
            decoration: widget.isChecked ? TextDecoration.lineThrough : null),
      ),
      onChanged: (value) {
        setState(() {
          widget.isChecked = value!;
        });
        widget.onCheck();
      },
    );
  }
}
