import 'package:flutter/material.dart';

import '../../../custom_widgets/custom_elevated_button.dart';

class AddToFavButton extends CustomElevatedButton {
  AddToFavButton({required VoidCallback onPressed})
      : super(
          // key: key,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(),
              Text(
                'Add to Favorites',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              Icon(Icons.favorite),
            ],
          ),
          height: 56.0,
        );
}
