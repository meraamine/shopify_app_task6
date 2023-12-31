import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/seeder/data.seeder.dart';
import 'package:shopify_app/widgets/carousel_slider_ex.widget.dart';
import 'package:shopify_app/widgets/headline.widget.dart';
import 'package:shopify_app/widgets/home/AdsCarousel_homepage.dart';
import 'package:shopify_app/widgets/home/categories_row.home.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await DataSeeder.loadData();
    setState(() {});
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeadlineWidget(title: 'Categories'),
          SizedBox(height: 10),
          CategoriesRowHome(),
          SizedBox(height: 10),
          AdsCarousel(),
          // CarouselSliderEx(
          //   items: [
          //     'first Ad',
          //     'second Ad',
          //     'third Ad',
          //     'forth Ad',
          //   ],
          // ),
          // if (_isLoading)
          //   CircularProgressIndicator()
          // else
          //   ...DataSeeder.products.map((e) => Text(e.name ?? 'No Name')).toList()
        ],
      ),
    );
  }
}
