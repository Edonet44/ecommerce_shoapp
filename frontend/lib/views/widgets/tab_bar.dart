import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

//https://www.youtube.com/watch?v=BHpSzDV4pEE&list=PLvG2mD7Ba5SzigkFFMElVrSJuzP5kzCQl&index=8
//tab bar al minuto 26:00

class ScrollableTabBar extends StatelessWidget {
  const ScrollableTabBar(
      {Key? key,
      required this.Scrollabile,
      this.labelcolor,
      this.labelstyle,
      this.padding,
      this.indicator,
      this.controller})
      : super(key: key);

  final bool Scrollabile;
  //colore che viene inserito alle icone
  final Color? labelcolor;
  //stile per la scritta sotto l'icona
  final TextStyle? labelstyle;
  final EdgeInsetsGeometry? padding;
  final Decoration? indicator;
  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          TabBar(
              controller: controller,
              isScrollable: true,
              labelPadding: EdgeInsets.all(10),
              indicatorPadding: EdgeInsets.all(10),
              labelColor: labelcolor,
              labelStyle: labelstyle,
              padding: EdgeInsets.symmetric(horizontal: 5),
              unselectedLabelColor: Colors.grey,
              indicator: indicator,
              indicatorColor: Colors.black,
              tabs: const [
                Tab(
                    text: "Primo Gruppo",
                    icon: Icon(
                      Icons.car_crash,
                      color: Colors.amber,
                    )),
                Tab(
                    text: "Secondo Gruppo",
                    icon: Icon(Icons.add_road_rounded, color: Colors.amber)),
                Tab(
                    text: "Terzo Gruppo",
                    icon: Icon(Icons.adobe, color: Colors.amber)),
              ]),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: TabBarView(controller: controller, children: [
              Container(
                //se voglio inserire del testo o degli oggetti inserire qui dentro
//                 child: Container(
// //inserire il listview con i libri https://www.youtube.com/watch?v=yrdiuMW2oXM&t=42s minuto 17:47

//                     ),

                height: MediaQuery.of(context).size.height * 0.405,
                //color: Colors.amber,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: Colors.grey,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width*0.6),
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.405,
                color: Colors.amber,
                //child: Container(),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.405,
                color: Colors.amber,
                // child: Container(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
