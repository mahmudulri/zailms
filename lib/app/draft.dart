// import 'package:flutter/material.dart';

// class CustomAlertDialog extends StatelessWidget {
//   final String title;
//   final String message;
//   final VoidCallback onConfirmPressed;

//   CustomAlertDialog({
//     required this.title,
//     required this.message,
//     required this.onConfirmPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(title),
//       content: Text(message),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // Close the dialog
//           },
//           child: Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             onConfirmPressed();
//             Navigator.of(context).pop(); // Close the dialog
//           },
//           child: Text('Confirm'),
//         ),
//       ],
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Alert Dialog Example'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return CustomAlertDialog(
//                     title: 'Custom Alert',
//                     message: 'This is a custom alert dialog.',
//                     onConfirmPressed: () {
//                       // Add your custom logic here when Confirm is pressed
//                       print('Confirmed');
//                     },
//                   );
//                 },
//               );
//             },
//             child: Text('Show Custom Alert'),
//           ),
//         ),
//       ),
//     );
//   }
// }
