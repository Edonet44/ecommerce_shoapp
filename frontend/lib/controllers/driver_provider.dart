import 'package:flutter/foundation.dart';

import '../models/Simba/Simba.dart';
import '../services/api_manager.dart';
import '../services/constant.dart';

class DriverProvider extends ChangeNotifier {
  late Driver? driver;
  
//recupero Dati per i driver
  Future<void> fetchData() async {
    final apiManager = ApiManager(baseUrl: Strings_api.DRIVER);
    final driverData = await apiManager.get<Driver>(
        "driver_endpoint", (json) => Driver.fromJson(json));
    driver = driverData;

   
  }

  notifyListeners(); // Notifica ai widget ascoltatori che lo stato è stato aggiornato
}
