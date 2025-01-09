import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleepsoundscapeapp/view_model/volume_slider_provider.dart';

import 'custom_slider_thimb.dart';
import 'custom_track_shape.dart';

class VolumeSlider extends StatelessWidget {
  final String soundName;
  final Color color;
  final double sliderValue;
  final ValueChanged<double> onChanged;

  const VolumeSlider({
    super.key,
    required this.soundName,
    required this.color,
    required this.sliderValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final sliderProvider = context.watch<VolumeSliderProvider>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack(
          //   alignment: Alignment.centerLeft,
          //     children: [
          Text(soundName,
            style: Theme.of(context).textTheme.bodyMedium?.
            copyWith(fontWeight: FontWeight.w500,color: Colors.white),),
                SizedBox(height: 10.h,),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 35,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 22,elevation: 10),
                    // CustomSliderThumbCircle(
                    //   thumbRadius: 25,
                    //   thumbIcon: icon,
                    // ),

                    trackShape: CustomTrackShape(),
                    activeTrackColor: Color(0xFF5C19B7),
                    inactiveTrackColor: const Color(0xFF28046B),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                    thumbColor: color,
                  ),
                  child: Slider(
                    value: sliderValue,
                    max: 100,
                    min: 0,
                    onChanged: onChanged,
                  ),
                ),
                // Positioned(
                //   left: 20,
                //   //(sliderProvider.sliderValue / 100) *
                //      // MediaQuery.of(context).size.width *
                //    //   0.65, // Adjust based on slider width
                //   child: Text(soundName,
                //   style: Theme.of(context).textTheme.bodyMedium?.
                //     copyWith(fontWeight: FontWeight.w500,color: Colors.white),),
                // )
          //     ],
          // )
        ],
      ),
    );
  }
}
