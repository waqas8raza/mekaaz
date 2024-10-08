import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mekaaz/core/utils/shared_pref_service.dart';


import 'app_router/app_router.dart';
import 'theme/app_colors/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.clearAll();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
  SharedPrefService.clearAll();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Me'kaazz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: '/',
      routes: AppRouter.routes,
      // home: const AddMedicineScreen(),
    );
  }
}
