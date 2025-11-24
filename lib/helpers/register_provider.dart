
import 'package:bnp_app/providers/auth_provider.dart';
import 'package:bnp_app/providers/change_pass_provider.dart';
import 'package:bnp_app/providers/reset_pass_provider.dart';
import 'package:bnp_app/providers/sign_up_provider.dart';
import 'package:provider/provider.dart';



var providers = [
  ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
  ChangeNotifierProvider<SignUpProvider>(create: (context) => SignUpProvider()),
  ChangeNotifierProvider<ResetPassProvider>(
    create: (context) => ResetPassProvider(),
  ),
  ChangeNotifierProvider<ChangePassProvider>(
    create: (context) => ChangePassProvider(),
  ),

];