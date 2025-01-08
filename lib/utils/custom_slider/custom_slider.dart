import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleepsoundscapeapp/view_model/volume_slider_provider.dart';

import 'custom_slider_thimb.dart';
import 'custom_track_shape.dart';

class VolumeSlider extends StatelessWidget {
  final String soundName;
  final Color color;
 // final IconData icon;

  const VolumeSlider(
      {super.key,
      required this.soundName,
      required this.color,
    //  required this.icon
      });

  @override
  Widget build(BuildContext context) {
    final sliderProvider = context.watch<VolumeSliderProvider>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 35,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 22,elevation: 10),
                    // CustomSliderThumbCircle(
                    //   thumbRadius: 25,
                    //   thumbIcon: icon,
                    // ),

                    trackShape: CustomTrackShape(),
                    activeTrackColor: color,
                    inactiveTrackColor: Color(0xFF28046B),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    thumbColor: color,
                  ),
                  child: Slider(
                    value: sliderProvider.sliderValue,
                    max: 100,
                    min: 0,
                    onChanged: (value){
                      sliderProvider.onChanges(value);
                    },
                  ),
                ),
                Positioned(
                  left: 20,
                  //(sliderProvider.sliderValue / 100) *
                     // MediaQuery.of(context).size.width *
                   //   0.65, // Adjust based on slider width
                  child: Text(soundName,
                  style: Theme.of(context).textTheme.bodyMedium?.
                    copyWith(fontWeight: FontWeight.w500,color: Colors.white),),
                )
              ],
          )
        ],
      ),
    );
  }
}
