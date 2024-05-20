import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
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
      body: ListView(
        padding: const EdgeInsets.only(top: 25.0),
        children: [
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Container(
              height: 200.0,
              color: Colors.blueGrey,
              child: Row(
                children: [
                ],
              )
            ),
          ),
          Container(
            child: Text(
                "hi"
            ),
          )
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
      tabs: MainCategory.values.map((mainCategory) => Container(
        width: 30.0,
        child: Tab(text: mainCategory.krName,),
      )).toList(),
      onTap: (index) {
          NetworkService.getSubCategoryList(index)
              .then((subCategoryList) {

               }
          );
      },
    );
  }
}
