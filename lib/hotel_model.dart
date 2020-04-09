

class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'hotel0.png',
    name: 'Goa Residency',
    address: '404 Great St',
    price: 1500,
  ),
  Hotel(
    imageUrl: 'hotel1.png',
    name: 'Grand Hyatt Goa',
    address: 'Near Chruch Gate',
    price: 3000,
  ),
  Hotel(
    imageUrl: 'hotel2.png',
    name: 'Casa Britona',
    address: 'Behind St College',
    price: 2400,
  ),
];
