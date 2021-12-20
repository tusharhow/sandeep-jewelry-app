// import 'package:flutter/material.dart';
// import 'package:sandeep_jwelery/screens/auth/verify_otp_input_screen.dart';
// import 'package:sandeep_jwelery/screens/homepage_main.dart';
// import 'package:sandeep_jwelery/services/api_service.dart';

// class AuthRepository {
//   apiCallOtp(BuildContext context, phone) {
//     final service = ApiServices();

//     service.apiCallOtp({
//       "mobile_no": phone,
      
//     }
   
//     ).then((value) => {
//           if (value.status == 200)
//             {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => VerifyOtpInputScreen(
//                             phoneNumber: phone,
//                           )),
//                   (route) => false),
//             }
//           else
//             {
//               print(value.status),
//             }
//         });
//   }

//   callLoginApi(BuildContext context, phone) {
//     final service = ApiServices();

//     service.apiCallLogin({
//       "mobile_no": phone,
//       "one_singnal": "y",
//       "type": "user",
    
//     }).then((value) => {
//           if (value.status == 200)
//             {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomePageMain()),
//                   (route) => false),
//               {
//                 print('Get Data => ${value.status}'),
//               }
//             }
//         });
//   }
// }
