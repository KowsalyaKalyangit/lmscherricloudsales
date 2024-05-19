import 'dart:io' as io;

 
import 'package:audioplayers/audioplayers.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
 
import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:leadingmanagementsystem/controller/get_note_controller.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:voice_message_package/voice_message_package.dart';

import '../../allpackages.dart';
import '../../controller/note_add_controller.dart';

 

class RecorderExample extends StatefulWidget {
  final LocalFileSystem localFileSystem;
  final String? id;

  RecorderExample({localFileSystem, this.id}) : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => new RecorderExampleState();
}

class RecorderExampleState extends State<RecorderExample> {
  AnotherAudioRecorder? _recorder;
  Recording? _current;
  var filesave;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
    NoteAddController noteAddController=Get.put(NoteAddController());
    NotesDetailsController notesDetailsController=Get.put(NotesDetailsController());
     var button1 ;
 var button2 ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notesDetailsController.noteDetailsController(leadid: widget.id.toString(),);
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        playerState = state;
      });
    });
    _init();
  }
_init() async {
    try {
      if (await AnotherAudioRecorder.hasPermissions) {
        String customPath = '/another_audio_recorder_';
        io.Directory appDocDirectory;
//        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        if (io.Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = (await getExternalStorageDirectory())!;
        }

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path + customPath + DateTime.now().millisecondsSinceEpoch.toString();

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        _recorder = AnotherAudioRecorder(customPath, audioFormat: AudioFormat.WAV);

        await _recorder?.initialized;
        // after initialization
        var current = await _recorder?.current(channel: 0);
        print(current);
        // should be "Initialized", if all working fine
        setState(() {
          _current = current;
          _currentStatus = current!.status!;
          print(_currentStatus);
        });
      } else {
        return SnackBar(content: Text("You must accept permissions"));
      }
    } catch (e) {
      print(e);
    }
  }
  //start

    _start() async {
    try {
      await _recorder?.start();
      var recording = await _recorder?.current(channel: 0);
      setState(() {
        _current = recording;
      });

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder?.current(channel: 0);
        // print(current.status);
        setState(() {
          _current = current;
          _currentStatus = _current!.status!;
        });
      });
    } catch (e) {
      print(e);
    }
  }

//stop
_stop() async {
    var result = await _recorder?.stop();
    print("Stop recording: ${result?.path}");
    print("Stop recording: ${result?.duration}");
    File file = widget.localFileSystem.file(result?.path);
    print("File length: ${await file.length()}");
    setState(() {
      filesave=file;
      _current = result;
      _currentStatus = _current!.status!;
    });

    noteAddController.categoryImage(filesave);
  }

 AudioPlayer audioPlayer = AudioPlayer();
  String audioUrl = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
  PlayerState playerState = PlayerState.stopped;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    floatingActionButton: FloatingActionButton(
        backgroundColor: appcolor,
        onPressed: (){
          showDialog(
  context: context,
  builder: (ctx) => StatefulBuilder(builder:
      (BuildContext context, StateSetter setState) {
    return AlertDialog(
      title: Text(
        "ADD NOTE",
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          border:
              Border.all(width: 1, color: Colors.grey),
        ),
        child:  Container(
        height: 25.0.hp,
        width: 60.0.wp,
        decoration: BoxDecoration(
         
          border: Border.all(color: formhintcolor),borderRadius: BorderRadius.circular(5),
        
        
        
        ),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Center(child: 
          
          
          ElevatedButton(
            style:  ElevatedButton.styleFrom(backgroundColor: button1==true?Colors.green:Colors.grey),
            
            onPressed: ()async{
        
      
    
          await _start();
          Fluttertoast.showToast(msg: 'Recording...');
         
          setState(() {
            button1=true;
            button2=false;
        
      },);
        

      }, child: Text( "START"))),
      Center(child: ElevatedButton(
         style:  ElevatedButton.styleFrom(backgroundColor: button2==true?Colors.red:Colors.grey),
        onPressed: ()async{
     
        await _stop();
           Fluttertoast.showToast(msg: 'Recording Stop...');
         
        
          setState(() {
             button1=false;
            button2=true;
        
      },);
        

      }, child: Text('STOP'))),],),
      ),
        alignment: Alignment.center,
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: Text("CANCEL"),
        ),
      ElevatedButton(
        style:  ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: ()async{
          
 noteAddController.noteAddController(leadid: widget.id,context: context).then((value) {
 notesDetailsController.noteDetailsController(leadid: widget.id).then((value) =>  Get.back());

            
            Navigator.of(ctx).pop();
            setState(() {
              
            },);
 }
  );},
      
           
         
        
        

        child: Text('SEND'))
      ],
    );
  }),
);
          //Get.to(  AudioRecordPage(id: widget.id.toString(),));
        },child: Icon(Icons.cloud_upload_outlined,color: screenbackground,),),
        body: Obx((){
          if(notesDetailsController.isAddDetailsLoad.value){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(notesDetailsController.getleadsdetails[0].data.isEmpty){
            return Center(child: Text('No Data Found'),);
          }
          else{
         return  ListView.builder(
          itemCount:notesDetailsController.getleadsdetails[0].data.length,
          itemBuilder: ( (context, index) {
            return Padding(
              padding:   EdgeInsets.only(left:10.0,right: 10),
              child: Column(
                children: [
                  Container(
                   height: 15.0.hp,
                    width: 100.0.wp,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                                   Text(notesDetailsController.getleadsdetails[0].data[index].addedby.toString(),style: listtitle,),
                                 
                                      Text(notesDetailsController.getleadsdetails[0].data[index].dateadded.toString(),style: formhintstyle,),
                                  //      VoiceMessageView(
                                  //   controller: VoiceController(
                                  //     audioSrc:
                                  //         notesDetailsController.getleadsdetails[0].data[index].filename.toString(),
                                  //     maxDuration:Duration(seconds: notesDetailsController.getleadsdetails[0].data[index].filename.length),
                                  //     isFile: false,
                                  //     onComplete: () {
                                  //       print('onComplete');
                                  //     },
                                  //     onPause: () {
                                  //       print('onPause');
                                  //     },
                                  //     onPlaying: () {
                                  //       print('onPlaying');
                                  //     },
                                  //   ),
                                  //   innerPadding: 2,
                                  //   cornerRadius: 20,
                                  //   size: 30,
                                  //   circlesColor: Colors.green,
                                   
                                  //   activeSliderColor: Colors.green,
                                  //   notActiveSliderColor: Colors.grey[200],
                                  //   counterTextStyle: TextStyle(fontSize: 10),
                                  // ),
                                   ElevatedButton(
              child: playerState == PlayerState.playing ? Text('Pause') : Text('Play'),
              onPressed: () {
                if (playerState == PlayerState.playing) {
                  audioPlayer.pause();
                } else {
                  audioPlayer.play(UrlSource(notesDetailsController.getleadsdetails[0].data[index].filename.toString()));
                }
              },
            ),
                                  Divider(color: Colors.grey,)
                                   
                        ],
                      ),
                    ),
                  ),
                  
                ]
              ),
            );
            
          }));
    } })
          
         
       
    );
}
}