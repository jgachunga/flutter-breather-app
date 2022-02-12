import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Color baseColor;
  final Color borderColor;
  final TextInputType inputType;
  final bool obscureText;
  final Function onChanged;
  final IconData leftIcon;

  CustomTextField({
    required this.hint,
    required this.controller,
    required this.onChanged,
    required this.baseColor,
    required this.borderColor,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    required this.leftIcon,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _visible = true;
  IconData? iconData;

  @override
  void initState() {
    super.initState();
    //currentColor = widget.borderColor;
    _visible = widget.obscureText;
    iconData = widget.leftIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: TextField(
          obscureText: _visible,
          onChanged: (text) {
            if (widget.onChanged != null) {
              widget.onChanged(text);
            }
          },
          //keyboardType: widget.inputType,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.grey,
                style: BorderStyle.none,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
            fillColor: Colors.transparent,
            // border: InputBorder.none,
            hintStyle: const TextStyle(
              color: Color(0xffAAB2FF),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            hintText: widget.hint,
            suffixIcon: (widget.obscureText == true)
                ? IconButton(
                    icon: Icon(
                        _visible ? Icons.visibility : Icons.visibility_off),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _visible = !_visible;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
