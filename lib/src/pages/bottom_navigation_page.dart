import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starvest/src/components/app_bar_component.dart';
import 'package:starvest/src/pages/history_page.dart';
import 'package:starvest/src/pages/home/home_page.dart';
import 'package:starvest/src/pages/market_page.dart';
import 'package:starvest/src/pages/portofolio_page.dart';
import 'package:starvest/src/pages/wallet_page.dart';
import 'package:starvest/src/util/constant.dart';

class BottomNavigationPage extends StatefulWidget {
  final User? user;

  const BottomNavigationPage({Key? key, this.user}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  List<Widget> bodyView = const [
    HomePage(),
    MarketPage(),
    PortofolioPage(),
    HistoryPage(),
    WalletPage(),
  ];

  int _index = 0;

  void _onTapItem(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarComponent(photoUrl: widget.user!.photoURL!),
      ),
      body: bodyView.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: colorPrimary,
          onTap: _onTapItem,
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: GoogleFonts.montserrat(
            fontSize: 12,
            color: colorPrimary,
          ),
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: "Market",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: "Portofolio",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: "Wallet",
            )
          ]),
    );
  }
}
