import 'package:flutter/material.dart';

/**
 * Widget Container con ombra e radius di 20
 * Titolo grande al centro
 * Sottotitolo 
 * Riga con 3 colonne e relative immagini
 * e bottone a lunghezza fissa arrotodato
 * https://www.youtube.com/watch?v=i2O2adGyz0U vedere video del container
 */

class ContainerShadows extends StatelessWidget {
  const ContainerShadows({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 20, spreadRadius: 5)
            ]),
        child: Column(
          children: [
            const Text(
              "Titolo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 5,
            ),
            Text("Secondo titolo",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            const Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fitness_center,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("TESt")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.tiktok,
                      color: Colors.purple,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("TESt")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.radar,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("TESt")
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(//creo una dimenzione fissa con infinty per il pulsante arrotondato
                width: double.infinity,
                height: 25,
                child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const StadiumBorder(), elevation: 0),
                      onPressed: () {}, child: Text("Clicca qui")))
          
          ],
        ));
  }
}
