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
//       home: RegistrationPage(),
//     );
//   }
// }
//
// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({super.key});
//
//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }
//
// class _RegistrationPageState extends State<RegistrationPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//
//   bool acceptedTerms = false;
//
//   String selectedRole = "Student";
//
//   void register() {
//     bool formValid = _formKey.currentState!.validate();
//
//     if (!acceptedTerms) {
//       setState(() {});
//       return;
//     }
//
//     if (formValid) {
//       print("Full Name: ${nameController.text}");
//       print("Email: ${emailController.text}");
//       print("Password: ${passwordController.text}");
//       print("Role: $selectedRole");
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Registration successful!"),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("User Registration"),
//       ),
//
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//
//         child: Form(
//           key: _formKey,
//
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//
//           child: Column(
//             children: [
//
//               TextFormField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: "Full Name",
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Full Name is required";
//                   }
//                   return null;
//                 },
//               ),
//
//               const SizedBox(height: 15),
//
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   labelText: "Email",
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Email is required";
//                   }
//
//                   if (!value.contains("@") || !value.contains(".")) {
//                     return "Enter a valid email";
//                   }
//
//                   return null;
//                 },
//               ),
//
//               const SizedBox(height: 15),
//
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: "Password",
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Password is required";
//                   }
//
//                   if (value.length < 6) {
//                     return "Minimum 6 characters";
//                   }
//
//                   return null;
//                 },
//               ),
//
//               const SizedBox(height: 15),
//
//               TextFormField(
//                 controller: confirmPasswordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: "Confirm Password",
//                 ),
//                 validator: (value) {
//                   if (value != passwordController.text) {
//                     return "Passwords do not match";
//                   }
//
//                   return null;
//                 },
//               ),
//
//               const SizedBox(height: 20),
//
//               DropdownButtonFormField<String>(
//                 value: selectedRole,
//                 decoration: const InputDecoration(
//                   labelText: "Role",
//                 ),
//                 items: const [
//                   DropdownMenuItem(
//                     value: "Student",
//                     child: Text("Student"),
//                   ),
//                   DropdownMenuItem(
//                     value: "Teacher",
//                     child: Text("Teacher"),
//                   ),
//                   DropdownMenuItem(
//                     value: "Developer",
//                     child: Text("Developer"),
//                   ),
//                 ],
//                 onChanged: (value) {
//                   setState(() {
//                     selectedRole = value!;
//                   });
//                 },
//               ),
//
//               const SizedBox(height: 15),
//
//               CheckboxListTile(
//                 value: acceptedTerms,
//                 title: const Text(
//                   "I accept the Terms and Conditions",
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     acceptedTerms = value!;
//                   });
//                 },
//               ),
//
//               if (!acceptedTerms)
//                 const Text(
//                   "You must accept the Terms and Conditions",
//                   style: TextStyle(
//                     color: Colors.red,
//                   ),
//                 ),
//
//               const SizedBox(height: 20),
//
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: register,
//                   child: const Text("Register"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }