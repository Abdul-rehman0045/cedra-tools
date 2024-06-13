import 'package:cedratools/helper/assets.dart';
import 'package:cedratools/helper/base_helper.dart';
import 'package:cedratools/helper/colors.dart';
import 'package:cedratools/helper/hide_keypad_on_outside_tap.dart';
import 'package:cedratools/widgets/custom_elevated_button.dart';
import 'package:cedratools/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    final marker = Marker(
      markerId: MarkerId('1'),
      position: BaseHelper.coordinates,
      infoWindow: InfoWindow(
        title: 'CT Store',
        snippet: BaseHelper.address,
      ),
    );
    markers[MarkerId('1')] = marker;
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyPadOnOutsideTap(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Leave us your message",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: Column(
                  children: [
                    CustomTextFromField(hintText: "Email"),
                    SizedBox(height: 15.h),
                    CustomTextFromField(
                      hintText: "Message",
                      maxLines: 5,
                      maxLength: 300,
                    ),
                    SizedBox(height: 6.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomElevatedButton(
                        text: "Send",
                        backgroundColor: kElevatedButtonBlackBg,
                        width: 160.w,
                        height: 45.w,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () {
                        BaseHelper.launchWhatsApp(BaseHelper.phoneNumber.replaceAll(" ", "")); // it removes the space between the phone number
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.whatsappIcon,
                            color: kDescriptionGreyText,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "${BaseHelper.phoneNumber}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    GestureDetector(
                      onTap: () {
                        BaseHelper.launchEmail(BaseHelper.email);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 30.r,
                            color: kDescriptionGreyText,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "${BaseHelper.email}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "follow us",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: kDescriptionGreyText,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BaseHelper.launchURL(BaseHelper.facebookUrl);
                          },
                          icon: SvgPicture.asset(Assets.facebookIcon),
                        ),
                        IconButton(
                          onPressed: () {
                            BaseHelper.launchURL(BaseHelper.twitterUrl);
                          },
                          icon: SvgPicture.asset(Assets.twitterIcon),
                        ),
                        IconButton(
                          onPressed: () {
                            BaseHelper.launchURL(BaseHelper.instagramUrl);
                          },
                          icon: SvgPicture.asset(Assets.instaIcon),
                        ),
                        IconButton(
                          onPressed: () {
                            BaseHelper.launchURL(BaseHelper.youtubeUrl);
                          },
                          icon: SvgPicture.asset(Assets.youtubeIcon),
                        ),
                      ],
                    ),
                    Container(
                      height: 300.h,
                      child: GoogleMap(
                        // myLocationEnabled: true,
                        mapToolbarEnabled: true,
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: false,
                        mapType: MapType.normal,
                        markers: markers.values.toSet(),
                        initialCameraPosition: CameraPosition(target: BaseHelper.coordinates, zoom: 16),
                        onMapCreated: (GoogleMapController controller) async {
                          controller.setMapStyle(await rootBundle.loadString('assets/map_style.txt')).then((value) => setState(() {}));
                        },
                        //* uncomment to enable scroll
                        // gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                        //   new Factory<OneSequenceGestureRecognizer>(
                        //     () => new EagerGestureRecognizer(),
                        //   ),
                        // ].toSet(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
