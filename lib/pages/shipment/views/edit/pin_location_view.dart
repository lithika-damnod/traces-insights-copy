import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traces/pages/shipment/views/edit/edit_shipping_info_view.dart';
import 'package:traces/pages/shipment/views/edit/view_addresses_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/features/shipment/widgets/custom_elevated_button.dart';
import 'package:traces/features/shipment/widgets/circular_icon_button.dart';

class PinLocationView extends StatefulWidget {
  const PinLocationView({super.key});

  @override
  _PinLocationViewState createState() => _PinLocationViewState();
}

class _PinLocationViewState extends State<PinLocationView> {
  double _pinTop = 200; // Initial position inside the map
  double _pinLeft = 160; // Centered horizontally

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      showCloseButton: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// **Header Section**
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pin Your Address",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "SF Pro Text",
                  ),
                ),
                CircularIconButton(
                  icon: CupertinoIcons.arrow_uturn_left,
                  iconColor: Color(0xFF8E8E93),
                  backgroundColor: Color(0xFF1C1C1E),
                  onPressed: () {
                    final modal = context
                        .findAncestorStateOfType<ModalBottomSheetState>();
                    modal?.navigateTo(EditShippingInformationView());
                  },
                ),
              ],
            ),
          ),

          /// **Subtitle**
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Make sure your pinned location is accurate and within the service area.",
              style: TextStyle(
                fontSize: 15.3,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.6),
                fontFamily: "SF Pro Text",
              ),
            ),
          ),
          SizedBox(height: 20.0),

          /// **Search Bar**
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              cursorColor: Colors.white70,
              decoration: InputDecoration(
                isCollapsed: true,
                filled: true,
                fillColor: const Color.fromRGBO(118, 118, 128, 0.24),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search Location",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  letterSpacing: -0.408,
                  color: Color.fromRGBO(235, 235, 245, 0.60),
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 5.0),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Color.fromRGBO(235, 235, 245, 0.60),
                    size: 20,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                letterSpacing: -0.408,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 17.0),

          /// **Scrollable Map Preview with Draggable Pin**
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: 707,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black12, // Optional background color
                ),
                child: Stack(
                  children: [
                    /// **Map Image**
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/icons/map_pin.png', // Replace with actual map asset
                        width: double.infinity,
                        height: 707,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// **Draggable Pin**
                    Positioned(
                      top: _pinTop,
                      left: _pinLeft,
                      child: Draggable(
                        feedback: SizedBox(
                          child: SvgPicture.asset(
                            'assets/icons/pin.svg', // Replace with your actual path
                            fit: BoxFit.contain,
                          ),
                        ),
                        childWhenDragging:
                            Container(), // Hide the original pin while dragging
                        child: SizedBox(
                          child: SvgPicture.asset(
                            'assets/icons/pin.svg', // Replace with your actual path
                            fit: BoxFit.contain,
                          ),
                        ),
                        onDragEnd: (details) {
                          final RenderBox containerBox =
                              context.findRenderObject() as RenderBox;
                          final Offset containerOffset =
                              containerBox.localToGlobal(Offset.zero);

                          // Calculate the new position relative to the container
                          double newTop =
                              details.offset.dy - containerOffset.dy;
                          double newLeft =
                              details.offset.dx - containerOffset.dx;

                          // Clamp the new position to stay within the container bounds
                          setState(() {
                            _pinTop = newTop.clamp(0.0, 500);
                            _pinLeft = newLeft.clamp(
                                0.0, MediaQuery.of(context).size.width);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),

          /// **Save Changes Button**
          CustomElevatedButton(
            text: "Save Changes",
            onPressed: () {
              final modal =
                  context.findAncestorStateOfType<ModalBottomSheetState>();
              modal?.navigateTo(ViewAddressesView());
            },
          ),
        ],
      ),
    );
  }
}
