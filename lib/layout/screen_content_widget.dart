import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:beer_hunter/helper/simple_action.dart';
import 'package:beer_hunter/layout/spacer.dart';

class ScreenContentState {
  final ScreenContentType type;
  final String? exception;

  ScreenContentState._(this.type, this.exception);

  static ScreenContentState get loading =>
      ScreenContentState._(ScreenContentType.loading, null);

  static ScreenContentState get content =>
      ScreenContentState._(ScreenContentType.content, null);

  static ScreenContentState get empty =>
      ScreenContentState._(ScreenContentType.empty, null);

  static ScreenContentState get success =>
      ScreenContentState._(ScreenContentType.success, null);

  static ScreenContentState error(String? exception) =>
      ScreenContentState._(ScreenContentType.error, exception);

  @override
  bool operator ==(other) {
    if (other is! ScreenContentState) {
      return false;
    }
    return type == other.type;
  }

  @override
  int get hashCode {
    return type.hashCode;
  }
}

enum ScreenContentType { content, loading, error, empty, success }

class ScreenContentConfig {
  String successTitle = '*Success';
  String successDescription = '';
  String errorTitle = '*Error';
  String errorDescription = '';
  String emptyTitle = '*Nothing to see here';
  String emptyDescription = '';
  String errorButtonTitle = '*Try again';
  String emptyButtonTitle = '*Back';
  String successButtonTitle = '*Done';
  VoidCallback? errorButtonCallback;
  VoidCallback? emptyButtonCallback;
  VoidCallback? successButtonCallback;
}

extension MultipleScreenContent on Set<ScreenContentState> {
  ScreenContentState get combinedState {
    if (contains(ScreenContentState.loading)) {
      return ScreenContentState.loading;
    }
    if (contains(ScreenContentState.error(null))) {
      return firstWhere((element) => element.type == ScreenContentType.error);
    }
    if (contains(ScreenContentState.empty) && length == 1) {
      return ScreenContentState.empty;
    }
    return ScreenContentState.content;
  }
}

class ScreenContentWidget extends StatelessWidget {
  final Widget child;
  final ScreenContentState state;
  final ScreenContentConfig config;
  final bool isScrollable;

  const ScreenContentWidget({
    Key? key,
    required this.child,
    required this.state,
    required this.config,
    required this.isScrollable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget getContent() {
      VoidCallback? popRouteAction =
          (context.router.canPop() ? context.router.pop : null);

      switch (state.type) {
        case ScreenContentType.loading:
          return const Center(child: CircularProgressIndicator());

        case ScreenContentType.error:
          return _stateLayout(
            context,
            icon: const Icon(
              Icons.error,
              size: 60,
            ),
            title: config.errorTitle,
            description: config.errorDescription,
            button: SimpleAction.optionalActionWith(
              title: config.errorButtonTitle,
              action: config.errorButtonCallback,
            ),
          );
        case ScreenContentType.empty:
          return _stateLayout(
            context,
            icon: const Icon(
              Icons.announcement,
              size: 60,
            ),
            title: config.emptyTitle,
            description: config.emptyDescription,
            button: SimpleAction.optionalActionWith(
              title: config.emptyButtonTitle,
              action: config.emptyButtonCallback ?? popRouteAction,
            ),
          );
        case ScreenContentType.success:
          return _stateLayout(
            context,
            icon: const Icon(
              Icons.check,
              size: 60,
            ),
            title: config.successTitle,
            description: config.successDescription,
            button: SimpleAction.optionalActionWith(
              title: config.successButtonTitle,
              action: config.successButtonCallback,
            ),
          );
        default:
          return Container();
      }
    }

    Widget body() {
      Widget widget = Visibility(
        visible: state.type == ScreenContentType.content,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: child,
        ),
      );

      if (isScrollable) {
        return SingleChildScrollView(
          child: widget,
        );
      } else {
        return widget;
      }
    }

    final stack = Stack(
      alignment: Alignment.topCenter,
      children: [
        body(),
        getContent(),
      ],
    );

    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: stack);
  }

  Widget _stateLayout(
    BuildContext context, {
    required Widget? icon,
    required String title,
    required String description,
    SimpleAction? button,
  }) {
    List<Widget> children = [];

    if (icon != null) {
      children.addAll([
        icon,
        const SizedSpacer(),
      ]);
    }

    children.addAll(
      [
        Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge),
        const SizedSpacer(
          size: SpacerSize.small,
        ),
        Text(description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );

    if (button != null) {
      children.addAll([
        const SizedSpacer(),
        OutlinedButton(
          onPressed: button.onPressed,
          child: Text(button.title),
        ),
      ]);
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: children,
        ),
      ),
    );
  }
}
