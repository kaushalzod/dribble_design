import 'package:flutter/material.dart';

class AnimatedIconsPyramid extends StatefulWidget {
  const AnimatedIconsPyramid({super.key});

  @override
  State<AnimatedIconsPyramid> createState() => _AnimatedIconsPyramidState();
}

class _AnimatedIconsPyramidState extends State<AnimatedIconsPyramid> {
  final List<String> logos = [
    "figma.png",
    "playstation.png",
    "spotify.png",
    "youtube.png",
    "dribble.png"
  ];

  // Starting visual positions
  List<int> positions = [0, 1, 2, 3, 4];
  final double horizontalOffset = 55.0;

  // Scaling mapping to positions
  final Map<int, double> scaleMapping = {
    0: 0.8,
    1: 0.9,
    2: 1.0,
    3: 0.9,
    4: 0.8,
  };

  final Duration animationDuration = const Duration(milliseconds: 300);

  // Rotate positions: each element moves left (position - 1) with 0 becoming
  // to 4.
  void rotateLeft() {
    setState(() {
      positions = positions.map((p) => (p - 1) < 0 ? 4 : p - 1).toList();
    });
  }

  // Custom z-order: assign a rank based on visual position.
  // Positions 0 and 4 (edges) get rank 0 (bottom),
  // positions 1 and 3 get rank 1 (middle),
  // and position 2 gets rank 2 (top).
  int zRank(int pos) {
    if (pos == 0 || pos == 4) return 0;
    if (pos == 1 || pos == 3) return 1;
    if (pos == 2) return 2;
    return 0;
  }

  Color getShadowColor() {
    return switch (positions.first) {
      0 => Colors.green,
      1 => Colors.orangeAccent,
      2 => Colors.purple,
      3 => Colors.pink,
      4 => Colors.red,
      _ => Colors.red
    };
  }

  // Calculate layering order based on zRank so that lower ranked items are drawn first.
  List<int> getLayeringOrder() {
    List<int> indices = List.generate(logos.length, (i) => i);
    indices.sort((a, b) {
      int rankA = zRank(positions[a]);
      int rankB = zRank(positions[b]);
      return rankA.compareTo(rankB);
    });
    return indices;
  }

  @override
  Widget build(BuildContext context) {
    // Finds the stacking order using the custom layering.
    List<int> layeringOrder = getLayeringOrder();

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx < 0) {
          rotateLeft();
        }
      },
      child: SizedBox(
        height: 120,
        width: 320,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: getShadowColor().withAlpha(120),
                    blurRadius: 80,
                    spreadRadius: 0,
                  )
                ]),
              ),
            ),
            Center(
              child: SizedBox(
                height: 60,
                width: 300,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: layeringOrder.map((index) {
                    int pos = positions[index];
                    double left = pos * horizontalOffset;
                    double scale = scaleMapping[pos]!;
                    return AnimatedPositioned(
                      key: ValueKey(logos[index]),
                      duration: animationDuration,
                      curve: Curves.easeInOut,
                      left: left,
                      top: 0,
                      child: AnimatedScale(
                        scale: scale,
                        duration: animationDuration,
                        curve: Curves.easeInOut,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                spreadRadius: 3,
                                color: Colors.black12,
                              ),
                            ],
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/png/${logos[index]}"),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
