import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salonconf/pages/event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset('assets/images/logo.svg'),
            SvgPicture.asset(
              'assets/images/logo.svg',
              // ignore: deprecated_member_use
              color: Colors.blue
            ),
            const SizedBox(height: 20),
            const Text("Sallon-Conf",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 42
              ),
            ),
            const Text("Sallon de virtualisation de conférence du 21 au 23 Avril 2026",
              style: TextStyle(
                fontSize: 24
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue)
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => const EventPage()),
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const EventPage(),
                  )
                );
              },
              label: const Text(
                "Voir le planning",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
  }
}