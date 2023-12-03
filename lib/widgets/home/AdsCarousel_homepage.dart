import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<dynamic>?> fetchAds() async {
  String jsonString = await rootBundle.loadString('assets/data/data.json');
  final jsonData = json.decode(jsonString);
  return jsonData['ads'];
}

class AdsCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>?>(
      future: fetchAds(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<dynamic> ads = snapshot.data!;
          return CarouselSlider.builder(
            itemCount: ads.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                child: Column(
                  children: [
                    Image.network(ads[index]['image'] ?? '', height: 200),
                    Text(ads[index]['title'] ?? ''),
                    Text(ads[index]['description'] ?? ''),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error loading ads');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
