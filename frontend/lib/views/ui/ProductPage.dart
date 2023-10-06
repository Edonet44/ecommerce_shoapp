import 'package:flutter/material.dart';

import '../widgets/widgtcamera.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



// Future<List<Detail>> getMyDetails() async {
//       final box = ref.read(hiveBoxProvider);
//       final accessToken = box.get(AUTHENTICATED_USER_EMAIL_KEY) as String?;
//       if (accessToken != null) {
//         My_standings my_StandingsAPi = My_standings();
//         MyStandings? myStandings =
//             await my_StandingsAPi.getMyStandings(accessToken);
//         if (myStandings != null) {
//           return myStandings.details;
//         }
//       }
//       return [];
//     }

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                //color: Colors.amber,
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("testo11"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("testo2"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text("colonna 2"),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text("colonna 3"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 30,
                ),
                //CustomScrollView(slivers: [SliverToBoxAdapter(child: Column(children: [FutureBuilder<List<dynamic>>(future: Future.wait(futures))],),)],)
              ],
            )) // Utilizza il tuo nuovo widget riutilizzabile
            // Altri widget o contenuti possono essere aggiunti qui
          ],
        ),
      ),
    );
  }
}
