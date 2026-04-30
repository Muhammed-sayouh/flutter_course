import 'package:flutter/material.dart';
import 'package:flutter_course/ui/restaurant_screen/custom_widgets/restaurant_widget.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: ListView(
        children: const [
          SizedBox(height: 20),
          RestaurantCard(
            image:
                'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
            logo: 'https://images.unsplash.com/photo-1556740749-887f6717d7e4',
            name: 'Makbous Express',
            rating: 4.2,
            reviews: 452,
            categories: 'Indian, International, Saudi',
            deliveryTime: '15 - 30 mins',
            distance: '2.4 km',
            offer: 'Free delivery (Spend 15 SAR)',
            isTopChoice: true,
          ),
          RestaurantCard(
            image:
                'https://images.unsplash.com/photo-1529042410759-befb1204b468',
            logo: 'https://images.unsplash.com/photo-1542744173-8e7e53415bb0',
            name: 'Jasmine of Old Damascus',
            rating: 4.1,
            reviews: 125,
            categories: 'Shawarma, Pastries',
            deliveryTime: '25 - 40 mins',
            distance: '4.3 km',
            offer: 'Free delivery (Spend 15 SAR)',
          ),
        ],
      ),
    );
  }
}
