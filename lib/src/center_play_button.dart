import 'dart:ui';

import 'package:chewie/src/animated_play_pause.dart';
import 'package:flutter/material.dart';

class CenterPlayButton extends StatelessWidget {
  const CenterPlayButton({
    Key? key,
    required this.backgroundColor,
    this.iconColor,
    required this.show,
    required this.isPlaying,
    required this.isFinished,
    this.onPressed,
  }) : super(key: key);

  final Color backgroundColor;
  final Color? iconColor;
  final bool show;
  final bool isPlaying;
  final bool isFinished;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Center(
        child: UnconstrainedBox(
          child: AnimatedOpacity(
            opacity: show ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              // Always set the iconSize on the IconButton, not on the Icon itself:
              // https://github.com/flutter/flutter/issues/52980
              child:
              GestureDetector(
                onTap: onPressed,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(48 * 100),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Container(
                          padding: const EdgeInsetsDirectional.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child:
                          isFinished
                              ? const Icon(Icons.replay
                              ,
                            color: Color(0xFFCB0107),

                          )
                              : AnimatedPlayPause(
                                  color: iconColor,
                                  playing: isPlaying,
                                )
                      ),
                    ),
                  ),
                ),
              )
              // IconButton(
              //   iconSize: 32,
              //   // padding: const EdgeInsets.all(12.0),
              //   icon: isFinished
              //       ? Icon(Icons.replay, color: iconColor)
              //       : AnimatedPlayPause(
              //           color: iconColor,
              //           playing: isPlaying,
              //         ),
              //   onPressed: onPressed,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
