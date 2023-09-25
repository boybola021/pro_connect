

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_article_tasks/service/strings.dart';

sealed class KTextWidget{

static Text notificationTextWidget = Text(I18N.notifications,style: TextStyle(fontSize: 14.sp,color: Colors.black));
static  Text marcAllReadTextWidget = Text(I18N.markAllRead,style: TextStyle(fontSize: 14.sp,color: Colors.black));
static const Text featuredTextWidget = Text(I18N.featured,style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500),);
static const Text latestNewsWidget = Text(I18N.latestNews,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500),);

}

class TextHorizontalTitleWidget extends StatelessWidget {
  final String title;
  const TextHorizontalTitleWidget({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.white),);
  }
}

class TextVerticalTitleWidget extends StatelessWidget {
  final String title;
  const TextVerticalTitleWidget({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(title);}
}

class TextSubtitleWidget extends StatelessWidget {
  final String subtitleText;
  const TextSubtitleWidget({super.key,required this.subtitleText});
  @override
  Widget build(BuildContext context) {
    return Text(subtitleText);
  }
}
