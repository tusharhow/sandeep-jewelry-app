import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';

class ProfileEditPage extends StatefulWidget {
  ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  bool tappedBtn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isEnabled = true;
                          tappedBtn = !tappedBtn;
                        });
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: tappedBtn ? Colors.white : Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileEditFormField(
                editingController: _nameController,
                label: 'Full Name',
                hint: 'Anil Jain',
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _emailController,
                label: 'Email Id',
                hint: 'akdikowdo@gmail.com',
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _phoneController,
                label: 'Mobile No',
                hint: '7882511251142',
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _dobController,
                label: 'Date of Birth',
                hint: '12/05/1998',
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _genderController,
                label: 'Gender',
                hint: 'Male',
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _addressController,
                label: 'Address',
                hint: 'Flat 5 Jain Apt Vikas Road',
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _pinController,
                label: 'Pin Code',
                hint: '584666',
              ),
              const SizedBox(
                height: 40,
              ),
              ReusablePrimaryButton(
                  childText: 'Delete Account',
                  buttonColor: const Color(0xffEE0000),
                  textColor: Colors.white,
                  onPressed: () {}),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
