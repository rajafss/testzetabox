
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_model.dart';
import '../../shared/component/component.dart';

import '../home/cubit/cubit.dart';
import '../home/cubit/states.dart';

class ProductScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var list = ShopCubit.get(context).product;

    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {

          return articlBuilder(list,context);

        }
    );


  }
  // Widget ProductBuilder(Product article, context)=> SingleChildScrollView(
  //   physics: BouncingScrollPhysics(),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       CarouselSlider(
  //           items: [
  //             Image(image: AssetImage('assets/images/iphone.jpg'),
  //               width: double.infinity,
  //               height: 120.0,
  //               fit: BoxFit.cover,),
  //             Image(image: AssetImage('assets/images/mac.png'),
  //               width: double.infinity,
  //               height: 120.0,
  //               fit: BoxFit.cover,),
  //             Image(image: AssetImage('assets/images/mic.jpg'),
  //               width: double.infinity,
  //               height: 120.0,
  //               fit: BoxFit.cover,),
  //             Image(image: AssetImage('assets/images/parfum.jpg'),
  //               width: double.infinity,
  //               height: 120.0,
  //               fit: BoxFit.cover,),
  //
  //           ],
  //           // article.image.map((e) => Image(
  //           //       image: NetworkImage('${e.image}'),
  //           //       fit: BoxFit.cover,
  //           //       width: double.infinity,)
  //           //
  //           //       ).toList(),
  //           options: CarouselOptions(
  //             height: 200.0,
  //             initialPage: 0,
  //             viewportFraction: 1.0,
  //             enableInfiniteScroll: true,
  //             reverse: false,
  //             autoPlay: true,
  //             autoPlayInterval: Duration(seconds: 3),
  //             autoPlayAnimationDuration: Duration(seconds: 1),
  //             autoPlayCurve: Curves.fastOutSlowIn,
  //             scrollDirection: Axis.horizontal,
  //
  //           )
  //       ),
  //       SizedBox(
  //         height: 10.0,
  //       ),
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text('Categories',
  //               style: TextStyle(
  //                   fontSize: 24,
  //                   fontWeight: FontWeight.w300
  //               ),
  //             ),
  //             // SizedBox(
  //             //   height: 10.0,
  //             // ),
  //             // Container(
  //             //   height: 150,
  //             //   child: ListView.separated(
  //             //       scrollDirection: Axis.horizontal,
  //             //       itemBuilder: (context, index)=> categoriesItem(list.),
  //             //       separatorBuilder: (context, index)=> SizedBox(width: 10.0,),
  //             //       itemCount: categoriesModel!.data.categories.length
  //             //   ),
  //             // ),
  //             // SizedBox(
  //             //   height: 20.0,
  //             // ),
  //             // Text('New Products',
  //             //   style: TextStyle(
  //             //       fontSize: 24,
  //             //       fontWeight: FontWeight.w300
  //             //   ),
  //             // ),
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         height: 10.0,
  //       ),
  //       Container(
  //         child: GridView.count(
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           crossAxisCount: 2,
  //           crossAxisSpacing: 1.0,
  //           mainAxisSpacing: 1.0,
  //           /// aspectration
  //           childAspectRatio: 1/1.58,
  //           children: List.generate(
  //             article.length,
  //                 (index) => productList( homeCategory.data.products[index], context),
  //           ),
  //         ),
  //       ),
  //     ],
  //   ),
  // );

}

// Widget articlBuilder(list) => Column(
//   children: [
//     CarouselSlider(
//
//         items: [
//           // Image(image: NetworkImage(list[context].),
//           //   width: double.infinity,
//           //   fit: BoxFit.cover,),
//           Image(image: AssetImage('assets/images/iphone.jpg'),
//             width: double.infinity,
//             fit: BoxFit.cover,),
//           Image(image: AssetImage('assets/images/parfum.jpg'),
//             width: double.infinity,
//             fit: BoxFit.cover,),
//           Image(image: AssetImage('assets/images/nass.jpg'),
//             width: double.infinity,
//             fit: BoxFit.cover,),
//
//         ],
//         options: CarouselOptions(
//           height: 200.0,
//           initialPage: 0,
//
//           enableInfiniteScroll: true,
//           reverse: false,
//           autoPlay: true,
//           autoPlayInterval: Duration(seconds: 3),
//           autoPlayAnimationDuration: Duration(seconds: 1),
//           autoPlayCurve: Curves.fastOutSlowIn,
//           scrollDirection: Axis.horizontal,
//
//         )),
//     SizedBox(height: 20,),
//     ListView.separated(
//         shrinkWrap: true,
//         // color scrol
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context,index) => buildArticlesItem(list[index], context),
//         separatorBuilder: (context,index) => myDivider(),
//         itemCount: list.length),
//   ],
// ),
