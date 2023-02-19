import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testzetabox/modules/home/cubit/states.dart';

import '../../../models/product_model.dart';
import '../../message/message_screen.dart';
import '../../order/order_screen.dart';
import '../../products/product_screen.dart';
import '../../profile/profile_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());




  static ShopCubit get(context) => BlocProvider.of(context);






  int currentIndex = 0;

  List<Widget> screens = [
    ProductScreen(),
    MessageScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  List<String> titles = [

    'Product',
    'Messages',
    'Order',
    'Profile',
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  // List<dynamic> product = [];
  // fetchdata() async{
  //   var url = "https://dummyjson.com/products";
  //   var response = await http.get(Uri.parse(url));
  //   if(response.statusCode == 200)
  //   {
  //     List<dynamic> items = json.decode(response.body)['products'];
  //
  //     return product = items;
  //
  //   }
  // }

  // List<Product> products = [];
  // Future<List<Product>> fetchProduct() async {
  //   final response = await http
  //       .get(Uri.parse("https://dummyjson.com/products"));
  //
  //   if (response.statusCode == 200) {
  //
  //     return product = Product.fromJson(jsonDecode(response.body)) as List<Product>;
  //
  //   } else {
  //
  //     throw Exception('Failed to load album');
  //   }
  // }

  List images = [];
  List<Product>? product;
  fetchdataProduct() async {
    var url = "https://fakestoreapi.com/products?fbclid=IwAR2yLhmTope8nYxciVO-UbIseDMTjZMoL_4kXLUUcpQfu3GJLv3NWNvfGBs";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> items = json.decode(response.body);
      product = items.map((tagJson) => Product.fromJson(tagJson)).toList();
      for(int i = 0; i < product!.length; i++){
        print(product![i].title);
        emit(ShopSeccessState());
      }

      return product;
    }
  }



}







