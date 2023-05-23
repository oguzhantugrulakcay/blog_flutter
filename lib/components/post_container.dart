import 'package:blog_flutter/components/text_field_container.dart';
import 'package:blog_flutter/constraints.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostContainer extends StatelessWidget {
  static Color _likeColor = Colors.grey;
  final String postUser;
  final String title;
  final String body;
  final int likeCount;
  final int commentCount;
  final DateTime createdAt;
  final bool isLiked;
  static DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');
  const PostContainer(
      {Key? key,
      required this.title,
      required this.body,
      required this.likeCount,
      required this.commentCount,
      required this.createdAt,
      this.isLiked = false,
      required this.postUser})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isLiked) {
      _likeColor = kPrimaryColor;
    }
    return TextFieldContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                postUser,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Text(
            body,
            style: const TextStyle(color: kPrimaryColor, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    likeCount.toString(),
                    style: TextStyle(color: _likeColor),
                  ),
                  IconButton(
                      onPressed: () {
                        if (_likeColor == kPrimaryColor) {
                          _likeColor = Colors.grey;
                        } else {
                          _likeColor = kPrimaryColor;
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: _likeColor,
                      )),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment_outlined,
                    color: Colors.grey,
                  )),
              const Spacer(),
              Text(
                dateFormat.format(createdAt),
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
              ),
            ],
          )
        ],
      ),
    );
  }
}
