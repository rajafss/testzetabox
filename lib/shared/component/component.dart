import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../modules/home/cubit/cubit.dart';
import '../../modules/products/product_details_screen.dart';

void navigateTo(context, widget) => Navigator.push(context, MaterialPageRoute(builder: (context)=> widget));

void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context)=>
            widget),
            (router)
        {
          return false;
        }
    );


Widget articlBuilder(list, context,{bool isSearch = false}) => SingleChildScrollView(

  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child:   Column(
      children: [
        ConditionalBuilder(
          condition: ShopCubit.get(context).product != null,
          builder: (context) {
            return  Column(
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

                      // Image(image: AssetImage('assets/images/iphone.jpg'),
                      //   width: double.infinity,
                      //   height: 120.0,
                      //   fit: BoxFit.cover,),
                      // Image(image: AssetImage('assets/images/mac.png'),
                      //   width: double.infinity,
                      //   height: 120.0,
                      //   fit: BoxFit.cover,),
                      // Image(image: AssetImage('assets/images/mic.jpg'),
                      //   width: double.infinity,
                      //   height: 120.0,
                      //   fit: BoxFit.cover,),
                      // Image(image: AssetImage('assets/images/parfum.jpg'),
                      //   width: double.infinity,
                      //   height: 120.0,
                      //   fit: BoxFit.cover,),

                    options: CarouselOptions(
                      height: 200.0,
                      initialPage: 0,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,

                    )),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 150,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Container(
                            width: 100,
                            margin: EdgeInsets.symmetric(vertical: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
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
                SizedBox(height: 20,),
                Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    /// aspectration
                    childAspectRatio: 1/1.58,
                    children: List.generate(list.length, (index) => productList(list[index], context)) ,

                  ),
                  ),

              ],
            );
          },
          fallback: (context)=> isSearch ? Container() : Center(child: CircularProgressIndicator()),

        ),

      ],

    ),
  ),
);

Widget productList( Product model, context) => InkWell(
  onTap: (){
    navigateTo(context, ProductDetaileScreen(product: model,));
  },
  child:   Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(image: NetworkImage(model.image),
              width: double.infinity,
              height: 180,
            ),
            // if(model.discount != 0)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                color: Colors.red,
                child: Text('DISCOUNT',
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white
                  ),),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                ),),
              Row(
                children: [
                  Text('${model.price}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blue,
                    ),),
                  SizedBox(
                    width: 5.0,
                  ),
                  // if(model.discount != 0)
                  Text('${model.rating.count}',
                    style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough
                    ),),
                  Spacer(),
                  IconButton(
                    onPressed: ()
                    {
                      // ShopCubit.get(context).changeFavorite(model.id);
                      // print(model.id);
                    },

                    icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor:  Colors.grey  ,
                        // backgroundColor: ShopCubit.get(context).favorites[model.id]! ? Colors.grey : defaultColor ,
                        child: Icon(
                          Icons.favorite_border,
                          size: 16.0,
                          color: Colors.white,
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);



Widget buildArticlesItem(Product article, context) =>InkWell(
  onTap: (){

    // navigateTo(context, ProductDetaileScreen(product: article,));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Stack(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article.image}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsetsDirectional.fromSTEB(90, 90, 0.0, 5.0),
              onPressed: (){
                // navigateTo(context, FavoriteScreen());
              },
              icon: Icon(Icons.favorite_outline),color: Colors.grey,),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${article.title}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                ),
                Row(
                  children: [
                    Text(
                        '${article.price} \$',
                        style: TextStyle(
                          color: Colors.pink.shade700,

                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis
                    ),
                    SizedBox(
                      width: 11.0,
                    ),
                    Text('${article.rating}',
                        style: TextStyle(
                          color: Colors.pink.shade700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis
                    ),
                  ],
                ),
                Text(
                    '${article.description}',
                    style: TextStyle(
                      color: Colors.grey,

                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis
                ),

              ],
            ),
          ),
        ),
      ],
    ),
  ),
);




Widget myDivider() =>  Container(
  height: 2,
  margin: EdgeInsets.only(
      top: 5, right:10),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    color: Colors.white12,
  ),
);


