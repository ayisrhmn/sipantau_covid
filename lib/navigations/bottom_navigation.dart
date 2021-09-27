import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sipantau_covid/pages/home.dart';
import 'package:sipantau_covid/pages/global.dart';
import 'package:sipantau_covid/pages/vaksin.dart';
import 'package:sipantau_covid/pages/hotline.dart';
import 'package:sipantau_covid/pages/info_apl.dart';
import 'package:sipantau_covid/theme.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Global(),
    Vaksin(),
    Hotline(),
    InfoApl(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Global',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Vaksin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Hotline',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info Apl',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}
