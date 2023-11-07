import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(VoxPlayer());
}

class VoxPlayer extends StatefulWidget {
  VoxPlayer({super.key});

  @override
  State<VoxPlayer> createState() => _VoxPlayerState();
}

class _VoxPlayerState extends State<VoxPlayer> {
  late AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent.shade100,
        appBar: AppBar(
          backgroundColor: Color(0xffFEE2F1),
          leading: Image.asset('assets/images/player.jpeg', fit: BoxFit.cover),
          centerTitle: true,
          title: Text('Vox Player'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<Playing?>(
                stream: _assetsAudioPlayer.current,
                builder: (context, snapshot) {
                  print(snapshot.data);
                  return Text('');
                }),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/player.jpeg',
                            fit: BoxFit.scaleDown),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('chand chupa badal main'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StreamBuilder<bool>(
                stream: _assetsAudioPlayer.isPlaying,
                builder: (context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _assetsAudioPlayer.previous();
                        },
                        icon: Icon(Icons.skip_previous_sharp),
                      ),
                      IconButton(
                          onPressed: () {
                            _assetsAudioPlayer.open(Audio("assets/one.mp3"),
                                autoStart: true);
                          },
                          icon: Icon(Icons.pause_sharp)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.skip_next_sharp)),
                    ],
                  );
                }),
            Slider(
              value: 0.4,
              onChanged: (value) {
                setState(
                  () {},
                );
              },
            ),
            Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsetsDirectional.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade100, Colors.purple.shade100],
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Jiyein Kyun',
                        style: TextStyle(
                            color: Colors.pinkAccent.shade100, fontSize: 20),
                      )),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Kyun Mai Jagoon',
                      style: TextStyle(
                        color: Colors.pinkAccent.shade100,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '1920',
                      style: TextStyle(
                          color: Colors.pinkAccent.shade100, fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late AssetsAudioPlayer _assetsAudioPlayer;
//
//   @override
//   void initState() {
//     super.initState();
//     _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             StreamBuilder<Playing?>(
//                 stream: _assetsAudioPlayer.current,
//                 builder: (context, snapshot) {
//                   print(snapshot.data);
//                   return Text(
//                     snapshot.data?.audio.audio.metas.title??"",
//                   );
//                 }),
//             StreamBuilder<bool>(
//                 stream: _assetsAudioPlayer.isPlaying,
//                 builder: (context, snapshot) {
//                   return IconButton(
//                       onPressed: () {
//                         _assetsAudioPlayer.playOrPause();
//                       },
//                       icon: Icon((snapshot.data ?? false)
//                           ? Icons.pause
//                           : Icons.play_arrow));
//                 }),
//             InkWell(
//               onTap: () {
//                 _assetsAudioPlayer.open(Audio("assets/"),
//                     autoStart: false);
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text("Chaleya"),
//               ),
//             ),
//             StreamBuilder<double>(
//                 stream: _assetsAudioPlayer.volume,
//                 builder: (context, snapshot) {
//                   if (snapshot.data != null) {
//                     return Slider(
//                       value: snapshot.data ?? 0,
//                       onChanged: (value) {
//                         _assetsAudioPlayer.setVolume(value);
//                       },
//                     );
//                   } else {
//                     return SizedBox();
//                   }
//                 }),
//             InkWell(
//                 onTap: () {
//                   _assetsAudioPlayer.open(
//                       Audio(
//                         "assets/heeriye.mp3",
//                         metas: Metas(
//                           id: 'Rock',
//                           title: 'Heeriye playing...',
//                           artist: 'Florent Champigny',
//                           album: 'RockAlbum',
//
//                         ),
//                       ),
//                       autoStart: false);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Heeriye"),
//                 )),
//             InkWell(
//                 onTap: () {
//                   _assetsAudioPlayer.open(Audio("assets/maan_jan.mp3"),
//                       autoStart: false);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Maan meri jana"),
//                 )),
//             InkWell(
//                 onTap: () {
//                   _assetsAudioPlayer.open(
//                       Audio.network(
//                           "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3"),
//                       autoStart: false);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("We_Are_Heading_to_the_East"),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
