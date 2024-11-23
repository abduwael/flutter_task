import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_router.dart';
import 'core/utils/block_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPrefHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        360,
        800,
      ),
      useInheritedMediaQuery: false,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Social Feed App',
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
