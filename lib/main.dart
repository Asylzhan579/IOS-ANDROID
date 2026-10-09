// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductPage(),
//     );
//   }
// }
//
// class ProductPage extends StatelessWidget {
//   const ProductPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Product"),
//       ),
//
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(
//                     "https://images.unsplash.com/photo-1656164061663-3dc536192fcb?auto=format&fit=crop&w=1200&q=80",
//                     width: double.infinity,
//                     height: 220,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//
//                 const Positioned(
//                   top: 10,
//                   right: 10,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: Icon(Icons.bookmark_border),
//                   ),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 20),
//
//             const Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     "Nike Sneakers",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   "\$120",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 10),
//
//             const Row(
//               children: [
//                 Icon(Icons.star, color: Colors.amber),
//                 SizedBox(width: 5),
//                 Text("4.8"),
//               ],
//             ),
//
//             const SizedBox(height: 15),
//
//             const Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 Chip(label: Text("Shoes")),
//                 Chip(label: Text("Sport")),
//                 Chip(label: Text("Men")),
//               ],
//             ),
//
//             const SizedBox(height: 20),
//
//             const Text(
//               "Comfortable sneakers for everyday use.",
//             ),
//           ],
//         ),
//       ),
//
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: const Text("Add to Cart"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }