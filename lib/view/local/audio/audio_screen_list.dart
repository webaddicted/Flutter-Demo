import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_audio_bean.dart';

class AudioScreenList extends StatefulWidget {
  DeviceAudioBean audioBean;

  AudioScreenList(this.audioBean, {super.key});

  @override
  State<AudioScreenList> createState() => _AudioScreenListState();
}

class _AudioScreenListState extends State<AudioScreenList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBarWithBackBtn(ctx: context, title: StringConst.AUDIO_TITLE),
      body: Builder(builder: (context) => _createUi(context)),
    );
  }

  Widget _createUi(BuildContext context) {
    if (widget.audioBean == null || widget.audioBean.files?.isEmpty == true) {
      return GetLoadingWidget();
    }
    return Container(
        alignment: Alignment.center,
        child: GridView.builder(
            itemCount: widget.audioBean.files?.length,
            itemBuilder: (BuildContext context, int index) {
              return getAudioRow(widget.audioBean.files![index], index);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5 / 1.8,
            )));
  }

  Widget getAudioRow(AudioFiles audioFiles, int index) {
    return InkWell(
      // onTap: ()=>navigationPush(context, ImageFolder(imageBean)),
      onLongPress: ()=>{audioDetails(audioFiles)},
      child: Card(
          color: ColorConst.GREY_COLOR,
          child: addRoundedCorners(
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.audiotrack_outlined,
                        size: 100, color: ColorConst.APP_COLOR)),
                Container(
                  color: ColorConst.transpBlack,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      getTxtWhiteColor(msg: '${audioFiles.displayName!} [${audioFiles.duration?.length}]',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          maxLines: 2),
                      if(audioFiles.album?.isNotEmpty==true && audioFiles.album!="<unknown>")
                      getTxtWhiteColor(
                          msg: 'Album Name : ${audioFiles.album!}',
                          fontSize: 15,
                          maxLines: 1),
                      if(audioFiles.artist?.isNotEmpty==true && audioFiles.artist!="<unknown>")
                      getTxtWhiteColor(
                          msg: 'Artist : ${audioFiles.artist!}',
                          fontSize: 15,
                          maxLines: 1),
                      getTxtWhiteColor(
                          msg: 'Duration : ${audioFiles.duration!}',
                          fontSize: 15,
                          maxLines: 1),
                      getTxtWhiteColor(
                          msg: 'Date : ${audioFiles.dateAdded!}',
                          fontSize: 15,
                          maxLines: 1)
                    ]
                  ),
                ),
              ],
            ),
          )),
    );
  }
  void audioDetails(AudioFiles audioBean) {
    var dialogDetails = Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          getTxtAppColor(msg:audioBean.displayName!, fontSize:18, fontWeight:FontWeight.bold),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.grey,
            height: 1,
          ),
          const SizedBox(height: 10),
          getTxt(msg:'File Path : ${audioBean.path}'),
          const SizedBox(height: 10),
          getTxt(msg:'Album : ${audioBean.album}'),
          const SizedBox(height: 10),
          getTxt(msg:'Artist : ${audioBean.artist}'),
          const SizedBox(height: 10),
          getTxt(msg:'Duration : ${formatTime(double.parse(audioBean.duration!))}'),
          const SizedBox(height: 10),
          getTxt(msg:'Date Added : ${DateTime.fromMillisecondsSinceEpoch(int.parse(audioBean.dateAdded!)).toString()}'),
          const SizedBox(height: 10),
          getTxt(msg:'Size : ${filesize(audioBean.size)}'),
          const SizedBox(height: 40),
        ],
      ),
    );
    showCustomDialog(ctx:context, dialogUi:dialogDetails);
  }
}
