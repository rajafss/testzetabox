import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HomeLayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // var cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context,state){},
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            title: Icon(Icons.document_scanner_outlined),
            // title: Text(ShopCubit.get(context).titles[ShopCubit.get(context).currentIndex],
            //     style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.pink.shade700)),
            actions: [
              MaterialButton(onPressed: (){},
                child: Text('MAN',),),
              MaterialButton(onPressed: (){},
                child: Text('WOMEN',),
              ),
              IconButton(onPressed: (){
                // navigateTo(context, SearchScreen());
              }, icon: Icon(Icons.search)),
              // IconButton(onPressed: (){
              //   navigateTo(context, ProfileScreen());
              // },
              //     icon: Icon(
              //       Icons.person_outline_sharp,
              //       color: Colors.pink.shade700,)
              // ),
              // TextButton(onPressed: (){
              //   CacheHelper.removeData(key: 'token').then((value)
              //   {
              //     if(value!) navigateAndFinish(context, OnBoardingScreen());
              //   });
              // }, child: Text('Logout')),

            ],
            //   TextButton(onPressed: (){
            //
            //     navigateTo(context, OnBoardingScreen());
            //     // CachHelper.removeData(key: 'token').then((value)
            //     // {
            //     //   if(value) navigateAndFinish(context, ShopLoginScreen());
            //     // });
            //   }, child: Text('LOGOUT')),
            // ],
          ),
          body: ShopCubit.get(context).screens[ShopCubit.get(context).currentIndex],

          bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                ShopCubit.get(context).changeBottomNav(index);
              },
              currentIndex: ShopCubit.get(context).currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  label: 'Profile',
                ),
              ]),

        );
      },

    );
  }
}
