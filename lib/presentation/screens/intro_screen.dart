import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mamo_pay/core/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<StatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Widget> carouselItems = [
    Image.network('https://cdn.prod.website-files.com/62662ec945767b19355b5c00/6751ce9056bd6a78db8f69ae_Frame%2010025.avif'),
    Image.network(
        'https://cdn.prod.website-files.com/62662ec945767b19355b5c00/6752f0a0504fc919320b3e50_Transparent%20iPhone%2015%20Pro%20Mockup%20(Mockuuups%20Studio).avif'),
    Image.network(
        'https://cdn.prod.website-files.com/62662ec945767b19355b5c00/6751bb275e2e900aa097787e_Free%20mockup%20of%20female%20hand%20holding%20iPhone%2014%20Pro%20(Mockuuups%20Studio)-p-500.avif'),
  ];

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Other widgets
            CarouselSlider(
              carouselController: _controller,
              items: carouselItems,
              options: CarouselOptions(
                pageSnapping: true,
                height: size.height * 0.5, // Customize the height of the carousel
                autoPlay: true, // Enable auto-play
                enlargeCenterPage: true, // Increase the size of the center item
                enableInfiniteScroll: true, // Enable infinite scroll
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselItems.asMap().entries.map((entry) {
                return Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            const Text(
              "Connect your bank account",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33.0),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, RouteName.dashboard);
              },
              child: const SizedBox(
                  height: 50,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login'),
                    ],
                  )),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ],
            ),
            // Other widgets
          ],
        ),
      ),
    );
  }
}
