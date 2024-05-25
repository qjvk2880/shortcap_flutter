import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shortcap/enum/main_category.dart';
import 'service/network_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 11,
    vsync: this,
    initialIndex: 0,

    animationDuration: const Duration(milliseconds: 400),
  );

  List<Widget> listView = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: _title(),
            bottom: _tabBar()
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 25.0),
                children: listView
              ),
            ),
          ],
        )
    );
  }

  Row _title() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/5f14e5a0-56fb-4b98-8345-db6fe64b272c.png',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ]
    );
  }

  TabBar _tabBar() {
    return TabBar(
      indicatorColor: const Color(0xff4369F3),
      labelColor: const Color(0xff4369F3),
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      indicatorSize: TabBarIndicatorSize.tab,
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      controller: tabController,
      tabs: MainCategory.values.map((mainCategory) =>
          Container(
            width: 30.0,
            child: Tab(text: mainCategory.krName,),
          )).toList(),
      onTap: (index) {
        NetworkService.getSubCategoryList(index)
            .then((subCategoryList) {
              print(subCategoryList[0].subCategory);
              setState(() {
                listView = List<Widget>.generate(subCategoryList.length, (idx) {
                  return FractionallySizedBox(
                    widthFactor: 0.9,
                    // heightFactor: 0.3,
                    child: Container(
                        height: 160.0,
                        // width: double.infinity,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              width: 120.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Colors.grey
                              ),
                            ),
                            Container(
                              child: SizedBox(
                                width: 20.0,
                                height: 160.0,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                      subCategoryList[idx].subCategory,
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Color(0xff3c66fc),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: SizedBox(
                                    height: 10.0,
                                  ),
                                ),
                                Container(
                                  width: 70.0,
                                  height: 28.0,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        '더보기',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Color(0xff6a9dff),
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Color(0xffe7f1f6),
                                      side: BorderSide(
                                        color: Colors.transparent
                                      )
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                    ),
                  );
                });
              });
              },
            );
      });
    }
}
