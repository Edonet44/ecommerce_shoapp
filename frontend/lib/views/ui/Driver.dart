import 'package:flutter/material.dart';
import 'package:frontend/controllers/client_provider.dart';
import 'package:frontend/controllers/concessionaria_provider.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:frontend/controllers/driver_provider.dart';
import 'package:frontend/models/Simba/Simba.dart';
import '../shared/theme.dart';
import '../widgets/widgt_container_driver.dart';

class Driver_Page extends StatefulWidget {
  const Driver_Page({super.key});

  @override
  State<Driver_Page> createState() => _DriverPageState();
}

class _DriverPageState extends State<Driver_Page> {
  late DriverProvider dateDriverProvider;
  late ClientProvider clientProvider;
  late ConcessionariaProvider dateConcessionariaProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Driver', style: IntestazioneTitolo),
        actions: [],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                FutureBuilder<List<dynamic>>(
                  future: Future.wait([
                    dateDriverProvider.fetchData(), //0
                    clientProvider.fetchData(), //1
                    dateConcessionariaProvider.fetchData() //2
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height, // Altezza dello schermo
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text(
                              'Errore durante il recupero delle concessionarie'));
                    } else {
                      Driver driver = snapshot.data![0];
                      Client client = snapshot.data![1];
                      Concessionaria concessionaria = snapshot.data![2];

                      // ignore: unnecessary_null_comparison
                      if (driver != null) {
                        return Column(
                          children: [
                            Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Ciao, ${driver.name!}'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Hai ${driver.count.toString()} viaggi in programma oggi'),
                                    ],
                                  ),
                                ],
                              ),
                              
                            ),
                            ),
                            WdgtContainerDriver(altezza: 100,larghezza: 100,raggio: 20)
                          ],
                        );

                        // return ListView.builder(
                        //   shrinkWrap: true,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemCount: detail.length,
                        //   itemBuilder: (context, index) {
                        //     Concessionaria details = detail[index];

                        //     return Card(
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       child: Column(
                        //         children: [
                        //           ListTile(
                        //             leading: CircleAvatar(
                        //                 radius: 20,
                        //                 child: Image.network(details)),
                        //             title: Text(
                        //               details.name!,
                        //               style: const TextStyle(
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //             subtitle: Row(
                        //               children: [
                        //                 Expanded(
                        //                   child: Text(details.description),
                        //                 ),
                        //               ],
                        //             ),
                        //             onTap: () {
                        //               // Azione da eseguire quando si fa clic sul dettaglio classifica

                        //               Navigator.push(
                        //                 context,
                        //                 MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       Classifica_dettaglio_Screen(
                        //                           details.idProgetto,
                        //                           details.nomeProgetto,
                        //                           details.pos),
                        //                 ),
                        //               );
                        //             },
                        //           ),
                        //           const SizedBox(height: 8),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // );
                      } else {
                        return const Center(
                            child: Text('Nessuna attivita disponibile'));
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
