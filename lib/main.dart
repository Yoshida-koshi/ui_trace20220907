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
      title: 'ui_trace20220907',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          height: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              primary: Colors.green,
            ),
            child: const Text('Settingsへ遷移'),
            onPressed: () {
              showModalBottomSheet(
                  enableDrag: true,
                  isScrollControlled: true,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: const UiTrace20220907(),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}

List<String> itemTextList = [
  'Name',
  'Username',
  'Birthday',
  'Mobile Number',
  'Email',
  'Bitmoji',
  'Snapcodes',
  'On-Demand Geofilters',
  'Spectacles',
  'Password',
  'Two-Factor Authentication',
  'Notifications',
  'Memories',
  'Shazam',
  'Apps from Snap',
  'Partner Connections',
  'Language',
];

List<String> detailTextList = [
  'Alexandre Dewez',
  'misterdewez',
  '7 August 1995',
  '!',
  'alex-dewez@hotmail.fr',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];

class UiTrace20220907 extends StatelessWidget {
  const UiTrace20220907({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.green),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 2 - 48 - 39),
              const Text(
                'Settings',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 0.5,
          height: 0,
        ),
        Container(
          width: double.infinity,
          height: 32,
          padding: const EdgeInsets.only(left: 16, top: 9),
          color: const Color(0xFFF4F6F9),
          child: const Text(
            'MY ACCOUNT',
            style: TextStyle(
                fontSize: 12, color: Colors.green, fontWeight: FontWeight.w700),
          ),
        ),
        Divider(
          thickness: 0.5,
          color: Colors.grey[300],
          height: 0,
        ),
        const SizedBox(height: 11),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 800),
              child: ListView.builder(
                  itemCount: 17,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    itemTextList[index],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: index == 3
                                            ? Colors.red
                                            : Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  detailTextList[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: index == 3
                                          ? Colors.red
                                          : Colors.grey),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: index == 3
                                      ? Colors.red
                                      : Colors.grey[400],
                                  size: 12,
                                ),
                                const SizedBox(width: 16),
                              ],
                            ),
                            const SizedBox(height: 5),
                            if (index != 16)
                              Divider(
                                thickness: 0.5,
                                color: Colors.grey[300],
                              )
                          ],
                        ),
                      ),
                      onTap: () {},
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
