import 'package:beer_hunter/usecase/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewmodel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final T model;
  final Widget? child;
  final Function(T) onModelReady;

  const BaseView({
    Key? key,
    required this.builder,
    required this.model,
    this.child,
    required this.onModelReady,
  }) : super(key: key);

  @override
  State createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseViewmodel> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.model;

    widget.onModelReady(model);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
