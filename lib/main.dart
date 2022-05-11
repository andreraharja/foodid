import 'package:flutter/material.dart';
import 'package:food_id/api.dart';
import 'package:food_id/model.dart';

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
  List<DataBanner> lsBanner = [];
  List<DataBanner> lsBannerTop = [];
  List<DataBanner> lsBannerSmall = [];

  @override
  void initState() {
    fetchBanner();
    super.initState();
  }

  fetchBanner() async {
    lsBanner = await getDataBanner() ?? [];
    lsBannerTop =
        lsBanner.where((element) => element.bannerVariantId == 1).toList();
    lsBannerSmall =
        lsBanner.where((element) => element.bannerVariantId == 3).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                      Text("Dikirim ke ",
                          style: TextStyle(color: Colors.white)),
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
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
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
            SizedBox(
              height: queryData.size.height * 0.25,
              child: PageView.builder(
                  itemCount: lsBannerTop.length,
                  controller: PageController(viewportFraction: 0.8),
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Image.network(
                            lsBannerTop[pagePosition].media!,
                          )),
                    );
                  }),
            ),
            SizedBox(
              height: queryData.size.height / 45,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Special di FOOD.ID",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: lsBannerSmall.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Image.network(
                            lsBannerSmall[index].media!,
                          ),
                        );
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cari inspirasi belanja",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: lsBannerSmall.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Image.network(
                            lsBannerSmall[index].media!,
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
