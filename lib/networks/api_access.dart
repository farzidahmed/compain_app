import 'package:bnp_app/about-us/data/rx_about_us/rx.dart';
import 'package:bnp_app/about-us/model/about_us_repsponse.dart';
import 'package:bnp_app/features/auth/data/rx_forget_password/rx.dart';
import 'package:bnp_app/features/auth/data/rx_login/rx.dart';
import 'package:bnp_app/features/auth/data/rx_otp_verify/rx.dart';
import 'package:bnp_app/features/auth/data/rx_reset_password/rx.dart';
import 'package:bnp_app/features/auth/data/rx_sign/rx.dart';
import 'package:bnp_app/features/auth/data/rx_user_verify/rx.dart';
import 'package:bnp_app/features/auth/model/login_response.dart';
import 'package:bnp_app/features/auth/model/verify_otp_response.dart';
import 'package:bnp_app/features/bnp_dofa/data/rx_bnp_dofa/rx.dart';
import 'package:bnp_app/features/bnp_dofa/model/programme_image_response.dart';
import 'package:bnp_app/features/cadabaj/data/rx_drug_seller/rx.dart';
import 'package:bnp_app/features/gallery/data/rx_gallery_api/rx.dart';
import 'package:bnp_app/features/gallery/model/get_gallery_response.dart';
import 'package:bnp_app/features/home/data/rx_carasul/rx.dart';
import 'package:bnp_app/features/home/data/rx_log_out/rx.dart';
import 'package:bnp_app/features/home/model/carasul_response.dart';
import 'package:bnp_app/features/information/data/rx_area/rx.dart';
import 'package:bnp_app/features/information/data/rx_complain/rx.dart';
import 'package:bnp_app/features/information/data/rx_word/rx.dart';
import 'package:bnp_app/features/information/model/area_response.dart';
import 'package:bnp_app/features/information/model/get_area_response.dart';
import 'package:rxdart/rxdart.dart';

SignupRx signupRx = SignupRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
UserVerifyOtpRx verifyOtpRx = UserVerifyOtpRx(
  empty: LoginResponse(),
  dataFetcher: BehaviorSubject<LoginResponse>(),
);
LoginRx loginRx = LoginRx(
  empty: LoginResponse(),
  dataFetcher: BehaviorSubject<LoginResponse>(),
);

ForgetPassRx forgetPassRx = ForgetPassRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
VerifyForgetPassOtpRx verifyForgetPassOtpRx = VerifyForgetPassOtpRx(
  empty: VerifyotpResponse(),
  dataFetcher: BehaviorSubject<VerifyotpResponse>(),
);
ResetPasswordRx resetPasswordRx = ResetPasswordRx(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
GetGalleryRx getGalleryRx = GetGalleryRx(
  empty: GetGalleryResponse(),
  dataFetcher: BehaviorSubject<GetGalleryResponse>(),
);
GetAreaRx getAreaRx = GetAreaRx(
  empty: GetAreaResponse(),
  dataFetcher: BehaviorSubject<GetAreaResponse>(),
);
GetWordRx getWordRx = GetWordRx(
  empty: AreaResponse(),
  dataFetcher: BehaviorSubject<AreaResponse>(),
);
GetCarasoulRx getCarasoulRx = GetCarasoulRx(
  empty: CarasoulResponse(),
  dataFetcher: BehaviorSubject<CarasoulResponse>(),
);
GetProgrameRx getProgrameRx = GetProgrameRx(
  empty: GetProgrammeImageResponse(),
  dataFetcher: BehaviorSubject<GetProgrammeImageResponse>(),
);
TermsAndCOnditonRx termsAndCOnditonRx = TermsAndCOnditonRx(
  empty: AboutResponse(),
  dataFetcher: BehaviorSubject<AboutResponse>(),
);
ComplainRx complainRx = ComplainRx(
empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
DrugSellerRx drugSellerRx = DrugSellerRx(
empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
LogoutRX logoutRX = LogoutRX(
empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);
