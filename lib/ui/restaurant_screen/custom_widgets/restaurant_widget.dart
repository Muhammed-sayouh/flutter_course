import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String image;
  final String logo;
  final String name;
  final double rating;
  final int reviews;
  final String categories;
  final String deliveryTime;
  final String distance;
  final String offer;
  final bool isTopChoice; // Added optional property

  const RestaurantCard({
    super.key,
    required this.image,
    required this.logo,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.categories,
    required this.deliveryTime,
    required this.distance,
    required this.offer,
    this.isTopChoice = false, // Defaults to false, so it's optional
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image Area
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Card(
                  child: Image.network(
                    image,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Bottom Content Area
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row 1: Badge + Name
                    Row(
                      children: [
                        _buildHPlusBadge(),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Give some space so it doesn't overlap the logo
                        const SizedBox(width: 60),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Row 2: Rating + Reviews + Categories
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFFFC107), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '$rating ($reviews)',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text('|',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                        ),
                        Expanded(
                          child: Text(
                            categories,
                            style: const TextStyle(
                              color: Color(0xFF757575),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Row 3: Price + Time + Distance + Free Delivery
                    Row(
                      children: [
                        const Text(
                          '\$\$\$',
                          style: TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.verified,
                            color: Color(0xFF757575), size: 14),
                        const SizedBox(width: 4),
                        Text(
                          deliveryTime,
                          style: const TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.location_on,
                            color: Color(0xFF757575), size: 14),
                        const SizedBox(width: 4),
                        Text(
                          distance,
                          style: const TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.directions_bike,
                            color: Colors.blue, size: 14),
                        const SizedBox(width: 4),
                        const Text(
                          'Free',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Ad',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Row 4: Offers and Tags
                    Row(
                      children: [
                        if (offer.isNotEmpty) _buildOfferTag(offer),
                        if (isTopChoice) ...[
                          const SizedBox(width: 8),
                          _buildTopChoiceTag(),
                        ]
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Logo placed on the right side
          Positioned(
            right: 20,
            top: 115, // 150 (image height) - 35 (half of logo height)
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  logo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Favorite Icon top right
          Positioned(
            right: 12,
            top: 12,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHPlusBadge() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD54F), // Yellow shade
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
            border: Border.all(color: const Color(0xFFFFD54F)),
          ),
          child: const Text(
            'H',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFF3F51B5), // Indigo shade
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
            border: Border.all(color: const Color(0xFF3F51B5)),
          ),
          child: const Text(
            '+',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOfferTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), // Light Blue 50
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.local_offer, color: Colors.blue, size: 14),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopChoiceTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0), // Light Orange 50
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.emoji_events,
              color: Color(0xFFE65100), size: 14), // Deep Orange
          SizedBox(width: 4),
          Text(
            'Top Choice',
            style: TextStyle(
              color: Color(0xFFE65100),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class TopCurveShape extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const TopCurveShape({
    super.key,
    this.width = 90,
    this.height = 35,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _TopCurvePainter(color),
      ),
    );
  }
}

class _TopCurvePainter extends CustomPainter {
  final Color color;

  _TopCurvePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    /// البداية من الشمال تحت
    path.moveTo(0, size.height);

    /// خط مستقيم لحد قبل الانحناءة
    path.lineTo(size.width * 0.35, size.height);

    /// الانحناءة الداخلية
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height,
      size.width * 0.55,
      size.height * 0.35,
    );

    /// الجزء الطالع لفوق
    path.quadraticBezierTo(
      size.width * 0.7,
      0,
      size.width,
      0,
    );

    /// قفل الشكل
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
