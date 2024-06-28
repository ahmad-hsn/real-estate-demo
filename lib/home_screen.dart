import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white, // End color (white)
                Colors.amber, // Start color (amber)
              ],
              begin: Alignment.topLeft, // Gradient start position
              end: Alignment.bottomRight, // Gradient end position
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration:
                          const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                'Saint Petersburg',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/ic_dummy_profile.png',
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Hi, Marina',
                      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                    const Text(
                      "let's select your \nperfect place",
                      style: TextStyle(fontSize: 30.0),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 180,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                shape: BoxShape.circle,
                              ),
                              child: const Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Text(
                                    'BUY',
                                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                                  ),
                                  Center(
                                    child: Text(
                                      '1 034',
                                      style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    child: Text(
                                      'offers',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: const Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Text(
                                    'RENT',
                                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                                  ),
                                  Center(
                                    child: Text(
                                      '2 212',
                                      style: TextStyle(color: Colors.grey, fontSize: 30.0, fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    child: Text(
                                      'offers',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
                margin: const EdgeInsets.only(bottom: 80),
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(25))),
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 2,
                      child: _getTile('assets/images/ic_dummy_house_1.jpg', 'Gladkova St., 1'),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 3,
                      child: _getTile('assets/images/ic_dummy_house_2.jpg', 'Gladkova St., 2'),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.5,
                      child: _getTile('assets/images/ic_dummy_house_2.jpg', 'Gladkova St., 3'),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.5,
                      child: _getTile('assets/images/ic_dummy_house_1.jpg', 'Gladkova St., 4'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getTile(String asset, String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            asset,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.fill,
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            padding: const EdgeInsets.only(left: 20.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE0E0E0), Color(0xFFD3CBB8)], // Customize your gradient colors here
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/ic_forward_arrow.png',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}