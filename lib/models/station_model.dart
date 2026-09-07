class StationModel {
  final String name;
  final String shortName;
  final String time;
  final bool isCurrent;
  final bool isDestination;
  final bool isInterchange;

  const StationModel({
    required this.name,
    required this.shortName,
    required this.time,
    this.isCurrent = false,
    this.isDestination = false,
    this.isInterchange = false,
  });
}