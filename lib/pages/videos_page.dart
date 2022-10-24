
import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/data/video_dao.dart';
import 'package:sciencenotes/domain/videos.dart';
import 'package:sciencenotes/widgets/video_card.dart';
import '../domain/content.dart';

class VideosPage extends StatefulWidget {
  final Content conteudo;

  const VideosPage({
    Key? key,
    required this.conteudo,
  }) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPage();
}

class _VideosPage extends State<VideosPage> {
  //List<VideoCardWidget> lista = DBcontent.listaVideos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListView(),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),
        backgroundColor: CustomColors.appeButtonColor,
      ),
      backgroundColor: CustomColors.gradienColor,
    );
  }
  buildListView() {
    var list = VideosDao().selectDiscipline(widget.conteudo);
    return FutureBuilder<List<Videos>>(
      future: list,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ?? -> Verificar ser o conteudo de snapshot.data é nulo
          List<Videos> list = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return VideoCardWidget(video: list[0],);
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
