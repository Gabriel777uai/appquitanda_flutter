import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData iconData;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String value;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.iconData,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.value = "",
    this.readOnly = false
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
        readOnly: widget.readOnly,
        initialValue: widget.value,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.green)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.green, width: 2)
          ),
          prefixIconColor: Colors.green,
          suffixIconColor: Colors.green,
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
