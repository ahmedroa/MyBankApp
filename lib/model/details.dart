class details {
  final int id, price;
  final String title, date;

  details({
    required this.id,
    required this.price,
    required this.title,
    required this.date,
  });
}

// list of products
List<details> detail = [
  details(
    id: 1,
    price: 20,
    title: "سحب",
    date: '',
  ),
];
