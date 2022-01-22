import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/components/profile_edit_form_field.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/controllers/user_controller.dart';
import 'package:sandeep_jwelery/models/profile_model.dart';
import 'package:sandeep_jwelery/models/user_edit_model.dart';
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
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _panController = TextEditingController();

  bool tappedBtn = false;

  String? mobileNo;
  String? emailFull;
  String? fullName;
  var userData;
  var userNumber;

  @override
  void initState() {
    super.initState();
    setState(() {
      nameCredential();
      userEditController.getUserDetails();

      editUser();
    });
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

  File? uploadimage;
  var editResponse;
  Future<UserEditModel> editUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    var url = 'https://admin.sandeepjewellers.com/app/public/api/edit';
    List<int> imageBytes = uploadimage!.readAsBytesSync();
    String baseimage = base64Encode(imageBytes);
    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    }, body: {
      "name": _nameController.text,
      "country": _countryController.text,
      "address": _addressController.text,
      "designation": "",
      "pincode": _pinController.text,
      "pan_no": _panController.text,
      "state": _stateController.text,
      "company_name": "",
      "email": _emailController.text,
      "image": baseimage,
      "city": _cityController.text,
      "gstno": _gstController.text,
      "mobile_no": _phoneController.text,
    });

    if (response.statusCode == 200) {
      setState(() {
        var parsedData = json.decode(response.body);
        editResponse = UserEditModel.fromJson(parsedData);
        print('done');
      });
    } else {
      // Flutter toast
      Fluttertoast.showToast(
        msg: "Something went wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return editResponse;
  }

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      uploadimage = File(image!.path);
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
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              // uploadimage == null
              //     ? Container(
              //         height: 50,
              //         width: 50,
              //         color: Colors.red,
              //       )
              //     : //if uploadimage is null then show empty container
              //     Container(
              //         //elese show image here
              //         child: uploadimage == null
              //             ? Container(
              //                 height: 50,
              //                 width: 50,
              //                 color: Colors.blue,
              //               )
              //             : CircleAvatar(
              //                 radius: 50,
              //                 backgroundImage: FileImage(
              //                     uploadimage!), //load image from file
              //               )),
              // Container(
              //     //show upload button after choosing image
              //     child: Container(
              //         //elese show uplaod button
              //         child: ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       getImage();

              //     });
              //   },
              //   child: Text(
              //     "Choose Image",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   //set brghtness to dark, because deepOrangeAccent is darker coler
              //   //so that its text color is light
              // ))),
              // const SizedBox(
              //   height: 20,
              // ),
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
              ProfileEditFormField(
                editingController: _addressController,
                label: 'Address',
                hint: "Address",
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _pinController,
                label: 'Pin Code',
                hint: "Pin code",
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _cityController,
                label: 'City',
                hint: "City",
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _gstController,
                label: 'GST No',
                hint: "GST No",
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _panController,
                label: 'PAN No',
                hint: "PAN No",
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileEditFormField(
                editingController: _stateController,
                label: 'State',
                hint: "State",
              ),
              const SizedBox(
                height: 50,
              ),
              ReusablePrimaryButton(
                  childText: 'Update',
                  buttonColor: const Color(0xffEE0000),
                  textColor: Colors.white,
                  onPressed: () {
                    editUser();
                    // Get.snackbar(
                    //   'User Data Updated',
                    //   'User Data Edit Succesful!',
                    //   backgroundColor: Colors.white,
                    // );
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
