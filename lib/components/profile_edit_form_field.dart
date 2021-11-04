import 'package:flutter/material.dart';

class ProfileEditFormField extends StatefulWidget {
  const ProfileEditFormField({
    Key? key,
    @required this.editingController,
    @required this.label,
    @required this.hint,
  }) : super(key: key);

  final editingController;
  final label;
  final hint;

  @override
  State<ProfileEditFormField> createState() => _ProfileEditFormFieldState();
}

bool isEnabled = false;

class _ProfileEditFormFieldState extends State<ProfileEditFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        enabled: isEnabled,
        controller: widget.editingController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: widget.label,
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(color: Colors.white54),
          hintText: widget.hint,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}