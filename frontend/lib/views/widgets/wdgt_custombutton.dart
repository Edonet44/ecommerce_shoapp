import 'package:flutter/material.dart';

/// Classe widget con bottone con sfumatura lineare 
/// con all interno un altro bottone circolare con freccia biannca
/// è quello utilizzato nella app goodgo all inizio della dashboard
class SplashCustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[300]!, Colors.grey[500]!],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: () {
         // Sostituisci LogPage con il nome della tua pagina di destinazione
          //vai al login
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(
          //       builder: (BuildContext context) =>
          //           const // Sostituisci LogPage con il nome della tua pagina di destinazione
          //           //Login_Page()
          //           ),
          // );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: Colors.transparent,
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Get Started',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
