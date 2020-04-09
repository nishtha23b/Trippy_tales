import 'package:trippy_tales/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'images/stmarksbasilica.jpg',
    name: 'Samsons Kiosk',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/gondola.jpg',
    name: 'Agonda Beach ',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Dive Goa',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'outdoor.png',
    city: 'Day Trips',
    country: 'Goa',
    description: 'Go Diving for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'nature.png',
    city: 'Religious Sites',
    country: 'Goa',
    description: 'Visit Parks for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'day.png',
    city: 'Nature and Wildfile',
    country: 'Goa',
    description: 'Visit Goa for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'temples.png',
    city: 'Night Trips',
    country: 'Goa',
    description: 'Visit Temples for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'beach.png',
    city: 'Beaches and Parks',
    country: 'Goa',
    description: 'Visit Beaches for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];