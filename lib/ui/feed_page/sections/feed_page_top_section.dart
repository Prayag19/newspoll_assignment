import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspoll/ui/utils/extensions.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/imageAssetButton_widget.dart';


class FeedPageTopSection extends StatelessWidget {
  const FeedPageTopSection({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: context.responsive(
        290,
        axis: Axis.vertical,
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                    AssetImage("assets/images/asset_feed_0.png"),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: context.responsive(
                57,
                axis: Axis.vertical,
              ),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: context.responsive(18, axis: Axis.horizontal),
            child: Container(
              width: MediaQuery.of(context).size.width-context.responsive(80, axis: Axis.horizontal),
              height: context.responsive(
                57,
                axis: Axis.vertical,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
              child: const Text(
                "Will China invade Taiwan before end september? ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top:  context.responsive(254,axis: Axis.vertical,),
            left: context.responsive(338,axis: Axis.horizontal,),
            child:  const ImageAssetButton(iHeight:24, iColor: Colors.white, iAsset: AppIcons.icFeedHIcon, iWidth: 24,),),
          Positioned(
            top:  context.responsive(11,axis: Axis.vertical,),
            left: context.responsive(346,axis: Axis.horizontal,),
            child: const   ImageAssetButton(iHeight:24, iColor: Colors.white, iAsset: AppIcons.icFeedRedo, iWidth: 24,),
    )
        ],
      ),
    );
  }
}

