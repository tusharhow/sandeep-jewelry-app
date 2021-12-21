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

  @override
  void initState() {
    super.initState();
    nameCredential();
    userEditController.getUserDetails();
    userData = getUserDetails();
  }

  final userEditController = Get.put(UserController());
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
    setState(() {
      userData = userEditController.userData;
      userData = getUserDetails();
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

              ProfileEditFormField(
                editingController: _nameController,
                label: 'Full Name',
                hint: userData['user']['name'],
              ),

              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _emailController,
                label: 'Email Id',
                hint: userData['user']['email'],
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _phoneController,
                label: 'Mobile No',
                hint: userData['user']['mobile_no'],
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

  Future getUserDetails() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');

      var url =
          "http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/details";
      var response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer ' + userToken!,
      }, body: {
        "mobile_no": mobileNo,
      });

      if (response.statusCode == 200) {
        var jsonString = response.body;
        userData = json.decode(jsonString);
        print('////////////////////${response.body}');

        print('///////// Response Is: ${userData}');

        SharedPreferences prefs = await SharedPreferences.getInstance();
        // String userToken = token;

        prefs.setBool('user', true);
        prefs.setString('userToken', userToken);
      } else {
        print('Data not found');
        print(userData);
        // Create a flutter toast.
        Fluttertoast.showToast(
            msg: "Data not found",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 20.0);
      }
    } catch (e) {
      print(e);
    }
  }
}
