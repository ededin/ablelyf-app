import 'dart:io';
import '../../../../ablelyf.dart';

class ProfileImagePreview extends StatefulWidget {
  const ProfileImagePreview({super.key, this.image});
  final File? image;

  @override
  State<ProfileImagePreview> createState() => _ProfileImagePreviewState();
}

class _ProfileImagePreviewState extends State<ProfileImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Selected Image',
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w500),
          ),
        ),
        body: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            File(widget.image!.path),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const StadiumBorder(),
          backgroundColor: Colors.black,
          onPressed: () {},
          child: const Icon(
            Icons.done,
            color: Colors.white,
          ),
        ));
  }
}
