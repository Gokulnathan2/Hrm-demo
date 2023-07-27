import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textInput(
    {controller,
    hint,
    icon,
    bool ispassword = false,
    Widget? suficon,
    FormFieldValidator<String>? validator}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color:
              Colors.grey.withOpacity(0.3), // Customize the shadow color here
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 2), // Customize the shadow offset here
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Color.fromARGB(255, 248, 244, 244),
    ),
    padding: EdgeInsets.only(left: 10, right: 15),
    child: Column(
      children: [
        TextFormField(
          //cursorColor: Colors.grey,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: ispassword,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suficon,
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Icon(icon),
          ),
        ),
      ],
    ),
  );
}

// class CommonTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String hintText;
//   final String labelText;
//   final TextInputType keyboardType;
//   final bool obscure;
//   final TextInputAction inputAction;
//   final FormFieldValidator<String>? validator;
//   final GlobalKey<FormFieldState>? _fieldKey;
//   final ValueChanged<String>? fieldSubmitted;
//   final FocusNode? focus;
//   final ValueChanged<String>? onChanged;
//   final Widget? prefix;
//   final Widget? suffix;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final int maxLines;
//   final int? minLines;
//   final List<TextInputFormatter> inputFormatters;
//   final bool isReadOnly;
//   final TextAlign textAlign;
//   final VoidCallback? onTap;
//   final BoxConstraints iconConstraints;
//   final Color textColor;
//   final AutovalidateMode? autovalidateMode;

//   const CommonTextField({
//     this.controller,
//     this.labelText = "",
//     GlobalKey<FormFieldState>? globalKey,
//     this.keyboardType = TextInputType.text,
//     this.obscure = false,
//     this.inputAction = TextInputAction.next,
//     this.validator,
//     this.fieldSubmitted,
//     this.focus,
//     this.onChanged,
//     this.prefix,
//     this.suffix,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.inputFormatters = const [],
//     this.maxLines = 1,
//     this.minLines,
//     this.isReadOnly = false,
//     this.hintText = "",
//     this.textAlign = TextAlign.start,
//     this.onTap,
//     this.textColor = const Color(0xff181C1F),
//     this.autovalidateMode,
//     this.iconConstraints = const BoxConstraints(maxWidth: 120),
//     Key? key,
//   })  : _fieldKey = globalKey,
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var textTheme = Theme.of(context).textTheme;
//     return Container(
//       margin: EdgeInsets.only(top: 10),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color:
//                 Colors.grey.withOpacity(0.3), // Customize the shadow color here
//             spreadRadius: 1,
//             blurRadius: 2,
//             offset: Offset(0, 2), // Customize the shadow offset here
//           ),
//         ],
//         borderRadius: BorderRadius.all(Radius.circular(100)),
//         color: Color.fromARGB(255, 248, 244, 244),
//       ),
//       padding: EdgeInsets.only(left: 30, right: 15, top: 2),
//       child: TextFormField(
//         onTap: onTap,
//         key: _fieldKey,
//         validator: validator,
//         obscuringCharacter: "•",
//         textInputAction: inputAction,
//         onFieldSubmitted: fieldSubmitted,
//         controller: controller,
//         focusNode: focus,
//         obscureText: obscure,
//         onChanged: onChanged,
//         // style: textTheme.headline6,
//         keyboardType: keyboardType,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         textAlign: textAlign,
//         maxLines: maxLines,
//         minLines: minLines,
//         readOnly: isReadOnly,
//         inputFormatters: inputFormatters,
//         decoration: InputDecoration(
//           labelText: labelText,
//           hintText: hintText,
//           prefix: prefix,
//           suffix: suffix,
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//           prefixIconConstraints: iconConstraints,
//           suffixIconConstraints: iconConstraints,
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscure;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validator;
  final GlobalKey<FormFieldState>? _fieldKey;
  final ValueChanged<String>? fieldSubmitted;
  final FocusNode? focus;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final int? minLines;
  final List<TextInputFormatter> inputFormatters;
  final bool isReadOnly;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final BoxConstraints iconConstraints;
  final Color textColor;
  final AutovalidateMode? autovalidateMode;

  const CommonTextField({
    this.controller,
    this.labelText = "",
    GlobalKey<FormFieldState>? globalKey,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.inputAction = TextInputAction.next,
    this.validator,
    this.fieldSubmitted,
    this.focus,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.minLines,
    this.isReadOnly = false,
    this.hintText = "",
    this.textAlign = TextAlign.start,
    this.onTap,
    this.textColor = const Color(0xff181C1F),
    this.autovalidateMode,
    this.iconConstraints = const BoxConstraints(maxWidth: 120),
    Key? key,
  })  : _fieldKey = globalKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return TextFormField(
      onTap: onTap,
      key: _fieldKey,
      validator: validator,
      obscuringCharacter: "•",
      textInputAction: inputAction,
      onFieldSubmitted: fieldSubmitted,
      controller: controller,
      focusNode: focus,
      obscureText: obscure,
      onChanged: onChanged,
      style: textTheme.headline6,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: textAlign,
      maxLines: maxLines,
      minLines: minLines,
      readOnly: isReadOnly,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefix: prefix,
          suffix: suffix,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconConstraints: iconConstraints,
          suffixIconConstraints: iconConstraints,
          fillColor: Colors.white,
          // border: InputBorder.none,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(50.0),
            borderSide: new BorderSide(),
          )),
    );
  }
}
