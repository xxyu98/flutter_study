import 'package:flutter/material.dart';

class CustomToast {
  static void showToast(
    BuildContext context,
    String message, {
    bool isSuccess = true,
    VoidCallback? onClosed,
  }) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: _buildToastContent(context, message, isSuccess),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 1), () {
      overlayEntry.remove();
      if (onClosed != null) {
        onClosed();
      }
    });
  }

  static Widget _buildToastContent(
      BuildContext context, String message, bool isSuccess) {
    return Container(
      width: 310,
      height: 210,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/toast_header.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(isSuccess
                    ? 'assets/images/toast_success.png'
                    : 'assets/images/toast_error.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 21),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(50, 50, 51, 1),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
