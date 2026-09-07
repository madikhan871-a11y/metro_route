import 'package:flutter/material.dart';

import '../data/station_data.dart';
import '../widgets/metro_line.dart';
import '../widgets/route_info_card.dart';
import '../widgets/station_tile.dart';

class MetroScreen extends StatefulWidget {
  const MetroScreen({super.key});

  @override
  State<MetroScreen> createState() => _MetroScreenState();
}

class _MetroScreenState extends State<MetroScreen> {
  bool swapped = false;

  void swapRoute() {
    setState(() {
      swapped = !swapped;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          swapped
              ? 'Route direction swapped'
              : 'Original route restored',
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 900),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1016),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSearchBox(),
              const SizedBox(height: 18),
              RouteInfoCard(onSwap: swapRoute),
              const SizedBox(height: 18),
              const MetroLine(),
              const SizedBox(height: 26),
              _buildStationsHeader(),
              const SizedBox(height: 16),
              ...List.generate(
                stations.length,
                    (index) => StationTile(
                  station: stations[index],
                  isLast: index == stations.length - 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CITY TRANSIT',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.4),
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Metro Route',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xFF151B23),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.my_location_rounded,
              color: Color(0xFF32D583),
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBox() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF151B23),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            color: Colors.white.withValues(alpha: 0.4),
            size: 21,
          ),
          const SizedBox(width: 12),
          Text(
            'Search station or destination',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.35),
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.tune_rounded,
            color: Colors.white.withValues(alpha: 0.45),
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildStationsHeader() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'STATIONS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
        ),
        Text(
          '${stations.length} stops',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.35),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}