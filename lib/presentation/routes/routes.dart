import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/screens/dashboard_screen/dashboard_screen.dart';
import 'package:oownee/presentation/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:oownee/presentation/screens/forgot_password_screen/password_reset_success.dart';
import 'package:oownee/presentation/screens/forgot_password_screen/setnewpassword_screen.dart';
import 'package:oownee/presentation/screens/info+screen/info_screen.dart';
import 'package:oownee/presentation/screens/myprofile_screen/edit_profile.dart';
import 'package:oownee/presentation/screens/myprofile_screen/my_profile_screen.dart';
import 'package:oownee/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:oownee/presentation/screens/registration_screens/complete_registration.dart';
import 'package:oownee/presentation/screens/registration_screens/explanation_page.dart';
import 'package:oownee/presentation/screens/registration_screens/first_property_profile.dart';
import 'package:oownee/presentation/screens/registration_screens/first_tenant_profile.dart';
import 'package:oownee/presentation/screens/registration_screens/pricing.dart';
import 'package:oownee/presentation/screens/registration_screens/property_name.dart';
import 'package:oownee/presentation/screens/registration_screens/property_registered.dart';
import 'package:oownee/presentation/screens/registration_screens/property_type.dart';
import 'package:oownee/presentation/screens/registration_screens/registration_success.dart';
import 'package:oownee/presentation/screens/registration_screens/tenant_register_success.dart';
import 'package:oownee/presentation/screens/signin_screen/signin_screen.dart';
import 'package:oownee/presentation/screens/welcome_screen/welcome_screen.dart';

class Routes {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case signinScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case propertynameScreen:
        return MaterialPageRoute(builder: (_) => const PropertyNameScreen());
      case setNewPasswordScreen:
        return MaterialPageRoute(builder: (_) => const SetNewPasswordScreen());
      case passwordResetSuccessfullScreen:
        return MaterialPageRoute(builder: (_) => const PasswordResetSuccess());
      case propertyRegisteredScreen:
        return MaterialPageRoute(
            builder: (_) => const PropertyRegisteredScreen());
      case tenantProfileScreen:
        return MaterialPageRoute(builder: (_) => const TenantProfileScreen());
      case tenantregisteredsuccessScreen:
        return MaterialPageRoute(builder: (_) => const TenantRegisterSuccess());
      case explanationScreen:
        return MaterialPageRoute(builder: (_) => const ExplanationScreen());
      case dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case infoScreen:
        return MaterialPageRoute(builder: (_) => const InfoScreen());
      case myprofileScreen:
        return MaterialPageRoute(builder: (_) => const MyProfileScreen());
      case editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

      default:
        throw ("this route name does not exist");
    }
  }
}
