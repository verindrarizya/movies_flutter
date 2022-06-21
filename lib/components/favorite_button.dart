import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: CircleAvatar(
        backgroundColor: Colors.black26.withOpacity(0.4),
        radius: 20,
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: const Color(0xffFF5740),
        ),
      ),
    );
  }
}
