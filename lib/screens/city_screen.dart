import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    var name;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          //color: Colors.red,
          image: DecorationImage(
              image: AssetImage('assets/images/weather1.gif'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Text(
                'Get Location',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white12,
                  icon: Icon(
                    Icons.location_city_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  hintText: "Enter City Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.white24,
              onPressed: () {
                Navigator.pop(context, name);
              },
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
