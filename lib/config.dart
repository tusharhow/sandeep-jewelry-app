var thisYear = DateTime.now().year.toString();

class AppConfig {
  static String copyRightText =
      "@ Sandeep Jewellry " + thisYear; //this shows in the splash screen
  static String appName = "Sandeep Jewellry"; //this shows in the splash screen

  //static String purchase_code = ""; //enter your purchase code for the app from codecanyon

  //configure this
  static const bool HTTPS = false;

  //configure this
  //static const DOMAIN_PATH = "192.168.0.104/ecommerce_demo_three"; //localhost
  static const DOMAIN_PATH =
      "ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api"; // directly inside the public folder

  //do not configure these below
  static const String API_ENDPATH = "/api";
  static const String PUBLIC_FOLDER = "public";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "$PROTOCOL$DOMAIN_PATH";
  static const String BASE_URL = "$RAW_BASE_URL";
  static const loginAPI = "/api/login";
  static const registerAPI = "/api/register";
  static const userProfileAPI = "/users/user-Profile";

  //configure this if you are using amazon s3 like services
  //give direct link to file like https://[[bucketname]].s3.ap-southeast-1.amazonaws.com/
  //otherwise do not change anythink
  static const String BASE_PATH = "$RAW_BASE_URL/$PUBLIC_FOLDER/";
//static const String BASE_PATH = "https://tosoviti.s3.ap-southeast-2.amazonaws.com/";
}
