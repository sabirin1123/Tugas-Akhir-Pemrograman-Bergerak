import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigumkm/pages/description.dart';

import '../Widget/search_widget.dart';
import '../modal/umkm.dart';
import '../repositori/repositori.dart';

class listUmkm extends StatefulWidget {
  @override
  listUmkmState createState() => listUmkmState();
}

class listUmkmState extends State<listUmkm> {
  description descripsiUMKM = description();
  List<Umkm> umkms = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final umkms = await FetchUmkmList.getUmkms(query);

    setState(() => this.umkms = umkms);
    print(umkms);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('List UMKM'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              buildSearch(),
              allData(),
              Expanded(
                child: ListView.builder(
                  itemCount: umkms.length,
                  itemBuilder: (context, index) {
                    final umkm = umkms[index];
                    print(umkm.name);

                    return buildUmkm(umkm);
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search berdasarkan kabupaten',
        onChanged: searchUmkm,
      );

  Widget allData() => SizedBox(
        height: 20,
        child: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(5.0),
            ),
            Text(
              '${umkms.length.toString()} UMKM tersedia',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );

  Future searchUmkm(String query) async => debounce(() async {
        final umkms = await FetchUmkmList.getUmkms(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.umkms = umkms;
        });
      });

  Widget buildUmkm(Umkm umkm) => Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 242, 241),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.1), //(x,y)
              blurRadius: 2.0,
            ),
          ],
        ),
        child: ListTile(
            title: Text(umkm.name),
            subtitle: Text(umkm.districts),
            trailing: IconButton(
              icon: const Icon(Icons.description_sharp),
              color: Theme.of(context).primaryColor,
              onPressed: () => setState(
                () {
                  Get.to(descripsiUMKM.descriptionUmkm(
                      umkm.name,
                      umkm.address,
                      umkm.districts,
                      umkm.subdistricts,
                      umkm.type_business,
                      umkm.type));
                },
              ),
            )),
      );
}
