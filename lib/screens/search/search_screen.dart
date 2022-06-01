import 'package:flutter/material.dart';
import 'package:searchack/models/hack_model.dart';
import 'package:searchack/services/hack_service.dart';

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
        title: const Text(
          'Поиск',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<Hackathon>>(
        future: HackService().getHacks(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.network(
                        snapshot.data![index].image!,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return ClipRRect(
                              child: child,
                              borderRadius: BorderRadius.circular(15.0),
                            );
                          }
                          return const CircularProgressIndicator(
                            color: Colors.purple,
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            snapshot.data![index].hackName!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(snapshot.data![index].description!),
                      const SizedBox(height: 5),
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
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
