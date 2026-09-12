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
// void main(){
//   int number = 2;
//   bool isprime=true;
//   if(number<2){
//     isprime=false;
//   }for(int i=2;i<number;i++){
//     if(number%2==0){
//       isprime=false;
//       break;
//     }
//   }
//   if (isprime) {
//     print("$number -> prime number");
//   } else {
//     print("$number -> not prime number");
//   }
// }
// classwork
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


