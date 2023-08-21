class Coffee {
  final String Image;
  final String name;
  final String price;

  const Coffee({required this.Image, required this.name, required this.price});
}

const Coffeelist = [
  Coffee(
      Image: 'TaamJaiCafe/coffee/Americano.jpg',
      name: 'Americano',
      price: '\$55.0'),
  Coffee(
      Image: 'TaamJaiCafe/coffee/Cappuccino.jpg',
      name: 'Cappuccino',
      price: '\$55.0'),
  Coffee(
      Image: 'TaamJaiCafe/coffee/Caramel Macchiato.jpg',
      name: 'Caramel Macchiato',
      price: '\$55.0'),
  Coffee(
      Image: 'TaamJaiCafe/coffee/espresso.jpg',
      name: 'Espresso',
      price: '\$55.0'),
  Coffee(Image: 'TaamJaiCafe/coffee/Latte.jpg', name: 'Latte', price: '\$55.0'),
  Coffee(
      Image: 'TaamJaiCafe/coffee/mocha coffee.jpg',
      name: 'Mocha coffee',
      price: '\$55.0'),
];
