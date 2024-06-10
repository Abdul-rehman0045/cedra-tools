import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/view_models/loader_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Loader extends ConsumerWidget {
  Loader({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watchRef = ref.watch(loaderViewModel);
    return Stack(
      children: [
        child,
        watchRef.isLoading
        ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.black45),
            child: Center(
                child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            )),
          )
        : Container(),
      ],
    );
  }
}
