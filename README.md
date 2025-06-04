# GoRouter POC - Flutter Navigation Demo

A Flutter application demonstrating sophisticated navigation patterns using `go_router` with clean architecture and type-safe routing.

## App Structure

### Main Tabs (StatefulShellRoute)

- **Home** - `/home`
- **Profile** - `/profile`
- **Settings** - `/settings`

### Feature Packages

- **Cart Package** - Shopping cart with hierarchical navigation
- **Menu Package** - Modal menu with fullscreen dialog

## Route Diagram

```
/ (SplashScreen)
│
└── StatefulShellRoute
    ├── /home (HomeScreen)
    │   ├── cart (CartListScreen)
    │   │   └── details/:id (CartDetailScreen)
    │   ├── details/:id (CartDetailScreen) [direct]
    │   └── ShellRoute [fullscreen modal]
    │       └── menu (MenuListScreen)
    │           └── details/:id (MenuDetailScreen)
    │
    ├── /profile (ProfileScreen)
    │   ├── cart (CartListScreen)
    │   │   └── details/:id (CartDetailScreen)
    │   ├── details/:id (CartDetailScreen) [direct]
    │   └── ShellRoute [fullscreen modal]
    │       └── menu (MenuListScreen)
    │           └── details/:id (MenuDetailScreen)
    │
    └── /settings (SettingsScreen)
        ├── cart (CartListScreen)
        │   └── details/:id (CartDetailScreen)
        ├── details/:id (CartDetailScreen) [direct]
        └── ShellRoute [fullscreen modal]
            └── menu (MenuListScreen)
                └── details/:id (MenuDetailScreen)
```

**Route Examples:**

- `/home/cart/details/1` - Hierarchical cart navigation
- `/profile/details/2` - Direct cart navigation
- `/settings/menu/details/3` - Menu modal navigation

## Navigation Patterns

### 1. Tab Navigation

Uses `AppRoute` enum for type-safe navigation between main tabs:

```dart
enum AppRoute {
  splash('/'),
  home('/home'),
  profile('/profile'),
  settings('/settings');
}
```

### 2. Cart Navigation

Two navigation patterns using `CartRoute` enum:

**Hierarchical**: Maintains navigation stack

```dart
context.go('./cart/details/1');        // /home/cart/details/1
```

**Direct**: Bypasses cart list

```dart
context.go('./details/2');             // /home/details/2
```

### 3. Menu Navigation

Modal overlay using `MenuRoute` enum:

```dart
context.go('/home/menu');              // Opens fullscreen modal
```

## Route Enums

### AppRoute

```dart
enum AppRoute {
  home('/home'),
  profile('/profile'),
  settings('/settings');
}
```

### CartRoute

```dart
enum CartRoute {
  cartList('cart'),
  cartDetail('details');
}
```

### MenuRoute

```dart
enum MenuRoute {
  menuList('menu'),
  menuDetail('details');
}
```

## Key Features

- **Type-safe routing** with enums
- **Multi-tab consistency** - same features available in all tabs
- **Modal navigation** - menu opens as fullscreen dialog
- **Hierarchical navigation** - maintains proper navigation stack
- **Deep linking** - direct URL access to any screen
- **Route path display** - shows current route in AppBar for debugging

## Navigation Examples

```dart
// Tab navigation
context.go(AppRoute.profile.path);

// Cart navigation (hierarchical)
context.go('./${CartRoute.cartList.path}/${CartRoute.cartDetail.path}/1');

// Cart navigation (direct)
context.go('./${CartRoute.cartDetail.path}/2');

// Menu navigation
context.go('/home/${MenuRoute.menuList.path}');
```

## Architecture

- **Clean separation** - each feature in its own package
- **Reusable components** - packages work across all tabs
- **Consistent patterns** - same navigation logic everywhere
- **Error handling** - fallback routes for invalid navigation
