
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/components/textformfield.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sandeep_jwelery/screens/auth/verify_otp_input_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? dropdownValue;
  bool isChecked = false;
  var registerAr;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  var dateFormat = DateFormat('dd MMMM, yyyy');
  var onTapRecognizer;
  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFDD700),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Enter Details to Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffD8D8D8),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.80,
                child: Column(
                  children: [
                    FormFieldComponent(
                        hintText: 'Full Name',
                        controller: _nameController,
                        icon: 'assets/icons/author.png'),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                        hintText: 'Email id',
                        controller: _emailController,
                        icon: 'assets/icons/email.png'),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                        hintText: 'Phone No.',
                        controller: _phoneController,
                        icon: 'assets/icons/phone.png'),
                    const SizedBox(
                      height: 15,
                    ),
                    FormFieldComponent(
                        hintText: ' Password',
                        controller: _passController,
                        icon: 'assets/icons/key.png'),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 48.0,
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: TextFormField(
                        onTap: () async {
                          var datePicked =
                              await DatePicker.showSimpleDatePicker(
                            context,
                            initialDate: DateTime(1990),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2099),
                            dateFormat: 'dd MMMM, yyyy',
                            locale: DateTimePickerLocale.en_us,
                            looping: true,
                          );
                          String? date =
                              DateFormat("dd MMMM, yyyy").format(datePicked!);

                          setState(() {
                            _dobController.text = date;
                          });
                        },
                        controller: _dobController,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xff272727),
                          hintText: 'Date of Birth',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.only(top: 15.0, left: 20),
                        ),
                        onChanged: (value) {
                          // get value from text field here
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Select Date of Birth';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButtonHideUnderline(
                        child: GFDropdown(
                          iconEnabledColor: Colors.white,
                          hint: const Text('Select Gender',
                              style: TextStyle(color: Colors.white)),
                          padding: const EdgeInsets.all(15),
                          borderRadius: BorderRadius.circular(5),
                          border:
                              const BorderSide(color: Colors.black12, width: 1),
                          dropdownButtonColor: const Color(0xff272727),
                          value: dropdownValue,
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValue = newValue as String?;
                              print(dropdownValue);
                            });
                          },
                          items: [
                            'Male',
                            'Female',
                            'Others',
                          ]
                              .map((value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GFCheckbox(
                          size: GFSize.SMALL,
                          activeBgColor: GFColors.SUCCESS,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                          value: isChecked,
                        ),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: ' I have read and accept ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16))
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ReusablePrimaryButton(
                        childText: 'Sign Up',
                        buttonColor: Colors.white,
                        textColor: Colors.black,
                        onPressed: () {
                          Registration();
                          print('clicked');
                        }),
                    // isChecked == true
                    //     ? Navigator.pushAndRemoveUntil(
                    //         context,
                    //         push(
                    //             context: context,
                    //             widget: const VerifyOtpInputScreen()),
                    //         (route) => false)
                    //     : showModalBottomSheet(
                    //         context: context,
                    //         builder: (context) {
                    //           return Column(
                    //             mainAxisSize: MainAxisSize.min,
                    //             children: <Widget>[
                    //               ListTile(
                    //                 leading: const Icon(Icons.photo),
                    //                 title: const Text(
                    //                   'Make sure you are agree to our terms and conditions',
                    //                   style:
                    //                       TextStyle(color: Colors.white),
                    //                 ),
                    //                 onTap: () {
                    //                   Navigator.pop(context);
                    //                 },
                    //               ),
                    //             ],
                    //           );
                    // RegisterRequestModel model = RegisterRequestModel(
                    //   mobileNo: _phoneController.text,
                    //   agentCode: "0042",
                    //   email: _emailController.text,
                    //   name: _nameController.text,
                    //   panNo: 'BBDER551',
                    //   type: 'user',
                    // );
                    // APIService.register(model).then((response) {
                    //   if (response.success != 201) {
                    //     FormHelper.showSimpleAlertDialog(
                    //         context,
                    //         AppConfig.appName,
                    //         'Account Successfully created',
                    //         'Ok', () {
                    //       Navigator.of(context);
                    //     });
                    //     Navigator.pushAndRemoveUntil(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => VerifyOtp()),
                    //         (route) => false);
                    //   } else {
                    //     FormHelper.showSimpleAlertDialog(
                    //         context,
                    //         AppConfig.appName,
                    //         'Something went wrong',
                    //         'Ok', () {
                    //       Navigator.of(context);
                    //     });
                    //   }
                    // });

                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // callRegisterApi() {
  //   final service = ApiServices();

  //   service.apiCallRegister({
  // "name": _nameController.text,
  // "email": _emailController.text,
  // "agent_code": "0042",
  // "type": "user",
  // "mobile_no": _phoneController.text,
  // "pan_no": "BBDER551",
  //   }).then((value) => {
  //         if (value.error != null)
  //           {
  //             Toast.show(value.error, context,
  //                 duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM)
  //           }
  //         else
  //           {
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => VerifyOtp()),
  //                 (route) => false),
  //           }
  //       });
  // }

  Future Registration() async {
    var url =
        "http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/register";
    var response = await http.post(Uri.parse(url), body: {
      "name": _nameController.text,
      "email": _emailController.text,
      "agent_code": "0042",
      "type": "client",
      "mobile_no": _phoneController.text,
      "pan_no": "BBDER551",
    });

    if (response.statusCode == 200) {
      // var jshonString = response.body;
      // registerAr = json.decode(jshonString);
      print('Registration successfully');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('user', true);
      prefs.setString('fullname', _nameController.text);
      prefs.setString('email', _emailController.text);
      prefs.setString('mobile', _phoneController.text);

      // await FlutterKeychain.put(
      //     key: "pinkUserToken", value: registerAr['token'].toString());
      // await FlutterKeychain.put(
      //     key: "pinkUserName", value: registerAr['name'].toString());
      // await FlutterKeychain.put(
      //     key: "pinkUserUserID", value: registerAr['id'].toString());
      // await FlutterKeychain.put(
      //     key: "pinkUserEmail", value: registerAr['email'].toString());
      // await FlutterKeychain.put(
      //     key: "pinkUserPhone", value: registerAr['mobile_no'].toString());

      push(
          context: context,
          widget: VerifyOtpInputScreen(
            phoneNumber: _phoneController.text,
          ));
    } else {
      print('Registration failed');
      // Create a flutter toast.
      Fluttertoast.showToast(
          msg: "Registration failed!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 20.0);
    }
  }
}
