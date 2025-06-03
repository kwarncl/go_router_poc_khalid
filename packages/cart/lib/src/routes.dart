// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import 'screens/cart_detail_screen.dart';
// import 'screens/cart_list_screen.dart';

// enum CartRoute {
//   cartList('/cart'),
//   cartDetail('/details/:id');

//   final String path;
//   const CartRoute(this.path);
// }

// // final cartRouter = GoRouter(
// //   initialLocation: CartRoute.cartList.path,
// //   routes: cartRoutes,
// //   debugLogDiagnostics: true,
// //   errorBuilder: (context, state) {
// //     debugPrint('[CartRouter] Error: ${state.error}');
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Error')),
// //       body: Center(child: Text('Error: ${state.error}')),
// //     );
// //   },
// // );

// /// Cart route with a separate navigator
// final cartShellRoute = ShellRoute(
//   routes: cartRoutes,
// );

// /// Cart route configuration
// final cartRoutes = [
//   GoRoute(
//     path: CartRoute.cartList.path,
//     builder: (context, state) {
//       debugPrint(
//         '[CartRoute] Building CartListScreen, state: ${state.uri}',
//       );
//       return const CartListScreen();
//     },
//     routes: [
//       GoRoute(
//         path: CartRoute.cartDetail.path,
//         builder: (context, state) {
//           final itemId = state.pathParameters['id']!;
//           debugPrint(
//             '[CartRoute] Building CartDetailScreen for item: $itemId, state: ${state.uri}',
//           );
//           return CartDetailScreen(itemId: itemId);
//         },
//       ),
//     ],
//   ),
//   GoRoute(
//     path: CartRoute.cartDetail.path,
//     builder: (context, state) {
//       final itemId = state.pathParameters['id']!;
//       debugPrint(
//         '[CartRoute] Building CartDetailScreen for item: $itemId, state: ${state.uri}',
//       );
//       return CartDetailScreen(itemId: itemId);
//     },
//   ),
// ];
