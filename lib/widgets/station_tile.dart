import 'package:flutter/material.dart';

import '../models/station_model.dart';

class StationTile extends StatelessWidget {
  final StationModel station;
  final bool isLast;

  const StationTile({
    super.key,
    required this.station,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final active = station.isCurrent || station.isDestination;

    return SizedBox(
      height: 72,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 42,
            child: Column(
              children: [
                Container(
                  width: active ? 20 : 14,
                  height: active ? 20 : 14,
                  margin: const EdgeInsets.only(top: 3),
                  decoration: BoxDecoration(
                    color: station.isDestination
                        ? const Color(0xFFFFC857)
                        : station.isCurrent
                        ? const Color(0xFF32D583)
                        : const Color(0xFF242B35),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: station.isDestination
                          ? const Color(0xFFFFC857)
                          : station.isCurrent
                          ? const Color(0xFF32D583)
                          : const Color(0xFF667085),
                      width: 2,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: station.isCurrent
                          ? const Color(0xFF32D583)
                          : const Color(0xFF303944),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          station.name,
                          style: TextStyle(
                            color: active
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.72),
                            fontSize: 14,
                            fontWeight: active
                                ? FontWeight.w700
                                : FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              station.shortName,
                              style: TextStyle(
                                color:
                                Colors.white.withValues(alpha: 0.35),
                                fontSize: 10,
                                letterSpacing: 1,
                              ),
                            ),
                            if (station.isInterchange) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF7C5CFC)
                                      .withValues(alpha: 0.14),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'TRANSFER',
                                  style: TextStyle(
                                    color: Color(0xFFA995FF),
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    station.time,
                    style: TextStyle(
                      color: active
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}