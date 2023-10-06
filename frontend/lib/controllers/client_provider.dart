import 'package:flutter/foundation.dart';
import '../models/Simba/Simba.dart';
import '../services/api_manager.dart';
import '../services/constant.dart';
 

class ClientProvider extends ChangeNotifier {
  
  late List<Job>? jobs;
  
//recupero Dati per i driver
  Future<void> fetchData() async {
   final apiManager = ApiManager(baseUrl: Strings_api.CLIENT_JOBS);
final jobsData = await apiManager.get<List<Job>>("jobs_endpoint", (json) {
      final List<dynamic> jobList = json;
      return jobList.map((jobJson) => Job.fromJson(jobJson)).toList();
    });
    jobs = jobsData;
  }
  notifyListeners(); // Notifica ai widget ascoltatori che lo stato è stato aggiornato
}