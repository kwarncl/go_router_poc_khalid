# Cart Package

A Flutter package that provides cart functionality with sophisticated navigation patterns using go_router. This package demonstrates clean architecture principles and advanced routing capabilities within a multi-tab application.

## Package Structure

```
packages/cart/
├── lib/
│   ├── cart.dart              # Main export file - exposes all public APIs
│   └── src/
│       ├── routes.dart        # Navigation routes and routing configuration
│       ├── common/
│       │   └── error_screen.dart    # Shared error handling screen
│       └── screens/
│           ├── cart_list_screen.dart    # Cart items list display
│           └── cart_detail_screen.dart  # Individual cart item details
├── pubspec.yaml               # Package dependencies and metadata
└── README.md                  # This documentation file
```

## Architecture Overview

The cart package follows Flutter's recommended package structure with clear separation of concerns:

- **Public API**: `lib/cart.dart` exports only the necessary components
- **Routes**: `lib/src/routes.dart` contains all navigation logic
- **Screens**: `lib/src/screens/` contains UI implementations
- **Common**: `lib/src/common/` contains shared components

## Navigation Patterns

This package implements multiple sophisticated navigation patterns to demonstrate different use cases:

### 1. Hierarchical Navigation (Parent-Child)

**Pattern**: Cart List → Cart Detail (with parent in navigation stack)

```dart
// From HomeScreen to Cart List to Detail
context.go('./${CartRoute.cartList.path}/${CartRoute.cartDetail.path}/1');
// Results in: /home/cart/details/1
```

**Behavior**:

- Cart List remains in the navigation stack
- Back button returns to Cart List
- Breadcrumb navigation maintained

### 2. Direct Navigation (Bypassing Parent)

**Pattern**: Direct to Cart Detail (without Cart List in stack)

```dart
// From HomeScreen directly to Cart Detail
context.go('./${CartRoute.cartDetail.path}/2');
// Results in: /home/details/2
```

**Behavior**:

- Cart List is not in the navigation stack
- Back button returns to Home
- Shorter navigation path for deep links

### 3. Relative Path Navigation

**Pattern**: Navigation using relative paths from current location

```dart
// From Cart List to Detail (using relative path)
context.go('./details/$itemId');
// Results in: /home/cart/details/{itemId}
```

**Benefits**:

- Route-agnostic navigation
- Maintains current branch context
- Cleaner code when navigating within the same feature

## Route Configuration

### CartRoute Enum

```dart
enum CartRoute {
  cartList('cart'),           // Maps to 'cart' path segment
  cartDetail('details');      // Maps to 'details' path segment

  final String path;
  const CartRoute(this.path);
}
```

**Purpose**: Type-safe route definitions that prevent typos and provide IDE autocompletion.

### Route Structure

```dart
List<GoRoute> getCartRoutes(GlobalKey<NavigatorState>? navigatorKey) {
  return [
    // Hierarchical route: cart list with nested detail
    GoRoute(
      path: CartRoute.cartList.path,           // 'cart'
      parentNavigatorKey: navigatorKey,        // Uses root navigator
      builder: (context, state) => const CartListScreen(),
      routes: [
        // Nested detail route: /cart/details/:id
        GoRoute(
          path: '${CartRoute.cartDetail.path}/:id',  // 'details/:id'
          parentNavigatorKey: navigatorKey,
          builder: (context, state) {
            final itemId = state.pathParameters['id']!;
            return CartDetailScreen(itemId: itemId);
          },
        ),
      ],
    ),

    // Direct route: bypasses cart list
    GoRoute(
      path: '${CartRoute.cartDetail.path}/:id',      // 'details/:id'
      parentNavigatorKey: navigatorKey,
      builder: (context, state) {
        final itemId = state.pathParameters['id']!;
        return CartDetailScreen(itemId: itemId);
      },
    ),
  ];
}
```

### Integration with Main Router

The cart routes are integrated into each branch of the StatefulShellRoute:

```dart
// In lib/router.dart
StatefulShellBranch(
  routes: [
    GoRoute(
      path: AppRoute.home.path,              // '/home'
      builder: (context, state) => const HomeScreen(),
      routes: [
        ...getCartRoutes(rootNavigatorKey),  // Adds cart routes to home branch
        // Other feature routes...
      ],
    ),
  ],
),
```

**Result**: Cart routes are available in all tabs:

- `/home/cart` - Cart List in Home tab
- `/profile/cart` - Cart List in Profile tab
- `/settings/cart` - Cart List in Settings tab

## Navigation Examples

### From Home Screen

```dart
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Navigate to cart list keeping hierarchy
          ListTile(
            title: const Text('View Cart'),
            onTap: () => context.go('./${CartRoute.cartList.path}'),
            // Results in: /home/cart
          ),

          // Navigate through cart list to detail (maintains stack)
          ListTile(
            title: const Text('View Item 1'),
            onTap: () => context.go(
              './${CartRoute.cartList.path}/${CartRoute.cartDetail.path}/1',
            ),
            // Results in: /home/cart/details/1
          ),

          // Navigate directly to detail (bypasses cart list)
          ListTile(
            title: const Text('View Item 2'),
            onTap: () => context.go('./${CartRoute.cartDetail.path}/2'),
            // Results in: /home/details/2
          ),
        ],
      ),
    );
  }
}
```

### From Cart List Screen

```dart
class CartListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final itemId = '${index + 1}';
          return ListTile(
            title: Text('Cart Item $itemId'),
            onTap: () {
              // Navigate to detail using relative path
              context.go('./details/$itemId');
              // Results in: current_path/details/{itemId}
            },
          );
        },
      ),
    );
  }
}
```

## Key Benefits

### 1. **Multi-Tab Consistency**

- Same cart experience across all tabs
- Route structure maintained in each branch
- Consistent navigation patterns

### 2. **Flexible Navigation Patterns**

- Hierarchical navigation for browsing flows
- Direct navigation for deep linking
- Relative paths for maintainable code

### 3. **Type Safety**

- Enum-based route definitions
- Compile-time route validation
- IDE autocompletion support

### 4. **Clean Architecture**

- Clear separation of concerns
- Reusable package structure
- Testable navigation logic

### 5. **Deep Linking Support**

- Direct URL access to any screen
- Bookmarkable cart items
- Share-friendly URLs

## Usage in Main App

### 1. Add to pubspec.yaml

```yaml
dependencies:
  cart:
    path: packages/cart
```

### 2. Import and configure routes

```dart
import 'package:cart/cart.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              routes: [
                ...getCartRoutes(rootNavigatorKey),  // Add cart routes
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
```

### 3. Navigate to cart screens

```dart
// Navigate to cart list
context.go('./cart');

// Navigate to specific cart item
context.go('./cart/details/123');

// Direct navigation to cart item
context.go('./details/123');
```

## Error Handling

The package includes a reusable error screen for handling navigation errors:

```dart
class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          children: [
            const Text('The requested page was not found'),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Testing Considerations

When testing cart navigation:

1. **Route Resolution**: Test that all route patterns resolve correctly
2. **Navigation Stack**: Verify navigation stack behavior for different patterns
3. **Parameter Passing**: Ensure item IDs are passed correctly
4. **Error Cases**: Test invalid routes and error handling
5. **Multi-Tab**: Verify cart works consistently across all tabs

## Best Practices

1. **Use Relative Paths**: Prefer relative navigation within features
2. **Type-Safe Routes**: Always use enum-based route definitions
3. **Clear Intent**: Choose navigation pattern based on user intent
4. **Consistent Structure**: Follow the same pattern for other packages
5. **Document Behavior**: Clearly document expected navigation behavior
