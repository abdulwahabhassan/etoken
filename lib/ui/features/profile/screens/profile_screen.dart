// import 'package:etoken/navigation/providers.dart';
import 'package:etoken/ui/features/profile/viewmodels/profile_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../common/theme/colors.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/error_dialog.dart';

const profileImageTitle = "profile_image.jpg";

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/$profileImageTitle';
      final savedImage = await File(pickedFile.path).copy(imagePath);
      setState(() {
        image = savedImage;
      });
    }
  }

  Future<void> loadImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/$profileImageTitle';

    if (File(imagePath).existsSync()) {
      setState(() {
        image = File(imagePath);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadImage();
  }

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  @override
  Widget build(BuildContext context) {
    final uiStateAsync = ref.watch(profileScreenViewModelProvider);
    return Scaffold(
      backgroundColor: lightBlue,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 48),
        child: ETokenAppBar(title: "Profile"),
      ),
      body: uiStateAsync.when(
        data:
            (uiState) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.deepPurpleAccent,
                              width: 2.5,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: pickImage,
                            child: Stack(
                              children: [
                                ClipOval(
                                  child:
                                      image != null
                                          ? Image.file(
                                            image!,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          )
                                          : Image.asset(
                                            "lib/ui/common/icons/img_cute_face.png",
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                ),
                                Positioned(
                                  bottom: 50,
                                  child: CustomPaint(
                                    size: Size(100, 50),
                                    painter: _HalfCirclePainter(),
                                  ),
                                ),
                                Positioned(
                                  bottom: 4,
                                  left: 38,

                                  child: Row(
                                    children: [
                                      Text(
                                        "Edit",
                                        style: TextTheme.of(context).labelSmall
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.edit,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 2),
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: uiState.userIdTextEditingController,
                          style: TextTheme.of(
                            context,
                          ).bodySmall?.copyWith(color: Colors.grey),
                          cursorColor: blue.withAlpha(100),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.person_pin_rounded,
                              color: Colors.black,
                            ),
                            // hintText: "Enter login ID",
                            hintStyle: TextTheme.of(
                              context,
                            ).labelSmall?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                            fillColor: blue.withAlpha(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            filled: true,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(12),
                          ),
                          enabled: false,
                        ),
                        SizedBox(height: 2),
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: uiState.nameTextEditingController,
                          style: TextTheme.of(context).bodySmall,
                          cursorColor: blue.withAlpha(100),
                          decoration: InputDecoration(
                            icon: Icon(Icons.abc_rounded, color: Colors.black),
                            hintText: "Enter name",
                            hintStyle: TextTheme.of(
                              context,
                            ).labelSmall?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                            fillColor: blue.withAlpha(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            filled: true,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                        SizedBox(height: 2),
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: uiState.phoneNumberTextEditingController,
                          style: TextTheme.of(context).bodySmall,
                          cursorColor: blue.withAlpha(100),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone_rounded,
                              color: Colors.black,
                            ),
                            hintText: "Enter phone number",
                            hintStyle: TextTheme.of(
                              context,
                            ).labelSmall?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                            fillColor: blue.withAlpha(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            filled: true,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                        SizedBox(height: 2),
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: uiState.genderTextEditingController,
                          style: TextTheme.of(
                            context,
                          ).bodySmall?.copyWith(color: Colors.grey),
                          cursorColor: blue.withAlpha(100),
                          decoration: InputDecoration(
                            icon: Icon(Icons.person, color: Colors.black),
                            hintText: "Select gender",
                            hintStyle: TextTheme.of(
                              context,
                            ).labelSmall?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                            fillColor: blue.withAlpha(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            filled: true,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(12),
                            enabled: false,
                          ),
                        ),
                        SizedBox(height: 2),
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: uiState.emailTextEditingController,
                          style: TextTheme.of(context).bodySmall,
                          cursorColor: blue.withAlpha(100),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email_rounded,
                              color: Colors.black,
                            ),
                            hintText: "Enter email",
                            hintStyle: TextTheme.of(
                              context,
                            ).labelSmall?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                            fillColor: blue.withAlpha(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            filled: true,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                        SizedBox(height: 2),
                        TextField(
                          textInputAction: TextInputAction.done,
                          controller: uiState.addressTextEditingController,
                          style: TextTheme.of(context).bodySmall,
                          cursorColor: blue.withAlpha(100),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.house_rounded,
                              color: Colors.black,
                            ),
                            hintText: "Enter address",
                            hintStyle: TextTheme.of(
                              context,
                            ).labelSmall?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                            fillColor: blue.withAlpha(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            filled: true,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                        Container(
                          height: 32,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Change Password?",
                              style: TextTheme.of(context).labelSmall?.copyWith(
                                color: blue,
                                decoration: TextDecoration.underline,
                                decorationColor: blue,
                                decorationThickness: 0.5,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          height: 36,
                          child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                                side: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Text(
                              "Save",
                              style: TextTheme.of(context).labelSmall?.copyWith(
                                color: blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        error: (error, _) {
          return ErrorDialog(
            error: error.toString(),
            onRetryPressed:
                ref.read(profileScreenViewModelProvider.notifier).saveProfile,
          );
        },
        loading:
            () => Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                strokeCap: StrokeCap.round,
                color: Colors.deepPurpleAccent,
              ),
            ),
      ),
    );
  }
}

class _HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.black.withAlpha(50)
          ..style = PaintingStyle.fill;

    final Path path =
        Path()
          ..addArc(Rect.fromLTWH(0, 0, size.width, size.height * 2), 0.57, 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
