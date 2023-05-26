import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/db/database.dart';
import 'package:searchack/main.dart';
import 'package:searchack/screens/search/search_detailed.dart';
import 'package:searchack/screens/search/search_viewmodel.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const SearchDetailed(),
              )),
          child: const Text(
            'Поиск',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: StreamBuilder<List<Hack>>(
        stream: database.getHacks(
          address: context.watch<SearchViewModel>().address,
          companyOrganizer: context.watch<SearchViewModel>().companyOrganizer,
          description: context.watch<SearchViewModel>().description,
          endDate: context.watch<SearchViewModel>().endDate,
          isStrict: context.watch<SearchViewModel>().isStrict,
          prizeFundAmount: context.watch<SearchViewModel>().prizeFundAmount,
          sponsorName: context.watch<SearchViewModel>().sponsorName,
          startDate: context.watch<SearchViewModel>().startDate,
          title: context.watch<SearchViewModel>().title,
        ),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            snapshot.data![index].title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(height: 2),
                      Image.network(snapshot.data![index].imageLink),
                      const SizedBox(height: 2),
                      Text(snapshot.data![index].description),
                      const SizedBox(height: 10),
                      const Text(
                        'Дополнительная информация:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Место проведения: ${snapshot.data![index].address}',
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Призовой фонд: ${snapshot.data![index].prizeFundAmount} рублей',
                      ),
                      Text(
                        'Спонсор: ${snapshot.data![index].sponsorName}',
                      ),
                      Text(
                        'Компания организатор: ${snapshot.data![index].companyOrganizer}',
                      ),
                      Text(
                        'Дата начала: ${DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].startDate).day}.${DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].startDate).month}.${DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].startDate).year}',
                      ),
                      Text(
                        'Дата окончания: ${DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].endDate).day}.${DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].endDate).month}.${DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].endDate).year}',
                      ),
                      const Divider(
                        thickness: 0.5,
                        height: 2,
                        color: Colors.purple,
                      )
                    ],
                  ),
                );
              }),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
