import '../models/roadmap_models.dart';

List<RoadmapSection> getRoadmapData() {
  return [
    RoadmapSection(
      id: 1,
      title: "Dart Programming Language",
      level: "beginner",
      icon: "🎯",
      description:
      "Dart is the programming language used to build Flutter apps. You must master Dart before diving into Flutter. Learn all fundamentals including syntax, OOP, async programming, collections, null safety, and more.",
      groups: [
        TopicGroup(name: "Basics & Syntax", topics: [
          TopicItem(name: "Installing Dart SDK", badge: "essential"),
          TopicItem(name: "main() function", badge: "essential"),
          TopicItem(
              name: "print() and string interpolation", badge: "essential"),
          TopicItem(
              name: "Variables (var, final, const)", badge: "essential"),
          TopicItem(
              name: "Data Types (int, double, String, bool, num)",
              badge: "essential"),
          TopicItem(name: "Type Inference", badge: "essential"),
          TopicItem(name: "Dynamic type", badge: "important"),
          TopicItem(name: "Comments (single, multi, doc)", badge: "optional"),
          TopicItem(
              name: "String methods (trim, split, contains, replaceAll)",
              badge: "important"),
          TopicItem(
              name: "Type conversion (parse, toString, toInt)",
              badge: "essential"),
          TopicItem(
              name: "Arithmetic Operators (+, -, *, /, ~/, %)",
              badge: "essential"),
          TopicItem(
              name: "Comparison Operators (==, !=, >, <, >=, <=)",
              badge: "essential"),
          TopicItem(
              name: "Logical Operators (&&, ||, !)", badge: "essential"),
          TopicItem(
              name: "Assignment Operators (=, +=, -=, ??=)",
              badge: "essential"),
          TopicItem(name: "Ternary Operator (? :)", badge: "essential"),
          TopicItem(name: "Cascade Operator (..)", badge: "important"),
          TopicItem(name: "Spread Operator (...)", badge: "important"),
          TopicItem(
              name: "Null-aware Operators (?., ??, ??=, !)",
              badge: "essential"),
        ]),
        TopicGroup(name: "Control Flow", topics: [
          TopicItem(name: "if / else / else if", badge: "essential"),
          TopicItem(name: "switch / case / default", badge: "essential"),
          TopicItem(name: "for loop", badge: "essential"),
          TopicItem(name: "for-in loop", badge: "essential"),
          TopicItem(name: "while loop", badge: "essential"),
          TopicItem(name: "do-while loop", badge: "essential"),
          TopicItem(name: "break and continue", badge: "essential"),
          TopicItem(name: "Labels in loops", badge: "optional"),
          TopicItem(name: "assert statement", badge: "important"),
        ]),
        TopicGroup(name: "Functions", topics: [
          TopicItem(
              name: "Function declaration & calling", badge: "essential"),
          TopicItem(name: "Return types", badge: "essential"),
          TopicItem(
              name: "Required positional parameters", badge: "essential"),
          TopicItem(
              name: "Optional positional parameters", badge: "essential"),
          TopicItem(name: "Named parameters", badge: "essential"),
          TopicItem(name: "Default parameter values", badge: "essential"),
          TopicItem(name: "Arrow functions (=>)", badge: "essential"),
          TopicItem(
              name: "Anonymous functions / Lambdas", badge: "essential"),
          TopicItem(name: "Higher-order functions", badge: "important"),
          TopicItem(name: "Closures", badge: "important"),
          TopicItem(name: "Recursive functions", badge: "important"),
          TopicItem(name: "typedef", badge: "important"),
          TopicItem(
              name: "Function as first-class objects", badge: "important"),
        ]),
        TopicGroup(name: "Collections", topics: [
          TopicItem(name: "List (fixed, growable)", badge: "essential"),
          TopicItem(
              name:
              "List methods (add, remove, insert, sort, where, map, forEach, reduce, fold, any, every, firstWhere)",
              badge: "essential"),
          TopicItem(
              name: "Set (HashSet, LinkedHashSet, SplayTreeSet)",
              badge: "essential"),
          TopicItem(
              name: "Set operations (union, intersection, difference)",
              badge: "important"),
          TopicItem(
              name: "Map (HashMap, LinkedHashMap, SplayTreeMap)",
              badge: "essential"),
          TopicItem(
              name:
              "Map methods (putIfAbsent, update, entries, keys, values, forEach)",
              badge: "essential"),
          TopicItem(name: "Iterable class", badge: "important"),
          TopicItem(
              name: "Collection if and collection for", badge: "important"),
          TopicItem(name: "Unmodifiable collections", badge: "optional"),
          TopicItem(name: "Queue", badge: "optional"),
        ]),
        TopicGroup(name: "Object-Oriented Programming", topics: [
          TopicItem(name: "Classes and Objects", badge: "essential"),
          TopicItem(
              name: "Constructors (default, named, const, factory)",
              badge: "essential"),
          TopicItem(name: "this keyword", badge: "essential"),
          TopicItem(name: "Getters and Setters", badge: "essential"),
          TopicItem(
              name: "Private members (_underscore)", badge: "essential"),
          TopicItem(name: "Inheritance (extends)", badge: "essential"),
          TopicItem(
              name: "Method overriding (@override)", badge: "essential"),
          TopicItem(name: "super keyword", badge: "essential"),
          TopicItem(name: "Abstract classes", badge: "essential"),
          TopicItem(name: "Interfaces (implements)", badge: "essential"),
          TopicItem(name: "Mixins (with)", badge: "essential"),
          TopicItem(name: "Static members", badge: "essential"),
          TopicItem(name: "Enums (enhanced enums)", badge: "essential"),
          TopicItem(name: "Sealed classes", badge: "important"),
          TopicItem(name: "Extension methods", badge: "important"),
          TopicItem(name: "Operator overloading", badge: "optional"),
          TopicItem(name: "Covariant keyword", badge: "optional"),
          TopicItem(
              name: "Callable classes (call method)", badge: "optional"),
          TopicItem(name: "toString, hashCode, ==", badge: "important"),
          TopicItem(name: "noSuchMethod", badge: "optional"),
        ]),
        TopicGroup(name: "Null Safety", topics: [
          TopicItem(name: "Nullable types (?)", badge: "essential"),
          TopicItem(name: "Non-nullable types", badge: "essential"),
          TopicItem(
              name: "Null assertion operator (!)", badge: "essential"),
          TopicItem(name: "Null-aware access (?.)", badge: "essential"),
          TopicItem(name: "Null coalescing (??)", badge: "essential"),
          TopicItem(
              name: "Null-aware assignment (??=)", badge: "essential"),
          TopicItem(name: "late keyword", badge: "essential"),
          TopicItem(name: "required keyword", badge: "essential"),
          TopicItem(name: "Type promotion", badge: "important"),
          TopicItem(name: "Flow analysis", badge: "important"),
        ]),
        TopicGroup(name: "Async Programming", topics: [
          TopicItem(name: "Future class", badge: "essential"),
          TopicItem(name: "async / await", badge: "essential"),
          TopicItem(
              name: "Future.then(), .catchError(), .whenComplete()",
              badge: "essential"),
          TopicItem(name: "Future.delayed()", badge: "essential"),
          TopicItem(name: "Future.wait()", badge: "important"),
          TopicItem(name: "Future.value()", badge: "optional"),
          TopicItem(name: "Stream class", badge: "essential"),
          TopicItem(name: "StreamController", badge: "essential"),
          TopicItem(
              name: "Single-subscription streams", badge: "important"),
          TopicItem(name: "Broadcast streams", badge: "important"),
          TopicItem(name: "Stream.listen()", badge: "essential"),
          TopicItem(name: "async* and yield", badge: "important"),
          TopicItem(name: "yield*", badge: "optional"),
          TopicItem(
              name: "Stream transformations (map, where, expand)",
              badge: "important"),
          TopicItem(name: "Completer", badge: "optional"),
          TopicItem(name: "Isolates", badge: "important"),
          TopicItem(name: "compute() function", badge: "important"),
        ]),
        TopicGroup(name: "Generics", topics: [
          TopicItem(name: "Generic classes", badge: "essential"),
          TopicItem(name: "Generic functions", badge: "essential"),
          TopicItem(
              name: "Type constraints (extends)", badge: "important"),
          TopicItem(name: "Generic methods", badge: "important"),
          TopicItem(
              name: "Covariance and contravariance", badge: "optional"),
        ]),
        TopicGroup(name: "Error Handling", topics: [
          TopicItem(name: "try / catch / finally", badge: "essential"),
          TopicItem(name: "throw keyword", badge: "essential"),
          TopicItem(name: "rethrow keyword", badge: "important"),
          TopicItem(
              name: "on keyword (specific exceptions)", badge: "essential"),
          TopicItem(name: "Custom exceptions", badge: "important"),
          TopicItem(
              name: "Exception vs Error classes", badge: "important"),
          TopicItem(name: "Stack trace", badge: "optional"),
        ]),
        TopicGroup(name: "Advanced Dart", topics: [
          TopicItem(name: "Records", badge: "important"),
          TopicItem(
              name: "Patterns and pattern matching", badge: "important"),
          TopicItem(name: "Destructuring", badge: "important"),
          TopicItem(
              name:
              "Metadata / Annotations (@deprecated, @override, @pragma)",
              badge: "important"),
          TopicItem(
              name:
              "Libraries and imports (import, export, show, hide, as, deferred)",
              badge: "essential"),
          TopicItem(name: "part and part of", badge: "optional"),
          TopicItem(name: "Zones", badge: "optional"),
          TopicItem(name: "Reflection (dart:mirrors)", badge: "optional"),
          TopicItem(name: "Code generation concepts", badge: "optional"),
          TopicItem(name: "Dart DevTools", badge: "important"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 2,
      title: "Development Environment Setup",
      level: "beginner",
      icon: "🛠",
      description:
      "Set up your complete Flutter development environment. Install all necessary tools, configure your IDE, and understand the project structure.",
      groups: [
        TopicGroup(name: "Installation", topics: [
          TopicItem(name: "Install Flutter SDK", badge: "essential"),
          TopicItem(
              name: "Install Dart SDK (bundled with Flutter)",
              badge: "essential"),
          TopicItem(name: "Install Android Studio", badge: "essential"),
          TopicItem(name: "Install VS Code", badge: "essential"),
          TopicItem(
              name: "Install Xcode (macOS for iOS)", badge: "important"),
          TopicItem(
              name: "Setup Android Emulator (AVD)", badge: "essential"),
          TopicItem(
              name: "Setup iOS Simulator (macOS)", badge: "important"),
          TopicItem(name: "flutter doctor command", badge: "essential"),
          TopicItem(name: "Accept Android licenses", badge: "essential"),
          TopicItem(name: "Git installation and setup", badge: "essential"),
        ]),
        TopicGroup(name: "IDE Configuration", topics: [
          TopicItem(
              name: "Flutter plugin for Android Studio",
              badge: "essential"),
          TopicItem(
              name: "Dart plugin for Android Studio", badge: "essential"),
          TopicItem(
              name: "Flutter extension for VS Code", badge: "essential"),
          TopicItem(
              name: "Dart extension for VS Code", badge: "essential"),
          TopicItem(name: "Error Lens extension", badge: "optional"),
          TopicItem(
              name: "Awesome Flutter Snippets extension",
              badge: "optional"),
          TopicItem(name: "Bracket Pair Colorizer", badge: "optional"),
          TopicItem(
              name: "Emulator launching from IDE", badge: "essential"),
          TopicItem(name: "Keyboard shortcuts", badge: "optional"),
        ]),
        TopicGroup(name: "Flutter CLI Commands", topics: [
          TopicItem(name: "flutter create", badge: "essential"),
          TopicItem(name: "flutter run", badge: "essential"),
          TopicItem(name: "flutter build", badge: "essential"),
          TopicItem(name: "flutter clean", badge: "essential"),
          TopicItem(name: "flutter pub get", badge: "essential"),
          TopicItem(name: "flutter pub upgrade", badge: "important"),
          TopicItem(name: "flutter pub add", badge: "essential"),
          TopicItem(name: "flutter pub remove", badge: "important"),
          TopicItem(name: "flutter analyze", badge: "important"),
          TopicItem(name: "flutter test", badge: "important"),
          TopicItem(name: "flutter doctor -v", badge: "essential"),
          TopicItem(name: "flutter devices", badge: "essential"),
          TopicItem(
              name: "flutter channel (stable, beta, dev, master)",
              badge: "important"),
          TopicItem(name: "flutter upgrade", badge: "important"),
          TopicItem(name: "flutter config", badge: "optional"),
          TopicItem(name: "flutter gen-l10n", badge: "optional"),
        ]),
        TopicGroup(name: "Project Structure", topics: [
          TopicItem(name: "lib/ directory", badge: "essential"),
          TopicItem(name: "main.dart file", badge: "essential"),
          TopicItem(
              name: "pubspec.yaml (dependencies, assets, fonts)",
              badge: "essential"),
          TopicItem(name: "pubspec.lock", badge: "important"),
          TopicItem(name: "android/ directory", badge: "important"),
          TopicItem(name: "ios/ directory", badge: "important"),
          TopicItem(name: "web/ directory", badge: "optional"),
          TopicItem(name: "test/ directory", badge: "important"),
          TopicItem(name: "build/ directory", badge: "optional"),
          TopicItem(name: ".dart_tool/ directory", badge: "optional"),
          TopicItem(name: "analysis_options.yaml", badge: "important"),
          TopicItem(name: ".gitignore", badge: "important"),
          TopicItem(name: "README.md", badge: "optional"),
        ]),
        TopicGroup(name: "Development Features", topics: [
          TopicItem(name: "Hot Reload (stateful)", badge: "essential"),
          TopicItem(name: "Hot Restart (stateless)", badge: "essential"),
          TopicItem(name: "Debug mode", badge: "essential"),
          TopicItem(name: "Profile mode", badge: "important"),
          TopicItem(name: "Release mode", badge: "important"),
          TopicItem(name: "Flutter DevTools", badge: "essential"),
          TopicItem(name: "Widget Inspector", badge: "important"),
          TopicItem(name: "Performance Overlay", badge: "optional"),
          TopicItem(name: "Debug Paint", badge: "optional"),
          TopicItem(name: "Dart Analysis / Linting", badge: "important"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 3,
      title: "Flutter Fundamentals & Core Concepts",
      level: "beginner",
      icon: "📱",
      description:
      "Understand the core concepts of Flutter including the widget tree, element tree, render tree, BuildContext, keys, and the overall Flutter architecture.",
      groups: [
        TopicGroup(name: "Core Architecture", topics: [
          TopicItem(name: "Everything is a Widget", badge: "essential"),
          TopicItem(name: "Widget Tree", badge: "essential"),
          TopicItem(name: "Element Tree", badge: "important"),
          TopicItem(name: "Render Tree", badge: "important"),
          TopicItem(name: "BuildContext", badge: "essential"),
          TopicItem(name: "Widget lifecycle", badge: "essential"),
          TopicItem(name: "StatelessWidget", badge: "essential"),
          TopicItem(name: "StatefulWidget", badge: "essential"),
          TopicItem(name: "State class", badge: "essential"),
          TopicItem(name: "setState()", badge: "essential"),
          TopicItem(name: "initState()", badge: "essential"),
          TopicItem(name: "dispose()", badge: "essential"),
          TopicItem(name: "didChangeDependencies()", badge: "important"),
          TopicItem(name: "didUpdateWidget()", badge: "important"),
          TopicItem(name: "deactivate()", badge: "optional"),
          TopicItem(name: "build() method", badge: "essential"),
          TopicItem(
              name: "Keys (ValueKey, ObjectKey, UniqueKey, GlobalKey)",
              badge: "important"),
          TopicItem(name: "InheritedWidget", badge: "important"),
          TopicItem(name: "InheritedModel", badge: "optional"),
          TopicItem(name: "InheritedNotifier", badge: "optional"),
        ]),
        TopicGroup(name: "Material Design", topics: [
          TopicItem(name: "MaterialApp", badge: "essential"),
          TopicItem(name: "ThemeData", badge: "essential"),
          TopicItem(name: "ColorScheme", badge: "essential"),
          TopicItem(name: "TextTheme", badge: "important"),
          TopicItem(
              name: "Material 3 / Material You", badge: "important"),
          TopicItem(
              name: "Dark Theme / Light Theme", badge: "essential"),
          TopicItem(
              name: "CupertinoApp (iOS style)", badge: "important"),
          TopicItem(
              name: "Platform-adaptive widgets", badge: "optional"),
        ]),
        TopicGroup(name: "Assets & Resources", topics: [
          TopicItem(name: "Adding images to assets", badge: "essential"),
          TopicItem(name: "Using AssetImage", badge: "essential"),
          TopicItem(name: "Using NetworkImage", badge: "essential"),
          TopicItem(name: "Custom fonts", badge: "essential"),
          TopicItem(name: "Google Fonts package", badge: "important"),
          TopicItem(
              name: "Icons (Material, Cupertino, custom)",
              badge: "essential"),
          TopicItem(name: "JSON asset files", badge: "important"),
          TopicItem(
              name: "pubspec.yaml assets configuration",
              badge: "essential"),
          TopicItem(
              name: "Asset variants (resolution-aware images)",
              badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 4,
      title: "All Widgets — Layout Widgets",
      level: "beginner",
      icon: "📐",
      description:
      "Master every layout widget in Flutter. These widgets control how other widgets are arranged and positioned on the screen.",
      groups: [
        TopicGroup(name: "Single-Child Layout Widgets", topics: [
          TopicItem(name: "Container", badge: "essential"),
          TopicItem(name: "Padding", badge: "essential"),
          TopicItem(name: "Center", badge: "essential"),
          TopicItem(name: "Align", badge: "essential"),
          TopicItem(name: "SizedBox", badge: "essential"),
          TopicItem(name: "ConstrainedBox", badge: "important"),
          TopicItem(name: "UnconstrainedBox", badge: "optional"),
          TopicItem(name: "LimitedBox", badge: "optional"),
          TopicItem(name: "OverflowBox", badge: "optional"),
          TopicItem(name: "SizedOverflowBox", badge: "optional"),
          TopicItem(
              name: "FractionallySizedBox", badge: "important"),
          TopicItem(name: "FittedBox", badge: "important"),
          TopicItem(name: "AspectRatio", badge: "important"),
          TopicItem(name: "IntrinsicHeight", badge: "important"),
          TopicItem(name: "IntrinsicWidth", badge: "important"),
          TopicItem(name: "Baseline", badge: "optional"),
          TopicItem(name: "Transform", badge: "important"),
          TopicItem(name: "RotatedBox", badge: "optional"),
          TopicItem(name: "DecoratedBox", badge: "optional"),
          TopicItem(name: "Offstage", badge: "optional"),
          TopicItem(
              name: "CustomSingleChildLayout", badge: "optional"),
        ]),
        TopicGroup(name: "Multi-Child Layout Widgets", topics: [
          TopicItem(name: "Column", badge: "essential"),
          TopicItem(name: "Row", badge: "essential"),
          TopicItem(name: "Stack", badge: "essential"),
          TopicItem(
              name: "Positioned (inside Stack)", badge: "essential"),
          TopicItem(name: "IndexedStack", badge: "important"),
          TopicItem(name: "Wrap", badge: "essential"),
          TopicItem(name: "Flow", badge: "optional"),
          TopicItem(name: "Flex", badge: "important"),
          TopicItem(name: "Flexible", badge: "essential"),
          TopicItem(name: "Expanded", badge: "essential"),
          TopicItem(name: "Spacer", badge: "essential"),
          TopicItem(name: "Table", badge: "important"),
          TopicItem(name: "TableRow", badge: "important"),
          TopicItem(
              name: "CustomMultiChildLayout", badge: "optional"),
          TopicItem(name: "LayoutBuilder", badge: "essential"),
          TopicItem(name: "OrientationBuilder", badge: "important"),
          TopicItem(name: "MediaQuery", badge: "essential"),
        ]),
        TopicGroup(name: "Flex / Alignment Concepts", topics: [
          TopicItem(
              name:
              "MainAxisAlignment (start, end, center, spaceBetween, spaceAround, spaceEvenly)",
              badge: "essential"),
          TopicItem(
              name:
              "CrossAxisAlignment (start, end, center, stretch, baseline)",
              badge: "essential"),
          TopicItem(
              name: "MainAxisSize (min, max)", badge: "essential"),
          TopicItem(
              name: "EdgeInsets (all, symmetric, only, fromLTRB)",
              badge: "essential"),
          TopicItem(name: "BoxConstraints", badge: "important"),
          TopicItem(name: "Alignment class", badge: "important"),
          TopicItem(name: "AlignmentDirectional", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 5,
      title: "All Widgets — UI / Display Widgets",
      level: "beginner",
      icon: "🎨",
      description:
      "Every widget used to display content, text, images, icons, and visual elements on screen.",
      groups: [
        TopicGroup(name: "Text Widgets", topics: [
          TopicItem(name: "Text", badge: "essential"),
          TopicItem(name: "RichText", badge: "essential"),
          TopicItem(name: "TextSpan", badge: "essential"),
          TopicItem(name: "SelectableText", badge: "important"),
          TopicItem(name: "DefaultTextStyle", badge: "important"),
          TopicItem(
              name:
              "TextStyle (fontSize, fontWeight, color, fontFamily, letterSpacing, wordSpacing, height, decoration, shadows, overflow)",
              badge: "essential"),
          TopicItem(
              name: "Text overflow (ellipsis, clip, fade, visible)",
              badge: "essential"),
          TopicItem(name: "maxLines property", badge: "essential"),
          TopicItem(name: "textAlign property", badge: "essential"),
          TopicItem(name: "softWrap property", badge: "important"),
        ]),
        TopicGroup(name: "Image Widgets", topics: [
          TopicItem(name: "Image.asset()", badge: "essential"),
          TopicItem(name: "Image.network()", badge: "essential"),
          TopicItem(name: "Image.file()", badge: "important"),
          TopicItem(name: "Image.memory()", badge: "optional"),
          TopicItem(
              name:
              "BoxFit (contain, cover, fill, fitWidth, fitHeight, none, scaleDown)",
              badge: "essential"),
          TopicItem(name: "DecorationImage", badge: "important"),
          TopicItem(name: "FadeInImage", badge: "important"),
          TopicItem(
              name: "CachedNetworkImage package", badge: "important"),
          TopicItem(name: "CircleAvatar", badge: "essential"),
          TopicItem(
              name: "Image error handling (errorBuilder)",
              badge: "important"),
          TopicItem(
              name: "Image loading (loadingBuilder)",
              badge: "important"),
        ]),
        TopicGroup(name: "Icon Widgets", topics: [
          TopicItem(name: "Icon", badge: "essential"),
          TopicItem(
              name: "Icons class (Material Icons)", badge: "essential"),
          TopicItem(name: "CupertinoIcons", badge: "important"),
          TopicItem(name: "IconButton", badge: "essential"),
          TopicItem(name: "ImageIcon", badge: "optional"),
          TopicItem(
              name: "Custom icon fonts (FlutterIcon, FontAwesome)",
              badge: "important"),
          TopicItem(
              name: "SVG icons (flutter_svg package)",
              badge: "important"),
        ]),
        TopicGroup(name: "Decoration & Styling", topics: [
          TopicItem(name: "BoxDecoration", badge: "essential"),
          TopicItem(name: "BorderRadius", badge: "essential"),
          TopicItem(name: "Border", badge: "essential"),
          TopicItem(name: "BoxShadow", badge: "essential"),
          TopicItem(
              name:
              "Gradient (LinearGradient, RadialGradient, SweepGradient)",
              badge: "essential"),
          TopicItem(name: "ShapeDecoration", badge: "optional"),
          TopicItem(name: "ClipRRect", badge: "essential"),
          TopicItem(name: "ClipOval", badge: "important"),
          TopicItem(name: "ClipPath", badge: "optional"),
          TopicItem(name: "ClipRect", badge: "optional"),
          TopicItem(name: "CustomPaint", badge: "important"),
          TopicItem(name: "CustomPainter", badge: "important"),
          TopicItem(
              name:
              "Canvas drawing (drawLine, drawCircle, drawRect, drawPath, drawArc)",
              badge: "optional"),
          TopicItem(name: "Opacity", badge: "essential"),
          TopicItem(name: "ColorFiltered", badge: "optional"),
          TopicItem(
              name: "BackdropFilter (blur effects)", badge: "important"),
          TopicItem(name: "ImageFilter.blur", badge: "important"),
          TopicItem(name: "ShaderMask", badge: "optional"),
          TopicItem(name: "PhysicalModel", badge: "optional"),
          TopicItem(name: "PhysicalShape", badge: "optional"),
          TopicItem(name: "Material", badge: "important"),
        ]),
        TopicGroup(name: "Indicator & Progress Widgets", topics: [
          TopicItem(
              name: "CircularProgressIndicator", badge: "essential"),
          TopicItem(
              name: "LinearProgressIndicator", badge: "essential"),
          TopicItem(name: "RefreshIndicator", badge: "essential"),
          TopicItem(
              name: "Shimmer effect (shimmer package)",
              badge: "important"),
          TopicItem(name: "Skeleton loaders", badge: "important"),
        ]),
        TopicGroup(name: "Dividers & Separators", topics: [
          TopicItem(name: "Divider", badge: "essential"),
          TopicItem(name: "VerticalDivider", badge: "important"),
          TopicItem(name: "Placeholder", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 6,
      title: "All Widgets — Input & Form Widgets",
      level: "beginner",
      icon: "⌨️",
      description:
      "All widgets related to user input, forms, text fields, buttons, checkboxes, radio buttons, sliders, switches, and more.",
      groups: [
        TopicGroup(name: "Text Input", topics: [
          TopicItem(name: "TextField", badge: "essential"),
          TopicItem(name: "TextFormField", badge: "essential"),
          TopicItem(name: "TextEditingController", badge: "essential"),
          TopicItem(name: "FocusNode", badge: "essential"),
          TopicItem(
              name:
              "InputDecoration (label, hint, prefix, suffix, border, icon, errorText, helperText, counterText)",
              badge: "essential"),
          TopicItem(name: "OutlineInputBorder", badge: "essential"),
          TopicItem(name: "UnderlineInputBorder", badge: "important"),
          TopicItem(name: "InputBorder.none", badge: "important"),
          TopicItem(
              name:
              "TextInputType (text, number, email, phone, url, multiline)",
              badge: "essential"),
          TopicItem(
              name:
              "TextInputAction (done, next, search, go, send)",
              badge: "important"),
          TopicItem(name: "obscureText (password)", badge: "essential"),
          TopicItem(
              name: "maxLength, maxLines, minLines",
              badge: "important"),
          TopicItem(
              name: "onChanged, onSubmitted, onEditingComplete",
              badge: "essential"),
          TopicItem(
              name:
              "TextInputFormatter (FilteringTextInputFormatter, LengthLimitingTextInputFormatter)",
              badge: "important"),
          TopicItem(name: "Autocomplete widget", badge: "optional"),
          TopicItem(
              name: "SearchBar / SearchAnchor", badge: "important"),
        ]),
        TopicGroup(name: "Form & Validation", topics: [
          TopicItem(name: "Form widget", badge: "essential"),
          TopicItem(
              name: "GlobalKey<FormState>", badge: "essential"),
          TopicItem(name: "FormState.validate()", badge: "essential"),
          TopicItem(name: "FormState.save()", badge: "essential"),
          TopicItem(name: "FormState.reset()", badge: "important"),
          TopicItem(name: "validator property", badge: "essential"),
          TopicItem(name: "autovalidateMode", badge: "important"),
          TopicItem(name: "FormField", badge: "optional"),
          TopicItem(
              name: "Custom form validators", badge: "essential"),
          TopicItem(
              name: "Regular expressions in validation",
              badge: "important"),
        ]),
        TopicGroup(name: "Button Widgets", topics: [
          TopicItem(name: "ElevatedButton", badge: "essential"),
          TopicItem(name: "TextButton", badge: "essential"),
          TopicItem(name: "OutlinedButton", badge: "essential"),
          TopicItem(name: "IconButton", badge: "essential"),
          TopicItem(name: "FloatingActionButton", badge: "essential"),
          TopicItem(
              name: "FloatingActionButton.extended",
              badge: "important"),
          TopicItem(name: "DropdownButton", badge: "essential"),
          TopicItem(
              name: "DropdownButtonFormField", badge: "essential"),
          TopicItem(name: "PopupMenuButton", badge: "important"),
          TopicItem(name: "ButtonStyle", badge: "essential"),
          TopicItem(name: "MaterialStateProperty", badge: "important"),
          TopicItem(name: "InkWell", badge: "essential"),
          TopicItem(name: "InkResponse", badge: "optional"),
          TopicItem(name: "GestureDetector", badge: "essential"),
          TopicItem(name: "CupertinoButton", badge: "optional"),
          TopicItem(name: "ToggleButtons", badge: "important"),
          TopicItem(name: "SegmentedButton", badge: "important"),
          TopicItem(name: "FilledButton", badge: "important"),
          TopicItem(name: "FilledButton.tonal", badge: "optional"),
          TopicItem(name: "MenuAnchor & MenuBar", badge: "optional"),
        ]),
        TopicGroup(name: "Selection Widgets", topics: [
          TopicItem(name: "Checkbox", badge: "essential"),
          TopicItem(name: "CheckboxListTile", badge: "essential"),
          TopicItem(name: "Radio", badge: "essential"),
          TopicItem(name: "RadioListTile", badge: "essential"),
          TopicItem(name: "Switch", badge: "essential"),
          TopicItem(name: "SwitchListTile", badge: "essential"),
          TopicItem(name: "Slider", badge: "essential"),
          TopicItem(name: "RangeSlider", badge: "important"),
          TopicItem(name: "CupertinoSwitch", badge: "optional"),
          TopicItem(name: "CupertinoSlider", badge: "optional"),
        ]),
        TopicGroup(name: "Date & Time Pickers", topics: [
          TopicItem(name: "showDatePicker()", badge: "essential"),
          TopicItem(name: "showTimePicker()", badge: "essential"),
          TopicItem(
              name: "showDateRangePicker()", badge: "important"),
          TopicItem(name: "CupertinoDatePicker", badge: "optional"),
          TopicItem(name: "CupertinoTimerPicker", badge: "optional"),
          TopicItem(name: "CalendarDatePicker", badge: "optional"),
          TopicItem(
              name: "InputDatePickerFormField", badge: "optional"),
        ]),
        TopicGroup(name: "Chip Widgets", topics: [
          TopicItem(name: "Chip", badge: "essential"),
          TopicItem(name: "InputChip", badge: "important"),
          TopicItem(name: "ChoiceChip", badge: "important"),
          TopicItem(name: "FilterChip", badge: "important"),
          TopicItem(name: "ActionChip", badge: "important"),
          TopicItem(name: "RawChip", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 7,
      title: "All Widgets — Scrolling Widgets",
      level: "intermediate",
      icon: "📜",
      description:
      "Every scrolling widget in Flutter including lists, grids, scroll views, slivers, and custom scroll behaviors.",
      groups: [
        TopicGroup(name: "Basic Scrolling", topics: [
          TopicItem(name: "SingleChildScrollView", badge: "essential"),
          TopicItem(name: "ListView", badge: "essential"),
          TopicItem(name: "ListView.builder()", badge: "essential"),
          TopicItem(name: "ListView.separated()", badge: "essential"),
          TopicItem(name: "ListView.custom()", badge: "optional"),
          TopicItem(name: "GridView", badge: "essential"),
          TopicItem(name: "GridView.builder()", badge: "essential"),
          TopicItem(name: "GridView.count()", badge: "essential"),
          TopicItem(name: "GridView.extent()", badge: "important"),
          TopicItem(name: "GridView.custom()", badge: "optional"),
          TopicItem(name: "ScrollController", badge: "essential"),
          TopicItem(
              name:
              "ScrollPhysics (BouncingScrollPhysics, ClampingScrollPhysics, NeverScrollableScrollPhysics, AlwaysScrollableScrollPhysics)",
              badge: "important"),
          TopicItem(name: "PageView", badge: "essential"),
          TopicItem(name: "PageView.builder()", badge: "important"),
          TopicItem(name: "PageController", badge: "essential"),
          TopicItem(name: "ListWheelScrollView", badge: "optional"),
          TopicItem(name: "Scrollbar", badge: "important"),
          TopicItem(
              name: "ScrollNotification / NotificationListener",
              badge: "important"),
          TopicItem(
              name: "DraggableScrollableSheet", badge: "important"),
          TopicItem(name: "ReorderableListView", badge: "important"),
        ]),
        TopicGroup(name: "Slivers (Advanced Scrolling)", topics: [
          TopicItem(name: "CustomScrollView", badge: "essential"),
          TopicItem(name: "SliverList", badge: "essential"),
          TopicItem(name: "SliverList.builder()", badge: "essential"),
          TopicItem(name: "SliverGrid", badge: "essential"),
          TopicItem(name: "SliverGrid.count()", badge: "important"),
          TopicItem(name: "SliverGrid.extent()", badge: "important"),
          TopicItem(name: "SliverAppBar", badge: "essential"),
          TopicItem(name: "SliverAppBar.large()", badge: "optional"),
          TopicItem(name: "SliverAppBar.medium()", badge: "optional"),
          TopicItem(name: "SliverToBoxAdapter", badge: "essential"),
          TopicItem(name: "SliverPadding", badge: "important"),
          TopicItem(name: "SliverFillRemaining", badge: "important"),
          TopicItem(name: "SliverFillViewport", badge: "optional"),
          TopicItem(
              name: "SliverFixedExtentList", badge: "optional"),
          TopicItem(
              name: "SliverPersistentHeader", badge: "important"),
          TopicItem(
              name: "SliverOverlapAbsorber", badge: "optional"),
          TopicItem(
              name: "SliverOverlapInjector", badge: "optional"),
          TopicItem(name: "SliverAnimatedList", badge: "optional"),
          TopicItem(
              name: "SliverPrototypeExtentList", badge: "optional"),
          TopicItem(name: "NestedScrollView", badge: "important"),
        ]),
        TopicGroup(name: "Scroll Delegates", topics: [
          TopicItem(
              name: "SliverChildBuilderDelegate", badge: "essential"),
          TopicItem(
              name: "SliverChildListDelegate", badge: "essential"),
          TopicItem(
              name: "SliverGridDelegateWithFixedCrossAxisCount",
              badge: "essential"),
          TopicItem(
              name: "SliverGridDelegateWithMaxCrossAxisExtent",
              badge: "important"),
          TopicItem(
              name: "KeepAlive / AutomaticKeepAliveClientMixin",
              badge: "important"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 8,
      title: "All Widgets — Navigation & App Structure",
      level: "intermediate",
      icon: "🧭",
      description:
      "All widgets related to app navigation, routing, scaffolding, app bars, drawers, bottom navigation, tabs, and dialogs.",
      groups: [
        TopicGroup(name: "Scaffold & App Bars", topics: [
          TopicItem(name: "Scaffold", badge: "essential"),
          TopicItem(name: "AppBar", badge: "essential"),
          TopicItem(name: "AppBar actions", badge: "essential"),
          TopicItem(name: "AppBar leading", badge: "essential"),
          TopicItem(name: "AppBar flexibleSpace", badge: "optional"),
          TopicItem(name: "PreferredSizeWidget", badge: "important"),
          TopicItem(name: "SliverAppBar", badge: "essential"),
          TopicItem(
              name: "CupertinoNavigationBar", badge: "optional"),
          TopicItem(name: "BottomAppBar", badge: "important"),
        ]),
        TopicGroup(name: "Navigation", topics: [
          TopicItem(name: "Navigator.push()", badge: "essential"),
          TopicItem(name: "Navigator.pop()", badge: "essential"),
          TopicItem(
              name: "Navigator.pushReplacement()", badge: "essential"),
          TopicItem(
              name: "Navigator.pushNamed()", badge: "essential"),
          TopicItem(
              name: "Navigator.pushAndRemoveUntil()",
              badge: "important"),
          TopicItem(name: "Navigator.popUntil()", badge: "important"),
          TopicItem(name: "Navigator.canPop()", badge: "important"),
          TopicItem(name: "Navigator.maybePop()", badge: "optional"),
          TopicItem(name: "MaterialPageRoute", badge: "essential"),
          TopicItem(name: "CupertinoPageRoute", badge: "optional"),
          TopicItem(
              name: "PageRouteBuilder (custom transitions)",
              badge: "important"),
          TopicItem(
              name: "Named routes (routes map)", badge: "essential"),
          TopicItem(name: "onGenerateRoute", badge: "important"),
          TopicItem(name: "onUnknownRoute", badge: "important"),
          TopicItem(
              name: "Route arguments passing", badge: "essential"),
          TopicItem(
              name: "Returning data from routes", badge: "essential"),
          TopicItem(
              name: "WillPopScope / PopScope", badge: "important"),
          TopicItem(
              name: "Navigator 2.0 / Router API", badge: "important"),
          TopicItem(name: "GoRouter package", badge: "essential"),
          TopicItem(
              name: "go_router redirect guards", badge: "important"),
          TopicItem(
              name: "go_router ShellRoute", badge: "important"),
          TopicItem(
              name: "go_router nested navigation", badge: "important"),
          TopicItem(name: "auto_route package", badge: "optional"),
          TopicItem(name: "Deep linking", badge: "important"),
        ]),
        TopicGroup(name: "Tab Navigation", topics: [
          TopicItem(name: "DefaultTabController", badge: "essential"),
          TopicItem(name: "TabBar", badge: "essential"),
          TopicItem(name: "TabBarView", badge: "essential"),
          TopicItem(name: "TabController", badge: "important"),
          TopicItem(name: "Tab widget", badge: "essential"),
        ]),
        TopicGroup(name: "Bottom Navigation", topics: [
          TopicItem(name: "BottomNavigationBar", badge: "essential"),
          TopicItem(
              name: "BottomNavigationBarItem", badge: "essential"),
          TopicItem(
              name: "NavigationBar (Material 3)", badge: "essential"),
          TopicItem(name: "NavigationDestination", badge: "essential"),
          TopicItem(name: "NavigationRail", badge: "important"),
          TopicItem(name: "NavigationDrawer", badge: "important"),
          TopicItem(name: "CupertinoTabBar", badge: "optional"),
          TopicItem(name: "CupertinoTabScaffold", badge: "optional"),
        ]),
        TopicGroup(name: "Drawer", topics: [
          TopicItem(name: "Drawer", badge: "essential"),
          TopicItem(name: "DrawerHeader", badge: "essential"),
          TopicItem(
              name: "UserAccountsDrawerHeader", badge: "important"),
          TopicItem(name: "endDrawer", badge: "optional"),
          TopicItem(name: "NavigationDrawer", badge: "important"),
        ]),
        TopicGroup(name: "Dialogs & Overlays", topics: [
          TopicItem(name: "showDialog()", badge: "essential"),
          TopicItem(name: "AlertDialog", badge: "essential"),
          TopicItem(name: "SimpleDialog", badge: "important"),
          TopicItem(name: "Dialog widget", badge: "important"),
          TopicItem(
              name: "showModalBottomSheet()", badge: "essential"),
          TopicItem(name: "showBottomSheet()", badge: "important"),
          TopicItem(name: "BottomSheet", badge: "important"),
          TopicItem(name: "SnackBar", badge: "essential"),
          TopicItem(
              name: "ScaffoldMessenger.showSnackBar()",
              badge: "essential"),
          TopicItem(name: "MaterialBanner", badge: "optional"),
          TopicItem(name: "Tooltip", badge: "important"),
          TopicItem(name: "ExpansionTile", badge: "essential"),
          TopicItem(name: "ExpansionPanelList", badge: "important"),
          TopicItem(name: "PopupMenuButton", badge: "important"),
          TopicItem(name: "showMenu()", badge: "optional"),
          TopicItem(
              name: "showCupertinoDialog()", badge: "optional"),
          TopicItem(
              name: "CupertinoAlertDialog", badge: "optional"),
          TopicItem(
              name: "CupertinoActionSheet", badge: "optional"),
          TopicItem(name: "OverlayEntry", badge: "optional"),
          TopicItem(name: "Overlay", badge: "optional"),
          TopicItem(name: "Banner", badge: "optional"),
        ]),
        TopicGroup(name: "List Tiles & Cards", topics: [
          TopicItem(name: "ListTile", badge: "essential"),
          TopicItem(
              name:
              "ListTile (leading, title, subtitle, trailing, onTap)",
              badge: "essential"),
          TopicItem(name: "Card", badge: "essential"),
          TopicItem(name: "Dismissible", badge: "important"),
          TopicItem(name: "Stepper", badge: "important"),
          TopicItem(name: "DataTable", badge: "important"),
          TopicItem(name: "PaginatedDataTable", badge: "optional"),
          TopicItem(name: "AboutListTile", badge: "optional"),
          TopicItem(name: "AboutDialog", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 9,
      title: "All Widgets — Animation Widgets",
      level: "intermediate",
      icon: "🎬",
      description:
      "Every animation widget and technique in Flutter, from implicit animations to explicit animations, hero animations, and custom animators.",
      groups: [
        TopicGroup(name: "Implicit Animations (Easy)", topics: [
          TopicItem(name: "AnimatedContainer", badge: "essential"),
          TopicItem(name: "AnimatedOpacity", badge: "essential"),
          TopicItem(name: "AnimatedPadding", badge: "important"),
          TopicItem(name: "AnimatedAlign", badge: "important"),
          TopicItem(name: "AnimatedPositioned", badge: "important"),
          TopicItem(
              name: "AnimatedDefaultTextStyle", badge: "important"),
          TopicItem(name: "AnimatedCrossFade", badge: "essential"),
          TopicItem(name: "AnimatedSwitcher", badge: "essential"),
          TopicItem(name: "AnimatedSize", badge: "important"),
          TopicItem(
              name: "AnimatedPhysicalModel", badge: "optional"),
          TopicItem(name: "AnimatedTheme", badge: "optional"),
          TopicItem(name: "AnimatedRotation", badge: "important"),
          TopicItem(name: "AnimatedScale", badge: "important"),
          TopicItem(name: "AnimatedSlide", badge: "important"),
          TopicItem(
              name: "AnimatedFractionallySizedBox", badge: "optional"),
          TopicItem(
              name: "TweenAnimationBuilder", badge: "essential"),
        ]),
        TopicGroup(name: "Explicit Animations (Advanced)", topics: [
          TopicItem(name: "AnimationController", badge: "essential"),
          TopicItem(
              name: "SingleTickerProviderStateMixin",
              badge: "essential"),
          TopicItem(
              name: "TickerProviderStateMixin", badge: "important"),
          TopicItem(
              name:
              "Tween (ColorTween, IntTween, SizeTween, etc.)",
              badge: "essential"),
          TopicItem(name: "CurvedAnimation", badge: "essential"),
          TopicItem(
              name:
              "Curves (easeIn, easeOut, bounceIn, elastic, etc.)",
              badge: "essential"),
          TopicItem(name: "Animation class", badge: "essential"),
          TopicItem(name: "AnimatedBuilder", badge: "essential"),
          TopicItem(name: "AnimatedWidget", badge: "important"),
          TopicItem(name: "FadeTransition", badge: "essential"),
          TopicItem(name: "SlideTransition", badge: "essential"),
          TopicItem(name: "ScaleTransition", badge: "important"),
          TopicItem(name: "RotationTransition", badge: "important"),
          TopicItem(name: "SizeTransition", badge: "important"),
          TopicItem(
              name: "DecoratedBoxTransition", badge: "optional"),
          TopicItem(
              name: "PositionedTransition", badge: "optional"),
          TopicItem(
              name: "RelativePositionedTransition",
              badge: "optional"),
          TopicItem(name: "AlignTransition", badge: "optional"),
          TopicItem(
              name: "DefaultTextStyleTransition", badge: "optional"),
          TopicItem(name: "AnimatedList", badge: "essential"),
          TopicItem(name: "AnimatedGrid", badge: "optional"),
          TopicItem(name: "Staggered animations", badge: "important"),
          TopicItem(name: "Chained animations", badge: "important"),
          TopicItem(
              name:
              "AnimationStatus (forward, reverse, completed, dismissed)",
              badge: "important"),
        ]),
        TopicGroup(name: "Hero & Page Transitions", topics: [
          TopicItem(name: "Hero widget", badge: "essential"),
          TopicItem(name: "Hero tag", badge: "essential"),
          TopicItem(
              name: "Hero flightShuttleBuilder", badge: "optional"),
          TopicItem(
              name: "Custom page route transitions",
              badge: "important"),
          TopicItem(
              name: "PageRouteBuilder with transitionsBuilder",
              badge: "important"),
          TopicItem(
              name: "Shared element transitions", badge: "optional"),
        ]),
        TopicGroup(name: "Advanced Animation Techniques", topics: [
          TopicItem(
              name: "Lottie animations (lottie package)",
              badge: "important"),
          TopicItem(name: "Rive animations", badge: "optional"),
          TopicItem(
              name:
              "Physics-based animations (SpringSimulation, GravitySimulation)",
              badge: "optional"),
          TopicItem(
              name: "CustomPainter animations", badge: "optional"),
          TopicItem(name: "Transform animations", badge: "important"),
          TopicItem(
              name: "Matrix4 transformations", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 10,
      title: "Gesture & Touch Handling",
      level: "intermediate",
      icon: "👆",
      description:
      "Handle all types of user gestures, touch events, and interactions in Flutter.",
      groups: [
        TopicGroup(name: "Gesture Widgets", topics: [
          TopicItem(
              name:
              "GestureDetector (onTap, onDoubleTap, onLongPress, onPan, onScale)",
              badge: "essential"),
          TopicItem(
              name: "InkWell (with ripple effect)", badge: "essential"),
          TopicItem(name: "InkResponse", badge: "optional"),
          TopicItem(name: "Draggable", badge: "important"),
          TopicItem(name: "DragTarget", badge: "important"),
          TopicItem(name: "LongPressDraggable", badge: "optional"),
          TopicItem(name: "Dismissible", badge: "essential"),
          TopicItem(
              name: "InteractiveViewer (pinch, zoom, pan)",
              badge: "important"),
          TopicItem(
              name: "Listener (raw pointer events)", badge: "optional"),
          TopicItem(name: "RawGestureDetector", badge: "optional"),
          TopicItem(name: "AbsorbPointer", badge: "important"),
          TopicItem(name: "IgnorePointer", badge: "important"),
          TopicItem(name: "MouseRegion", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 11,
      title: "State Management",
      level: "intermediate",
      icon: "🔄",
      description:
      "Master all state management approaches in Flutter — from simple setState to advanced reactive solutions.",
      groups: [
        TopicGroup(name: "Built-in State Management", topics: [
          TopicItem(name: "setState()", badge: "essential"),
          TopicItem(name: "InheritedWidget", badge: "important"),
          TopicItem(name: "InheritedNotifier", badge: "optional"),
          TopicItem(name: "ValueNotifier", badge: "essential"),
          TopicItem(
              name: "ValueListenableBuilder", badge: "essential"),
          TopicItem(name: "ChangeNotifier", badge: "essential"),
          TopicItem(name: "Listenable", badge: "important"),
          TopicItem(name: "StreamBuilder", badge: "essential"),
          TopicItem(name: "FutureBuilder", badge: "essential"),
          TopicItem(name: "NotificationListener", badge: "optional"),
        ]),
        TopicGroup(name: "Provider", topics: [
          TopicItem(name: "Provider package setup", badge: "essential"),
          TopicItem(
              name: "ChangeNotifierProvider", badge: "essential"),
          TopicItem(name: "Consumer widget", badge: "essential"),
          TopicItem(
              name: "Provider.of<T>(context)", badge: "essential"),
          TopicItem(name: "context.watch<T>()", badge: "essential"),
          TopicItem(name: "context.read<T>()", badge: "essential"),
          TopicItem(
              name: "context.select<T, R>()", badge: "important"),
          TopicItem(name: "MultiProvider", badge: "essential"),
          TopicItem(name: "ProxyProvider", badge: "important"),
          TopicItem(name: "FutureProvider", badge: "important"),
          TopicItem(name: "StreamProvider", badge: "important"),
          TopicItem(name: "Selector widget", badge: "optional"),
        ]),
        TopicGroup(name: "Riverpod", topics: [
          TopicItem(
              name: "Riverpod package setup", badge: "important"),
          TopicItem(name: "ProviderScope", badge: "important"),
          TopicItem(name: "Provider (read-only)", badge: "important"),
          TopicItem(name: "StateProvider", badge: "important"),
          TopicItem(
              name: "StateNotifierProvider", badge: "important"),
          TopicItem(name: "FutureProvider", badge: "important"),
          TopicItem(name: "StreamProvider", badge: "important"),
          TopicItem(
              name: "NotifierProvider (Riverpod 2.0)",
              badge: "important"),
          TopicItem(
              name: "AsyncNotifierProvider", badge: "important"),
          TopicItem(name: "ConsumerWidget", badge: "important"),
          TopicItem(
              name: "ConsumerStatefulWidget", badge: "important"),
          TopicItem(
              name: "ref.watch / ref.read / ref.listen",
              badge: "important"),
          TopicItem(
              name: "Provider modifiers (family, autoDispose)",
              badge: "important"),
          TopicItem(
              name: "Riverpod code generation", badge: "optional"),
        ]),
        TopicGroup(name: "BLoC / Cubit", topics: [
          TopicItem(name: "flutter_bloc package", badge: "important"),
          TopicItem(name: "Cubit class", badge: "important"),
          TopicItem(name: "BlocProvider", badge: "important"),
          TopicItem(name: "BlocBuilder", badge: "important"),
          TopicItem(name: "BlocListener", badge: "important"),
          TopicItem(name: "BlocConsumer", badge: "important"),
          TopicItem(name: "MultiBlocProvider", badge: "important"),
          TopicItem(
              name: "Bloc class (events + states)", badge: "important"),
          TopicItem(name: "Event classes", badge: "important"),
          TopicItem(name: "State classes", badge: "important"),
          TopicItem(name: "on<Event> handlers", badge: "important"),
          TopicItem(name: "emit()", badge: "important"),
          TopicItem(name: "BlocObserver", badge: "optional"),
          TopicItem(name: "RepositoryProvider", badge: "important"),
          TopicItem(
              name: "Equatable package with BLoC", badge: "important"),
          TopicItem(
              name: "freezed package with BLoC", badge: "optional"),
        ]),
        TopicGroup(name: "GetX", topics: [
          TopicItem(name: "GetX package setup", badge: "optional"),
          TopicItem(
              name: "Obx / GetxController", badge: "optional"),
          TopicItem(
              name: ".obs reactive variables", badge: "optional"),
          TopicItem(name: "Get.put / Get.find", badge: "optional"),
          TopicItem(name: "GetBuilder", badge: "optional"),
          TopicItem(
              name: "Get.to / Get.off / Get.offAll",
              badge: "optional"),
        ]),
        TopicGroup(name: "Other State Management", topics: [
          TopicItem(name: "MobX", badge: "optional"),
          TopicItem(name: "Redux", badge: "optional"),
          TopicItem(name: "Signals", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 12,
      title: "Networking & API Integration",
      level: "intermediate",
      icon: "🌐",
      description:
      "Learn to communicate with backend servers, consume REST APIs, handle JSON data, and manage network requests.",
      groups: [
        TopicGroup(name: "HTTP Networking", topics: [
          TopicItem(name: "http package", badge: "essential"),
          TopicItem(name: "GET request", badge: "essential"),
          TopicItem(name: "POST request", badge: "essential"),
          TopicItem(name: "PUT request", badge: "essential"),
          TopicItem(name: "PATCH request", badge: "important"),
          TopicItem(name: "DELETE request", badge: "essential"),
          TopicItem(name: "Request headers", badge: "essential"),
          TopicItem(name: "Query parameters", badge: "essential"),
          TopicItem(
              name: "Request body (JSON, form data)",
              badge: "essential"),
          TopicItem(
              name: "Multipart requests (file upload)",
              badge: "important"),
          TopicItem(name: "Status codes handling", badge: "essential"),
          TopicItem(name: "Timeout handling", badge: "important"),
        ]),
        TopicGroup(name: "Dio Package", topics: [
          TopicItem(name: "Dio package setup", badge: "essential"),
          TopicItem(name: "Dio base options", badge: "essential"),
          TopicItem(name: "Dio interceptors", badge: "essential"),
          TopicItem(name: "Request interceptor", badge: "important"),
          TopicItem(name: "Response interceptor", badge: "important"),
          TopicItem(name: "Error interceptor", badge: "important"),
          TopicItem(name: "Dio cancel token", badge: "important"),
          TopicItem(name: "Dio FormData", badge: "important"),
          TopicItem(
              name: "Download files with Dio", badge: "optional"),
          TopicItem(
              name: "Dio retry / retry interceptor", badge: "optional"),
        ]),
        TopicGroup(name: "JSON & Serialization", topics: [
          TopicItem(
              name: "dart:convert (jsonEncode, jsonDecode)",
              badge: "essential"),
          TopicItem(
              name: "Model classes (fromJson, toJson)",
              badge: "essential"),
          TopicItem(
              name: "json_serializable package", badge: "essential"),
          TopicItem(
              name: "@JsonSerializable annotation", badge: "important"),
          TopicItem(
              name: "build_runner for code generation",
              badge: "essential"),
          TopicItem(
              name: "freezed package for models", badge: "important"),
          TopicItem(name: "Nested JSON parsing", badge: "essential"),
          TopicItem(name: "JSON arrays parsing", badge: "essential"),
        ]),
        TopicGroup(name: "Advanced Networking", topics: [
          TopicItem(
              name: "REST API architecture", badge: "essential"),
          TopicItem(
              name: "GraphQL (graphql_flutter)", badge: "optional"),
          TopicItem(
              name: "WebSocket (web_socket_channel)",
              badge: "important"),
          TopicItem(
              name: "Socket.IO (socket_io_client)", badge: "optional"),
          TopicItem(name: "gRPC", badge: "optional"),
          TopicItem(
              name:
              "API authentication (Bearer tokens, API keys)",
              badge: "essential"),
          TopicItem(
              name: "Token refresh mechanism", badge: "important"),
          TopicItem(name: "Certificate pinning", badge: "optional"),
          TopicItem(
              name: "Caching network responses", badge: "important"),
          TopicItem(
              name: "Connectivity check (connectivity_plus)",
              badge: "important"),
          TopicItem(
              name: "Offline-first approach", badge: "optional"),
          TopicItem(
              name: "Pagination (offset, cursor)", badge: "essential"),
          TopicItem(
              name: "Infinite scroll implementation",
              badge: "essential"),
          TopicItem(name: "Pull to refresh", badge: "essential"),
          TopicItem(name: "Retry logic", badge: "important"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 13,
      title: "Local Storage & Database",
      level: "intermediate",
      icon: "💾",
      description:
      "Store data locally on the device using various persistence solutions available in Flutter.",
      groups: [
        TopicGroup(name: "Key-Value Storage", topics: [
          TopicItem(
              name: "SharedPreferences package", badge: "essential"),
          TopicItem(
              name: "Store strings, ints, bools, lists",
              badge: "essential"),
          TopicItem(
              name: "Read and write operations", badge: "essential"),
          TopicItem(
              name: "Remove and clear data", badge: "essential"),
          TopicItem(
              name: "flutter_secure_storage (encrypted)",
              badge: "essential"),
          TopicItem(
              name: "Hive package (NoSQL)", badge: "important"),
          TopicItem(name: "Hive TypeAdapters", badge: "important"),
          TopicItem(name: "Hive boxes", badge: "important"),
          TopicItem(name: "Hive code generation", badge: "optional"),
        ]),
        TopicGroup(name: "SQL Database", topics: [
          TopicItem(name: "sqflite package", badge: "essential"),
          TopicItem(
              name: "Database creation and versioning",
              badge: "essential"),
          TopicItem(
              name: "Create tables (CREATE TABLE)", badge: "essential"),
          TopicItem(name: "Insert data (INSERT)", badge: "essential"),
          TopicItem(
              name: "Query data (SELECT, WHERE, ORDER BY)",
              badge: "essential"),
          TopicItem(name: "Update data (UPDATE)", badge: "essential"),
          TopicItem(name: "Delete data (DELETE)", badge: "essential"),
          TopicItem(name: "Database migrations", badge: "important"),
          TopicItem(
              name: "Raw queries vs helper methods",
              badge: "important"),
          TopicItem(name: "Batch operations", badge: "optional"),
          TopicItem(name: "Transaction support", badge: "important"),
          TopicItem(
              name: "Drift (formerly Moor) package", badge: "optional"),
          TopicItem(name: "Floor package", badge: "optional"),
        ]),
        TopicGroup(name: "Other Storage", topics: [
          TopicItem(name: "Isar database", badge: "optional"),
          TopicItem(name: "ObjectBox", badge: "optional"),
          TopicItem(name: "Realm", badge: "optional"),
          TopicItem(
              name: "File storage (dart:io File)", badge: "important"),
          TopicItem(
              name:
              "Path provider (getApplicationDocumentsDirectory)",
              badge: "essential"),
          TopicItem(name: "Cache management", badge: "important"),
          TopicItem(
              name: "Image caching (cached_network_image)",
              badge: "important"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 14,
      title: "Firebase Integration",
      level: "advanced",
      icon: "🔥",
      description:
      "Complete Firebase integration for Flutter apps — authentication, database, storage, messaging, and more.",
      groups: [
        TopicGroup(name: "Firebase Setup", topics: [
          TopicItem(
              name: "Firebase Console project creation",
              badge: "essential"),
          TopicItem(
              name: "FlutterFire CLI (flutterfire configure)",
              badge: "essential"),
          TopicItem(name: "firebase_core package", badge: "essential"),
          TopicItem(
              name: "Firebase.initializeApp()", badge: "essential"),
          TopicItem(name: "firebase_options.dart", badge: "essential"),
          TopicItem(
              name: "Android configuration (google-services.json)",
              badge: "essential"),
          TopicItem(
              name: "iOS configuration (GoogleService-Info.plist)",
              badge: "important"),
        ]),
        TopicGroup(name: "Firebase Authentication", topics: [
          TopicItem(name: "firebase_auth package", badge: "essential"),
          TopicItem(
              name: "Email/Password sign up", badge: "essential"),
          TopicItem(
              name: "Email/Password sign in", badge: "essential"),
          TopicItem(name: "Sign out", badge: "essential"),
          TopicItem(
              name:
              "Auth state changes (authStateChanges stream)",
              badge: "essential"),
          TopicItem(
              name:
              "Current user (FirebaseAuth.instance.currentUser)",
              badge: "essential"),
          TopicItem(
              name: "Google Sign-In (google_sign_in)",
              badge: "essential"),
          TopicItem(
              name: "Apple Sign-In (sign_in_with_apple)",
              badge: "important"),
          TopicItem(name: "Facebook Login", badge: "optional"),
          TopicItem(
              name: "Phone number authentication", badge: "important"),
          TopicItem(
              name: "Anonymous authentication", badge: "optional"),
          TopicItem(name: "Email verification", badge: "important"),
          TopicItem(name: "Password reset", badge: "essential"),
          TopicItem(
              name: "Link multiple auth providers", badge: "optional"),
          TopicItem(
              name: "Custom claims / roles", badge: "optional"),
          TopicItem(
              name: "Firebase Auth error handling", badge: "essential"),
        ]),
        TopicGroup(name: "Cloud Firestore", topics: [
          TopicItem(
              name: "cloud_firestore package", badge: "essential"),
          TopicItem(
              name: "Collections and documents", badge: "essential"),
          TopicItem(
              name: "Add document (add, set)", badge: "essential"),
          TopicItem(name: "Read document (get)", badge: "essential"),
          TopicItem(
              name: "Update document (update)", badge: "essential"),
          TopicItem(
              name: "Delete document (delete)", badge: "essential"),
          TopicItem(
              name: "Real-time listeners (snapshots)",
              badge: "essential"),
          TopicItem(
              name:
              "Queries (where, orderBy, limit, startAfter)",
              badge: "essential"),
          TopicItem(name: "Compound queries", badge: "important"),
          TopicItem(name: "Subcollections", badge: "important"),
          TopicItem(name: "Batch writes", badge: "important"),
          TopicItem(name: "Transactions", badge: "important"),
          TopicItem(
              name: "Pagination with Firestore", badge: "important"),
          TopicItem(name: "Firestore indexes", badge: "important"),
          TopicItem(
              name: "Firestore security rules", badge: "essential"),
          TopicItem(name: "Offline persistence", badge: "important"),
          TopicItem(
              name:
              "FieldValue (increment, arrayUnion, arrayRemove, serverTimestamp)",
              badge: "important"),
        ]),
        TopicGroup(name: "Firebase Storage", topics: [
          TopicItem(
              name: "firebase_storage package", badge: "important"),
          TopicItem(name: "Upload files", badge: "important"),
          TopicItem(name: "Download URL", badge: "important"),
          TopicItem(name: "Delete files", badge: "important"),
          TopicItem(
              name: "Upload progress tracking", badge: "optional"),
          TopicItem(
              name: "Storage security rules", badge: "important"),
          TopicItem(
              name: "Image compression before upload",
              badge: "optional"),
        ]),
        TopicGroup(
            name: "Firebase Cloud Messaging (Push Notifications)",
            topics: [
              TopicItem(
                  name: "firebase_messaging package",
                  badge: "essential"),
              TopicItem(name: "FCM token", badge: "essential"),
              TopicItem(
                  name: "Foreground messages", badge: "essential"),
              TopicItem(
                  name: "Background messages", badge: "essential"),
              TopicItem(
                  name: "Notification channels (Android)",
                  badge: "important"),
              TopicItem(
                  name: "flutter_local_notifications package",
                  badge: "essential"),
              TopicItem(
                  name: "Notification tap handling",
                  badge: "important"),
              TopicItem(
                  name: "Topic subscriptions", badge: "optional"),
              TopicItem(
                  name: "Sending notifications from server",
                  badge: "important"),
            ]),
        TopicGroup(name: "Other Firebase Services", topics: [
          TopicItem(name: "Firebase Crashlytics", badge: "important"),
          TopicItem(name: "Firebase Analytics", badge: "important"),
          TopicItem(
              name: "Firebase Remote Config", badge: "optional"),
          TopicItem(
              name: "Firebase Dynamic Links / App Links",
              badge: "optional"),
          TopicItem(
              name: "Firebase Performance Monitoring",
              badge: "optional"),
          TopicItem(name: "Firebase App Check", badge: "optional"),
          TopicItem(name: "Cloud Functions", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 15,
      title: "Platform-Specific Features",
      level: "advanced",
      icon: "📲",
      description:
      "Access device features and platform-specific APIs — camera, location, permissions, sensors, and native platform channels.",
      groups: [
        TopicGroup(name: "Device Features", topics: [
          TopicItem(
              name: "Camera (camera package, image_picker)",
              badge: "essential"),
          TopicItem(
              name: "Image picker (gallery, camera)",
              badge: "essential"),
          TopicItem(
              name: "File picker (file_picker)", badge: "important"),
          TopicItem(
              name: "Location (geolocator, location)",
              badge: "essential"),
          TopicItem(
              name: "Google Maps (google_maps_flutter)",
              badge: "important"),
          TopicItem(
              name: "Permissions handling (permission_handler)",
              badge: "essential"),
          TopicItem(
              name:
              "Local notifications (flutter_local_notifications)",
              badge: "essential"),
          TopicItem(
              name: "Biometric authentication (local_auth)",
              badge: "important"),
          TopicItem(
              name: "Share content (share_plus)", badge: "important"),
          TopicItem(
              name: "URL launcher (url_launcher)", badge: "essential"),
          TopicItem(
              name: "App links / Deep links", badge: "important"),
          TopicItem(
              name: "In-app browser (webview_flutter)",
              badge: "important"),
          TopicItem(
              name:
              "QR code scanner (qr_code_scanner, mobile_scanner)",
              badge: "optional"),
          TopicItem(name: "Barcode scanner", badge: "optional"),
          TopicItem(
              name:
              "Bluetooth (flutter_bluetooth_serial, flutter_blue_plus)",
              badge: "optional"),
          TopicItem(name: "NFC", badge: "optional"),
          TopicItem(
              name: "Sensors (accelerometer, gyroscope)",
              badge: "optional"),
          TopicItem(
              name: "Battery info (battery_plus)", badge: "optional"),
          TopicItem(
              name: "Device info (device_info_plus)",
              badge: "important"),
          TopicItem(
              name: "Package info (package_info_plus)",
              badge: "important"),
          TopicItem(name: "Clipboard", badge: "important"),
          TopicItem(
              name: "Vibration / Haptic feedback", badge: "optional"),
          TopicItem(
              name: "Audio player (audioplayers, just_audio)",
              badge: "optional"),
          TopicItem(
              name: "Video player (video_player, chewie)",
              badge: "optional"),
          TopicItem(
              name: "PDF viewer (syncfusion_flutter_pdfviewer)",
              badge: "optional"),
          TopicItem(
              name: "Contacts (contacts_service)", badge: "optional"),
          TopicItem(name: "SMS", badge: "optional"),
          TopicItem(name: "Phone call", badge: "optional"),
        ]),
        TopicGroup(name: "Platform Channels", topics: [
          TopicItem(name: "MethodChannel", badge: "important"),
          TopicItem(name: "EventChannel", badge: "important"),
          TopicItem(name: "BasicMessageChannel", badge: "optional"),
          TopicItem(
              name: "Writing native Android code (Kotlin/Java)",
              badge: "important"),
          TopicItem(
              name: "Writing native iOS code (Swift/Objective-C)",
              badge: "important"),
          TopicItem(
              name:
              "Platform-specific UI (Platform.isAndroid, Platform.isIOS)",
              badge: "essential"),
          TopicItem(
              name: "Pigeon package (type-safe channels)",
              badge: "optional"),
          TopicItem(
              name: "FFI (Foreign Function Interface)",
              badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 16,
      title: "Responsive & Adaptive Design",
      level: "intermediate",
      icon: "📏",
      description:
      "Build apps that look great on all screen sizes — phones, tablets, desktops, and web.",
      groups: [
        TopicGroup(name: "Responsive Design", topics: [
          TopicItem(
              name:
              "MediaQuery (screen size, orientation, padding)",
              badge: "essential"),
          TopicItem(name: "LayoutBuilder", badge: "essential"),
          TopicItem(name: "OrientationBuilder", badge: "important"),
          TopicItem(
              name: "Flexible and Expanded", badge: "essential"),
          TopicItem(
              name: "FractionallySizedBox", badge: "important"),
          TopicItem(name: "AspectRatio", badge: "important"),
          TopicItem(name: "Wrap widget", badge: "essential"),
          TopicItem(
              name: "responsive_builder package", badge: "optional"),
          TopicItem(
              name: "flutter_screenutil package", badge: "optional"),
          TopicItem(name: "Breakpoints strategy", badge: "important"),
          TopicItem(name: "SafeArea widget", badge: "essential"),
          TopicItem(
              name: "Platform-adaptive widgets", badge: "important"),
          TopicItem(
              name: "Responsive text sizing", badge: "important"),
          TopicItem(name: "Responsive images", badge: "important"),
        ]),
        TopicGroup(name: "Multi-Platform Support", topics: [
          TopicItem(name: "Flutter for Web", badge: "important"),
          TopicItem(
              name: "Flutter for Desktop (Windows, macOS, Linux)",
              badge: "optional"),
          TopicItem(
              name: "Flutter for Embedded", badge: "optional"),
          TopicItem(
              name:
              "Platform checks (kIsWeb, Platform.isAndroid, etc.)",
              badge: "essential"),
          TopicItem(
              name:
              "Adaptive layouts (phone vs tablet vs desktop)",
              badge: "important"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 17,
      title: "Architecture & Design Patterns",
      level: "advanced",
      icon: "🏗",
      description:
      "Organize your code with proper architecture patterns and design principles for scalable, maintainable Flutter apps.",
      groups: [
        TopicGroup(name: "Folder Structure", topics: [
          TopicItem(
              name: "Feature-first structure", badge: "essential"),
          TopicItem(
              name: "Layer-first structure", badge: "important"),
          TopicItem(
              name: "Separating UI, logic, data layers",
              badge: "essential"),
          TopicItem(name: "Models folder", badge: "essential"),
          TopicItem(
              name: "Services / Repositories folder",
              badge: "essential"),
          TopicItem(
              name: "Widgets folder (reusable)", badge: "essential"),
          TopicItem(
              name: "Utils / Helpers folder", badge: "important"),
          TopicItem(name: "Constants folder", badge: "important"),
          TopicItem(name: "Theme folder", badge: "important"),
        ]),
        TopicGroup(name: "Architecture Patterns", topics: [
          TopicItem(
              name: "MVC (Model-View-Controller)", badge: "important"),
          TopicItem(
              name: "MVVM (Model-View-ViewModel)", badge: "essential"),
          TopicItem(name: "Clean Architecture", badge: "essential"),
          TopicItem(
              name:
              "Clean Architecture layers (Data, Domain, Presentation)",
              badge: "essential"),
          TopicItem(
              name: "Use Cases / Interactors", badge: "important"),
          TopicItem(name: "Repository Pattern", badge: "essential"),
          TopicItem(
              name: "Data Sources (Remote, Local)", badge: "essential"),
          TopicItem(name: "Dependency Injection", badge: "essential"),
          TopicItem(
              name: "get_it package (Service Locator)",
              badge: "essential"),
          TopicItem(name: "injectable package", badge: "optional"),
          TopicItem(name: "Singleton pattern", badge: "essential"),
          TopicItem(name: "Factory pattern", badge: "important"),
          TopicItem(name: "Observer pattern", badge: "important"),
          TopicItem(name: "Builder pattern", badge: "optional"),
          TopicItem(name: "SOLID principles", badge: "essential"),
          TopicItem(
              name: "DRY (Don't Repeat Yourself)", badge: "essential"),
          TopicItem(
              name: "KISS (Keep It Simple)", badge: "essential"),
          TopicItem(
              name: "Separation of Concerns", badge: "essential"),
        ]),
        TopicGroup(name: "Code Quality", topics: [
          TopicItem(
              name: "Linting rules (analysis_options.yaml)",
              badge: "essential"),
          TopicItem(
              name: "flutter_lints / very_good_analysis",
              badge: "important"),
          TopicItem(
              name: "Code formatting (dart format)",
              badge: "essential"),
          TopicItem(
              name: "Documentation comments (///)", badge: "important"),
          TopicItem(
              name: "Extension methods for clean code",
              badge: "important"),
          TopicItem(
              name: "Mixins for code reuse", badge: "important"),
          TopicItem(
              name: "Equatable for value equality",
              badge: "important"),
          TopicItem(
              name: "freezed for immutable models",
              badge: "important"),
          TopicItem(
              name: "dartz package (functional programming)",
              badge: "optional"),
          TopicItem(
              name: "Either type (Left/Right)", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 18,
      title: "Testing",
      level: "advanced",
      icon: "🧪",
      description:
      "Write comprehensive tests for your Flutter applications — unit tests, widget tests, and integration tests.",
      groups: [
        TopicGroup(name: "Unit Testing", topics: [
          TopicItem(name: "flutter_test package", badge: "essential"),
          TopicItem(name: "test() function", badge: "essential"),
          TopicItem(
              name: "group() for organizing tests", badge: "essential"),
          TopicItem(name: "expect() matchers", badge: "essential"),
          TopicItem(
              name: "setUp() and tearDown()", badge: "essential"),
          TopicItem(
              name: "setUpAll() and tearDownAll()", badge: "important"),
          TopicItem(name: "Testing models", badge: "essential"),
          TopicItem(
              name: "Testing functions / utilities",
              badge: "essential"),
          TopicItem(
              name: "Testing BLoC / Cubit (bloc_test)",
              badge: "important"),
          TopicItem(name: "Testing Provider", badge: "important"),
          TopicItem(
              name: "Mocking with mockito", badge: "essential"),
          TopicItem(
              name: "Mocking with mocktail", badge: "important"),
          TopicItem(
              name: "@GenerateMocks annotation", badge: "important"),
          TopicItem(
              name: "when / thenReturn / thenAnswer",
              badge: "essential"),
          TopicItem(name: "verify() calls", badge: "important"),
          TopicItem(name: "Testing async code", badge: "essential"),
          TopicItem(name: "Testing streams", badge: "important"),
          TopicItem(
              name: "Code coverage (flutter test --coverage)",
              badge: "important"),
          TopicItem(
              name: "fake vs mock vs stub", badge: "important"),
        ]),
        TopicGroup(name: "Widget Testing", topics: [
          TopicItem(
              name: "testWidgets() function", badge: "essential"),
          TopicItem(name: "WidgetTester", badge: "essential"),
          TopicItem(name: "pumpWidget()", badge: "essential"),
          TopicItem(
              name: "pump() and pumpAndSettle()", badge: "essential"),
          TopicItem(name: "find.byType()", badge: "essential"),
          TopicItem(name: "find.byKey()", badge: "essential"),
          TopicItem(name: "find.text()", badge: "essential"),
          TopicItem(name: "find.byWidget()", badge: "important"),
          TopicItem(name: "find.byIcon()", badge: "important"),
          TopicItem(name: "tester.tap()", badge: "essential"),
          TopicItem(name: "tester.enterText()", badge: "essential"),
          TopicItem(name: "tester.drag()", badge: "important"),
          TopicItem(name: "tester.longPress()", badge: "optional"),
          TopicItem(
              name:
              "expect(find.text('...'), findsOneWidget)",
              badge: "essential"),
          TopicItem(
              name: "findsNothing, findsWidgets, findsNWidgets",
              badge: "important"),
          TopicItem(
              name: "Golden tests (matchesGoldenFile)",
              badge: "optional"),
        ]),
        TopicGroup(name: "Integration Testing", topics: [
          TopicItem(
              name: "integration_test package", badge: "important"),
          TopicItem(
              name: "IntegrationTestWidgetsFlutterBinding",
              badge: "important"),
          TopicItem(name: "End-to-end testing", badge: "important"),
          TopicItem(
              name: "Testing navigation flows", badge: "important"),
          TopicItem(
              name: "Testing on real devices", badge: "optional"),
          TopicItem(name: "Patrol package", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 19,
      title: "Internationalization & Localization",
      level: "advanced",
      icon: "🌍",
      description:
      "Make your app available in multiple languages and adapt to different locales.",
      groups: [
        TopicGroup(name: "Localization", topics: [
          TopicItem(
              name: "flutter_localizations package",
              badge: "essential"),
          TopicItem(name: "intl package", badge: "essential"),
          TopicItem(name: "ARB files (.arb)", badge: "essential"),
          TopicItem(
              name: "flutter gen-l10n command", badge: "essential"),
          TopicItem(
              name: "AppLocalizations class", badge: "essential"),
          TopicItem(name: "supportedLocales", badge: "essential"),
          TopicItem(
              name: "localizationsDelegates", badge: "essential"),
          TopicItem(name: "Locale class", badge: "important"),
          TopicItem(
              name: "Plurals and gender support", badge: "important"),
          TopicItem(
              name: "RTL (Right-to-Left) support", badge: "important"),
          TopicItem(
              name: "Date formatting (DateFormat)", badge: "important"),
          TopicItem(
              name: "Number formatting (NumberFormat)",
              badge: "important"),
          TopicItem(name: "Currency formatting", badge: "optional"),
          TopicItem(
              name: "easy_localization package", badge: "optional"),
          TopicItem(
              name: "Dynamic locale switching", badge: "important"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 20,
      title: "Performance Optimization",
      level: "advanced",
      icon: "⚡",
      description:
      "Optimize your Flutter app for maximum performance, smooth animations, and minimal resource usage.",
      groups: [
        TopicGroup(name: "Widget Optimization", topics: [
          TopicItem(name: "const constructors", badge: "essential"),
          TopicItem(name: "const widgets", badge: "essential"),
          TopicItem(
              name: "Avoiding unnecessary rebuilds", badge: "essential"),
          TopicItem(name: "RepaintBoundary", badge: "important"),
          TopicItem(
              name: "Keys for efficient list updates",
              badge: "important"),
          TopicItem(
              name: "Splitting widgets into smaller widgets",
              badge: "essential"),
          TopicItem(
              name: "Using builder constructors (ListView.builder)",
              badge: "essential"),
          TopicItem(name: "Lazy loading", badge: "essential"),
          TopicItem(
              name: "Image optimization (resize, cache, compress)",
              badge: "important"),
          TopicItem(
              name:
              "Avoiding expensive operations in build()",
              badge: "essential"),
          TopicItem(
              name: "Using Visibility widget", badge: "optional"),
          TopicItem(
              name: "AutomaticKeepAlive for tab preservation",
              badge: "important"),
        ]),
        TopicGroup(name: "Performance Tools", topics: [
          TopicItem(name: "Flutter DevTools", badge: "essential"),
          TopicItem(name: "Performance Overlay", badge: "important"),
          TopicItem(
              name: "Widget rebuild tracker", badge: "important"),
          TopicItem(name: "Timeline view", badge: "important"),
          TopicItem(name: "Memory profiler", badge: "important"),
          TopicItem(name: "CPU profiler", badge: "optional"),
          TopicItem(name: "Network profiler", badge: "optional"),
          TopicItem(
              name:
              "App size analysis (flutter build --analyze-size)",
              badge: "optional"),
          TopicItem(
              name: "Profile mode testing", badge: "important"),
          TopicItem(
              name: "Release mode testing", badge: "important"),
          TopicItem(
              name: "Jank detection (frame rendering)",
              badge: "optional"),
        ]),
        TopicGroup(name: "Advanced Optimization", topics: [
          TopicItem(
              name: "Isolates for heavy computation",
              badge: "important"),
          TopicItem(name: "compute() function", badge: "important"),
          TopicItem(
              name: "Deferred loading / Lazy imports",
              badge: "optional"),
          TopicItem(name: "Tree shaking", badge: "optional"),
          TopicItem(name: "Code splitting", badge: "optional"),
          TopicItem(
              name:
              "Reduce app size (ProGuard, --split-debug-info)",
              badge: "important"),
          TopicItem(
              name: "Obfuscation (--obfuscate)", badge: "important"),
          TopicItem(name: "Deferred components", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 21,
      title: "CI/CD & DevOps",
      level: "advanced",
      icon: "🔧",
      description:
      "Automate building, testing, and deploying your Flutter apps using CI/CD pipelines.",
      groups: [
        TopicGroup(name: "Version Control", topics: [
          TopicItem(
              name: "Git basics (init, add, commit, push, pull)",
              badge: "essential"),
          TopicItem(
              name: "Git branching (feature, develop, main)",
              badge: "essential"),
          TopicItem(
              name: "Git merge and rebase", badge: "important"),
          TopicItem(
              name: "Git flow / GitHub flow", badge: "important"),
          TopicItem(
              name: "Pull requests / Code reviews",
              badge: "essential"),
          TopicItem(
              name: ".gitignore for Flutter", badge: "essential"),
          TopicItem(name: "Conventional commits", badge: "optional"),
        ]),
        TopicGroup(name: "CI/CD Tools", topics: [
          TopicItem(
              name: "GitHub Actions for Flutter", badge: "important"),
          TopicItem(name: "GitLab CI/CD", badge: "optional"),
          TopicItem(name: "Bitrise", badge: "optional"),
          TopicItem(name: "Codemagic", badge: "important"),
          TopicItem(name: "Fastlane", badge: "important"),
          TopicItem(
              name: "fastlane match (iOS certificates)",
              badge: "optional"),
          TopicItem(
              name: "Automated testing in CI", badge: "important"),
          TopicItem(name: "Automated builds", badge: "important"),
          TopicItem(
              name: "Code coverage reports", badge: "optional"),
          TopicItem(
              name: "Firebase App Distribution", badge: "important"),
        ]),
        TopicGroup(name: "App Configuration", topics: [
          TopicItem(
              name: "Flavors (dev, staging, production)",
              badge: "important"),
          TopicItem(name: "Environment variables", badge: "important"),
          TopicItem(
              name: "flutter_dotenv package", badge: "optional"),
          TopicItem(name: "Build configurations", badge: "important"),
          TopicItem(
              name: "App versioning (version, build number)",
              badge: "essential"),
          TopicItem(name: "Semantic versioning", badge: "important"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 22,
      title: "App Deployment & Publishing",
      level: "advanced",
      icon: "🚀",
      description:
      "Build, sign, and publish your Flutter app to Google Play Store and Apple App Store.",
      groups: [
        TopicGroup(name: "Android Deployment", topics: [
          TopicItem(name: "flutter build apk", badge: "essential"),
          TopicItem(
              name: "flutter build appbundle", badge: "essential"),
          TopicItem(
              name: "App signing (keystore generation)",
              badge: "essential"),
          TopicItem(name: "key.properties file", badge: "essential"),
          TopicItem(
              name: "build.gradle configuration", badge: "essential"),
          TopicItem(
              name: "App icon setup (flutter_launcher_icons)",
              badge: "essential"),
          TopicItem(
              name: "Splash screen (flutter_native_splash)",
              badge: "essential"),
          TopicItem(name: "Adaptive icons", badge: "important"),
          TopicItem(
              name: "ProGuard / R8 (code shrinking)",
              badge: "important"),
          TopicItem(name: "Multidex support", badge: "optional"),
          TopicItem(
              name: "Permissions in AndroidManifest.xml",
              badge: "essential"),
          TopicItem(
              name: "Google Play Console setup", badge: "essential"),
          TopicItem(
              name:
              "App listing (title, description, screenshots)",
              badge: "essential"),
          TopicItem(name: "Content rating", badge: "essential"),
          TopicItem(name: "Privacy policy", badge: "essential"),
          TopicItem(
              name: "Internal / Closed / Open testing tracks",
              badge: "important"),
          TopicItem(name: "Production release", badge: "essential"),
          TopicItem(
              name: "In-app updates (in_app_update)",
              badge: "optional"),
          TopicItem(
              name: "Google Play App Signing", badge: "important"),
        ]),
        TopicGroup(name: "iOS Deployment", topics: [
          TopicItem(name: "flutter build ios", badge: "essential"),
          TopicItem(name: "flutter build ipa", badge: "essential"),
          TopicItem(
              name: "Apple Developer account", badge: "essential"),
          TopicItem(
              name: "Xcode project configuration", badge: "essential"),
          TopicItem(name: "Bundle identifier", badge: "essential"),
          TopicItem(
              name: "Provisioning profiles", badge: "essential"),
          TopicItem(
              name: "Code signing certificates", badge: "essential"),
          TopicItem(
              name: "Info.plist configuration", badge: "essential"),
          TopicItem(name: "App Store Connect", badge: "essential"),
          TopicItem(name: "TestFlight", badge: "important"),
          TopicItem(
              name: "App review guidelines", badge: "essential"),
          TopicItem(
              name: "Privacy nutrition labels", badge: "essential"),
          TopicItem(name: "App icon for iOS", badge: "essential"),
          TopicItem(name: "Launch storyboard", badge: "important"),
          TopicItem(name: "Universal links", badge: "optional"),
        ]),
        TopicGroup(name: "Web Deployment", topics: [
          TopicItem(name: "flutter build web", badge: "optional"),
          TopicItem(name: "Firebase Hosting", badge: "optional"),
          TopicItem(
              name: "Vercel / Netlify deployment", badge: "optional"),
          TopicItem(name: "SEO considerations", badge: "optional"),
          TopicItem(name: "PWA support", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 23,
      title: "Security Best Practices",
      level: "expert",
      icon: "🔒",
      description:
      "Secure your Flutter app — protect data, secure communications, and follow security best practices.",
      groups: [
        TopicGroup(name: "App Security", topics: [
          TopicItem(
              name: "Secure storage (flutter_secure_storage)",
              badge: "essential"),
          TopicItem(
              name: "HTTPS / SSL pinning", badge: "important"),
          TopicItem(
              name: "Code obfuscation (--obfuscate)",
              badge: "important"),
          TopicItem(name: "API key protection", badge: "essential"),
          TopicItem(
              name: "Environment variables for secrets",
              badge: "essential"),
          TopicItem(
              name: "Token storage (secure, not shared prefs)",
              badge: "essential"),
          TopicItem(name: "JWT handling", badge: "important"),
          TopicItem(
              name: "Biometric authentication", badge: "important"),
          TopicItem(
              name: "Root/Jailbreak detection", badge: "optional"),
          TopicItem(
              name: "Input validation and sanitization",
              badge: "essential"),
          TopicItem(
              name: "SQL injection prevention", badge: "important"),
          TopicItem(
              name: "XSS prevention (web)", badge: "optional"),
          TopicItem(
              name: "Firebase security rules", badge: "essential"),
          TopicItem(
              name: "Network security config (Android)",
              badge: "optional"),
          TopicItem(
              name: "App Transport Security (iOS)", badge: "optional"),
          TopicItem(name: "ProGuard rules", badge: "optional"),
        ]),
      ],
    ),
    RoadmapSection(
      id: 24,
      title: "Advanced Topics & Extras",
      level: "expert",
      icon: "🎓",
      description:
      "Advanced Flutter topics including custom render objects, plugins development, app monetization, and emerging technologies.",
      groups: [
        TopicGroup(name: "Advanced Flutter", topics: [
          TopicItem(name: "Custom RenderObject", badge: "optional"),
          TopicItem(name: "Custom RenderBox", badge: "optional"),
          TopicItem(
              name: "Custom layout protocols", badge: "optional"),
          TopicItem(
              name: "Creating Flutter packages", badge: "important"),
          TopicItem(
              name: "Creating Flutter plugins", badge: "optional"),
          TopicItem(
              name: "Publishing packages to pub.dev",
              badge: "optional"),
          TopicItem(name: "Federated plugins", badge: "optional"),
          TopicItem(
              name: "Method channels implementation",
              badge: "important"),
          TopicItem(
              name: "Custom painters (advanced)", badge: "important"),
          TopicItem(name: "Shader programming", badge: "optional"),
          TopicItem(
              name: "Impeller rendering engine", badge: "optional"),
          TopicItem(
              name: "Flutter internals (how Flutter renders)",
              badge: "optional"),
        ]),
        TopicGroup(name: "App Monetization", topics: [
          TopicItem(
              name: "Google AdMob (google_mobile_ads)",
              badge: "optional"),
          TopicItem(name: "Banner ads", badge: "optional"),
          TopicItem(name: "Interstitial ads", badge: "optional"),
          TopicItem(name: "Rewarded ads", badge: "optional"),
          TopicItem(name: "Native ads", badge: "optional"),
          TopicItem(
              name: "In-app purchases (in_app_purchase)",
              badge: "optional"),
          TopicItem(name: "Subscription models", badge: "optional"),
          TopicItem(name: "RevenueCat package", badge: "optional"),
        ]),
        TopicGroup(name: "Emerging Technologies", topics: [
          TopicItem(
              name:
              "Machine Learning (tflite_flutter, google_ml_kit)",
              badge: "optional"),
          TopicItem(
              name: "Augmented Reality (ar_flutter_plugin)",
              badge: "optional"),
          TopicItem(name: "IoT with Flutter", badge: "optional"),
          TopicItem(
              name: "Flame (game engine)", badge: "optional"),
          TopicItem(
              name: "Flutter + Supabase", badge: "optional"),
          TopicItem(
              name: "Flutter + Appwrite", badge: "optional"),
          TopicItem(
              name: "Server-side Dart (shelf, dart_frog)",
              badge: "optional"),
          TopicItem(name: "Dart on backend", badge: "optional"),
        ]),
        TopicGroup(name: "Essential Packages to Know", topics: [
          TopicItem(name: "provider", badge: "essential"),
          TopicItem(name: "flutter_bloc", badge: "essential"),
          TopicItem(name: "riverpod", badge: "important"),
          TopicItem(name: "get_it", badge: "essential"),
          TopicItem(name: "dio", badge: "essential"),
          TopicItem(name: "go_router", badge: "essential"),
          TopicItem(name: "json_serializable", badge: "essential"),
          TopicItem(name: "freezed", badge: "important"),
          TopicItem(name: "equatable", badge: "important"),
          TopicItem(
              name: "cached_network_image", badge: "essential"),
          TopicItem(name: "flutter_svg", badge: "important"),
          TopicItem(name: "lottie", badge: "important"),
          TopicItem(name: "shimmer", badge: "important"),
          TopicItem(name: "intl", badge: "essential"),
          TopicItem(
              name: "flutter_launcher_icons", badge: "essential"),
          TopicItem(
              name: "flutter_native_splash", badge: "essential"),
          TopicItem(
              name: "permission_handler", badge: "essential"),
          TopicItem(name: "image_picker", badge: "essential"),
          TopicItem(name: "path_provider", badge: "essential"),
          TopicItem(name: "url_launcher", badge: "essential"),
          TopicItem(name: "share_plus", badge: "important"),
          TopicItem(name: "connectivity_plus", badge: "important"),
          TopicItem(name: "flutter_dotenv", badge: "optional"),
          TopicItem(name: "hive", badge: "important"),
          TopicItem(name: "sqflite", badge: "important"),
          TopicItem(
              name: "mockito / mocktail", badge: "important"),
          TopicItem(name: "build_runner", badge: "essential"),
        ]),
      ],
    ),
  ];
}