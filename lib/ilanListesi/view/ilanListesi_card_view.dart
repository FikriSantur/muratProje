import 'package:apphayvan/ilanListesi/view_model/ilanListesi_view_mixin.dart';
import 'package:flutter/material.dart';

/// Uygulamanın genel renk tanımlamaları
class AppColors {
  static const primaryGreen = Colors.green;
  static const etiketBackground = Colors.white;
  static const buttonText = Colors.white;
}

/// Uygulamanın genel yazı stil tanımlamaları
class AppTextStyles {
  static const price = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const roomType = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const etiket = TextStyle(fontSize: 14, color: Colors.black);
  static const button = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonText,
  );
}

/// Kart için boyut, boşluk ve diğer stil sabitleri
class CardStyles {
  // Boyutlar ve kenar boşlukları
  static const double cardBorderRadius = 20.0;
  static const double imageHeight = 300.0;
  static const double cardHeight = 500.0;
  static const double horizontalPadding = 16.0;
  static const double spaceBetweenElements = 8.0;

  // Icon ve etiket değerleri
  static const double iconSize = 20.0;
  static const double etiketPaddingHorizontal = 8.0;
  static const double etiketPaddingVertical = 4.0;
  static const double etiketMarginRight = 8.0;
  static const double etiketMarginBottom = 8.0;
}

class IlanlistesiCardView extends StatefulWidget with IlanListesiViewMixin {
  const IlanlistesiCardView({super.key});

  @override
  State<IlanlistesiCardView> createState() => _IlanlistesiCardViewState();
}

class _IlanlistesiCardViewState extends State<IlanlistesiCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CardStyles.horizontalPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Kartın sabit yüksekliğe sahip kısmı
                SizedBox(height: CardStyles.cardHeight, child: _cardview()),
                const SizedBox(height: CardStyles.spaceBetweenElements * 2),
                // Buton: Kartın dışında yer alıyor
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(60),
                      backgroundColor: AppColors.primaryGreen,
                    ),
                    onPressed: () {
                      // Butona basıldığında yapılacak işlemleri buraya ekleyin.
                    },
                    child: const Text("Book", style: AppTextStyles.button),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card _cardview() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CardStyles.cardBorderRadius),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(),
          const SizedBox(height: CardStyles.spaceBetweenElements),
          _buildPriceAndRoomTypeSection(),
          const SizedBox(height: CardStyles.spaceBetweenElements),
          _buildIlanBilgiEtiketleriSection(),
        ],
      ),
    );
  }

  // Yardımcı widget fonksiyonları build metodunun altında yer alır.

  /// Resim bölümünü oluşturan fonksiyon
  Widget _buildImageSection() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(CardStyles.cardBorderRadius),
        topRight: Radius.circular(CardStyles.cardBorderRadius),
      ),
      child: Image.network(
        "https://yavuzpetshop.com.tr/wp-content/uploads/2023/07/adsiz-tasarim_61601f3d30ec0_XL.jpeg",
        height: CardStyles.imageHeight,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  /// Fiyat ve oda tipi bilgisini gösteren bölüm
  Widget _buildPriceAndRoomTypeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CardStyles.horizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.price, style: AppTextStyles.price),
          Container(
            child: Row(
              children: [
                Icon(Icons.pets_rounded),
                Icon(Icons.pets_rounded),
                SizedBox(width: 8),
                Text(widget.roomType, style: AppTextStyles.roomType),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Tek bir ilan etiketini (ikon + metin) oluşturan yardımcı fonksiyon
  Widget _buildIlanBilgiEtiketi(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CardStyles.etiketPaddingHorizontal,
        vertical: CardStyles.etiketPaddingVertical,
      ),
      margin: const EdgeInsets.only(
        right: CardStyles.etiketMarginRight,
        bottom: CardStyles.etiketMarginBottom,
      ),
      decoration: BoxDecoration(
        color: AppColors.etiketBackground,
        borderRadius: BorderRadius.circular(CardStyles.cardBorderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Outlined ikon versiyonu, yeşil renk kullanılarak
          Icon(icon, size: CardStyles.iconSize, color: AppColors.primaryGreen),
          const SizedBox(width: 4),
          Text(text, style: AppTextStyles.etiket),
        ],
      ),
    );
  }

  /// İlan etiketlerinin Wrap içerisinde sıralandığı bölüm
  Widget _buildIlanBilgiEtiketleriSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CardStyles.horizontalPadding,
      ),
      child: Wrap(
        children: [
          _buildIlanBilgiEtiketi(Icons.person_3_outlined, "Cat sitter"),
          _buildIlanBilgiEtiketi(Icons.restaurant_outlined, "Feeding"),
          _buildIlanBilgiEtiketi(Icons.photo_camera_outlined, "Photo report"),
          _buildIlanBilgiEtiketi(Icons.videocam_outlined, "Video recording"),
        ],
      ),
    );
  }
}
