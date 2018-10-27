import 'package:flutter/material.dart';

const Color _mariner = Color(0xFF3B5F8F);
const Color _mediumPurple = Color(0xFF8266D4);
const Color _tomato = Color(0xFFF95B57);
const Color _mySin = Color(0xFFF3A646);

class SectionDetail {
  const SectionDetail({
    this.title,
    this.subtitle,
    this.imageAsset,
    this.imageAssetPackage,
  });
  final String title;
  final String subtitle;
  final String imageAsset;
  final String imageAssetPackage;
}

class Section {
  const Section({
    this.title,
    this.backgroundAsset,
    this.backgroundAssetPackage,
    this.leftColor,
    this.rightColor,
    this.details,
  });
  final String title;
  final String backgroundAsset;
  final String backgroundAssetPackage;
  final Color leftColor;
  final Color rightColor;
  final List<SectionDetail> details;

  @override
  bool operator==(Object other) {
    if (other is! Section)
      return false;
    final Section otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

const SectionDetail _eyeglassesDetail = SectionDetail(
  imageAsset: 'logo.png',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _seatingDetail = SectionDetail(
  imageAsset: 'logo.png',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _decorationDetail = SectionDetail(
  imageAsset: 'logo.png',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _protectionDetail = SectionDetail(
  imageAsset: 'logo.png',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

final List<Section> allSections = <Section>[
  const Section(
    title: 'Agence',
    leftColor: _mediumPurple,
    rightColor: _mariner,
    backgroundAsset: 'logo.png',
    details: <SectionDetail>[
      _eyeglassesDetail,
    ],
  ),
  const Section(
    title: 'Expertises',
    leftColor: _tomato,
    rightColor: _mediumPurple,
    backgroundAsset: 'logo.png',
    details: <SectionDetail>[
      _seatingDetail,
    ],
  ),
  const Section(
    title: 'Clients',
    leftColor: _mySin,
    rightColor: _tomato,
    backgroundAsset: 'logo.png',
    details: <SectionDetail>[
      _decorationDetail,
    ],
  ),
  const Section(
    title: 'Blog',
    leftColor: Colors.white,
    rightColor: _tomato,
    backgroundAsset: 'logo.png',
    details: <SectionDetail>[
      _protectionDetail,
    ],
  ),
  const Section(
    title: 'Contact',
    leftColor: Colors.white,
    rightColor: _tomato,
    backgroundAsset: 'logo.png',
    details: <SectionDetail>[
      _protectionDetail,
    ],
  ),
];
