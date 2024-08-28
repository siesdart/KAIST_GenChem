import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  const ActivityTile({
    required this.leading,
    required this.title,
    this.onTap,
    super.key,
  });

  final Widget leading;
  final Widget title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: const Color(0xFFF8F8F8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              AnimatedDefaultTextStyle(
                style: theme.textTheme.labelSmall!
                    .copyWith(color: theme.colorScheme.onSurfaceVariant),
                duration: kThemeChangeDuration,
                child: leading,
              ),
              const SizedBox(width: 8),
              DefaultTextStyle(
                style: theme.textTheme.bodyMedium!,
                child: title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
