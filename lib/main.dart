// TASK 1
// OUTPUT MULTIPLICATION TABLE 1-10
//
// void main() {
//   for (int i = 1; i <= 10; i++) {
//     for (int j = 1; j <= 10; j++) {
//       print("$i * $j = ${i * j}");
//     }
//   }
// }
// TASK 2
// NEXT DAY

// void main() {
//   int day = 28;
//   int month = 2;
//   int year = 2024;
//
//   bool leapYear =
//       year % 400 == 0 ||
//           (year % 4 == 0 && year % 100 != 0);
//
//   int maxDay;
//
//   if (month == 2) {
//     maxDay = leapYear ? 29 : 28;
//   } else if (month == 4 ||
//       month == 6 ||
//       month == 9 ||
//       month == 11) {
//     maxDay = 30;
//   } else {
//     maxDay = 31;
//   }
//
//   if (month < 1 ||
//       month > 12 ||
//       day < 1 ||
//       day > maxDay) {
//     print("Invalid date");
//   } else {
//     day++;
//
//     if (day > maxDay) {
//       day = 1;
//       month++;
//     }
//
//     if (month > 12) {
//       month = 1;
//       year++;
//     }
//
//
//     print(
//       "${day.toString().padLeft(2, '0')}."
//           "${month.toString().padLeft(2, '0')}."
//           "$year",
//     );
//   }
// }
// TASK 3
// Vowel Counter
// void main() {
//   String text = "flutter mobile development";
//   int count = 0;
//   for (int i = 0; i < text.length; i++) {
//     if (text[i] == 'a' ||
//         text[i] == 'e' ||
//         text[i] == 'i' ||
//         text[i] == 'o' ||
//         text[i] == 'u') {
//       count++;
//     }
//   }
//   print(count);
// }
// TASK4
// void main() {
//   List<int> numbers = [14, 88, 3, 42, 99, 12, 67];
//
//   int min = numbers[0];
//   int max = numbers[0];
//
//   for (int i = 0; i < numbers.length; i++) {
//     if (numbers[i] > max) {
//       max = numbers[i];
//     }
//
//     if (numbers[i] < min) {
//       min = numbers[i];
//     }
//   }
//
//   print("Max: $max");
//   print("Min: $min");
// }
// TASK5
// void main() {
//   int number = 2;
//
//   bool isPrime = true;
//
//   if (number < 2) {
//     isPrime = false;
//   }
//
//   for (int i = 2; i < number; i++) {
//     if (number % i == 0) {
//       isPrime = false;
//       break;
//     }
//   }
//
//   if (isPrime) {
//     print("$number -> prime number");
//   } else {
//     print("$number -> not prime number");
//   }
// }
//LAB1EX1
// void main() {
//   processOrder(orderId: 101, itemPrice: 2000.0, promoCode: 'SAVE10');
//
//
//   processOrder(orderId: 102, itemPrice: 1500.0, deliveryFee: 300.0);
//
//
//   processOrder(orderId: 103, itemPrice: 4000.0);
// }
//
// double processOrder({
//   required int orderId,
//   required double itemPrice,
//   String? promoCode,
//   double? deliveryFee,
// }) {
//   double discount = 0.0;
//   if (promoCode == 'SAVE10') {
//     discount = itemPrice * 0.10;
//   }
//
//   double priceAfterDiscount = itemPrice - discount;
//
//   double finalDeliveryFee = deliveryFee ?? 500.0;
//
//   double total = priceAfterDiscount + finalDeliveryFee;
//
//   print('Order Summary');
//   print('Order ID: $orderId');
//   print('Item Price: ${itemPrice.toStringAsFixed(2)} ₸');
//   print('Promo Code: ${promoCode ?? "none"}');
//   print('Discount: ${discount.toStringAsFixed(2)} ₸');
//   print('Delivery Fee: ${finalDeliveryFee.toStringAsFixed(2)} ₸');
//   print('Final Total: ${total.toStringAsFixed(2)} ₸');
//
//   return total;
// }
// LAB2 save ATM
// void checkBalance({required String name, required double balance}) =>
//     print("$name, your balance is ${balance.toStringAsFixed(2)} ₸");
// double deposit({required double currentBalance, double? amount}) {
//   double depositAmount = amount ?? 0.0;
//   currentBalance += depositAmount;
//
//   print("Deposited: ${depositAmount.toStringAsFixed(2)} ₸");
//   print("New balance: ${currentBalance.toStringAsFixed(2)} ₸");
//
//   return currentBalance;
// }
// double withdraw({
//   required String name,
//   required double currentBalance,
//   double? amount,
//   int? pinCode,
// }) {
//   int enteredPin = pinCode ?? 0;
//
//   if (enteredPin != 1234) {
//     print("Wrong PIN. Transaction declined.");
//     return currentBalance;
//   }
//   double withdrawAmount = amount ?? 0.0;
//
//   if (withdrawAmount > currentBalance) {
//     print("Not enough balance.");
//     return currentBalance;
//   }
//
//   currentBalance -= withdrawAmount;
//
//   print("$name withdrew ${withdrawAmount.toStringAsFixed(2)} ₸");
//   print("New balance: ${currentBalance.toStringAsFixed(2)} ₸");
//
//   return currentBalance;
// }
// void main() {
//   String name = "Asylzhan";
//   double balance = 5000.0;
//
//   checkBalance(name: name, balance: balance);
//
//   balance = deposit(currentBalance: balance, amount: 2000.0);
//
//   balance = withdraw(
//     name: name,
//     currentBalance: balance,
//     amount: 1500.0,
//     pinCode: 1234,
//   );
//
//   checkBalance(name: name, balance: balance);
// }
// LAB3LIbraryy
class Book {
  final String title;
  final String author;
  final double price;
  bool isBorrowed;

