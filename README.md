# GoRouter POC - Flutter Navigation Demo

A Flutter application demonstrating navigation patterns using `go_router` with `StatefulShellRoute.indexedStack`, modular packages, and modern Dart syntax.

## Architecture

- **StatefulShellRoute.indexedStack** for persistent bottom navigation
- **Feature packages** (Cart & Menu) with reusable navigation
- **Enhanced switch expressions** for clean code
- **Type-safe routing** with enum-based navigation

## App Structure

### Main Navigation

```
StatefulShellRoute.indexedStack
├── Branch 0: /home (HomeScreen)
├── Branch 1: /profile (ProfileScreen)
└── Branch 2: /settings (SettingsScreen)
```

### Route Architecture

```
/ (SplashScreen)
│
└── StatefulShellRoute.indexedStack
    ├── /home
    │   ├── cart → details/:id (hierarchical)
    │   ├── details/:id (direct)
    │   └── menu → details/:id (modal)
    │
    ├── /profile
    │   ├── cart → details/:id
    │   ├── details/:id
    │   └── menu → details/:id
    │
    └── /settings
        ├── cart → details/:id
        ├── details/:id
        └── menu → details/:id
```

## GoRouter Implementation

### Router Configuration

```dart
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  initialLocation: AppRoute.splash.path,
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    // Splash route (outside shell)
    GoRoute(
      path: AppRoute.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),

    // Main shell with persistent bottom navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeContainer(navigationShell: navigationShell);
      },
      parentNavigatorKey: rootNavigatorKey,
      branches: [
        // Home branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.home.path,
              builder: (context, state) => const HomeScreen(),
              routes: [
                ...getCartRoutes(rootNavigatorKey),
                ...getMenuRoutes(rootNavigatorKey),
              ],
            ),
          ],
        ),
        // Profile and Settings branches...
      ],
    ),
  ],
);
```

### Bottom Navigation Container

```dart
class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
```

### Package Route Integration

**Cart Routes:**

```dart
List<GoRoute> getCartRoutes(GlobalKey<NavigatorState>? navigatorKey) {
  return [
    // Hierarchical route: Cart List → Cart Detail
    GoRoute(
      path: CartRoute.cartList.path,
      parentNavigatorKey: navigatorKey,
      builder: (context, state) => const CartListScreen(),
      routes: [
        GoRoute(
          path: '${CartRoute.cartDetail.path}/:id',
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
      path: '${CartRoute.cartDetail.path}/:id',
      parentNavigatorKey: navigatorKey,
      builder: (context, state) {
        final itemId = state.pathParameters['id']!;
        return CartDetailScreen(itemId: itemId);
      },
    ),
  ];
}
```

**Menu Routes:**

```dart
List<RouteBase> getMenuRoutes([GlobalKey<NavigatorState>? navigatorKey]) {
  return [
    ShellRoute(
      parentNavigatorKey: navigatorKey,
      pageBuilder: (context, state, child) {
        return MaterialPage(
          key: state.pageKey,
          child: child,
          fullscreenDialog: true,
        );
      },
      routes: [
        GoRoute(
          path: MenuRoute.menuList.path,
          builder: (context, state) => const MenuListScreen(),
          routes: [
            GoRoute(
              path: '${MenuRoute.menuDetail.path}/:id',
              builder: (context, state) {
                final itemId = state.pathParameters['id']!;
                return MenuDetailScreen(itemId: itemId);
              },
            ),
          ],
        ),
      ],
    ),
  ];
}
```

## Route Examples

| Route                     | Description                | Navigation Stack         |
| ------------------------- | -------------------------- | ------------------------ |
| `/`                       | Splash screen              | Splash                   |
| `/home`                   | Home tab                   | Home                     |
| `/home/cart`              | Cart list in home          | Home → Cart              |
| `/home/cart/details/1`    | Cart detail (hierarchical) | Home → Cart → Detail     |
| `/home/details/2`         | Cart detail (direct)       | Home → Detail            |
| `/home/menu`              | Menu modal                 | Home + Modal             |
| `/profile/menu/details/3` | Menu detail in modal       | Profile + Modal → Detail |

## Navigation Patterns

### 1. Tab Navigation

Uses `StatefulShellRoute` for persistent bottom navigation:

```dart
// Proper tab switching (preserves state)
navigationShell.goBranch(index)

// ❌ Wrong: Would bypass state preservation
context.go('/home')
```

### 2. Cart Navigation

**Hierarchical** (maintains navigation stack):

```dart
context.go('./${CartRoute.cartList.path}/${CartRoute.cartDetail.path}/1');
// Results in: /home/cart/details/1 (back button goes to cart list)
```

**Direct** (bypasses intermediate screens):

```dart
context.go('./${CartRoute.cartDetail.path}/2');
// Results in: /home/details/2 (back button goes to home)
```

### 3. Menu Navigation

**Modal** with return-to-origin logic:

```dart
// Open modal
context.go('/home/${MenuRoute.menuList.path}');

// Return to originating tab (enhanced switch expression)
static void returnToOriginatingTab(BuildContext context) {
  final targetRoute = switch (GoRouterState.of(context).fullPath) {
    String path when path.contains('/home/') => '/home',
    String path when path.contains('/profile/') => '/profile',
    String path when path.contains('/settings/') => '/settings',
    _ => '/home',
  };
  context.go(targetRoute);
}
```

## Usage Examples

### Basic Navigation

```dart
// Tab navigation
context.go(AppRoute.profile.path);

// Cart (hierarchical)
context.go('./${CartRoute.cartList.path}/${CartRoute.cartDetail.path}/1');

// Cart (direct)
context.go('./${CartRoute.cartDetail.path}/2');

// Menu modal
context.go('/home/${MenuRoute.menuList.path}');
```

### Route Enums

```dart
enum AppRoute {
  splash('/'),
  home('/home'),
  profile('/profile'),
  settings('/settings');

  final String path;
  const AppRoute(this.path);
}

enum CartRoute {
  cartList('cart'),
  cartDetail('details');

  final String path;
  const CartRoute(this.path);
}

enum MenuRoute {
  menuList('menu'),
  menuDetail('details');

  final String path;
  const MenuRoute(this.path);
}
```

## Feature Packages

### Cart Package (`packages/cart/`)

- Hierarchical and direct navigation patterns
- Reusable across all tabs
- Parameter-based routing

### Menu Package (`packages/menu/`)

- Modal navigation with ShellRoute
- Return-to-origin functionality
- Fullscreen dialog presentation

## Features

✅ Persistent bottom navigation with state preservation  
✅ Hierarchical and direct navigation patterns  
✅ Modal navigation with return-to-origin  
✅ Deep linking support  
✅ Type-safe routing with enums  
✅ Modern Dart syntax with enhanced switch expressions
