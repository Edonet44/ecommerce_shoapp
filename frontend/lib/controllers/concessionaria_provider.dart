import 'package:flutter/foundation.dart';
import '../models/Simba/Simba.dart';
import '../services/api_manager.dart';
import '../services/constant.dart';

class ConcessionariaProvider extends ChangeNotifier {
  late Concessionaria? concessionaria;

//recupero Dati per i driver
  Future<void> fetchData() async {
    final apiManager = ApiManager(baseUrl: Strings_api.CONCESSIONARIA);
    final ConcessionariaData = await apiManager.get<Concessionaria>(
        "concessionaria_endpoint", (json) => Concessionaria.fromJson(json));
    concessionaria = ConcessionariaData;
  }
  notifyListeners(); // Notifica ai widget ascoltatori che lo stato è stato aggiornato
}
