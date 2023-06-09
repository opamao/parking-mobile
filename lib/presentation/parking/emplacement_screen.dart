import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parkingflutter/utils/route.dart';

class EmplacementScreen extends StatefulWidget {
  const EmplacementScreen({super.key});

  @override
  State<EmplacementScreen> createState() => _EmplacementScreenState();
}

class _EmplacementScreenState extends State<EmplacementScreen> {
  List<bool> parkingSpots = [
    false,
    true,
    false,
    true,
    false,
    false,
    true,
    true
  ];
  List<bool> selectedSpots = [];

  @override
  void initState() {
    super.initState();
    selectedSpots = List<bool>.filled(parkingSpots.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.6,
        children: List.generate(parkingSpots.length, (index) {
          return GestureDetector(
            onTap: () {
              if (!parkingSpots[index]) {
                setState(() {
                  selectedSpots[index] = !selectedSpots[index];
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: parkingSpots[index]
                    ? Colors.red
                    : selectedSpots[index]
                        ? Colors.lime.shade500
                        : Colors.green,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: parkingSpots[index]
                  ? Image.asset("assets/images/car.png")
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Place libre",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "AB0${index + 1}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
            ),
          );
        }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.attribution);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lime.shade500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 1.0,
            ),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Attribuer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
