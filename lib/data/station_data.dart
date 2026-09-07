import '../models/station_model.dart';

const stations = [
  StationModel(
    name: 'Central Square',
    shortName: 'CSQ',
    time: '09:10',
    isCurrent: true,
  ),
  StationModel(
    name: 'Garden Avenue',
    shortName: 'GAV',
    time: '09:14',
  ),
  StationModel(
    name: 'City Library',
    shortName: 'CLB',
    time: '09:18',
    isInterchange: true,
  ),
  StationModel(
    name: 'Riverside',
    shortName: 'RIV',
    time: '09:23',
  ),
  StationModel(
    name: 'Market Street',
    shortName: 'MKT',
    time: '09:27',
  ),
  StationModel(
    name: 'Grand Terminal',
    shortName: 'GTR',
    time: '09:32',
    isDestination: true,
  ),
];