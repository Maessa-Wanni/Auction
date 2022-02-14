import 'package:carousel_slider/carousel_slider.dart';
import 'package:emaritas_auction/common/outlined_button.dart';
import 'package:emaritas_auction/model/details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/common/app_colors.dart';

class DetailsScreen extends StatefulWidget {
  final DetailsModel detailsModel;

  DetailsScreen({required this.detailsModel});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailsScreen> {
  CarouselController carouselController =
      new CarouselController(); // Give the controller

  responsiveScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portraitScreen(width, height);
    } else if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return landscapeScreen(width, height);
    }
  }

  Widget portraitScreen(double width, double height) {
    return Container(
      height: height*0.83,
      decoration: new BoxDecoration(
          gradient: new RadialGradient(
            radius: 1.8,
            colors: [
              Color.fromARGB(255, 255,255,255),
              Color.fromARGB(255, 255,200,203),
            ],

          ),),
      child: ListView(
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               buildSlider(height, width, widget.detailsModel.images,widget.detailsModel.lot),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     width: width * 0.5,
                     decoration: BoxDecoration(
                       color: AppColors.primaryColor,
                     ),
                     padding: EdgeInsets.all(
                       16,
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           "Current Price",
                           style: TextStyle(
                             color: Colors.grey,
                             fontSize: 16,
                           ),
                         ),
                         SizedBox(
                           height: 5,
                         ),
                         Text(
                           widget.detailsModel.currentPrice,
                           style: TextStyle(
                             color: AppColors.white,
                             fontSize: 16,
                           ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     width: width * 0.5,
                     decoration: BoxDecoration(
                     ),
                     padding: EdgeInsets.all(
                       16,
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Text(
                           "Minimum Increment",
                           style: TextStyle(
                             color: AppColors.text_gray,
                             fontSize: 16,
                           ),
                         ),
                         SizedBox(
                           height: 5,
                         ),
                         Text(
                           widget.detailsModel.minimumIncrement,
                           style: TextStyle(
                             fontSize: 16,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Column(
                       children: [
                         Icon(
                           Icons.access_time_outlined,
                           size: 50,
                         ),
                         SizedBox(
                           height: 10,
                         ),
                         Icon(
                           Icons.person,
                           size: 25,
                           color: AppColors.text_gray,
                         ),
                       ],
                     ),
                     SizedBox(
                       width: 10,
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               "End Time : " + widget.detailsModel.endTime,
                               style: TextStyle(
                                 fontSize: 16,
                               ),
                             ),
                             SizedBox(
                               height: 5,
                             ),
                             Text(
                               "Time remaining : " +
                                   widget.detailsModel.remainingTime,
                               style: TextStyle(
                                 fontSize: 16,
                               ),
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 10,
                         ),
                         Text(
                           "Number of Bids : " +
                               widget.detailsModel.auctionsNumber.toString(),
                           style: TextStyle(
                             fontSize: 16,
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Text(
                   widget.detailsModel.description,
                   style: TextStyle(
                     fontSize: 16,
                   ),
                 ),
               ),
               buildList(widget.detailsModel.list, height),
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     ButtonOutLine(
                       color: AppColors.black_text,
                       name: "Share",
                       width: width * 0.42,
                       height: height * 0.05,
                       icon: Icon(
                         Icons.share,
                         color: AppColors.white,
                       ),
                     ),
                     SizedBox(
                       width: width * 0.05,
                     ),
                     ButtonOutLine(
                       color: AppColors.black_text,
                       name: "Watch",
                       width: width * 0.42,
                       height: height * 0.05,
                       icon: Icon(
                         Icons.remove_red_eye_outlined,
                         color: AppColors.white,
                       ),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: ButtonOutLine(
                   color: AppColors.black_text,
                   name: "Chat Now",
                   width: width * 0.90,
                   height: height * 0.05,
                 ),
               ),
             ],
           ),
         ],
      ),
    );
  }

  Widget buildList(List<dynamic> list, height) {
    return Container(
      margin: EdgeInsets.all(16.0),

      constraints: new BoxConstraints(
        minHeight: 0.0,
        maxHeight: height,
      ),
      decoration: BoxDecoration(
       // color: AppColors.white,

        border: Border.all(
          color: AppColors.text_gray,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  list[index].toString(),
                  style: TextStyle(
                    color: AppColors.black_text,
                    fontSize: 17,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,size: 16,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: AppColors.text_gray,);
        },
        itemCount: list.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }

  Widget buildSlider(double height, double width, List<dynamic> list,String name) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            CarouselSlider(
              carouselController: carouselController, // Give the controller
              options: CarouselOptions(
                height: height * 0.25,
              ),
              items: list.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Image.asset(
                        i,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                color: AppColors.black_text.withOpacity(0.5),
                child: IconButton(
                  onPressed: () {
                    // Use the controller to change the current page
                    carouselController.previousPage();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                color: AppColors.black_text.withOpacity(0.5),
                child: IconButton(
                  onPressed: () {
                    // Use the controller to change the current page
                    carouselController.nextPage();
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          child: Container(
            color: AppColors.black_text.withOpacity(0.4,),
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                ),),
                Icon(Icons.zoom_out_map_outlined,color: AppColors.white,),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget landscapeScreen(double height, double width) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: responsiveScreen(context),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail'),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        height:  MediaQuery.of(context).size.height*0.07,
        child: Center(
          child: ButtonOutLine(
            color: AppColors.primaryColor,
            name: "BID NOW",
            width: MediaQuery.of(context).size.width*0.9,
            height:  MediaQuery.of(context).size.height*0.06,
          ),
        ),
      ),
    );
  }
}
