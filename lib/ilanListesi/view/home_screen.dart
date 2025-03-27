import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLocation = 'Delhi, India';

  final List<String> locations = [
    'Delhi, India',
    'Istanbul, Turkey',
    'New York, USA',
    'Tokyo, Japan',
    'London, UK',
    'Paris, France',
    'Berlin, Germany',
    'Madrid, Spain',
  ];

  final GlobalKey _locationKey = GlobalKey(); // konum için referans

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Profil avatarı
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2628",
              ),
            ),

            // Ortadaki konum (popup tetikleyici)
            GestureDetector(
              key: _locationKey,
              onTap: () async {
                final RenderBox renderBox =
                    _locationKey.currentContext!.findRenderObject()
                        as RenderBox;
                final Offset offset = renderBox.localToGlobal(Offset.zero);

                final selected = await showMenu<String>(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    offset.dx,
                    offset.dy + renderBox.size.height + 5,
                    offset.dx + 200,
                    offset.dy,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  items: [
                    PopupMenuItem<String>(
                      enabled: false,
                      child: SizedBox(
                        height: 200, // Scrollable olacak yükseklik
                        width: 220,
                        child: SingleChildScrollView(
                          child: Column(
                            children:
                                locations
                                    .where((loc) => loc != _selectedLocation)
                                    .map(
                                      (location) => ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 8,
                                            ),
                                        leading: const Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.purple,
                                        ),
                                        title: Text(
                                          location,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),

                                        onTap: () {
                                          Navigator.pop(
                                            context,
                                            location,
                                          ); // menüyü kapat
                                        },
                                      ),
                                    )
                                    .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );

                if (selected != null) {
                  setState(() {
                    _selectedLocation = selected;
                  });
                }
              },
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.purple),
                  const SizedBox(width: 4),
                  Text(
                    _selectedLocation,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                ],
              ),
            ),

            // Sağdaki menü ikonu
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.grid_view_outlined,
                color: Colors.black,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
