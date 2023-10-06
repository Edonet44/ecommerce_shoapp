import 'package:flutter/material.dart';



//**
//Oggetto Container con bordi arrotondati con la possibilita di usare titoli e sottotitoli
//
// */

class WdgtContainerDriver extends StatelessWidget {
  final double altezza;
  final double larghezza;
  final String? imageUrl;
  final String? trailing;
  final String? title2;
  final String? title3;
  final String? sottotiolo1;
  final String? sottotiolo2;
  final Colors? colore;
  final double raggio;

  const WdgtContainerDriver(
      {Key? key,
      this.imageUrl,
      required this.altezza,
      required this.larghezza,
      this.trailing,
      this.title2,
      this.title3,
      this.sottotiolo1,
      this.sottotiolo2,
      this.colore,
      required this.raggio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 147, 197, 219),
        borderRadius: BorderRadius.circular(raggio),
      ),
      child: Column(children: [
        Row(
          children: [
            Container(
              height: altezza,
              width: larghezza,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
             child: imageUrl != null && imageUrl!.isNotEmpty
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : Text(trailing!),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "CO",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$trailing",
                ),
              ],
            ),
          ],
        ),
        // const SizedBox(height: 16),
        // Row(
        //   children: [
        //     Container(
        //       width: 50,
        //       height: 50,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: Image.network(
        //         "https://site.goodgo.app/premialita/static/uploads/logo_gare/gara_nazionale_2022.jpg",
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     const SizedBox(width: 16),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const Text(
        //           "CO2",
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         const SizedBox(height: 8),
        //         Text(
        //           "Saved: ${standingdetail.co2Saved}",
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "PM10",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Saved: $title2",
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "SO2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Saved: $title3",
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
