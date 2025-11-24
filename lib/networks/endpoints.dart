// ignore_for_file: constant_identifier_names

// const String url = String.fromEnvironment("BASE_URL");
// const String url = "http://192.168.40.77:8000";
// const String url = "https://henock.softvencefsd.xyz";
// const String url = "https://puppy.softvencefsd.xyz/api";
const String url = "https://apps.obiram.xyz/api/";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class EndPoints {
  EndPoints._();
  static String login() => "login";
  static String signup() => "register";
  static String verifyOtp() => "verify-email";
  static String forgetPassword() => "forget-password";
  static String verifyForgetPass() => "otp-token";
  static String resendOtp() => "api/register";
  static String resendForgetOtp() => "resend-otp";
  static String resetPassword() => "reset-password";
  static String userProfile() => "profile";
    static String getGallry() => "gallary-image";
    static String getArea() => "get-police-station";
    static String word(String policeaStation) => "get-area?polish_station=$policeaStation";
    static String getProgramme() => "program-image";
    static String getCarasul() => "carousel-image";
    static String termsAndCondition() => "about-us";
    static String complain() => "complain-suggestion";
    static String drug() => "drug-seller";
    static String logOut() => "logout";

  
}
