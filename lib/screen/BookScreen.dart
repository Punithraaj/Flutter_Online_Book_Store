import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_book_store/model/LatestBooks.dart';
import 'package:flutter_online_book_store/model/PopularBooks.dart';
import 'package:flutter_online_book_store/utils/utility.dart';
import 'package:flutter_online_book_store/widgets/book_item.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: appBgColor,
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
                        color: primary,
                      ))),
              Icon(
                Icons.search_rounded,
                color: primary,
              ),
              SizedBox(
                width: 15,
              ),
              Badge(
                position: BadgePosition.topEnd(top: -10, end: -10),
                badgeContent: Text(
                  '1',
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.shopping_bag_rounded,
                  color: primary,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: TabBar(
                indicatorColor: primary,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primary,
                ),
                labelPadding: EdgeInsets.only(top: 8, bottom: 8),
                unselectedLabelColor: primary,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Text(
                    "New Books",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Popular Books",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: TabBarView(
                children: [
                  ListView(
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      children: getNewBooks()),
                  ListView(
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      children: getPopularBooks()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getNewBooks() {
    return List.generate(latestBooksInfo.length,
        (index) => BookItem(book: latestBooksInfo[index]));
  }

  getPopularBooks() {
    return List.generate(popularBooksInfo.length,
        (index) => BookItem(book: popularBooksInfo[index]));
  }
}
