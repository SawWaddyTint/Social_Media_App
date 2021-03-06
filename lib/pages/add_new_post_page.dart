import 'dart:io';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/blocs/add_new_post_bloc.dart';
import 'package:social_media_app/resources/dimens.dart';
import 'package:social_media_app/widgets/primary_button_view.dart';
import 'package:social_media_app/widgets/profile_image_view.dart';

class AddNewPostPage extends StatelessWidget {
  final int? newsFeedId;

  const AddNewPostPage({
    Key? key,
    this.newsFeedId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AddNewPostBloc(newsFeedId: newsFeedId),
        child: Selector<AddNewPostBloc, bool>(
          selector: (context, bloc) => bloc.isLoading,
          builder: (context, isLoading, child) => Stack(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  centerTitle: false,
                  title: Selector<AddNewPostBloc, bool>(
                    selector: (context, bloc) => bloc.isInEditMode,
                    builder: (context, isInEditMode, child) => Container(
                      margin: const EdgeInsets.only(
                        left: MARGIN_MEDIUM,
                      ),
                      child: Text(
                        isInEditMode ? "Edit Post" : "Add New Post",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: TEXT_HEADING_1X,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  elevation: 0.0,
                  leading: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: MARGIN_XLARGE,
                    ),
                  ),
                ),
                body: Container(
                  margin: const EdgeInsets.only(
                    top: MARGIN_XLARGE,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        ProfileImageAndNameView(),
                        SizedBox(
                          height: MARGIN_LARGE,
                        ),
                        AddNewPostTextFieldView(),
                        SizedBox(
                          height: MARGIN_MEDIUM,
                        ),
                        PostDescriptionErrorView(),
                        SizedBox(
                          height: MARGIN_LARGE,
                        ),
                        PostImageView(),
                        SizedBox(
                          height: MARGIN_LARGE,
                        ),
                        PostButtonView(),
                        SizedBox(
                          height: MARGIN_MEDIUM,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: isLoading,
                  child: Container(
                    color: Colors.black12,
                    child: const Center(
                      child: LoadingView(),
                    ),
                  ))
            ],
          ),
        ));
  }
}

class PostDescriptionErrorView extends StatelessWidget {
  const PostDescriptionErrorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (context, bloc, child) => Visibility(
        visible: bloc.isAddNewPostError,
        child: const Text(
          "Post should not be empty",
          style: TextStyle(
            color: Colors.red,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class PostButtonView extends StatelessWidget {
  const PostButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (context, bloc, child) => GestureDetector(
        onTap: () {
          bloc.onTapAddNewPost().then((value) {
            Navigator.pop(context);
          });
        },
        child: PrimaryButtonView(
          label: "Post",
          themeColor: bloc.themeColor,
        ),
      ),
    );
  }
}

class ProfileImageAndNameView extends StatelessWidget {
  const ProfileImageAndNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (context, bloc, child) => Row(
        children: [
          ProfileImageView(
            profileImage: bloc.profilePicture,
          ),
          SizedBox(
            width: MARGIN_MEDIUM_2,
          ),
          Text(
            bloc.userName,
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class AddNewPostTextFieldView extends StatelessWidget {
  const AddNewPostTextFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (context, bloc, child) => SizedBox(
        height: ADD_NEW_POST_TEXTFIELD_HEIGHT,
        child: TextField(
          enableInteractiveSelection: true,
          maxLines: 24,
          controller: TextEditingController(text: bloc.newPostDescription),
          onChanged: (text) {
            bloc.onNewPostTextChanged(text);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                MARGIN_MEDIUM,
              ),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
            hintText: "What's on your mind?",
          ),
        ),
      ),
    );
  }
}

class PostImageView extends StatelessWidget {
  const PostImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewPostBloc>(
      builder: (context, bloc, child) => Container(
        padding: const EdgeInsets.all(MARGIN_MEDIUM),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            border: Border.all(color: Colors.black, width: 1)),
        child: Stack(children: [
          GestureDetector(
            child: Container(
              child: (bloc.chosenImageFile == null)
                  ? SizedBox(
                      height: 300,
                      child: Image.network((bloc.imageUrl == "")
                          ? "https://newhorizon-department-of-computer-science-engineering.s3.ap-south-1.amazonaws.com/nhengineering/department-of-computer-science-engineering/wp-content/uploads/2020/01/13103907/default_image_01.png"
                          : bloc.imageUrl),
                    )
                  : SizedBox(
                      height: 300,
                      child: Image.file(
                        bloc.chosenImageFile ?? File(""),
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            onTap: () async {
              final ImagePicker _picker = ImagePicker();
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);

              if (image != null) {
                // bloc.fileToUint8List(File(image.path));
                bloc.onImageChosen(File(image.path));
              }
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Visibility(
              visible: (bloc.chosenImageFile != null || bloc.imageUrl != ""),
              child: GestureDetector(
                  onTap: () {
                    bloc.onTapDeleteImage();
                  },
                  child: const Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black12,
        child: const Center(
          child: SizedBox(
            width: MARGIN_XXLARGE,
            height: MARGIN_XXLARGE,
            child: LoadingIndicator(
              indicatorType: Indicator.audioEqualizer,
              colors: [Colors.white],
              strokeWidth: 2,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.black,
            ),
          ),
        ));
  }
}
