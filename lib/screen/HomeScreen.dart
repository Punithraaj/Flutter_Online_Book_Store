import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_online_book_store/screen/model/LatestBooks.dart';
import 'package:flutter_online_book_store/screen/model/PopularBooks.dart';
import 'package:flutter_online_book_store/utils/utility.dart';
import 'package:flutter_online_book_store/widgets/avatar_image.dart';
import 'package:flutter_online_book_store/widgets/book_card.dart';
import 'package:flutter_online_book_store/widgets/book_cover.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: primary,
        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.vertical_distribute_rounded,
                    ))),
            Icon(Icons.search_rounded),
            SizedBox(
              width: 15,
            ),
            AvatarImage("https://avatars.githubusercontent.com/u/26542668?v=4",
                isSVG: false, width: 27, height: 27)
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    child: getHeaderBlock(),
                  ),
                  Positioned(
                      top: 140,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 260,
                        child: getPopularBooks(),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Text(
                      "Latest Books",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: getLatestBooks(),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getHeaderBlock() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
              color: primary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 15),
                child: Text(
                  "Hi, Raaj",
                  style: TextStyle(
                      color: secondary,
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 15),
                child: Text(
                  "Welcome to Lifemasto!",
                  style: TextStyle(
                      color: secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Popular Books",
                    style: TextStyle(
                        color: secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          color: primary,
          child: Container(
            decoration: BoxDecoration(
                color: appBgColor,
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(100))),
          ),
        )
      ],
    );
  }

  getPopularBooks() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 5, left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            popularBooksInfo.length,
            (index) => BookCard(
                  popularBook: popularBooksInfo[index],
                )),
      ),
    );
  }

  getLatestBooks() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(latestBooksInfo.length,
            (index) => BookCover(book: latestBooksInfo[index])),
      ),
    );
  }
}
