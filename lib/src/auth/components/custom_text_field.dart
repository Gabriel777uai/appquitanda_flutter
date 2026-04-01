import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData iconData;
  final String label;
  final bool isSecret;

  const CustomTextField({
    super.key,
    required this.iconData,
    required this.label,
    this.isSecret = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.iconData),
          suffixIcon: widget.isSecret
              ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off))
              : null,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          labelText: widget.label,
        ),
      ),
    );
  }
}
