import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sandeep_jwelery/components/textformfield.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:getwidget/getwidget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? dropdownValue;
  bool isChecked = false;
  TextEditingController _nameController = new TextEditingController();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _phoneController = new TextEditingController();

  TextEditingController _passController = new TextEditingController();

  TextEditingController _dobController = new TextEditingController();

  var dateFormat = DateFormat('dd MMMM, yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
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
              child: Text(
                'Enter Details to Sign Up',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffD8D8D8),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  FormFieldComponent(
                      hintText: 'Full Name',
                      controller: _nameController,
                      icon: 'assets/icons/author.png'),
                  SizedBox(
                    height: 15,
                  ),
                  FormFieldComponent(
                      hintText: 'Email id',
                      controller: _emailController,
                      icon: 'assets/icons/email.png'),
                  SizedBox(
                    height: 15,
                  ),
                  FormFieldComponent(
                      hintText: 'Phone No.',
                      controller: _phoneController,
                      icon: 'assets/icons/phone.png'),
                  SizedBox(
                    height: 15,
                  ),
                  FormFieldComponent(
                      hintText: ' Password',
                      controller: _passController,
                      icon: 'assets/icons/key.png'),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 48.0,
                    width: MediaQuery.of(context).size.width / 1.05,
                    child: TextFormField(
                      onTap: () async {
                        var datePicked = await DatePicker.showSimpleDatePicker(
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
                      style: TextStyle(fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff272727),
                        hintText: '    Date of Birth',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.only(top: 10.0),
                      ),
                      onChanged: (value) {
                        //get value from text field here
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonHideUnderline(
                      child: GFDropdown(
                        padding: const EdgeInsets.all(15),
                        borderRadius: BorderRadius.circular(5),
                        border:
                            const BorderSide(color: Colors.black12, width: 1),
                        dropdownButtonColor: Color(0xff272727),
                        value: dropdownValue,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue as String?;
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
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GFCheckbox(
                        size: GFSize.SMALL,
                        activeBgColor: GFColors.PRIMARY,
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
                                text: 'I have read and accept ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            TextSpan(
                                text: 'Terms & Conditions',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 16))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
