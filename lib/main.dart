import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialapp/firebase_options.dart';
import 'package:socialapp/layout/cubit/cubit.dart';
import 'package:socialapp/layout/cubit/states.dart';
import 'package:socialapp/layout/layout.dart';
import 'package:socialapp/modules/login/login_screen.dart';
import 'package:socialapp/shared/bloc_observer.dart';
import 'package:socialapp/shared/components/constants.dart';
import 'package:socialapp/shared/network/local/cache_helper.dart';
import 'package:socialapp/shared/style/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Widget widget;
  // CacheHelper.removeData(key: 'uId');
  uId = CacheHelper.getData(key: 'uId');
  print(uId);
  // print(FirebaseAuth.instance.currentUser!.emailVerified);
  if (uId != null) {
    widget = const Layout();
  } else {
    widget = LoginScreen();
  }

  bool isDarkTheme = false;

  runApp(MainApp(
    startWidget: widget,
    isDarkTheme: isDarkTheme,
  ));
}

class MainApp extends StatelessWidget {
  final Widget? startWidget;
  final bool? isDarkTheme;
  const MainApp(
      {super.key, required this.startWidget, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit()
            ..getUserData()
            ..getPosts()
            ..getAllUsers(),
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: LightTheme,
              darkTheme: DarkTheme,
              themeMode: isDarkTheme == true ? ThemeMode.dark : ThemeMode.light,
              home: Scaffold(
                body: startWidget,
              ),
            );
          }),
    );
  }
}
