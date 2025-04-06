# fab_scroll_animator

Add native Flutter animation to the FloatingActionButton when scrolling a ListView or GridView.

This package helps you automatically animate the FloatingActionButton between extended and collapsed states based on the user's scroll direction.

## ✨ Features

- Automatically detects scroll direction (up/down)
- Collapses the FAB when scrolling down
- Expands the FAB when scrolling up or idle
- Smooth transition using `AnimatedContainer`
- Customizable collapsed width and animation duration
- Compatible with `ListView`, `GridView`, or any scrollable widget

## 🎥 Demo

[![Watch the demo on YouTube](https://img.youtube.com/vi/iYi5cAA39so/0.jpg)](https://www.youtube.com/watch?v=iYi5cAA39so)


## 🚀 Getting Started

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
  fab_scroll_animator: ^1.0.0
```

Then import it:

```dart
import 'package:fab_scroll_animator/fab_scroll_animator.dart';
```

## 🧪 Example

```dart
final ScrollController scrollController = ScrollController();

Scaffold(
  body: ListView.builder(
    controller: scrollController,
    itemCount: 150,
    itemBuilder: (_, index) => ListTile(title: Text('LLLLoooonnnngggg Item \$index')),
  ),
  floatingActionButton: FABScrollAnimator(
    scrollController: scrollController,
    onScroll: (isExtended) {
      return FloatingActionButton.extended(
        isExtended: isExtended,
        onPressed: () {},
        label: Text('LLLLoooonnnngggg Text'),
        icon: Icon(Icons.add),
      );
    },
  ),
);
```

## ⚙️ Parameters

| Parameter           | Type                     | Description                                             |
|---------------------|--------------------------|---------------------------------------------------------|
| `scrollController`  | `ScrollController`       | Controller attached to your scrollable widget          |
| `onScroll`          | `Widget Function(bool)`  | Builder function called with `true` (extended) or `false` (collapsed) |
| `collapsedWidth`    | `double`                 | Width of the FAB when collapsed (default: `55.0`)      |
| `animationDuration` | `Duration`               | Duration of the collapse/expand animation (default: `milliseconds: 300`)             |

## 📦 Other Packages

| Package | Description |
|--------|-------------|
| [form_extensions](https://pub.dev/packages/form_extensions) | Simplifies form validation and saving using `.validator` and `.onSaved` extensions for all Flutter widgets. |
| [listview_empty_builder](https://pub.dev/packages/listview_empty_builder) | Adds a simple `.emptyBuilder` to ListView to handle empty states elegantly. |


## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

