import 'package:flutter/material.dart';
import 'package:pedifacil/shared/themes/app_colors.dart';
import 'package:pedifacil/shared/themes/app_text_styles.dart';

class PriceBar extends StatefulWidget {
  final bool visible;
  final double price;
  const PriceBar({Key? key, required this.price, required this.visible})
      : super(key: key);

  @override
  _PriceBarState createState() => _PriceBarState();
}

class _PriceBarState extends State<PriceBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(0, 1),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  ));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.visible)
      _controller.forward();
    else
      _controller.reverse();
    return Positioned(
      bottom: 0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.primary, width: 3.0),
            ),
          ),
          height: 65,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: AppTextStyles.cardTitle,
                      ),
                      Text(
                        "R\$ ${widget.price.toStringAsFixed(2).replaceAll(".", ",")}",
                        style: AppTextStyles.descriptionText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.visible ? () {} : null,
                    child: Text(
                      'Continuar',
                      style: AppTextStyles.button,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
