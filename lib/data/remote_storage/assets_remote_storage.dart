import 'package:flutter/material.dart';

class AssetsRemoteStorage {
  List<Widget> fetchCarouselImages() {
    return [
      Image.network('https://cdn.prod.website-files.com/62662ec945767b19355b5c00/6751ce9056bd6a78db8f69ae_Frame%2010025.avif'),
      Image.network(
          'https://cdn.prod.website-files.com/62662ec945767b19355b5c00/6752f0a0504fc919320b3e50_Transparent%20iPhone%2015%20Pro%20Mockup%20(Mockuuups%20Studio).avif'),
      Image.network(
          'https://cdn.prod.website-files.com/62662ec945767b19355b5c00/6751bb275e2e900aa097787e_Free%20mockup%20of%20female%20hand%20holding%20iPhone%2014%20Pro%20(Mockuuups%20Studio)-p-500.avif'),
    ];
  }
}
