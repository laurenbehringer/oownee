import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oownee/app_view.dart';
import 'package:oownee/firebase_options.dart';
import 'package:oownee/injection_container.dart';
import 'package:oownee/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:oownee/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:oownee/injection_container.dart' as di;
import 'package:oownee/presentation/bloc/login/login_bloc.dart';
import 'package:oownee/presentation/bloc/owner_view/owner_view_bloc.dart';
import 'package:oownee/presentation/bloc/view_property/property_view_bloc.dart';
import 'package:oownee/presentation/bloc/view_tenant/view_tenant_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent, // transparent status bar
  // ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final forgotpasswordBloc = sl<ForgotPasswordBloc>();
  final dashboardBloc = sl<DashboardBloc>();
  final loginBloc = sl<LoginBloc>();
  final ownerviewBloc = sl<OwnerViewBloc>();
  final propertyviewBloc = sl<PropertyViewBloc>();
  final tenantviewBloc = sl<ViewTenantBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => forgotpasswordBloc),
        BlocProvider(create: (_) => dashboardBloc),
        BlocProvider(create: (_) => loginBloc),
        BlocProvider(create: (_) => ownerviewBloc),
        BlocProvider(create: (_) => propertyviewBloc),
        BlocProvider(create: (_) => tenantviewBloc),
      ],
      child: AppView(),
    );
  }
}
