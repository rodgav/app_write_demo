import 'package:flutter/material.dart';

class TxtFormFieldWid extends StatelessWidget {
  final Function(String) onSubmitted;
  final FormFieldValidator<String>? validator;
  final double width;
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final FocusNode focusNode;
  final bool showIcon;
  final bool enabled;

  TxtFormFieldWid(
      {Key? key,
      required this.onSubmitted,
      required this.validator,
      required this.width,
      required this.hintText,
      required this.textEditingController,
      required this.textInputType,
      required this.focusNode,
      required this.showIcon,
      required this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: TextFormField(
          enabled: enabled,
          controller: textEditingController,
          keyboardType: textInputType,
          style: TextStyle(fontSize: 18, color: Colors.black),
          focusNode: focusNode,
          cursorColor: Colors.blue,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black),
              suffixIcon: showIcon
                  ? IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () => onSubmitted(textEditingController.text))
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                borderSide:
                    BorderSide(color: Colors.blue.withOpacity(0.7), width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              enabled: enabled,
              contentPadding: EdgeInsets.symmetric(horizontal: 10)),
          onFieldSubmitted: onSubmitted,
          validator: validator,
        ));
  }
}
