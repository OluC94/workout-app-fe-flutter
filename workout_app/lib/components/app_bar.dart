import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.leading,
  }) : super(key: key);

  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 25 / 2.5),
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Text(
                    title,
                    style:
                        const TextStyle(color: Colors.blueGrey, fontSize: 25),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading ??
                      Transform.translate(
                        offset: const Offset(-14, 0),
                        child: const BackButton(
                          color: Colors.blueGrey,
                        ),
                      )
                ],
              )
            ],
          )),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
