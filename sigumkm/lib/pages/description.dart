import 'package:flutter/material.dart';
import 'package:get/get.dart';

class description extends StatelessWidget {
  const description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget descriptionUmkm(String name, String address, String dis, String subdis,
          String typebis, String type) =>
      Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 130,
                          child: Wrap(
                            children: [
                              const Icon(
                                Icons.description,
                                size: 18,
                                color: Colors.teal,
                              ),
                              judul(' Deskripsi'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        title(name),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 120,
                          child: Wrap(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 18,
                                color: Colors.teal,
                              ),
                              judul(" Alamat"),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        title(address),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 120,
                          child: Wrap(
                            children: [
                              Icon(
                                Icons.location_city,
                                size: 18,
                                color: Colors.teal,
                              ),
                              judul(' Kabupaten'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        title(dis)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 120,
                          child: Wrap(
                            children: [
                              Icon(
                                Icons.location_city,
                                size: 18,
                                color: Colors.teal,
                              ),
                              judul(' Kecamatan')
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        title(subdis)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 120,
                          child: Wrap(
                            children: [
                              Icon(
                                Icons.category_outlined,
                                size: 18,
                                color: Colors.teal,
                              ),
                              judul(' Jenis')
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        title(typebis),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 120,
                          child: Wrap(
                            children: [
                              Icon(
                                Icons.category_outlined,
                                size: 18,
                                color: Colors.teal,
                              ),
                              judul(' Kategori')
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        title(type),
                      ],
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      );

  Widget title(String title) => Expanded(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      );

  Widget judul(String judul) => Text(
        judul,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      );
}
