import 'package:flutter/material.dart';

class RightSidePanel extends StatefulWidget {
  const RightSidePanel({super.key});

  @override
  State<RightSidePanel> createState() => _RightSidePanelState();
}

class _RightSidePanelState extends State<RightSidePanel> {
  @override
  Widget build(BuildContext context) {
    final double panelWidth = MediaQuery.of(context).size.width * 0.5;

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Material(
        color: Color(0x00000091),
        child: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: panelWidth,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(-4, 0),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wallpaper Setup',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Configure your wallpaper settings and enable auto-rotation',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 26),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Activate Wallpaper',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Set the selected wallpaper as your desktop background',
                                  style: TextStyle(
                                    color: Color(0xFF9C9C9C),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFC8FFBD),
                                borderRadius: BorderRadius.circular(38),
                              ),
                              child: Row(
                                spacing: 10,
                                children: [
                                  Icon(
                                    Icons.check_circle_sharp,
                                    color: Color(0xFF1BA400),
                                    size: 19,
                                  ),
                                  Text(
                                    'Activated',
                                    style: TextStyle(color: Color(0xFF1BA400)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 26),
                      Text(
                        'Display mode',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4),
                      _radioListTile(
                        value: 'Fit',
                        label: 'Scale to fit without cropping',
                      ),
                      SizedBox(height: 4),
                      _radioListTile(
                        value: 'Fill',
                        label: 'Scale to fill the entire screen',
                      ),
                      SizedBox(height: 4),
                      _radioListTile(
                        value: 'Stretch',
                        label: 'Stretch to fill the screen',
                      ),
                      SizedBox(height: 4),
                      _radioListTile(
                        value: 'Tile',
                        label: 'Repeat the image to fill the screen',
                      ),
                      SizedBox(height: 26),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Auto - Rotation',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Automatically change your wallpaper at regular intervals',
                                  style: TextStyle(
                                    color: Color(0xFF9C9C9C),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                              value: true,
                              padding: EdgeInsets.zero,
                              activeTrackColor: Color(0xFFFBB03B),
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 26),
                      Text(
                        'Advanced Settings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4),
                      _radioListTile(
                        value: 'Lock Wallpaper',
                        label: 'Prevent accidental changes',
                        radius: 7,
                      ),
                      SizedBox(height: 4),
                      _radioListTile(
                        value: 'Sync Across Devices',
                        label: 'Keep wallpaper consistent on all devices',
                        radius: 7,
                      ),
                      SizedBox(height: 26,),
                      Row(
                        spacing: 20,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F8F8),
                              borderRadius: BorderRadius.circular(21),
                              border: Border.all(color: Color(0xFFDFDFDF)),
                            ),
                            child: Text('Cancel'),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                              color: Color(0xFFFBB03B),
                            ),
                            child: Text(
                              'Save Settings',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _radioListTile({
    required String value,
    required String label,
    double? radius,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 24),
              border: Border.all(color: Color(0xFFD8D8D8), width: 1),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                label,
                style: TextStyle(fontSize: 14, color: Color(0xFF9C9C9C)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
