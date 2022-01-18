import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:prayer/compass.dart';
import 'package:prayer/settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final perth = Coordinates(31.9523, 115.8613);
    final nyParams = CalculationMethod.moon_sighting_committee.getParameters();
    nyParams.madhab = Madhab.hanafi;
    final nyPrayerTimes = PrayerTimes.today(perth, nyParams);

    //print(nyPrayerTimes.fajr.timeZoneName);
    final String fajr = DateFormat.jm().format(nyPrayerTimes.fajr);
    //print(DateFormat.jm().format(nyPrayerTimes.sunrise));
    final String dhuhr = DateFormat.jm().format(nyPrayerTimes.dhuhr);
    final String asr = DateFormat.jm().format(nyPrayerTimes.asr);
    final String maghrib = DateFormat.jm().format(nyPrayerTimes.maghrib);
    final String isha = DateFormat.jm().format(nyPrayerTimes.isha);

    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
                child: Text('Header')
            ),
            ListTile(
              leading: const Icon(
                Icons.home
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                  Icons.compass_calibration
              ),
              title: const Text('Qibla'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Compass())
                );
                //Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                  Icons.settings
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings())
                );
                //Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Card(
              child: SizedBox(
                height: 300,
                child: ListTile(
                  title: Text('Fajr',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  subtitle: Text('$fajr'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Zuhur'),
                subtitle: Text('$dhuhr'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Asr'),
                subtitle: Text('$asr'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Maghrib'),
                subtitle: Text('$maghrib'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Ishaa'),
                subtitle: Text('$isha'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

