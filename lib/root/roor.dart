import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:settyl/screen_signin/screen_signin.dart';
import 'package:location/location.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile Name"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) => SigninScreen()),
                      (route) => false);
                },
                child: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white),
                ))
          ],
          bottom: const TabBar(tabs: [
            Text(
              "Personal Details",
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            Text(
              "Location",
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ]),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 30,
                    ),
                    Text("Profile name"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Emailid@gmail.com"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Addresss")
                  ],
                ),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 160, 105, 170)),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            personal(),
            Location(),
          ],
        ),
      ),
    );
  }
}

class personal extends StatelessWidget {
  const personal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            const Text(
              "Name",
              style: TextStyle(fontSize: 25),
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit))
          ],
        )
      ],
    );
  }
}

class Location extends StatefulWidget {
  get onLocationChanged => null;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Location> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  late GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
