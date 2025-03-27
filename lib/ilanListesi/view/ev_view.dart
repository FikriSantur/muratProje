import 'dart:collection';

import 'package:flutter/material.dart';

class AppConstants {
  static const Color primaryColor = Colors.black;
  static const Color accentColor = Color(0xFF2D6A4F);
  static const Color greyColor = Colors.grey;

  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  // Slider yüksekliğini isteklerinize göre değiştirebilirsiniz.
  // Eğer tam ekranın üst kısmını kaplamasını istiyorsanız MediaQuery'den de faydalanabilirsiniz.
  static const double imageHeight = 250.0;

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subtitleTextStyle = TextStyle(
    fontSize: 15,
    color: Colors.grey[600],
  );
  static const TextStyle priceTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 3 * 1000);
  int _currentPage = 0;

  final List<String> _imageurls = [
    "https://media-blog.zingat.com/uploads/2018/01/Luks-ev-anagorsel.1.jpg",
    "https://www.tokihaber.com.tr/wp-content/uploads/2021/04/luks-konut-villa.jpg",
    "https://cdn.hangiev.com/magusa-yeni-bogazici-satilik-ikiz-ev-202212001018130002921367DJWW4MA.jpg",
  ];

  final List<String> _featureList = [
    "4 Rooms",
    "4 Bathroom",
    "Pool",
    "Wifi",
    "Parking",
    "BBQ",
  ];

  // Örnek: Her özellik için icon belirleyen fonksiyon
  IconData getFeatureIcon(String feature) {
    if (feature.contains("Rooms")) return Icons.king_bed_outlined;
    if (feature.contains("Bathroom")) return Icons.bathtub_outlined;
    if (feature.contains("Pool")) return Icons.pool_outlined;
    if (feature.contains("Wifi")) return Icons.wifi_outlined;
    if (feature.contains("Parking")) return Icons.local_parking_outlined;
    if (feature.contains("BBQ")) return Icons.outdoor_grill_outlined;
    return Icons.help_outline; // Eğer eşleşme yoksa
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Eğer resmin yüksekliğini ekranın üst kısmını kaplayacak şekilde ayarlamak isterseniz,
    // MediaQuery kullanarak ekran yüksekliğinin belirli bir oranını alabilirsiniz.
    final double sliderHeight = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        children: [
          // Slider, ekranın üst kısmını kaplayacak
          SizedBox(
            height: sliderHeight,
            width: double.infinity,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  // Sonsuz scroll için itemCount belirlemiyoruz
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index % _imageurls.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    final imageUrl = _imageurls[index % _imageurls.length];
                    return Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    );
                  },
                ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_imageurls.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 11 : 8,
                        height: _currentPage == index ? 11 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              _currentPage == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPropertyCard(),
                    // İleride ek içerikler eklenebilir.
                  ],
                ),
              ),
            ),
          ),
          // Alt içerik: SafeArea sayesinde durum çubuğu ve çentiklere uyumlu
        ],
      ),
    );
  }

  Widget _buildPropertyCard() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: AppConstants.defaultPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(AppConstants.defaultRadius),
          bottomRight: Radius.circular(AppConstants.defaultRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Luxe Villa", style: AppConstants.titleTextStyle),
                Text("\$1,200 / night", style: AppConstants.priceTextStyle),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Oregon, United States",
              style: AppConstants.subtitleTextStyle,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star_outline_rounded),
                Text(
                  "4.5 Raiting",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 2),
                Text("(23 Views)", style: AppConstants.subtitleTextStyle),
                SizedBox(width: 35),
                Icon(Icons.location_on_outlined),
                Text(
                  "1 Km",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    _featureList.map((feature) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              getFeatureIcon(feature),
                              size: 16,
                              color: AppConstants.greyColor,
                            ),
                            const SizedBox(width: 4),
                            Text(feature, style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
            SizedBox(height: 8),
            Divider(color: Colors.grey.shade300, thickness: 1),
            Text("Description", style: AppConstants.titleTextStyle),
            SizedBox(height: 10),
            // Açıklama metni
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 75),
              child: Scrollbar(
                thumbVisibility: true,

                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "Experience modern sophistication at Aurora Luxe Villa, where contemporary design meets breathtaking views. Enjoy premium amenities, stylish interiors, and an unforgettable stay.",

                      style: AppConstants.subtitleTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey.shade300, thickness: 1),
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2628",
                  ),
                ),
                const SizedBox(width: 12),
                // Expanded ile Column, kalan alanı kaplar
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Host",
                        style: TextStyle(
                          color: AppConstants.greyColor,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Josep Colins",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Chat butonuna tıklanınca yapılacak işlemler
                  },
                  icon: const Icon(
                    Icons.chat_bubble_outline_outlined,
                    color: Colors.grey, // İkon rengi gri olarak ayarlanıyor
                  ),
                  label: const Text(
                    "Chat",
                    style: TextStyle(color: Colors.grey),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(50),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  // Butona basıldığında yapılacak işlemleri buraya ekleyin.
                },
                child: const Text(
                  "Book",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
