// To parse this JSON data, do
//
//     final simba = simbaFromJson(jsonString);

import 'dart:convert';

Simba simbaFromJson(String str) => Simba.fromJson(json.decode(str));

String simbaToJson(Simba data) => json.encode(data.toJson());

class Simba {
  List<Driver>? drivers;
  List<Client>? clients;
  List<Concessionaria>? concessionarie;

  Simba({
    this.drivers,
    this.clients,
    this.concessionarie,
  });

  factory Simba.fromJson(Map<String, dynamic> json) => Simba(
        drivers: (json["drivers"] as List<dynamic>?)
            ?.map((d) => Driver.fromJson(d))
            .toList(),
        clients: (json["clients"] as List<dynamic>?)
            ?.map((c) => Client.fromJson(c))
            .toList(),
        concessionarie: (json["concessionarie"] as List<dynamic>?)
            ?.map((c) => Concessionaria.fromJson(c))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "drivers": drivers?.map((d) => d.toJson()).toList(),
        "clients": clients?.map((c) => c.toJson()).toList(),
        "concessionarie": concessionarie?.map((c) => c.toJson()).toList(),
      };
}

class Client {
  String? name;
  bool? paymentDone;
  String? nomeConcessionaria; // Indica se il pagamento è stato effettuato
  List<Job>? acceptedJobs; // Lavori accettati dal cliente

  Client({
    this.name,
    this.paymentDone,
    this.nomeConcessionaria,
    this.acceptedJobs,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        name: json["name"] ?? "",
        nomeConcessionaria: json["nomeConcessionaria"] ?? "",
        paymentDone:
            json["paymentDone"] ?? false, // Impostato su false se non presente
        acceptedJobs: (json["acceptedJobs"] as List<dynamic>?)
            ?.map((j) => Job.fromJson(j))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? "",
        "paymentDone": paymentDone ?? false,
        "acceptedJobs": acceptedJobs?.map((j) => j.toJson()).toList() ?? [],
      };
}

class Concessionaria {
  String? name;
  String? data;
  String? address;
  int? numeroViaggi;
  bool? addJobs; // Indica se la concessionaria può aggiungere nuovi lavori

  Concessionaria({
    this.name,
    this.data,
    this.address,
    this.numeroViaggi,
    this.addJobs,
  });

  factory Concessionaria.fromJson(Map<String, dynamic> json) => Concessionaria(
        name: json["name"] ?? "",
        data: json["data"] ?? "",
        address: json["address"] ?? "",
        numeroViaggi: json[""] ?? 0,
        addJobs: json["addJobs"] ?? false, // Impostato su false se non presente
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? "",
        "address": address ?? "",
        "addJobs": addJobs ?? false,
      };
}

class Driver {
  String? name;
  int? count;
  List<Concessionaria>? concessionarie;
  bool
      paymentNotificationSent; // Campo per indicare se la notifica di pagamento è stata inviata

  Driver({
    this.name,
    this.count,
    this.concessionarie,
    this.paymentNotificationSent = false,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        name: json["name"] ?? "",
        count: json["count"] ?? 0,
        concessionarie: (json["concessionarie"] as List<dynamic>?)
                ?.map((c) => Concessionaria.fromJson(c))
                .toList() ??
            [],
        paymentNotificationSent: json["paymentNotificationSent"] ??
            false, // Impostato su false se non presente
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? "",
        "concessionarie": concessionarie?.map((c) => c.toJson()).toList() ?? [],
        "paymentNotificationSent": paymentNotificationSent ?? false,
      };
}

class Job {
  String? description;
  double? cost;
  bool? accepted; // Indica se il lavoro è stato accettato dal cliente

  Job({
    this.description,
    this.cost,
    this.accepted,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        description: json["description"] ?? "",
        cost: json["cost"]?.toDouble() ?? 0.0,
        accepted:
            json["accepted"] ?? false, // Impostato su false se non presente
      );

  Map<String, dynamic> toJson() => {
        "description": description ?? "",
        "cost": cost ?? 0.0,
        "accepted": accepted ?? false,
      };
}
