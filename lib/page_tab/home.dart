import 'package:flutter/material.dart';
import 'package:task_1/detail.dart';
import 'package:task_1/model/property.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBuilder extends StatefulWidget {
  const HomeBuilder({super.key});

  @override
  State<HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<HomeBuilder> {
  String selectedPropertyType = '';
  @override
  void initState() {
    super.initState();
    // Gán giá trị mặc định cho item đầu tiên
    selectedPropertyType = 'House';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildSearchBar(),
              _buildPropertyTypes(),
              const SizedBox(
                height: 10,
              ),
              _buildNearFromYou(),
              const SizedBox(
                height: 10,
              ),
              _buildPropertyList(),
              _buildBestForYou(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding:
          const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0, top: 8),
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Location',
                style: TextStyle(color: Colors.black54, fontSize: 12),
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Jakarta',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    'assets/dropdown2.png', // Path to your asset image
                    width: 12,
                    height: 12,
                    color: Colors.grey[600], // Apply color to the image
                  ),
                ],
              ),
              Stack(
                children: [
                  const Icon(Icons.notifications_outlined, size: 30.0),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 320,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search address or near you',
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(133, 133, 133, 1),
                ),
                fillColor: const Color.fromRGBO(247, 247, 247, 1),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 24,
                  color: Color.fromRGBO(131, 131, 131, 1),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                isDense: true,
                alignLabelWithHint: true,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(160, 218, 251, 1),
                  Color.fromRGBO(10, 142, 217, 1),
                ],
              ),
            ),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPropertyTypes() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPropertyTypeButton('House'),
            const SizedBox(
              width: 10,
            ),
            _buildPropertyTypeButton('Apartment'),
            const SizedBox(
              width: 10,
            ),
            _buildPropertyTypeButton('Hotel'),
            const SizedBox(
              width: 10,
            ),
            _buildPropertyTypeButton('Villa'),
            const SizedBox(
              width: 10,
            ),
            _buildPropertyTypeButton('Conttage'),
          ],
        ),
      ),
    );
  }

  BoxDecoration _selectedDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(160, 218, 251, 1),
          Color.fromRGBO(10, 142, 217, 1),
        ],
      ),
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(54, 59, 100, 0.08),
          offset: Offset(0, 4),
          blurRadius: 8,
          spreadRadius: 0,
        ),
      ],
    );
  }

  Widget _buildPropertyTypeButton(String label) {
    bool isSelected = selectedPropertyType == label;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
      child: DecoratedBox(
        decoration: isSelected
            ? _selectedDecoration()
            : BoxDecoration(
                color: const Color.fromRGBO(247, 247, 247, 1),
                borderRadius: BorderRadius.circular(10),
              ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedPropertyType = label;
            });
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: isSelected
                ? Colors.white
                : const Color.fromRGBO(133, 133, 133, 1),
            backgroundColor: Colors.transparent,
            shadowColor:
                Colors.transparent, // Loại bỏ bóng mặc định của ElevatedButton
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            minimumSize: const Size(69, 34),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 14, // Adjust font size
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget _buildNearFromYou() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Near from you',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          Text(
            'See more',
            style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1)),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyList() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
        height: 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildPropertyCard(
              Property(
                name: 'Dreamsville House',
                distance: '1.8 km',
                address: 'Jl Sultan Iskandar Muda',
                imageUrl: 'assets/image_1.png',
              ),
            ),
            _buildPropertyCard(
              Property(
                name: 'Ascot House',
                distance: '2.0 km',
                address: 'Jl Cilandak Tengah',
                imageUrl: 'assets/image_2.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

//Code chuyển trang
  Route _createRoute(Property property) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          PropertyDetailPage(property: property),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Widget _buildPropertyCard(Property property) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute(property));
      },
      child: Container(
        width: 222,
        height: 320,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                property.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    property.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    property.address,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on,
                        color: Colors.white, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      property.distance,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBestForYou() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:
                EdgeInsets.only(top: 16.0, right: 16, left: 16, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best for you',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text(
                  'See more',
                  style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1)),
                ),
              ],
            ),
          ),
          _buildBestPropertyItem('Orchad House', 'Rp 2,500,000,000 / Year',
              '6 Bedroom', '4 Bathroom', 'assets/image_3.png'),
          _buildBestPropertyItem('The Hollies House', 'Rp 2,000,000,000 / Year',
              '5 Bedroom', '3 Bathroom', 'assets/image_4.png'),
        ],
      ),
    );
  }

  Widget _buildBestPropertyItem(String name, String price, String bedrooms,
      String bathrooms, String url) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Căn các phần tử theo đỉnh
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              url,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color.fromRGBO(10, 142, 217, 1),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Image.asset(
                      'assets/sleeping.png', // Path to your asset image
                      width: 16,
                      height: 16,
                      color: Colors.grey[600], // Apply color to the image
                    ),
                    const SizedBox(width: 4),
                    Text(
                      bedrooms,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 30),
                    Image.asset(
                      'assets/bathroom.png', // Path to your asset image
                      width: 16,
                      height: 16,
                      color: Colors.grey[600], // Apply color to the image
                    ),
                    const SizedBox(width: 4),
                    Text(
                      bathrooms,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
