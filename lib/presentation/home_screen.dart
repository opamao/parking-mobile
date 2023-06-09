import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parkingflutter/presentation/account/account_screen.dart';
import 'package:parkingflutter/presentation/accueil/accueil_screen.dart';
import 'package:parkingflutter/presentation/historique/ticket_screen.dart';
import 'package:parkingflutter/presentation/parking/parking_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final Widget _accueil = const AccueilScreen();
  final Widget _parking = const ParkingScreen();
  final Widget _ticket = const TicketScreen();
  final Widget _account = const AccountScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: getBody(),
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Théodore Yapi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "Vinci",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          SizedBox.fromSize(
            size: const Size(40, 40),
            child: ClipOval(
              child: Material(
                color: Colors.lime.shade50,
                child: InkWell(
                  splashColor: Colors.limeAccent,
                  onTap: () {},
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const Gap(10),
        ],
      ),
      bottomNavigationBar: _buildBlurEffect(),
    );
  }

  Widget _buildBlurEffect() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.lightGreenAccent,
      strokeColor: Colors.white,
      unSelectedColor: const Color(0xff6c788a),
      backgroundColor: Colors.grey.shade800,
      borderRadius: const Radius.circular(20.0),
      blurEffect: true,
      opacity: 1,
      items: [
        CustomNavigationBarItem(
          icon: const Icon(Icons.home),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.local_parking_outlined),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.confirmation_number_outlined),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.perm_identity_outlined),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      isFloating: true,
    );
  }

  Widget getBody() {
    if (_currentIndex == 0) {
      return _accueil;
    } else if (_currentIndex == 1) {
      return _parking;
    } else if (_currentIndex == 2) {
      return _ticket;
    } else {
      return _account;
    }
  }
}
