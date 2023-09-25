


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_article_tasks/views/text_widget.dart';
import '../model/aticle_model.dart';
import '../screens/detail_page.dart';



class CustomSliverBox extends StatelessWidget {
  final List<Article> article;
  const CustomSliverBox({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: 40.w, top: 20, bottom: 15),
            child: KTextWidget.featuredTextWidget),
        SizedBox(
          height: 240.h,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              aspectRatio: 16 / 11,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration:
              const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: article.length,
            itemBuilder: (context, index, _) {
              final data = article[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(id: data.id)));
                },
                child: Container(
                  height: 240.h,
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  padding:
                  EdgeInsets.only(left: 20.w, bottom: 30.h),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(15.r)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(data.imageUrl),
                      // onError: (error, StackTrace? stack) {
                      //   debugPrint("imgUrl error: $error StackTrace: $stack");
                      // },
                    ),
                  ),
                  child: TextHorizontalTitleWidget(
                    title: data.title,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(left: 35.w, top: 20, bottom: 15),
          child: KTextWidget.latestNewsWidget,
        ),
      ],
    );
  }
}
