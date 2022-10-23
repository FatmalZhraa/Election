import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/login/login_cubit.dart';
import '../blocs/main/main_cubit.dart';
import '../screens/login_screen.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => MainCubit()),
          BlocProvider(create: (BuildContext context) => LoginCubit()),
        ],
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, widget) => MaterialApp(
                builder: (context, widget) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaleFactor: 1.0.sp),
                    child: widget!,
                  );
                },
                debugShowCheckedModeBanner: false,
                title: "Election app",
                home:  LoginScreen(),
              ),
            );
          },
        ));
  }
}
