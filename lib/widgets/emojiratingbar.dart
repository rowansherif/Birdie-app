import 'package:flutter/material.dart';

class EmojiRatingBar extends StatefulWidget {
  const EmojiRatingBar({super.key});

  @override
  State<EmojiRatingBar> createState() => _EmojiRatingBarState();
}

class _EmojiRatingBarState extends State<EmojiRatingBar> {
  

 int _selectedRating = 0;

  final List<String> _emojis = ['😞', '☹️', '😐', '🙂', '😀'];
  void _onEmojiTap(int index) {
    setState(() {
      _selectedRating = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_emojis.length, (index) {
            return GestureDetector(
              onTap: () => _onEmojiTap(index),
              child: Padding(
                padding: const EdgeInsets.all(7.5),
                child: Text(
                  _emojis[index],
                  style: TextStyle(
                    fontSize: 40,
                    color: _selectedRating >= index + 1
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      
    );
  }
}