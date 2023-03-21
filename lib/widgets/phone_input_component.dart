import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneInputComponent extends StatefulWidget {
  const PhoneInputComponent({
    Key? key,
    this.validator,
    required this.onChanged,
    required this.initialValue,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final FormFieldValidator<String?>? validator;
  final String initialValue;

  @override
  State<PhoneInputComponent> createState() => _PhoneInputComponentState();
}

class _PhoneInputComponentState extends State<PhoneInputComponent> {
  late MaskTextInputFormatter phoneMaskFormatter;
  final FocusNode phoneFocusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  String shadowText = "998 90 123-45-67";

  String updateShadowText(String currentText) {
    shadowText = "998 90 123-45-67";
    shadowText = shadowText.substring(currentText.length, shadowText.length);
    return currentText + shadowText;
  }

  @override
  void initState() {
    phoneMaskFormatter = MaskTextInputFormatter(
      mask: '+998 ## ###-##-##',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
    controller.text = phoneMaskFormatter.maskText(widget.initialValue);
    updateShadowText(widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      inputFormatters: [phoneMaskFormatter],
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: true),
      focusNode: phoneFocusNode,
      onChanged: (String value) {
        setState(() {
          if (value.length == 12) {
            phoneFocusNode.unfocus();
          }
          widget.onChanged.call(value);
          shadowText = updateShadowText(value);
        });
      },
      validator: widget.validator,
      style: GoogleFonts.raleway().copyWith(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
      decoration: InputDecoration(
        hintText: "Phone number",
        contentPadding: EdgeInsets.only(left: 20.w).w,
        hintStyle: GoogleFonts.raleway()
            .copyWith(color: Colors.white70.withOpacity(0.6), fontSize: 14),
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r).r),
          borderSide:
              BorderSide(color: Colors.white70.withOpacity(0.2), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r).r),
          borderSide: BorderSide(width: 2.w, color: Colors.blue),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r).r),
          borderSide: BorderSide(width: 2.w, color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r).r),
          borderSide: BorderSide(width: 2.w, color: Colors.red),
        ),
      ),
    );
  }
}
