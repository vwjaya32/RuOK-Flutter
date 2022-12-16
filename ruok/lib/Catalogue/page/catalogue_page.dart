import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruok/drawer.dart';
import 'package:ruok/Catalogue/model/catalogue_model.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});
  @override
  State<StatefulWidget> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  Future<CatalogueModel> fetch() async {
    final request = context.watch<CookieRequest>();
    final response = await request.get(
        "https://ruok.up.railway.app/catalogue/get_catalogue");

    CatalogueModel fetched = CatalogueModel.fromJson(response);

    return fetched;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    final _formKeyNamaItem = GlobalKey<FormState>();
    final _formKeyMetodePembayaran = GlobalKey<FormState>();
    final _formKeyMetodePengiriman = GlobalKey<FormState>();

    var namaItem = "";
    var metodePembayaran = "";
    var metodePengiriman = "";

    return Scaffold(
      drawer: RuokDrawer(),
      appBar: AppBar(
        title: const Text(
          "Catalogue",
        style: TextStyle(fontFamily: "Roboto Slab"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment : MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                const Text(
                  "Comfort thy soul, boost thy happiness",
                  style: TextStyle(
                    fontFamily: "Roboto Slab",
                    fontSize: 30,
                    color: Color.fromARGB(255, 110, 168, 165),
                  ),
                ),
              ]),
            ),
            Row(
              mainAxisAlignment : MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "lib/Catalogue/assets/img/teddy1.jpg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const Text(
                      "COMPANION TEDDY  40K",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 110, 168, 165),
                        fontFamily: "Roboto Slab",
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "lib/Catalogue/assets/img/chicksoup1.jpeg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const Text(
                      "GOOD OL' CHICKEN SOUP  30K",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 110, 168, 165),
                        fontFamily: "Roboto Slab",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment : MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "lib/Catalogue/assets/img/candle1.jpg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const Text(
                      "SOOTHING CANDLE  30K",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 110, 168, 165),
                        fontFamily: "Roboto Slab",
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "lib/Catalogue/assets/img/heating1.jpeg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const Text(
                      "HEATING BLANKET  100K",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 110, 168, 165),
                        fontFamily: "Roboto Slab",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment : MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "lib/Catalogue/assets/img/boost-juice3.jpg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const Text(
                      "SEROTONIN JUICE  25K",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 110, 168, 165),
                        fontFamily: "Roboto Slab",
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "lib/Catalogue/assets/img/goal1.jpg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const Text(
                      "GOAL PLANNER  50K",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 110, 168, 165),
                        fontFamily: "Roboto Slab",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: OutlinedButton(
                onPressed: () {
                  if (!request.loggedIn) {
                    return;
                  }
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        color: Colors.white,
                        height: 350,
                        child: Column(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Form(
                                  key: _formKeyNamaItem,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "",
                                      labelText: "Item Name",
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    // Menambahkan behavior saat nama diketik
                                    onChanged: (String? value) {
                                      setState(() {
                                        namaItem = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Item name is empty:(';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Form(
                                  key: _formKeyMetodePembayaran,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "",
                                      labelText: "Payment Method",
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    // Menambahkan behavior saat nama diketik
                                    onChanged: (String? value) {
                                      setState(() {
                                        metodePembayaran = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Payment method is empty:(';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Form(
                                  key: _formKeyMetodePengiriman,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "",
                                      labelText: "Shipping Method",
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    // Menambahkan behavior saat nama diketik
                                    onChanged: (String? value) {
                                      setState(() {
                                        metodePengiriman = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Shipping method is empty:(';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                if (_formKeyNamaItem.currentState!.validate() &&
                                    _formKeyMetodePembayaran.currentState!
                                        .validate() &&
                                    _formKeyMetodePengiriman.currentState!
                                        .validate()) {
                                  final response = await request.post(
                                    "https://ruok.up.railway.app/catalogue/buy_item",
                                    {
                                      "metode_pembayaran": metodePembayaran,
                                      "shipping_method": metodePengiriman,
                                      "nama_item": namaItem,
                                    },
                                  );
                                  var message = response["message"].toString();
                                  message = message.replaceAll("[", "");
                                  message = message.replaceAll("]", "");

                                  if (response["status"]) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text("Success"),
                                        content: Text(message),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text("Invalid"),
                                        content: Text(message),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const Text("Submit"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                      color: Color.fromARGB(255, 121, 59, 168), width: 1),
                  minimumSize: const Size.fromRadius(21),
                ),
                child: const Text(
                  "BUY",
                  style: TextStyle(
                    color: Color.fromARGB(255, 121, 59, 168),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
