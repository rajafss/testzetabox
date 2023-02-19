import 'package:flutter/material.dart';
import 'package:testzetabox/shared/styles/theme.dart';

import 'modules/home/cubit/cubit.dart';
import 'modules/home/cubit/states.dart';
import 'modules/onbording/onbording_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopCubit()..fetchdataProduct(),),

      ],
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state){},
        builder: (context, state){
         return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}



