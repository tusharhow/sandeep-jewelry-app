var thisYear = DateTime.now().year.toString();

class AppConfig {
  static String copyRightText =
      "@ Sandeep Jewellry " + thisYear; //this shows in the splash screen
  static String appName = "Sandeep Jewellry"; //this shows in the splash screen

  //static String purchase_code = ""; //enter your purchase code for the app from codecanyon

  //configure this

  //configure this
  //static const DOMAIN_PATH = "192.168.0.104/ecommerce_demo_three"; //localhost
  static const DOMAIN_PATH =
      "https://admin.sandeepjewellers.com/app/public/api"; // directly inside the public folder

  //do not configure these below

  static const String BASE_URL = "$DOMAIN_PATH";
  static const loginAPI = "/api/login";
  static const registerAPI = "/api/register";
  static const userProfileAPI = "/details";

  //configure this if you are using amazon s3 like services
  //give direct link to file like https://[[bucketname]].s3.ap-southeast-1.amazonaws.com/
  //otherwise do not change anythink

//static const String BASE_PATH = "https://tosoviti.s3.ap-southeast-2.amazonaws.com/";
}