  Book({
    required this.title,
    required this.author,
    required this.price,
    this.isBorrowed = false,
  });

  @override
  String toString() => '$title by $author - $price ₸';
}

class Library {
  final List<Book> _books = [];

  void addBook(Book book) => _books.add(book);

  List<Book> get availableBooks =>
      _books.where((book) => !book.isBorrowed).toList();

  double get totalValue =>
      _books.fold(0.0, (total, book) => total + book.price);
}

void main() {
  final library = Library()
    ..addBook(Book(title: "Atomic Habits", author: "James Clear", price: 5000))
    ..addBook(Book(title: "1984", author: "George Orwell", price: 3500, isBorrowed: true))
    ..addBook(Book(title: "The Hobbit", author: "J.R.R. Tolkien", price: 4500))
    ..addBook(Book(title: "Clean Code", author: "Robert Martin", price: 7000));

  print("Available Books:");
  library.availableBooks.forEach(print);

  print("\nTotal collection value: ${library.totalValue} ₸");
}
// HW3
// abstract class MediaItem {
//   String id;
//   String title;
//   double price;
//
//   MediaItem({
//     required this.id,
//     required this.title,
//     required this.price,
//   });
//
//   String getDetails();
// }
//
// mixin Downloadable {
//   void download(String title) {
//     print("Downloading $title...");
//   }
// }
//
// class Audiobook extends MediaItem with Downloadable {
//   double durationHours;
//   String narrator;
//
//   Audiobook({
//     required String id,
//     required String title,
//     required double price,
//     required this.durationHours,
//     required this.narrator,
//   }) : super(
//     id: id,
//     title: title,
//     price: price,
//   );
//
//   @override
//   String getDetails() {
//     return "Audiobook: $title, Price: $price, "
//         "Duration: $durationHours hours, Narrator: $narrator";
//   }
// }
//
// class EBook extends MediaItem with Downloadable {
//   double fileSizeMB;
//   String author;
//
//   EBook({
//     required String id,
//     required String title,
//     required double price,
//     required this.fileSizeMB,
//     required this.author,
//   }) : super(
//     id: id,
//     title: title,
//     price: price,
//   );
//
//   @override
//   String getDetails() {
//     return "EBook: $title, Price: $price, "
//         "Size: $fileSizeMB MB, Author: $author";
//   }
// }
//
// class ShoppingCart {
//   List<MediaItem> _items = [];
//
//   void addItem(MediaItem item) {
//     _items.add(item);
//   }
//
//   double calculateTotalWithTax({
//     double taxRate = 0.12,
//   }) {
//     double total = _items.fold(
//       0.0,
//           (sum, item) => sum + item.price,
//     );
//
//     return total + (total * taxRate);
//   }
//
//   List<MediaItem> filterByMaxPrice(double maxPrice) {
//     return _items
//         .where((item) => item.price <= maxPrice)
//         .toList();
//   }
//
//   void printReceipt() {
//     print("----- RECEIPT -----");
//
//     for (MediaItem item in _items) {
//       print(item.getDetails());
//
//       if (item is Downloadable) {
//         item.download(item.title);
//       }
//     }
//
//     print(
//       "Total with tax: ${calculateTotalWithTax().toStringAsFixed(2)}",
//     );
//   }
// }
//
// void main() {
//   ShoppingCart cart = ShoppingCart();
//
//   Audiobook audiobook = Audiobook(
//     id: "A001",
//     title: "Atomic Habits",
//     price: 5000.0,
//     durationHours: 5.5,
//     narrator: "James Clear",
//   );
//
//   EBook ebook1 = EBook(
//     id: "E001",
//     title: "Clean Code",
//     price: 4000.0,
//     fileSizeMB: 12.5,
//     author: "Robert Martin",
//   );
//
//   EBook ebook2 = EBook(
//     id: "E002",
//     title: "1984",
//     price: 2500.0,
//     fileSizeMB: 5.0,
//     author: "George Orwell",
//   );
//
//   cart.addItem(audiobook);
//   cart.addItem(ebook1);
//   cart.addItem(ebook2);
//
//   cart.printReceipt();
//
//   print("");
//   print("Items under 4000:");
//
//   List<MediaItem> cheapItems =
//   cart.filterByMaxPrice(4000.0);
//
//   for (MediaItem item in cheapItems) {
//     print(item.getDetails());
//   }
// }
//
