import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';

class AnnouncementSlider extends StatelessWidget {
 AnnouncementSlider({super.key});
 final List<Image> announcementImage=[
    Image.asset('assets/images/Announcement 1.png',fit: BoxFit.fill,),
    Image.asset('assets/images/Announcement 2.png',fit: BoxFit.fill,),
    Image.asset('assets/images/Announcement 3.png',fit: BoxFit.fill,),

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ImageSlideshow(
        indicatorRadius: 4,
        width: double.infinity,
        autoPlayInterval:4000,
        height: 200,
        initialPage: 0,
        indicatorColor: MyTheme.primaryColor,
        indicatorBackgroundColor: Colors.grey,
        isLoop: true,
        children: announcementImage,
      ),
    );
  }
}
