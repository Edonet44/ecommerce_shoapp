import 'package:flutter/material.dart';
import 'package:frontend/views/widgets/widgtcamera.dart';

import '../widgets/widgt_container_withshadws.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  final List<String> tabTitles = ['Tab 1', 'Tab 2', 'Tab 3'];

  List<String> tabs = ["Tutti", "Categoria", "Top", "Raccomandata"];

  // Contenuto delle schede
  // final List<Widget> tabContents = [
  //   Center(child: Text('Contenuto Tab 1')),
  //   Center(child: Text('Contenuto Tab 2')),
  //   Center(child: Text('Contenuto Tab 3')),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.withAlpha(10),
          title: Center(
              child: Text(
            "DRIVER",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black38.withOpacity(0.5)),
          )),
        ),
        body: DefaultTabController(
          length: tabTitles.length,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: const Radius.circular(40),
                            bottomRight: const Radius.circular(40)),
                        child: Image.asset("assets/images/driver.jpg"),
                      ),
                      Positioned(
                          top: 200,
                          bottom: 0,
                          left: 25,
                          right: 25,
                          child: ContainerShadows())
                    ]),
                  ),
                  SizedBox(height: 20),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black.withOpacity(0.2),
                  //           spreadRadius: 2,
                  //           blurRadius: 10,
                  //           offset: Offset(0, 3),
                  //         ),
                  //       ],
                  //     ),
                  //     child: TabBar(
                  //       tabs: tabTitles.map((title) {
                  //         return Container(
                  //           padding: EdgeInsets.symmetric(horizontal: 20.0),
                  //           child: Tab(
                  //             child: Text(title),
                  //           ),
                  //         );
                  //       }).toList(),
                  //     ),
                  //   ),
                  // ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var i = 0; i < 4; i++)
                          FittedBox(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.only(left: 15, right: 15),
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black12.withOpacity(0.05)),
                              child: Center(
                                child: FittedBox(child: Text(tabs[i])),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  //aggiungere il contenuto delle schede
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    height: 350, // Altezza del contenitore delle schede
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 2.0,
                                child: CameraWidget(),
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
