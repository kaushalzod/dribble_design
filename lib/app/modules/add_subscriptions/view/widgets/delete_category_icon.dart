import 'package:flutter/material.dart';

class DeleteCategoryIcon extends StatelessWidget {
  const DeleteCategoryIcon({super.key, this.onDelete});
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            action: SnackBarAction(
              label: "Delete",
              onPressed: () {
                onDelete?.call();
              },
            ),
            behavior: SnackBarBehavior.floating,
            content: Text(
              "Are you sure? You want to delete this category.",
            ),
            showCloseIcon: true,
          ),
        );
      },
      icon: Icon(Icons.delete, color: Colors.white),
      style: IconButton.styleFrom(
        backgroundColor: Color(0xff28272d),
      ),
    );
  }
}
