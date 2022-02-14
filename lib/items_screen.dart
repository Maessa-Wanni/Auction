import 'package:emaritas_auction/details_screen.dart';
import 'package:emaritas_auction/model/details_model.dart';
import 'package:emaritas_auction/model/item_model.dart';
import 'package:flutter/material.dart';

import 'core/common/app_colors.dart';

class ItemsScreen extends StatefulWidget {
  final List<ItemModel> item;

  ItemsScreen({required this.item});

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsScreen> {
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
      decoration: new BoxDecoration(
        gradient: new RadialGradient(
          radius: 1.8,
          colors: [
            Color.fromARGB(255, 255,255,255),
            Color.fromARGB(255, 255,200,203),
          ],

        ),),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 5),
        itemBuilder: (context, index) {
          return itemBuild(
            widget.item[index],
          );
        },
        itemCount: widget.item.length,
      ),
    );
  }

  Widget itemBuild(ItemModel item) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                detailsModel: DetailsModel(
                  currentPrice: item.price,
                  minimumIncrement: "AED 5,000",
                  remainingTime: item.time,
                  endTime: "7 Feb - 12:00 PM",
                  description: "Plot no.2518\n"
                      "Area : industrial\n"
                      "Usage:Commerical/Offices/Industrial",
                  images: [
                    "assets/images/property1-1.jpg",
                    "assets/images/property1-2.jpg",
                    "assets/images/property1-3.jpg"
                  ],
                  auctionsNumber: item.auctionsNumber,
                  lot: item.lot,
                  list: [
                    "Affection plan",
                    "Details",
                    "Property Map",
                  ],
                ),
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.98,
          height: height * 0.13,
          color: AppColors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.asset(item.image, fit: BoxFit.fill),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        item.lot,
                        style: TextStyle(color: AppColors.blueFontColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 15,
                                color: AppColors.text_gray,
                              ),
                              Text(
                                ": " + "${item.auctionsNumber}",
                                style: TextStyle(
                                  color: AppColors.black_text,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${item.time} ",
                                style: TextStyle(
                                  color: AppColors.black_text,
                                ),
                              ),
                              Icon(
                                Icons.access_time,
                                size: 15,
                                color: AppColors.text_gray,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        item.price,
                        style: TextStyle(
                          color: AppColors.black_text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
        title: Text('Item Auction'),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
