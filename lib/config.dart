var thisYear = DateTime.now().year.toString();

class AppConfig {
  static String copyRightText =
      "@ Sandeep Jewellry " + thisYear; 
  static String appName = "Sandeep Jewellry"; 

  static const DOMAIN_PATH =
      "https://admin.sandeepjewellers.com/app/public/api";

  //do not configure these below

  static const String BASE_URL = "$DOMAIN_PATH";

}
