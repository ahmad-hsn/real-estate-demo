import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  bool _showLayerPopup = false;

  void _toggleLayerPopup() {
    setState(() {
      _showLayerPopup = !_showLayerPopup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(59.9342802, 30.3350986), // Coordinates of Saint Petersburg
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png",
                subdomains: const ['a', 'b', 'c', 'd'],
                tileProvider: NetworkTileProvider(),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Saint Petersburg',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            right: 10,
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {},
                child: const Icon(Icons.list, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 10,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {},
                child: const Icon(Icons.my_location, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 140,
            left: 10,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: _toggleLayerPopup,
                child: const Icon(Icons.layers, color: Colors.white),
              ),
            ),
          ),
          if (_showLayerPopup)
            Positioned(
              bottom: 140,
              left: 30,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          _toggleLayerPopup();
                        },
                        child: _buildLayerOption(icon: FontAwesomeIcons.home, text: 'Cosy areas', isSelected: true),
                      ),
                      InkWell(
                        onTap: (){
                          _toggleLayerPopup();
                        },
                        child: _buildLayerOption(icon: FontAwesomeIcons.wallet, text: 'Price', isSelected: false),
                      ),
                      InkWell(
                        onTap: (){
                          _toggleLayerPopup();
                        },
                        child: _buildLayerOption(icon: FontAwesomeIcons.trash, text: 'Infrastructure', isSelected: false),
                      ),
                      InkWell(
                        onTap: (){
                          _toggleLayerPopup();
                        },
                        child: _buildLayerOption(icon: FontAwesomeIcons.layerGroup, text: 'Without any layer', isSelected: false),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLayerOption({required IconData icon, required String text, required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.orange : Colors.grey),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.orange : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}