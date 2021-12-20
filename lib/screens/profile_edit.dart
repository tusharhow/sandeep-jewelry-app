import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/components/profile_edit_form_field.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

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

  String? mobileNo;
  String? emailFull;
  String? fullName;

  @override
  void initState() {
    super.initState();
    nameCredential();
  }

  void nameCredential() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullname');
      emailFull = prefs.getString('email');
      mobileNo = prefs.getString('mobile');

      print(fullName);
      print(emailFull);
      print(mobileNo);
    });
  }

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
                hint: fullName,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _emailController,
                label: 'Email Id',
                hint: emailFull,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _phoneController,
                label: 'Mobile No',
                hint: mobileNo,
              ),
              const SizedBox(
                height: 10,
              ),
              // ProfileEditFormField(
              //   editingController: _dobController,
              //   label: 'Date of Birth',
              //   hint: _dob,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // ProfileEditFormField(
              //   editingController: _genderController,
              //   label: 'Gender',
              //   hint: _gender,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // ProfileEditFormField(
              //   editingController: _addressController,
              //   label: 'Address',
              //   hint: _address,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // ProfileEditFormField(
              //   editingController: _pinController,
              //   label: 'Pin Code',
              //   hint: _pin,
              // ),
              // const SizedBox(
              //   height: 40,
              // ),
              ReusablePrimaryButton(
                  childText: 'Update',
                  buttonColor: const Color(0xffEE0000),
                  textColor: Colors.white,
                  onPressed: () {
                    Get.snackbar(
                      'User Data Updated',
                      'User Data Edit Succesful!',
                      backgroundColor: Colors.white,
                    );
                  }),
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
