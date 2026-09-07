import 'package:flutter/material.dart';

class RouteInfoCard extends StatelessWidget {
  final VoidCallback onSwap;

  const RouteInfoCard({
    super.key,
    required this.onSwap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF151B23),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _StationInfo(
                  label: 'FROM',
                  station: 'Central Square',
                  icon: Icons.radio_button_checked_rounded,
                  color: const Color(0xFF32D583),
                ),
              ),
              GestureDetector(
                onTap: onSwap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF232A34),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.swap_horiz_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Expanded(
                child: _StationInfo(
                  label: 'TO',
                  station: 'Grand Terminal',
                  icon: Icons.location_on_rounded,
                  color: const Color(0xFFFFC857),
                  alignEnd: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.06),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _BottomInfo(
                  icon: Icons.schedule_rounded,
                  title: '18 min',
                  subtitle: 'Travel time',
                ),
              ),
              Expanded(
                child: _BottomInfo(
                  icon: Icons.confirmation_number_outlined,
                  title: '\$2.40',
                  subtitle: 'Estimated fare',
                ),
              ),
              Expanded(
                child: _BottomInfo(
                  icon: Icons.train_rounded,
                  title: '4 min',
                  subtitle: 'Next train',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StationInfo extends StatelessWidget {
  final String label;
  final String station;
  final IconData icon;
  final Color color;
  final bool alignEnd;

  const _StationInfo({
    required this.label,
    required this.station,
    required this.icon,
    required this.color,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.35),
            fontSize: 9,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment:
          alignEnd ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!alignEnd)
              Icon(icon, color: color, size: 15),
            if (!alignEnd) const SizedBox(width: 6),
            Flexible(
              child: Text(
                station,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: alignEnd ? TextAlign.right : TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (alignEnd) const SizedBox(width: 6),
            if (alignEnd)
              Icon(icon, color: color, size: 15),
          ],
        ),
      ],
    );
  }
}

class _BottomInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _BottomInfo({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF32D583),
          size: 19,
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.35),
            fontSize: 9,
          ),
        ),
      ],
    );
  }
}