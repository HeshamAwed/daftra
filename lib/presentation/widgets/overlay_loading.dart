import 'package:daftra/presentation/resources/colors.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;


class LoadingOverlay {
  OverlayEntry? _overlayEntry;

  LoadingOverlay();

  void show(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
        // replace with your own layout
        builder: (context) =>  ColoredBox(
          color:  const Color.fromARGB(255, 240, 244, 248).withOpacity(0.5),
          child: const Center(
            child: CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation(colorAccent),
            ),
          ),
        ),
      );
      Overlay.of(context)!.insert(_overlayEntry!);
    }
  }

  void hide() {
    if (_overlayEntry != null) {
    //  print("Hesam");
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}
