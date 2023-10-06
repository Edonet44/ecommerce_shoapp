import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/tab_bar.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  List<String> tabs = ["Tutti", "Categoria", "Top", "Raccomandata"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon:
                                Icon(Icons.search, color: Color(0XFF676565)),
                            border: InputBorder.none,
                            label: Text(
                              "Cerca il tuo prodotto",
                              style: TextStyle(color: Colors.grey),
                            ))),
                  ),
                  Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(child: Icon(Icons.notifications_none)))
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFFFF0DD),
                    borderRadius: BorderRadius.circular(10)),
                child: const Image(
                    image:
                        AssetImage("assets/images/silhouette-3186305_640.png")),
              ),
              SizedBox(height: 20),
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
              TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.transparent,
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.grey.withOpacity(0.3),
                  tabs: const [
                    Tab(
                      text: "Scarpe uomo",
                    ),
                    Tab(
                      text: "Scarpe donna",
                    ),
                    Tab(
                      text: "Scarpe bambino",
                    ),
                  ]),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.20),
                child: Container(
                  height: 250,
                  padding: const EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _tabController, children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.405,
                              color: Colors.amber,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.405,
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
                            height: MediaQuery.of(context).size.height * 0.405,
                            color: Colors.amber,
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              )
              // ScrollableTabBar(
              //   Scrollabile: true,
              //   labelcolor: Colors.black26,
              //   labelstyle: TextStyle(
              //     fontSize: 22,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   padding: EdgeInsets.all(8),
              //   indicator: BoxDecoration(
              //     color: Colors.blue, // Colore di riempimento
              //     border: Border.all(
              //       color: Colors.red, // Colore del bordo
              //       width: 2.0, // Spessore del bordo
              //     ),
              //   ),
              //   controller: _tabController,
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}
