import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.onChanged,
    this.obsecureText = false,
    this.margin = const EdgeInsets.only(bottom: 16),
    this.padding = const EdgeInsets.only(left: 20, bottom: 5, top: 8),
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final String labelText;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  final bool obsecureText;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: MediaQuery.of(context).size.width,
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF0E0E0E),
        border: Border.all(color: const Color(0xFF494949)),
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        obscureText: widget.obsecureText,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha: 0.5),
            height: 0,
            fontSize: 16,
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            height: 0,
            fontSize: 14,
            fontFamily: 'inter',
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
