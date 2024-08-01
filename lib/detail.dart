import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/model/property.dart';

class PropertyDetailPage extends StatefulWidget {
  const PropertyDetailPage({super.key, required this.property});
  final Property property;
  @override
  State<PropertyDetailPage> createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  final List<String> imageUrls = [
    'assets/gallery/gallery1.png',
    'assets/gallery/gallery2.png',
    'assets/gallery/gallery3.png',
    'assets/gallery/gallery4.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, right: 20.0, left: 20.0, bottom: 3.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        widget.property.imageUrl,
                        height: 350,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(0, 0, 0, 0),
                                Color.fromRGBO(0, 0, 0, 0.6)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 0.24),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new,
                              size: 20, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 0.24),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.bookmark_border,
                              color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.property.name,
                              style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              )),
                          Text('${widget.property.address}, Jakata seletan',
                              style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                    color: Color.fromRGBO(239, 238, 238, 1),
                                    fontSize: 15),
                              )),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/sleeping.png', // Path to your asset image
                                width: 18,
                                height: 18,
                                color:
                                    Colors.white, // Apply color to the image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            '6 Bedroom',
                            style: TextStyle(
                              color: Color.fromRGBO(212, 212, 212, 1),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/bathroom.png', // Path to your asset image
                                width: 18,
                                height: 18,
                                color:
                                    Colors.white, // Apply color to the image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            '4 Bathroom',
                            style: TextStyle(
                                color: Color.fromRGBO(212, 212, 212, 1)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description',
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...',
                              style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(133, 133, 133, 1)),
                              )),
                          TextSpan(
                            text: ' Show More',
                            style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 0.0),
                      leading: Container(
                        width: 50.0, // Kích thước của hình tròn
                        height: 50.0,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(177, 191, 203, 1),
                          shape: BoxShape.circle, // Hình dạng tròn
                          image: DecorationImage(
                            image: AssetImage('assets/avatar.png'),
                            fit: BoxFit
                                .contain, // Điều chỉnh cách ảnh được căn chỉnh
                          ),
                        ),
                        alignment:
                            Alignment.bottomCenter, // Căn chỉnh ảnh xuống dưới
                      ),
                      title: const Text(
                        'Garry Allen',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: const Text(
                        'Owner',
                        style:
                            TextStyle(color: Color.fromRGBO(133, 133, 133, 1)),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(10, 142, 217, 0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(10, 142, 217, 0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/chat.png', // Path to your asset image
                                width: 16,
                                height: 16,
                                color: Colors.white, // Apply color to the image
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Gallery',
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          imageUrls.length, // Thêm 1 cho hình ảnh với "+5"
                          (index) {
                            if (index == imageUrls.length) {
                              // Hình ảnh cuối cùng với "+5"
                              return Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black
                                      .withOpacity(0.5), // Màu đen mờ
                                ),
                                child: const Center(
                                  child: Text(
                                    '+5',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.only(right: 15),
                                child: Stack(
                                  children: [
                                    // Hình ảnh từ assets
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(imageUrls[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Đè lên với màu đen mờ và "+5"
                                    if (index ==
                                        3) // Chỉ áp dụng cho hình ảnh số 4 (index 3)
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black
                                                .withOpacity(0.5), // Màu đen mờ
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '+5',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Stack(
                        children: [
                          // Hình ảnh với góc bo tròn
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/map.png',
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Chấm vị trí giống như Google Maps
                          Positioned(
                            left: 210, // Điều chỉnh vị trí ngang của chấm
                            top: 40, // Điều chỉnh vị trí dọc của chấm
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(
                                    10, 142, 217, 0.3), // Nền xanh nhạt
                              ),
                              child: Center(
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(
                                        10, 142, 217, 1), // Chấm xanh đậm
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          color: Color.fromRGBO(133, 133, 133, 1),
                          fontSize: 16)),
                ),
                Text('Rp. 2,500,000,000 / Year',
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    )),
              ],
            ),
            Container(
              height: 50,
              width: 130,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(160, 218, 251, 1),
                    Color.fromRGBO(10, 142, 217, 1),
                  ], // Màu gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10), // Bo tròn góc
              ),
              child: Center(
                child: Text(
                  'Rent Now',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
