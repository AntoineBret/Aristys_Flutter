import 'package:flutter/material.dart';

const Color _blue700 = Color(0xFF1976D2);
const Color _lightBlue700 = Color(0xFF0288D1);
const Color _cyan700 = Color(0xFFF0097A7);
const Color _teal700 = Color(0xFF00796B);
const Color _green700 = Color(0xFF388E3c);
const Color _lightGreen700 = Color(0xFF689F38);

const Color _blue300 = Color(0xFF3B5F8F);
const Color _lightBlue300 = Color(0xFF8266D4);
const Color _cyan300 = Color(0xFFF95B57);
const Color _teal300 = Color(0xFFF3A646);
const Color _green300 = Color(0xFF81C784);
const Color _lightGreen300 = Color(0xFFAED581);

class Section {
  const Section({
    this.title,
    this.backgroundAsset,
    this.backgroundAssetPackage,
    this.leftColor,
    this.rightColor,
  });
  final String title;
  final String backgroundAsset;
  final String backgroundAssetPackage;
  final Color leftColor;
  final Color rightColor;

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


final List<Section> allSections = <Section>[
  const Section(
    title: 'Agence',
    leftColor: _lightBlue300,
    rightColor: _blue300,
    backgroundAsset: ('assets/agence.png'),
  ),
  const Section(
    title: 'Expertises',
    leftColor: _cyan300,
    rightColor: _lightBlue300,
    backgroundAsset: ('assets/expertises.png'),
  ),
  const Section(
    title: 'Clients',
    leftColor: _teal300,
    rightColor: _cyan300,
    backgroundAsset: ('assets/clients.png'),
  ),
  const Section(
    title: 'Blog',
    leftColor: _green300,
    rightColor: _teal300,
    backgroundAsset: ('assets/blog.png'),
  ),
  const Section(
    title: 'Contact',
    leftColor: _lightGreen300,
    rightColor: _green300,
    backgroundAsset: ('assets/contact.png'),
  ),
];
