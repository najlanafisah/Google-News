import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class LoadingShimmerTopHeadlines extends StatefulWidget {
  const LoadingShimmerTopHeadlines({super.key});

  @override
  State<LoadingShimmerTopHeadlines> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmerTopHeadlines>
    with SingleTickerProviderStateMixin {
  // ini membantu user yang hpnya buriq biar ga terlalu patah2 pas loading
  late AnimationController
  _animationController; // late itu kurang lebih mirip sama future tapi bedanya ini buat variable bukan buat class
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // source shimmer
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Container(
                              height: 12,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.divider,
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 8),

                        // title shimmer
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // biar dia mojok ke kiri
                              children: [
                                Container(
                                  height: 16,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.divider,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 16,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.divider,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 10),
                  // image shimmer
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.divider,
                              AppColors.divider.withValues(alpha: 0.5),
                              AppColors.divider,
                            ],
                            stops: [
                              // ini biar si loadingnya muter2
                              0.0,
                              0.5,
                              1.0,
                            ],
                            transform: GradientRotation(
                              _animation.value * 3.14159,
                            ), // ini angka phi (yang linkaran2 itu lohh 3,14 dan phi)
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    height: 12,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.divider,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
