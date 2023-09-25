
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_article_tasks/bloc/article_bloc.dart';
import 'package:new_article_tasks/core/service_locatory.dart';
import 'package:new_article_tasks/model/aticle_model.dart';
import 'package:new_article_tasks/service/icons.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final Article article;
  @override
 void initState(){
   super.initState();
    article = context.read<ArticleBloc>().
    state.items.firstWhere((element) => element.id == widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<ArticleBloc,ArticleState>(
      builder: (context,state) {
        return Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: width,
                      width: width,
                      alignment: Alignment.bottomLeft,
                      padding:  EdgeInsets.only(left: 20.w,bottom: 50.h,top: 30.h),
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          image:  DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(article.imageUrl,),
                      ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator.pop(context,widget.id);
                              },
                              icon: KTIcons.arrowBackWhite,
                          ),
                          const Spacer(),
                          Text(article.title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.white),),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(article.description.toString(),style:  TextStyle(fontSize: 18.sp),),
                    ),
                  ],
                ),
              ),
              if(state is ArticleLoadingState) const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      }
    );
  }
}
