import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UpdateProfileTextField extends StatelessWidget {
  UpdateProfileTextField({
    Key? key,
    required this.controller,
    required this.text,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.textInputType,
    this.inputFormatters,
    this.isDone = false,
  }) : super(key: key);

  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final String text;
  final ValueChanged? onChanged;
  bool? isDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        textInputAction: isDone! ? TextInputAction.done : TextInputAction.next,
        onChanged: onChanged,
        style: GoogleFonts.raleway().copyWith(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
        obscureText:
            (text == "Password" || text == "Confirm Password" ? true : false),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: text,
          labelStyle:
              GoogleFonts.raleway().copyWith(color: Colors.black, fontSize: 14),
          contentPadding: const EdgeInsets.only(left: 20),
          hintStyle: GoogleFonts.raleway()
              .copyWith(color: Colors.white70.withOpacity(0.6), fontSize: 14),
          suffixIcon: suffixIcon,
          filled: false,
          // labelText: text,

          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(color: Colors.white70.withOpacity(0.2), width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
