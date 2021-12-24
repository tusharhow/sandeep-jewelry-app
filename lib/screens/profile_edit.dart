import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/components/profile_edit_form_field.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/controllers/user_controller.dart';
import 'package:sandeep_jwelery/models/profile_model.dart';
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
  var userData;
  var userNumber;

  @override
  void initState() {
    super.initState();
    nameCredential();
    userEditController.getUserDetails();
    profileUpdate();
  }

  final userEditController = Get.put(UserController());

  void nameCredential() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullname');
      emailFull = prefs.getString('email');
      mobileNo = prefs.getString('mobile');

      // print(fullName);
      // print(emailFull);
      // print(mobileNo);
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      userData = userEditController.userData;
    });
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

              FutureBuilder<UserDetailsModel>(
                  future: userEditController.userModelFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ProfileEditFormField(
                        editingController: _nameController,
                        label: 'Full Name',
                        hint: snapshot.data!.user.name,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),

              const SizedBox(
                height: 10,
              ),
              FutureBuilder<UserDetailsModel>(
                  future: userEditController.userModelFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ProfileEditFormField(
                        editingController: _emailController,
                        label: 'Full Email',
                        hint: snapshot.data!.user.email,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<UserDetailsModel>(
                  future: userEditController.userModelFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ProfileEditFormField(
                        editingController: _phoneController,
                        label: 'Mobile No',
                        hint: snapshot.data!.user.mobileNo,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
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
              const SizedBox(
                height: 50,
              ),
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

  Future profileUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userToken = prefs.getString('userToken');
    userNumber = prefs.getString('mobile');
    var url =
        "http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/edit";
    var response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer ' + userToken!,
    }, body: {
      "mobile_no": userNumber,
      "state": "west bengal",
      "city": "kolkata",
      "email": emailFull,
      "name": fullName,
      "company_name": "bandhan",
      "gstno": "7895423",
      "pan_no": "clopa3426p",
      "address": "kestopur kolkata",
      "designation": "officer",
      "pincode": "700102",
      "image": "save back.png",
    });

    print(response.body);

    var parsedData = json.decode(response.body);
  }
}
