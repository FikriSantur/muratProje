import 'package:flutter/material.dart';

class ProfileCardView extends StatelessWidget {
  const ProfileCardView({super.key});

  // Stil ve boyut sabitleri
  static const double kCardMargin = 16.0;
  static const double kCardBorderRadius = 16.0;
  static const double kCoverImageHeight = 150.0;
  static const double kProfileImageRadius = 40.0;
  static const double kSettingsIconTop = 8.0;
  static const double kSettingsIconRight = 8.0;
  static const double kProfileImageBottom = -40.0;
  static const double kProfileImageLeft = 16.0;
  static const double kEditProfileButtonBottom = -55.0;
  static const double kEditProfileButtonRight = 8.0;
  static const double kVerifiedIconSize = 16.0;
  static const double kAboutTitleFontSize = 18.0;
  static const double kAboutEditButtonFontSize = 16.0;
  static const double kStatFontSize = 16.0;

  static const Color kGreenColor = Colors.green;
  static const Color kGreyColor = Colors.grey;

  // Text stil tanımlamaları
  static const TextStyle kNameTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
  static const TextStyle kDefaultTextStyle = TextStyle(fontSize: 14);
  static const TextStyle kAboutTitleTextStyle = TextStyle(
    fontSize: kAboutTitleFontSize,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle kBirthGenderLabelTextStyle = TextStyle(
    color: Colors.grey,
  );
  static const TextStyle kBirthGenderValueTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _buildProfileCard(),
          const SizedBox(height: 2),
          _buildAboutCard(),
        ],
      ),
    );
  }

  /// Profil kartı (üstte kapak, profil fotoğrafı, isim, açıklama, lokasyon ve istatistikler)
  Widget _buildProfileCard() {
    return Card(
      margin: const EdgeInsets.all(kCardMargin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
      ),
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCoverImageSection(),
          const SizedBox(height: 40),
          _buildUserDetailsSection(),
          const SizedBox(height: 8),
          _buildLocationSection(),
          const SizedBox(height: 16),
          _buildStatsSection(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  /// Kapak görseli, ayarlar butonu, profil fotoğrafı ve "Edit profile" butonu içeren bölüm
  Widget _buildCoverImageSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: kCoverImageHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(kCardBorderRadius),
              topRight: Radius.circular(kCardBorderRadius),
            ),
            image: const DecorationImage(
              image: NetworkImage(
                "https://yavuzpetshop.com.tr/wp-content/uploads/2023/07/adsiz-tasarim_61601f3d30ec0_XL.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: kSettingsIconTop,
          right: kSettingsIconRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
          ),
        ),
        Positioned(
          bottom: kProfileImageBottom,
          left: kProfileImageLeft,
          child: CircleAvatar(
            radius: kProfileImageRadius,
            backgroundImage: const NetworkImage(
              "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2628",
            ),
          ),
        ),
        Positioned(
          bottom: kEditProfileButtonBottom,
          right: kEditProfileButtonRight,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.edit),
            style: OutlinedButton.styleFrom(
              foregroundColor: kGreenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCardBorderRadius),
              ),
              side: const BorderSide(color: kGreenColor, width: 2),
            ),
            label: const Text("Edit profile"),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  /// Kullanıcı ismi ve açıklama metnini içeren bölüm
  Widget _buildUserDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kCardMargin,
            vertical: 3.0,
          ),
          child: Row(
            children: [
              Text(
                "Umut Fikri Santur",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: kNameTextStyle,
              ),

              const SizedBox(width: 3),
              const Icon(
                Icons.verified,
                color: kGreenColor,
                size: kVerifiedIconSize,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kCardMargin,
            vertical: 3.0,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 75),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text(
                    "My best friend has a fur and a tailalk slfnaklsnf kn alskfnaks\n"
                    "asfmalskfmaklsfkalsfmklamsf aklmsfkas klafkmlfakmla\n"
                    "kmsflkamsf umut",
                    style: kDefaultTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Lokasyon bilgisini içeren bölüm
  Widget _buildLocationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kCardMargin),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined, color: Colors.grey.shade500),
          Text(
            "NY, Kellogg Rd New Hartford, 24",
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  /// İstatistikler (Pets, Friends, Saved) satırını içeren bölüm
  Widget _buildStatsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem("4", "Pets"),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: kCardMargin),
          width: 1,
          height: 30,
          color: Colors.grey.shade500,
        ),
        _buildStatItem("25", "Friends"),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: kCardMargin),
          width: 1,
          height: 30,
          color: Colors.grey.shade500,
        ),
        _buildStatItem("2", "Saved"),
      ],
    );
  }

  /// "About Me" kartı: Başlık, düzenleme butonu, doğum tarihi, cinsiyet ve açıklama metni
  Widget _buildAboutCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
      ),
      margin: const EdgeInsets.all(kCardMargin),
      child: Padding(
        padding: const EdgeInsets.all(kCardMargin),
        child: Column(
          children: [
            _buildAboutHeader(),
            const SizedBox(height: 12),
            _buildBirthGenderTable(),
            const SizedBox(height: 10),
            _buildAboutDescription(),
          ],
        ),
      ),
    );
  }

  /// "About Me" başlığı ve "Edit" butonunu içeren üst kısım
  Widget _buildAboutHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(Icons.info_outline, color: kGreenColor),
            SizedBox(width: 3),
            Text("About Me", style: kAboutTitleTextStyle),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Edit",
            style: TextStyle(
              color: kGreenColor,
              fontSize: kAboutEditButtonFontSize,
            ),
          ),
        ),
      ],
    );
  }

  /// Doğum tarihi ve cinsiyeti gösteren tablo
  Widget _buildBirthGenderTable() {
    return Table(
      columnWidths: const {0: IntrinsicColumnWidth(), 1: FlexColumnWidth()},
      children: const [
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 4, right: 56),
              child: Text('Birth date:', style: kBirthGenderLabelTextStyle),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text('14 August 2002', style: kBirthGenderValueTextStyle),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 4, right: 56),
              child: Text('Gender:', style: kBirthGenderLabelTextStyle),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text('Man', style: kBirthGenderValueTextStyle),
            ),
          ],
        ),
      ],
    );
  }

  /// "About" kısmındaki açıklama metnini gösteren bölüm (scrollable)
  Widget _buildAboutDescription() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 75),
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
              "My best friend has a fur and a tailalk slfnaklsnf kn alskfnaks\n"
              "asfmalskfmaklsfkalsfmklamsf aklmsfkas klafkmlfakmla\n"
              "kmsflkamsf umut",
              style: kDefaultTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  /// İstatistik satırındaki tek bir öğeyi oluşturur
  static Widget _buildStatItem(String value, String label) {
    return Row(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: kStatFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
