import 'package:sciencenotes/data/db_helper.dart';
import 'package:sciencenotes/domain/videos.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:sqflite/sqflite.dart';

class VideosDao {
  Future<void> addVideo({required Videos videos}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    await db.insert('video', videos.toJson());
    print('sai da inserção do video');
  }

  Future<List<Videos>> getLastId(int id) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT *, MAX(id) FROM video WHERE idContent=? ;';
    final result = await db.rawQuery(sql, [id]);

    List<Videos> lista = <Videos>[];
    Videos video = Videos.fromJson(result[0]);
    lista.add(video);

    return lista;
  }

  selectDiscipline(Content content){
    if(content.id_discipline == 1){
      var lista = listarVideosPhysical(content);
      return lista;
    }else if (content.id_discipline==2){
      var lista = listarVideosChemical(content);
      return lista;
    }else{
      var lista = listarVideosBiology(content);
      return lista;
    }
  }

  Future<List<Videos>> listarVideosPhysical(Content content) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    List<Videos> aux = <Videos>[];
    List<Videos> lista = <Videos>[];
    aux = await selectContent(content, db, lista, 11);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 12);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 13);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 14);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 15);
    lista = aux.isEmpty ? lista : aux;

    return lista;
  }

  Future<List<Videos>> listarVideosChemical(Content content) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    List<Videos> lista = <Videos>[];
    List<Videos> aux = <Videos>[];
    aux = await selectContent(content, db, lista, 21);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 22);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 23);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 24);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 25);
    lista = aux.isEmpty ? lista : aux;

    return lista;
  }

  Future<List<Videos>> listarVideosBiology(Content content) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    List<Videos> lista = <Videos>[];
    List<Videos> aux = <Videos>[];
    aux = await selectContent(content, db, lista, 31);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 32);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 33);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 34);
    lista = aux.isEmpty ? lista : aux;
    aux = await selectContent(content, db, lista, 35);
    lista = aux.isEmpty ? lista : aux;

    return lista;
  }

  Future<List<Videos>> selectContent(Content content, Database db, List<Videos> lista, int id) async {
    if(content.id==id){
      String sql = 'SELECT * FROM video WHERE idContent=?;';
      final result = await db.rawQuery(sql, [id]);
      print(result);
      for(var json in result){
        Videos video = Videos.fromJson(json);
        lista.add(video);
      }
    }
    return lista;
  }
}