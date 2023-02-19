
import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../home/cubit/cubit.dart';





class ProductDetaileScreen extends StatelessWidget {
  final Product product;
  ProductDetaileScreen({required this.product});

  @override
  Widget build(BuildContext context) {
// void getImages()
// {
//   for(int i = 0; i< product.images.length; i++)
//   {
//     print(product.images[i]);
//   }
// }

    return  Scaffold(
      appBar: AppBar(
        title: Text("${product.category}", style: Theme.of(context).textTheme.bodyText1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CarouselSlider(

                      items:
                      ShopCubit.get(context).product!.map((e) => Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Image(
                          image: NetworkImage('${e.image}'),
                          fit: BoxFit.cover,
                          width: double.infinity,),
                      )

                      ).toList(),

                      options: CarouselOptions(
                        height: 400.0,
                        initialPage: 0,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,

                      )
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white.withOpacity(0.5),

                      
                    ),
                    child: Text('Free Payement ....\$ ${product.rating.count} ', style: TextStyle(fontSize: 18),),
                  ),
                ],

              ),

              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      ' \$ ${product.price} ',
                      style: TextStyle(
                        color: Colors.black,

                      ),
                    ),
                    Text(
                      '${product.title}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        height: 140,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              return Container(
                                width: 100,
                                margin: EdgeInsets.symmetric(vertical: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black,
                                ),
                                child: MaterialButton(onPressed: (){},
                                  child: Text('NEW IN',style: TextStyle(fontSize: 15,
                                    color: Colors.white,),),),
                              );
                            },

                            separatorBuilder: (context, index)=> SizedBox(width: 8.0,),
                            itemCount: 5
                        ),
                      ),
                    ),
                     Text(
                      'DETAILS',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${product.description}',
                      style: TextStyle(
                        color: Colors.black,

                      ),

                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                Container(

                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/shopping-bag.png',),
                      alignment: AlignmentDirectional.centerStart,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,
                  ),
                  
                  child: MaterialButton(onPressed: (){},
                    child: Text('ADD TO SHOPPING BAG',style: TextStyle(fontSize: 20,
                      color: Colors.white,
                    ),
                    ),
                  ),
                ),
                  ],
                ),
              ),




            ],
          ),
        ),
      ),

    );
  }
}
