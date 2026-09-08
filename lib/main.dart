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