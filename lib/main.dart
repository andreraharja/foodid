import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Id',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Food Id'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: queryData.size.height * 0.23,
        color: Colors.green,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "FOOD.ID",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: queryData.size.height / 30),
                ),
                const Icon(
                  Icons.chat,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: queryData.size.height / 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                Text("Dikirim ke ", style: TextStyle(color: Colors.white)),
                Text(
                  "Jakarta Selatan",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: queryData.size.height / 45,
            ),
            Center(
              child: SizedBox(
                height: queryData.size.height / 15,
                width: double.infinity,
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Mau Belanja Makanan Apa ?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
