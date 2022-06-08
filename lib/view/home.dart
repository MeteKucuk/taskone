import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_bilclick/bloc/network_bloc.dart';
import 'package:task_bilclick/utilities/extension.dart';
import 'package:task_bilclick/view/books_list.dart';
import '../data/books_api.dart';
import '../model/books_model.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkBloc()..add(NetworkObserve()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: context.height * 0.15,
                width: context.width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      icon(iconData: Icons.book),
                      const Text(
                        "Kitaplar",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      icon(iconData: Icons.book),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: BlocBuilder<NetworkBloc, NetworkState>(
                  builder: (context, state) {
                    if (state is NetworkFailure) {
                      if (GetStorage().read("apiData") == null) {
                        return const Center(
                          child: Text("Gösterilecek veri bulanamadı"),
                        );
                      } else {
                        final data =
                            GetStorage().read("apiData") as List<dynamic>;

                        final result = data
                            .map<BooksModel>(
                                (json) => BooksModel.fromJson(json))
                            .toList();

                        return BooksList(
                          length: data.length,
                          books: result,
                        );
                      }
                    } else if (state is NetworkSuccess) {
                      return FutureBuilder<List<BooksModel>>(
                          future: BooksApi().getAllBooks(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return BooksList(
                                length: snapshot.data!.length,
                                books: snapshot.data!,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Icon icon({required IconData iconData}) {
    return Icon(
      iconData,
      size: 50,
      color: Colors.grey,
    );
  }
}
