import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_market/cubit/food_cubit.dart';
import 'package:food_market/cubit/transaction_cubit.dart';
import 'package:food_market/cubit/user_cubit.dart';
import 'package:food_market/ui/pages/pages.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => FoodCubit()),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
