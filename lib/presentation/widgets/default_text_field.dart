import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

class DefaultTextField extends StatefulWidget {
  TextEditingController controller;
  final TextInputType type;
  final String? hint;
  final Color? fillColor;
  bool isPassword = false;

  DefaultTextField({
    super.key,
    required this.controller,
    required this.type,
    required this.isPassword,
    this.hint,
    this.fillColor,
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}
class _DefaultTextFieldState extends State<DefaultTextField> {
  bool showPassword = false;
  @override
  void initState() {
    showPassword = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.type,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffix: widget.isPassword? GestureDetector(
          onTap: (){
            setState(() {
              showPassword = !showPassword;
            });
          },
          child: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ): null,
        hintText: widget.hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        filled: true,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        fillColor: widget.fillColor ?? const Color.fromRGBO(244, 244, 246, 1),
      ),
      obscureText: showPassword,
    );
  }
}
