import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/component/component.dart';
import '../home/home_screen.dart';



class OnBoardingModel
{
  final String image;
  // final String title;
  // final String body;

  OnBoardingModel({
    required this.image,
    // required this.title,
    // required this.body
  });

}
bool isLast = false;

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardControler = PageController();

  List<OnBoardingModel> boarding = [
    OnBoardingModel(image: 'assets/images/onbord3.jfif',
      // title: 'on boardin 3 title',
      // body: 'on boarding 3 body'
    ),
    OnBoardingModel(image: 'assets/images/onbord.jfif',
        // title: 'on boardin 1 title',
        // body: 'on boarding 1 body'
    ),
    OnBoardingModel(image: 'assets/images/onbord2.jfif',
      // title: 'on boardin 3 title',
      // body: 'on boarding 3 body'
    ),


  ];
  String title = '';
  void submit()
  {
    navigateAndFinish(context,
            HomeLayoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     // TextButton(onPressed: submit,
      //     //     child: Text('Skip',
      //     //       style: TextStyle(
      //     //         color: Colors.pink.shade700,
      //     //       ),)),
      //   ],
      // ),
      body:Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardControler,

                physics: BouncingScrollPhysics(),
                onPageChanged: (int index)
                {
                  if(index == boarding.length - 1)
                  {
                     setState(() {
                      isLast = true;
                      submit();
                    });
                  } else
                  {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context,index)=> buildBoardItem(boarding[index % boarding.length]),
                itemCount: boarding.length,
              ),
            ),
            // SizedBox(
            //   height: 40.0,
            // ),
            // Row(
            //   children: [
            //     SmoothPageIndicator(
            //       effect: ExpandingDotsEffect(
            //         expansionFactor: 4,
            //         dotColor: Colors.grey,
            //         activeDotColor: Colors.blue,
            //         dotHeight: 10,
            //         dotWidth: 10,
            //         spacing: 5.0,
            //       ),
            //       controller: boardControler,
            //       count: boarding.length,
            //     ),
            //     Spacer(),
            //     FloatingActionButton(
            //       onPressed: ()
            //       {
            //         if(isLast)
            //         {
            //
            //
            //         }else
            //         {
            //           boardControler.nextPage(
            //               duration: Duration(
            //                   milliseconds: 750
            //               ),
            //               curve: Curves.linear);
            //         }
            //       },
            //       child: Icon(Icons.arrow_forward_ios),),
            //   ],
            // ),

          ],
        ),
      ),
    );
  }

  Widget buildBoardItem(OnBoardingModel model) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Image.asset('${model.image}',
              fit: BoxFit.cover,
          )
      ),
      // SizedBox(
      //   height: 20.0,
      // ),
      // Text('${model.title}',
      //   style: TextStyle(
      //     fontSize: 24.0,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      // SizedBox(
      //   height: 30.0,
      // ),
      // Text('${model.body}',
      //   style: TextStyle(
      //     fontSize: 14.0,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      // SizedBox(
      //   height: 50.0,
      // ),
    ],
  );

}
