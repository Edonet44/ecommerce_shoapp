// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: slash_for_doc_comments
/**
 * Temi da utilizzare nell applicazione
 * Ver 1.0
 */

TextStyle get IntestazioneSottotitolo {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold));
}

TextStyle get IntestazioneTitolo {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          color: Colors.black45, fontSize: 22, fontWeight: FontWeight.bold));
}

//--------------------------------------------Modulo 2----------------------------------------
TextStyle get Forgot_password {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          color: Color.fromARGB(115, 45, 43, 43),
          fontSize: 20,
          fontWeight: FontWeight.bold));
}

TextStyle get Legenda {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline));
}

//-------------------------------Profilo -------------------------------------------------------
// ignore: non_constant_identifier_names
TextStyle get IntestazioneTitoloProfilo {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          color: Colors.black45, fontSize: 28, fontWeight: FontWeight.bold));
}

TextStyle get IntestazioneTrattamenti_profilo {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          color: Colors.black45, fontSize: 20, fontWeight: FontWeight.bold));
}

TextStyle get DescrizioneProfilo {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          height: 1.4));
}

//-------------------------------Home -------------------------------------------------------
TextStyle get DescrizioneProfiloHome {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          height: 1.2));
}
//----------------------------------------------------------