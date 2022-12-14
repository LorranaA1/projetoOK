import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "science_notes5.db");
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );

    print(path);
    return database;
  }


  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        "create table USER (id int PRIMARY KEY, url_image varchar(150), "
        "email varchar(50), password varchar(8), name varchar(50), "
        "username varchar(20), birthdate varchar(10));";
    await db.execute(sql);

    sql =
    "create table DISCIPLINE (id int PRIMARY KEY, name varchar(20));";
    await db.execute(sql);

    sql =
    "create table CONTENT (id int PRIMARY KEY, image varchar(150), "
        "title varchar(50), colorButton varchar(50), colorContent varchar(50), "
        "introduction varchar(512), id_discipline int, constraint fk_content_id_discipline "
        "foreign key (id_discipline) references discipline(id));";
    await db.execute(sql);

    sql =
    "create table VIDEO (id int PRIMARY KEY, urlImage varchar(150), "
        "tituloVideo varchar(50), tempoDuracao varchar(5), urlVideo varchar(150),"
        "idContent int, constraint fk_video_id_content foreign key (idContent)"
        "references content (id));";
    await db.execute(sql);

    sql =
    "create table RESUME (id int PRIMARY KEY, paragraph1 text, "
        "paragraph2 text, paragraph3 text, paragraph4 text, url_image varchar(150),"
        "id_content int, constraint fk_resume_id_content foreign key (id_content)"
        "references content (id));";
    await db.execute(sql);

    sql =
    "create table QUESTION (id int PRIMARY KEY, institute varchar(50), "
        "question varchar(512), alt1 varchar(150), alt2 varchar(150), alt3 varchar(150),"
        "alt4 varchar(150), alt5 varchar(150), colorQuestion varchar(50), "
        "alter_correct int,"
        "id_content int, constraint fk_question_id_content foreign key (id_content)"
        "references content (id));";
    await db.execute(sql);

    sql =
    "INSERT INTO USER (id, url_image, email, password, name, username, birthdate) "
        "VALUES (1, 'https://animais.com', 'cris@gmail.com', '12345', "
        "'cristianocosta', 'criszinho', '09/04/2005');";
    await db.execute(sql);

    sql =
    "INSERT INTO DISCIPLINE (id, name) VALUES(1, 'Fisica');";
    await db.execute(sql);

    sql =
    "INSERT INTO DISCIPLINE (id, name) VALUES(2, 'Quimica');";
    await db.execute(sql);

    sql =
    "INSERT INTO DISCIPLINE (id, name) VALUES(3, 'Biologia');";
    await db.execute(sql);


    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(11, 'lib/assets/images/physical/kinematics.png', 'Cinem??tica', "
        "'0xFFABC6E5', '0xFFABC6E5',  'A cinem??tica ?? a ??rea da mec??nica que "
        "realiza os estudos dos movimentos, sem levar em considera????o os motivos"
        " para que estes ocorram.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(12, 'lib/assets/images/physical/dinamic.png', 'Din??mica', "
        "'0xFFABC6E5', '0xFFABC6E5',  'Din??mica, uma das ??reas que comp??em a mec??nica, "
        "?? a parte da f??sica que realiza o estudo das causas do movimento, de maneira a realizar a an??lise e descrever "
        "as for??as que s??o respons??veis por produzi-las.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(13, 'lib/assets/images/physical/static.png', 'Est??tica', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Est??tica ?? a parte da f??sica, mais especificamente da mec??nica, "
        "que realiza o estudo dos corpos que n??o se movimentam, ou seja, que est??o em repouso.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(14, 'lib/assets/images/physical/hidro.png', 'Hidrost??tica e Hidrodin??mica', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Hidrost??tica ?? a parte da f??sica que realiza o estudo dos fluidos em repouso, "
        "j?? hidrodin??mica realiza o estudo desses fluidos em movimento.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(15, 'lib/assets/images/physical/thermology.png', 'Termologia', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Termologia ?? um ramo da F??sica que estuda os fen??menos t??rmicos como calor, "
        "temperatura, dilata????o, energia t??rmica, estudo t??rmico dos gases etc.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(16, 'lib/assets/images/physical/optics.png', '??ptica', "
        "'0xFFABC6E5', '0xFFABC6E5', '??ptica ?? a parte da F??sica que estuda fen??menos "
        "associados ?? luz. Podendo ser dividida em ??ptica geom??trica e ??ptica f??sica, de "
        "acordo com a forma que a luz se comporta.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(17, 'lib/assets/images/physical/wave.png', 'Ondulat??ria', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Ondulat??ria ?? a parte da F??sica que estuda as "
        "ondas, ou seja, qualquer perturba????o (pulso) que se propaga em um meio.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(18, 'lib/assets/images/physical/electrostatic.png', 'Eletrost??tica', "
        "'0xFFABC6E5', '0xFFABC6E5', 'Eletrost??tica ?? o ramo da eletricidade que "
        "estuda as propriedades e o comportamento de cargas el??tricas em repouso.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(19, 'lib/assets/images/physical/electrodynamic.png', 'Eletrodin??mica', "
        "'0xFFABC6E5', '0xFFABC6E5', 'A eletrodin??mica ?? a parte da F??sica que estuda "
        "as cargas el??tricas em movimento, ou seja, a din??mica da eletricidade.', 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(110, 'lib/assets/images/physical/electromagnetism.png', 'Eletromagnetismo', "
        "'0xFFABC6E5', '0xFFABC6E5', 'O eletromagnetismo ?? a parte da F??sica que estuda a eletricidade e o magnetismo, bem como as rela????es estabelecidas entre eles.', 1);";
    await db.execute(sql);


    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(21, 'lib/assets/images/chemistry/atom.png', '??tomo e Tabela peri??dica', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'O ??tomo ?? a unidade fundamental da mat??ria e a menor fra????o capaz de identificar um elemento qu??mico. A tabela peri??dica, por sua vez, ?? um modelo que agrupa todos os elementos qu??micos e respectivas propriedades.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(22, 'lib/assets/images/chemistry/inorganic.png', 'Fun????es Inorg??nicas', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'Fun????es inorg??nicas s??o os grupos de subst??ncias qu??micas que n??o det??m como elemento qu??mico central o carbono. As quatro classifica????es principais de fun????es inorg??nicas s??o: ??cidos, bases, sais e ??xidos.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(23, 'lib/assets/images/chemistry/organic.png', 'Qu??mica Org??nica', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'A qu??mica org??nica ?? o ramo da qu??mica respons??vel pelo estudo dos compostos carb??nicos, ou ainda compostos org??nicos, que apresentam em sua constitui????o ??tomos de carbono.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(24, 'lib/assets/images/chemistry/stoichiometry.png', 'Estequiometria', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'A Estequiometria ?? a forma de calcular, proporcionalmente, as quantidades de reagentes e produtos envolvidos em uma rea????o qu??mica.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(25, 'lib/assets/images/chemistry/solution.png', 'Solu????es', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'Solu????es s??o misturas homog??neas compostas por um ou mais solutos distintos dissolvidos em um solvente. ?? v??lido salientar que elas se apresentam, obrigatoriamente, em uma ??nica fase no que diz respeito ao seu aspecto visual.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(26, 'lib/assets/images/chemistry/thermochemistry.png', 'Termoqu??mica', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'Termoqu??mica ?? a parte da qu??mica que estuda a quantidade de calor (energia) envolvida nas rea????es qu??micas, bem como a sua transfer??ncia em alguns fen??menos f??sicos.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(27, 'lib/assets/images/chemistry/kinetics.png', 'Cin??tica', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'A cin??tica ?? um ramo na ci??ncia que estuda a velocidade das rea????es qu??micas, determinadas atrav??s de leis emp??ricas, assim como os fatores que a influenciam.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(28, 'lib/assets/images/chemistry/electrochemistry.png', 'Eletroqu??mica', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'Eletroqu??mica ?? um ramo da Qu??mica que estuda o fen??meno da transfer??ncia de el??trons para a transforma????o de energia qu??mica em energia el??trica e vice-versa.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(29, 'lib/assets/images/chemistry/balance.png', 'Equilibrio Qu??mico', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'O equil??brio qu??mico ?? um fen??meno que acontece nas rea????es qu??micas revers??veis entre reagentes e produtos nas seguintes condi????es: quando a temperatura ?? constante e quando o sistema n??o apresenta trocas com o ambiente.', 2);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(210, 'lib/assets/images/chemistry/gases.png', 'Gases', "
        "'0xFFCCA9DD', '0xFFCCA9DD', 'Gases s??o compostos moleculares que possuem caracter??sticas como a grande compressibilidade e a capacidade de se expandirem. Eles n??o possuem volume fixo, s??o misc??veis entre si e em qualquer propor????o.', 2);";
    await db.execute(sql);



    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(31, 'lib/assets/images/biology/cytology.png', 'Citologia', "
        "'0xFF8FB996', '0xFF8FB996', 'A citologia ?? a esfera da biologia que estuda as c??lulas, suas fun????es e sua import??ncia na constitui????o dos seres vivos.Com o objetivo de compreender o ciclo de vida destes seres.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(32, 'lib/assets/images/biology/reproduction.png', 'Reprodu????o Humana', "
        "'0xFF8FB996', '0xFF8FB996', 'A reprodu????o humana ?? parte da Biologia que estuda o desenvolvimento de um novo organismo desde a sua fertiliza????o at?? o momento do nascimento.',3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(33, 'lib/assets/images/biology/embryology.png', 'Embriologia', "
        "'0xFF8FB996', '0xFF8FB996', 'A reprodu????o humana ?? parte da Biologia que estuda o desenvolvimento de um novo organismo desde a sua fertiliza????o at?? o momento do nascimento.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(34, 'lib/assets/images/biology/biochemistry.png', 'Bioqu??mica', "
        "'0xFF8FB996', '0xFF8FB996', 'Bioqu??mica ?? a ci??ncia que estuda os processos qu??micos que ocorrem nos organismos vivos. Esses processos qu??micos, abordam as estrutura e as fun????o metab??licas de componentes celulares.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(35, 'lib/assets/images/biology/histology.png', 'Histologia', "
        "'0xFF8FB996', '0xFF8FB996', 'Histologia a ci??ncia que estuda os tecidos.Por estabelecer o significado de aspectos microsc??picos caracter??sticos de c??lulas e tecidos, bem como os estudos histol??gicos entre as rela????es entre estrutura e fun????o.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(36, 'lib/assets/images/biology/physiology.png', 'Fisiologia', "
        "'0xFF8FB996', '0xFF8FB996', 'A Fisiologia o estudo das fun????es e do funcionamento normal dos seres vivos, como tamb??m dos processos f??sico-qu??micos.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(37, 'lib/assets/images/biology/genetics.png', 'Gen??tica', "
        "'0xFF8FB996', '0xFF8FB996', 'A Gen??tica ?? a ci??ncia que estuda os genes, a hereditariedade e a varia????o entre os organismos.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(38, 'lib/assets/images/biology/botany.png', 'Bot??nica', "
        "'0xFF8FB996', '0xFF8FB996', 'A Bot??nica ?? a ci??ncia que estuda as plantas e as algas.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(39, 'lib/assets/images/biology/zoology.png', 'Zoologia', "
        "'0xFF8FB996', '0xFF8FB996', 'A Zoologia ?? a ci??ncia que estuda os animais, sejam esp??cies vivas ou extintas.', 3);";
    await db.execute(sql);

    sql =
    "INSERT INTO CONTENT (id, image, title, colorButton, colorContent, introduction, id_discipline) "
        "values(310, 'lib/assets/images/biology/ecology.png', 'Ecologia', "
        "'0xFF8FB996', '0xFF8FB996', 'A Ecologia busca compreender o funcionamento de toda a natureza. Seus conhecimentos s??o pautados no estudo das diversas rela????es existentes entre os seres vivo como um todo.', 3);";
    await db.execute(sql);

//videos de fisica
    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (111, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo F??sica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 11);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (121, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo F??sica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 12);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (131, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo F??sica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 13);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (141, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo F??sica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 14);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (151, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo F??sica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 15);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (161, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo F??sica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 16);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (171, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo F??sica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 17);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (181, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo F??sica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 18);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (191, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo F??sica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 19);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (1101, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo F??sica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 110);";
    await db.execute(sql);

    //videos de quimica
    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (211, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Qu??mica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 21);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (221, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Qu??mica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 22);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (231, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Qu??mica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 23);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (241, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Qu??mica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 24);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (251, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Qu??mica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 25);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (261, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Qu??mica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 26);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (271, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Qu??mica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 27);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (281, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Qu??mica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 28);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (291, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Qu??mica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 29);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (2101, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Qu??mica', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 210);";
    await db.execute(sql);

    //videos de biologia
    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (311, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 31);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (321, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 32);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (331, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 33);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (341, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 34);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (351, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 35);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (361, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 36);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (371, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 37);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (381, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 38);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (391, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 39);";
    await db.execute(sql);

    sql =
    "INSERT INTO VIDEO (id, urlImage, tituloVideo, tempoDuracao, urlVideo, idContent) "
        "VALUES (3101, 'https://guiadoestudante.abril.com.br/wp-content/uploads/sites/4/2019/10/aulas-enem-2.jpg',"
        "'V??deo Biologia', '25:40', 'https://www.youtube.com/watch?v=_6ILoTeChCE', 310);";
    await db.execute(sql);

    //cinem??tica -- ID_DISCI+ID_CONT+_ID_QUES
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(111, 'Exerc??cio 1: (UECE 2021)',"
        "'Um trem parte de uma esta????o A em dire????o a uma esta????o B separada de A por uma dist??ncia de 4 km. Sabe-se que, partindo do repouso a partir de A, o trem acelera uniformemente at?? alcan??ar um ponto do trajeto a partir do qual passa a desacelerar uniformemente parando finalmente em B. Sabendo que o percurso entre A e B ?? realizado em apenas 6 min, a velocidade m??xima, em km/h, alcan??ada pelo trem no referido percurso ?? ',"
        "'120.', '40.', '80.', '160.', '180.', '0xFFABC6E5', 3, 11);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(112, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFABC6E5', 1, 11);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(113, 'Exerc??cio 3: (VUNESP 2018)',"
        "'Um carro de competi????o percorre metade de um circuito com velocidade m??dia de 200 km/h. Na segunda metade do circuito, o desempenho do carro melhora e sua velocidade m??dia passa a ser 300 km/h. A velocidade m??dia desse carro quando ele completa todo o circuito ?? de',"
        "'225 km/h.', '275 km/h.', '220 km/h.', '230 km/h.', '240 km/h.', '0xFFABC6E5', 5, 11);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(114, 'Exerc??cio 4: (UFMS 2018)',"
        "'No dia 4 de novembro de 2018, foi realizada a 8?? volta UFMS. O percurso tem largada e chegada em frente ao pr??dio da Reitoria da universidade, com circuitos de uma ou duas voltas, sendo cada volta de 3,5 km."
        " Um atleta que correr?? as duas voltas terminar?? a primeira volta com um pace m??dio de 6,0 min/km. Como ele pretende completar a prova com um pace m??dio de 5,0 min/km, a segunda volta deve ser completada com uma velocidade m??dia de:',"
        "'4,0 km/h.', '12 km/h.', '14,4 km/h.', '15 km/h.', '18 km/h.', '0xFFABC6E5', 4, 11);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(115, 'Exerc??cio 5: (VUNESP 2019)',"
        "'Depois de ter feito uma viagem entre duas cidades, o motorista calculou sua velocidade escalar m??dia no percurso considerando seu deslocamento escalar e o intervalo de tempo gasto. Ap??s alguns c??lculos, ele concluiu que se tivesse feito a mesma viagem, pela mesma trajet??ria, com uma velocidade escalar m??dia 25% maior, o intervalo de tempo gasto teria sido reduzido em',"
        "'25%.', '20%.', '12%.', '15%.', '10%.', '0xFFABC6E5', 2, 11);";
    await db.execute(sql);

    //dinamica
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(121, 'Exerc??cio 1: (MARINHA 2021)',"
        "'Um guindaste do Arsenal de Marinha do Rio de Janeiro (AMRJ) suspende um objeto de 200Kg a uma altura de 5m acima do n??vel do mar. Desprezando as dimens??es do objeto e adotando o valor da acelera????o da gravidade local igual a 10 m/s2, calcule a energia potencial do objeto em rela????o ao n??vel do mar, e marque a op????o correta. ',"
        "'2KJ.', '4KJ.', '6KJ.', '8KJ.', '10KJ.', '0xFFABC6E5', 5, 12);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(122, 'Exerc??cio 2: (AERON??UTICA 2021)',"
        "'Um determinado carro el??trico (de massa 1850 kg e levando dois ocupantes de massa igual a 75 kg cada), partindo do repouso, em uma pista retil??nea e horizontal, consegue atingir a velocidade de 108 km/h em 4,0 segundos.     Para obter essa acelera????o o motor el??trico desse carro dever?? ter no m??nimo, a pot??ncia de ____ HP (horse-power). "
        "Utilize 1 HP = 750 W e despreze o atrito com o ar. ',"
        "'225.', '300.', '450.', '600.', '150.', '0xFFABC6E5', 2, 12);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(123, 'Exerc??cio 3: (FUNDEP 2021)',"
        "'Um casal de patinadores faz uma apresenta????o de patina????o art??stica no gelo, quando, em dado momento, estando os dois em repouso, o homem, de 72 kg, empurra sua companheira, de 48 kg, na horizontal e ela passa a se mover a uma velocidade de 18 km/h."
        "Considerando apenas as for??as de intera????o entre o casal, qual ?? o impulso aplicado ao rapaz, em N.s, na intera????o entre eles? ',"
        "'240.', '360.', '864.', '1296.', '764.', '0xFFABC6E5', 1, 12);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(124, 'Exerc??cio 4: (AERON??UTICA 2020)',"
        "'Um trem parte do repouso sobre uma linha horizontal e deve alcan??ar a velocidade de 72 km/h. At?? atingir essa velocidade, o movimento do trem tem acelera????o constante de 0,50 m/s2 , sendo que resist??ncias passivas absorvem 5,0% da energia fornecida pela locomotiva. O esfor??o m??dio, em N, fornecido pela locomotiva para transportar uma carga de 1,0 ton ??',"
        "'2,5??10^2.', '4,8??10^2.', '5,0??10^2.', '5,3??10^2.', '1,0??10^3.', '0xFFABC6E5', 4, 12);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(125, 'Exerc??cio 5: (MARINHA 2020)',"
        "'Durante uma partida de v??lei, um atleta realiza um saque suspendendo uma bola (de massa m=0,2 Kg) a uma altura de 2 m do solo e a golpeando, de forma que a bola descreva uma trajet??ria obl??qua. Ap??s o saque, a bola toca o solo a 30 m do local de lan??amento. Sabendo que a bola leva 0,9 s para alcan??ar o ponto mais alto de sua trajet??ria e o tempo de contato da m??o do atleta com a bola ?? de 0,01 s, qual foi o m??dulo da for??a m??dia aplicada sobre a bola? (considere a acelera????o da gravidade g=10 m/s2 e despreze a for??a de resist??ncia do ar).',"
        "'75N.', '100N.', '150N.', '350N.', '450N.', '0xFFABC6E5', 4, 12);";
    await db.execute(sql);

    //ESTATICA
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(131, 'Exerc??cio 1: (ANCONPREV 2020)',"
        "'Quanto aos tipos de escoamento de fluidos, indique a senten??a verdadeira:', "
        "'Escoamento laminar descreve o fluxo irregular de ??gua com velocidade m??dia.', "
        "'No escoamento turbulento a perda de energia ?? menor do que no escoamento laminar.', "
        "'O escoamento permanente ocorre quando a vaz??o ?? crescente ao longo do tempo.', "
        "'O escoamento supercr??tico desenvolve-se em pequenas profundidades e grandes velocidade',"
        "'O escoamento subcr??tico se desenvolve em baixas profundidade e pequenas velocidades', "
        "'0xFFABC6E5', 5, 13);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(132, 'Exerc??cio 2: (FUNDEP 2019)',"
        "'Duas crian??as sustentam uma sacola de brinquedos de 30 kg, puxando-a pelas al??as. Se uma das crian??as faz uma for??a de 150 N e o ??ngulo entre a for??a dessa crian??a e a da segunda ?? de 30??, podemos concluir que a segunda crian??a faz uma for??a de', "
        "'50 N.', "
        "'161 N.', "
        "'180 N.', "
        "'450 N.',"
        "'123 N.', "
        "'0xFFABC6E5', 5, 13);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(133, 'Exerc??cio 3: (FUVEST 2021)',"
        "'Um m??bile pendurado no teto tem tr??s elefantezinhos presos um ao outro por fios. As massas dos elefantes de cima, do meio e de baixo s??o, respectivamente, 20 g, 30 g e 70 g. Os valores de tens??o, em newtons, nos fios superior, m??dio e inferior s??o, respectivamente, iguais a"
        " Desconsidere as massas dos fios. Acelera????o da gravidade g = 10 m/s?? .', "
        "'1,7; 1,0; 0,7.', "
        "'1,2; 0,5; 0,2.', "
        "'0,2; 0,5; 1,2.', "
        "'0,2; 0,3; 0,7.', "
        "'1,7; 0,5; 1,2.', "
        "'0xFFABC6E5', 1, 13);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(134, 'Exerc??cio 4: (ENEM 2021)',"
        "'A Torre Eiffel, com seus 324 metros de altura, feita com treli??as de ferro, pesava 7 300 toneladas quando terminou de ser constru??da em 1889. Um arquiteto resolve construir um prot??tipo dessa torre em escala 1:100, usando os mesmos materiais (cada dimens??o linear em escala de 1:100 do monumento real). Considere que a torre real tenha uma massa Mtorre e exer??a na funda????o sobre a qual foi erguida uma press??o Ptorre. O modelo constru??do pelo arquiteto ter?? uma massa Mmodelo e exercer?? uma press??o Pmodelo."
        "Como a press??o exercida pela torre se compara com a press??o exercida pelo prot??tipo? Ou seja, qual ?? a raz??o entre as press??es (Ptorre)/(Pmodelo) ?', "
        "'10^0', "
        "'10^1', "
        "'10^2', "
        "'10^4',"
        "'10^6' ,"
        "'0xFFABC6E5', 5, 13);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(135, 'Exerc??cio 5: (ENEM 2019)',"
        "'Slackline ?? um esporte no qual o atleta deve se equilibrar e executar manobras estando sobre uma fita esticada. Para a pr??tica do esporte, as duas extremidades da fita s??o fixadas de forma que ela fique a alguns cent??metros do solo. Quando uma atleta de massa igual a 80 kg est?? exatamente no meio da fita, essa se desloca verticalmente, formando um ??ngulo de 10?? com a horizontal, como esquematizado na figura. Sabe-se que a acelera????o da gravidade ?? igual a 10 m s???2, cos(10??) = 0,98 e sen(10??) = 0,17."
        "Qual ?? a for??a que a fita exerce em cada uma das ??rvores por causa da presen??a da atleta?',"
        "'4,0 ?? 10^2 N', "
        "'4,1 ?? 10^2 N', "
        "'8,0 ?? 10^2 N', "
        "'2,4 ?? 10^3 N', "
        "'4,7 ?? 10^3 N', "
        "'0xFFABC6E5', 5, 13);";
    await db.execute(sql);


    //HIDRO
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(141, 'Exerc??cio 1: (ENEM 2019)',"
        "'Um experimento simples, que pode ser realizado com materiais encontrados em casa, ?? realizado da seguinte forma: adiciona-se um volume de etanol em um copo de vidro e, em seguida, uma folha de papel. Com o passar do tempo, observa-se um comportamento peculiar: o etanol se desloca sobre a superf??cie do papel, superando a gravidade que o atrai no sentido oposto, como mostra a imagem. Para parte dos estudantes, isso ocorre por causa da absor????o do l??quido pelo papel."
        "Do ponto de vista cient??fico, o que explica o movimento do l??quido ?? a', "
        "'evapora????o do l??quido.', "
        "'diferen??a de densidades.', "
        "'rea????o qu??mica com o papel.', "
        "'capilaridade nos poros do papel.', "
        "'resist??ncia ao escoamento do l??quido.', "
        "'0xFFABC6E5', 5, 14);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(142, 'Exerc??cio 2: (ENEM 2014)',"
        "'Em um experimento, foram separados tr??s recipientes A, B e C, contendo 200 mL de l??quidos distintos: o recipiente A continha ??gua, com densidade de 1,00 g/mL; o recipiente B, ??lcool et??lico, com densidade de 0,79 g/mL; e o recipiente C, clorof??rmio, com densidade de 1,48 g/mL. Em cada um desses recipientes foi adicionada uma pedra de gelo, com densidade pr??xima a 0,90 g/mL."
        "No experimento apresentado, observou-se que a pedra de gelo', "
        "'flutuou em A, flutuou em B e flutuou em C.', "
        "'flutuou em A, afundou em B e flutuou em C.', "
        "'afundou em A, afundou em B e flutuou em C.', "
        "'afundou em A, flutuou em B e afundou em C', "
        "'flutuou em A, afundou em B e afundou em C.',"
        "'0xFFABC6E5', 5, 14);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(143, 'Exerc??cio 3: (ENEM 2016)',"
        "'Um navio petroleiro ?? capaz de transportar milhares de toneladas de carga. Neste caso, uma grande quantidade de massa consegue flutuar."
        "Nesta situa????o, o empuxo ??', "
        "'maior que a for??a peso do petroleiro.', "
        "'igual ?? for??a peso do petroleiro.', "
        "'maior que a for??a peso da ??gua deslocada.', "
        "'igual ?? for??a peso do volume submerso do navio.', "
        "'igual ?? massa da ??gua deslocada.',"
        "'0xFFABC6E5', 5, 14);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(144, 'Exerc??cio 4: (ENEM 2010)',"
        "'Ao apertar a garrafa, o movimento de descida do frasco ocorre porque', "
        "'diminui a for??a para baixo que a ??gua aplica no frasco.', "
        "'aumenta a press??o na parte pressionada da garrafa.', "
        "'aumenta a quantidade de ??gua que fica dentro do frasco.', "
        "'diminui a for??a de resist??ncia da ??gua sobre o frasco.',"
        "'diminui a press??o que a ??gua aplica na base do frasco.', "
        "'0xFFABC6E5', 5, 14);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(145, 'Exerc??cio 5: (ENEM 2021)',"
        "'Um agricultor deseja utilizar um motor para bombear ??gua (?? ??gua = 1 kg L???1) de um rio at?? um reservat??rio onde existe um desn??vel de 30 m de altura entre o rio e o reservat??rio, como representado na figura. Ele necessita de uma vaz??o constante de 3 600 litros de ??gua por hora. Considere a acelera????o da gravidade igual a 10 m s???2."
        "Considerando a situa????o apresentada e desprezando efeitos de perdas mec??nicas e el??tricas, qual deve ser a pot??ncia m??nima do motor para realizar a opera????o?', "
        "'1,0 ?? 10^1 W', "
        "'5,0 ?? 10^1 W', "
        "'3,0 ?? 10^2 W', "
        "'3,6 ?? 10^4 W',"
        "'1,1 ?? 10^6 W', "
        "'0xFFABC6E5', 5, 14);";
    await db.execute(sql);


    //TERMO
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(151, 'Exerc??cio 1: (UNIFESO 2019)',"
        "'Em um caf?? da manh??, mistura-se caf?? a 80??C com leite a 10??C para se obter 400 mL de caf?? com leite a 50??C. Considerando que caf?? e leite apresentam calor espec??fico e densidade iguais, a quantidade de leite a ser utilizada na mistura, em mL, ser?? aproximadamente:', "
        "'140', "
        "'150', "
        "'160', "
        "'170', "
        "'180',"
        "'0xFFABC6E5', 5, 15);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(152, 'Exerc??cio 2: (CONSULPLAN 2021)',"
        "'Se uma pessoa deixar uma chapa de ferro sobre fogo alto por cinco minutos e, logo ap??s, borrifar ??gua em cima da chapa, ir?? observar que as got??culas ???pular??o??? e desaparecer??o em contato com a superf??cie ultra-aquecida. Qual a mudan??a de estado f??sico foi observada por esta pessoa?', "
        "'Ebuli????o.', "
        "'Calefa????o.', "
        "'Evapora????o.', "
        "'Sublima????o.', "
        "'Solidifica????o.', "
        "'0xFFABC6E5', 5, 15);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(153, 'Exerc??cio 3: (UEG 2021)',"
        "'Com o surgimento do novo corona v??rus, muitos laborat??rios j?? apresentaram as suas vacinas. Em especial, um laborat??rio americano disse que durante o armazenamento/transporte sua vacina deve ser mantida a -70??C. Os EUA ainda utilizam no seu dia-a-dia a escala termom??trica Fahrenheit (s??mbolo ??F)."
        "Qual ?? o valor dessa temperatura em ??F?', "
        "'38,0', "
        "'-70,8', "
        "'-94,0', "
        "'70,0', "
        "'-38,0', "
        "'0xFFABC6E5', 5, 15);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(154, 'Exerc??cio 4: (SELECON 2021)',"
        "'As temperaturas correspondentes nas escalas Celsius e Kelvin,respectivamente,para a temperatura 100??F s??o iguais a:', "
        "'100??C e 100K', "
        "'132,7??C e 405,7K', "
        "'37,7??C e 310,7K', "
        "'302,5??C e 575,5K', "
        "'575,5,5??C e 580,5K', "
        "'0xFFABC6E5', 5, 15);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(155, 'Exerc??cio 5: (SEE-AC 2020)',"
        "'Na ocorr??ncia de inc??ndios as chamas tendem a subir. O processo respons??vel por esta ocorr??ncia ?? a:', "
        "'condu????o.', "
        "'irradia????o.', "
        "'convec????o.', "
        "'ebuli????o.', "
        "'evapora????o.', "
        "'0xFFABC6E5', 5, 15);";
    await db.execute(sql);


    //optica
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(161, 'Exerc??cio 1: (AOCP 2021)',"
        "'Em rela????o ??s lupas, assinale a alternativa correta.', "
        "'A lupa ?? um instrumento ??ptico composto de apenas uma lente divergente.', "
        "'Para a correta utiliza????o de uma lupa, o objeto deve se encontrar antes do ponto antiprincipal.', "
        "'Quando a imagem formada por uma lupa se encontra do mesmo lado do objeto, ela ?? real e invertida.', "
        "'Se a verg??ncia de uma lupa ?? de 20 dioptrias, sua dist??ncia focal ?? de 10 cm.', "
        "'Uma lupa de 20 dioptrias forma uma imagem cinco vezes maior de um objeto colocado a 4 cm de seu centro ??ptico.', "
        "'0xFFABC6E5', 5, 16);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(162, 'Exerc??cio 2: (MS CONCURSOS 2018)',"
        "'O raio luminoso ?? uma onda progressiva de campos el??tricos e magn??ticos, ou seja, ?? uma onda eletromagn??tica. No espectro eletromagn??tico, encontram-se outras formas de ondas, tais como as ondas de r??dio, as micro-ondas, raios infravermelhos e ultravioletas. Escolha a alternativa correta, que define em qual velocidade as ondas de r??dio se propagam no v??cuo.', "
        "'Na velocidade do som.', "
        "'Abaixo da velocidade do som.', "
        "'Na mesma velocidade da Luz vis??vel.', "
        "'Abaixo da velocidade da Luz vis??vel.', "
        "'Acima da velocidade da Luz vis??vel.', "
        "'0xFFABC6E5', 5, 16);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(163, 'Exerc??cio 3: (INSTITUTO AOCP 2019)',"
        "'Quando um feixe de luz monocrom??tico passa de um meio menos refringente para um meio mais refringente, esse feixe tem', "
        "'a sua velocidade aumentada.', "
        "'a sua frequ??ncia diminu??da.', "
        "'a sua velocidade diminu??da.', "
        "'o seu comprimento de onda inalterado.', "
        "'a cor alterada.', "
        "'0xFFABC6E5', 5, 16);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(164, 'Exerc??cio 4: (PREFEITURA DE CRISTALINA 2018)',"
        "'O fen??meno ??ptico em que a luz incide sobre uma superf??cie e retorna ao seu meio de origem ?? conhecido como', "
        "'difra????o da luz.', "
        "'dispers??o da luz.', "
        "'reflex??o da luz.', "
        "'refra????o da luz.', "
        "'polariza????o da luz.', "
        "'0xFFABC6E5', 5, 16);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(165, 'Exerc??cio 4: (SEDUC-GO 2010)',"
        "'Quando a luz proveniente de uma fonte puntiforme incide sobre um contorno retil??neo, o contorno da sombra projetada sobre um plano nunca ?? perfeitamente retil??neo. A explica????o desse efeito ?? que a luz, assim como o som, tem caracter??sticas ondulat??rias. Tal efeito constitui o fen??meno chamado', "
        "'difra????o.', "
        "'dispers??o.', "
        "'espalhamento.', "
        "'polariza????o.', "
        "'sublima????o.', "
        "'0xFFABC6E5', 5, 16);";
    await db.execute(sql);

    //ondulatoria
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(171, 'Exerc??cio 1: (FUNDEP 2018)',"
        "'Considere que Jo??o est?? gritando quando seu professor de F??sica entra na sala de aula. Aproveitando a ??ltima aula sobre ondas sonoras, o seu professor o adverte: ?????? Jo??o, que som forte e baixo! De longe reconheci seu timbre!??? As palavras destacadas na fala do professor se referem, respectivamente, a', "
        "'amplitude, frequ??ncia e forma da onda.', "
        "'forma da onda, amplitude e frequ??ncia.', "
        "'frequ??ncia, amplitude e forma da onda.', "
        "'comprimento de onda, frequ??ncia e forma da onda.', "
        "'forma de onda, frequ??ncia e amplitude.', "
        "'0xFFABC6E5', 5, 17);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(172, 'Exerc??cio 2: (SEE-AC 2020)',"
        "'Em um experimento, a tela de visualiza????o est?? posicionada a 2,0 m das fendas que distam entre si 0,54 mm. No padr??o de interfer??ncia gerado foi observado que o espa??amento entre as franjas ?? de 2,0 mm. Qual ?? o comprimento de onda da luz usada neste experimento?', "
        "'450 nm', "
        "'500 nm', "
        "'540 nm', "
        "'610 nm', "
        "'700 nm', "
        "'0xFFABC6E5', 5, 17);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(173, 'Exerc??cio 3: (IBADE 2018)',"
        "'Quando uma onda ?? produzida pela deforma????o de um meio material, como uma onda na superf??cie da ??gua, ?? classificada como:', "
        "'mec??nica.', "
        "'longitudinal.', "
        "'eletromagn??tica.', "
        "'transversal.', "
        "'IMPR??PRIA', "
        "'0xFFABC6E5', 5, 17);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(174, 'Exerc??cio 4: (SEE-AC 2020)',"
        "'A velocidade de propaga????o de uma onda sonora ?? determinada em fun????o', "
        "'da frequ??ncia sonora.', "
        "'da intensidade sonora.', "
        "'do comprimento de onda.', "
        "'da amplitude sonora.', "
        "'das caracter??sticas do meio.', "
        "'0xFFABC6E5', 5, 17);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(175, 'Exerc??cio 5: (SEED-PR 2021)',"
        "'Na interfer??ncia de duas ondas sonoras harm??nicas de frequ??ncias levemente diferentes, a intensidade do som que se ouve muda de m??xima para m??nima a cada 0,2 s. A diferen??a entre as frequ??ncias das duas ondas sonoras ?? de', "
        "'2 Hz', "
        "'2.5 Hz', "
        "'4 Hz', "
        "'5 Hz', "
        "'6 Hz', "
        "'0xFFABC6E5', 5, 17);";
    await db.execute(sql);

    //ELETROSTATICA
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(181, 'Exerc??cio 1: (ENEM 2021)',"
        "'O desfibrilador salva vidas de pessoas que s??o acometidas por ataques card??acos ou arritmias. Ele disp??e de um capacitor que pode ser carregado por uma fonte com uma alta tens??o. Usando o desfibrilador, pode-se fornecer energia ao cora????o, por meio de um choque el??trico, para que ele volte a pulsar novamente em seu ritmo normal. Um socorrista disp??e de um desfibrilador com capacitor de 70 microfarads que pode armazenar cerca de 220 J de energia, quando conectado a uma tens??o de 2 500 V."
        "O valor da carga armazenada por esse desfibrilador, em coulomb, ?? de', "
        "'0,015', "
        "'0,088', "
        "'0,175', "
        "'3,15', "
        "'11,4', "
        "'0xFFABC6E5', 5, 18);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(182, 'Exerc??cio 2: (ENEM 2014)',"
        "'A grandeza f??sica associada ao brilho instant??neo da l??mpada fluorescente, por estar pr??xima a uma descarga el??trica, ?? o(a)', "
        "'carga el??trica.', "
        "'campo el??trico.', "
        "'corrente el??trica.', "
        "'capacit??ncia el??trica.', "
        "'condutividade el??trica.', "
        "'0xFFABC6E5', 5, 18);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(183, 'Exerc??cio 3: (ENEM 2013)',"
        "'Em uma experi??ncia did??tica, cinco esferas de metal foram presas em um barbante, de forma que a dist??ncia entre esferas consecutivas aumentava em progress??o aritm??tica. O barbante foi suspenso e a primeira esfera ficou em contato com o ch??o. Olhando o barbante de baixo para cima, as dist??ncias entre as esferas ficavam cada vez maiores. Quando o barbante foi solto, o som das colis??es entre duas esferas consecutivas e o solo foi gerado em intervalos de tempo exatamente iguais."
        "A raz??o de os intervalos de tempo citados serem iguais ?? que a', "
        "'velocidade de cada esfera ?? constante.', "
        "'for??a resultante em cada esfera ?? constante.', "
        "'acelera????o de cada esfera aumenta com o tempo.', "
        "'tens??o aplicada em cada esfera aumenta com o tempo.', "
        "'energia mec??nica de cada esfera aumenta com o tempo.', "
        "'0xFFABC6E5', 5, 18);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(184, 'Exerc??cio 4: (CEDERJ 2020)',"
        "'A tens??o eletrost??tica e a resist??ncia el??trica do corpo humano variam de indiv??duo para indiv??duo, essa ??ltima pode variar de 500 Q at?? 500.000 Q ?? passagem de corrente el??trica. Com base no enunciado, a menor tens??o el??trica, em Volts (V) que o corpo humano estaria submetido, caso fosse atingido por um raio de 30 mil amperes, vale:', "
        "'0,06', "
        "'60', "
        "'1,5x10^7', "
        "'1,5x10^10', "
        "'1,5', "
        "'0xFFABC6E5', 5, 18);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(185, 'Exerc??cio 5: (SEE-AC 2020)',"
        "'Uma das aplica????es cient??ficas/tecnol??gica do conhecimento da eletrost??tica foi a inven????o da impressora a jato de tinta. Esta impressora usa pequenas gotas de tinta que podem ser eletricamente neutras ou eletrizadas positiva ou negativamente. No funcionamento da impressora essas gotas penetram as placas defletoras onde existe um campo el??trico uniforme ???E???. As gotas atingem o papel formando as letras. Observando a figura a seguir nota-se o percurso de tr??s gotas atravessando a regi??o entre as placas at?? atingir o papel em baixo. Na figura abaixo a dire????o do campo el??trico est?? indicada emergindo da placa A para placa B. As gotas 1, 2 e 3, observando seus desvios, respectivamente est??o:', "
        "'Carregadas negativamente, neutra e carregada positivamente.', "
        "'Neutra, carregada positivamente e carregada negativamente.', "
        "'Carregada positivamente, carregada negativamente e neutra.', "
        "'Carregada positivamente, neutra e carregada negativamente.', "
        "'Neutra, carregada negativamente e carregada positivamente.', "
        "'0xFFABC6E5', 5, 18);";
    await db.execute(sql);


    //eletrodinamica
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(191, 'Exerc??cio 1: (SEED-PR 2021)',"
        "'Um aparelho de ar condicionado apresenta uma pot??ncia de 0,8 kW. Durante o m??s de janeiro este eletrodom??stico ficava ligado durante 6 horas todos os dias. Sabendo que 1 kWh custa R\$ 0,50. O custo gerado por este aparelho no m??s de janeiro foi:', "
        "'R\$ 74,40.', "
        "'R\$ 70,20.', "
        "'R\$ 63,00.', "
        "'R\$ 55,80.', "
        "'R\$ 49,30.', "
        "'0xFFABC6E5', 5, 19);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(192, 'Exerc??cio 2: (UERR 2017)',"
        "'As medidas baseadas na luz e outras formas de radia????o eletromagn??tica (REM) s??o amplamente empregadas em qu??mica anal??tica. As intera????es da radia????o com a mat??ria s??o estudo da ci??ncia da espectroscopia. Em rela????o ??s propriedades da radia????o eletromagn??tica ?? incorreto afirmar que:', "
        "'a REM ?? uma forma de energia que ?? transmitida atrav??s do espa??o a velocidades enormes;', "
        "'a REM pode ser descrita como uma onda com propriedades como comprimento de onda, frequ??ncia, velocidade e amplitude;', "
        "'apenas uma parte da REM pode ser quantizada em f??tons;', "
        "'a energia de um f??ton ?? diretamente proporcional ?? sua frequ??ncia;', "
        "'comprimento de onda (??): corresponde a dist??ncia entre duas cristas de onda, medida em dire????o ?? progress??o de onda.', "
        "'0xFFABC6E5', 5, 19);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(193, 'Exerc??cio 3: (UNESP 2019)',"
        "'Comumente se ouve falar dos perigos da alta voltagem em dispositivos el??tricos. Todavia, uma alta voltagem pode n??o significar uma grande quantidade de energia se:', "
        "'o potencial el??trico envolvido for constante.', "
        "'a quantidade de carga envolvida for baixa', "
        "'o campo el??trico envolvido for uniforme.', "
        "'a for??a el??trica envolvida for baixa.', "
        "'o dispositivo for condutor de energia.', "
        "'0xFFABC6E5', 5, 19);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(194, 'Exerc??cio 4: (FUNDEP 2019)',"
        "'Considere dois condutores, 1 e 2, de mesmo material, sendo o comprimento do fio 1 igual a tr??s quartos do fio 2, e o di??metro do fio 1 igual ?? ter??a parte do fio 2."
        "Se submetidos a uma mesma tens??o el??trica, a raz??o entre as intensidades das correntes el??tricas 1 e 2 ser??:', "
        "'9/4', "
        "'4/9', "
        "'4/27', "
        "'27/4', "
        "'27', "
        "'0xFFABC6E5', 5, 19);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(195, 'Exerc??cio 5: (SEE-AC 2020)',"
        "'Foram associados em s??rie seis capacitores iguais e a capacit??ncia equivalente dessa associa????o ?? de 1,5 ??F. Em seguida, foram associados quatro desses capacitores em paralelo a uma tens??o de 100,0 V."
        "A energia potencial el??trica dessa nova associa????o, em J, ?? de aproximadamente', "
        "'1,8 x 10^???1.', "
        "'3,6 x 10^???4.', "
        "'4,5 x 10^???2.', "
        "'9,0 x 10^???6.', "
        "'9,0 x 10^-3.', "
        "'0xFFABC6E5', 5, 19);";
    await db.execute(sql);

    //eletromagnetismo
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(1101, 'Exerc??cio 1: (PC-ES 2019)',"
        "'Sobre ??m??s permanentes, assinale a alternativa correta.', "
        "'N??o ?? poss??vel desmagnetizar um ??m?? permanente.', "
        "'Quanto maior a for??a coercitiva em um material, menos suscept??vel ?? desmagnetiza????o por campo magn??tico ele estar??.', "
        "'Quanto menor o fluxo residual em um material, mais intenso ser?? seu campo magn??tico ap??s o processo de magnetiza????o.', "
        "'N??o alteram suas propriedades ao serem aquecidos.', "
        "'Para que estejam magnetizados, seus dom??nios magn??ticos devem estar desalinhados.', "
        "'0xFFABC6E5', 5, 110);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(1102, 'Exerc??cio 2: (PC-ES 2019)',"
        "'Em rela????o ??s ondas eletromagn??ticas, ?? correto afirmar que', "
        "'consistem em intensidades de campo el??trico e magn??tico, oscilando na mesma frequ??ncia.', "
        "'no v??cuo, seu comprimento de onda independe da frequ??ncia desta.', "
        "'o espectro eletromagn??tico se diferencia pela velocidade da onda no v??cuo.', "
        "'n??o podem ser vistas a olho n??, independente de sua frequ??ncia.', "
        "'se propagam apenas em meios f??sicos.', "
        "'0xFFABC6E5', 5, 110);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(1103, 'Exerc??cio 3: (FAU 2017)',"
        "'Dentre as principais vantagens no uso de relays de estado s??lido frente aos eletromec??nicos em instala????es el??tricas podemos destacar:', "
        "'Menor emiss??o de odores, opera????es de alta frequ??ncia e maior vida ??til.', "
        "'Menor emiss??o de odores, opera????es de alta frequ??ncia e menor custo.', "
        "'Menor emiss??o de ru??dos, opera????es de alta frequ??ncia e menor custo.', "
        "'Menor emiss??o de ru??dos, opera????es de alta frequ??ncia e maior vida ??til.', "
        "'Menor emiss??o de ru??dos, n??o sofre aquecimento e maior vida ??til.', "
        "'0xFFABC6E5', 5, 110);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(1104, 'Exerc??cio 4: (UFGD 2019)',"
        "'Os materiais ferromagn??ticos est??o presentes em v??rios dispositivos eletromagn??ticos. Um bom material ferromagn??tico ?? caracterizado por', "
        "'alta permissividade el??trica.', "
        "'alta permeabilidade magn??tica.', "
        "'alto ??ndice de dureza do material.', "
        "'alto fator de pot??ncia de isolamento.', "
        "'alto fator de pot??ncia de isolamento.', "
        "'0xFFABC6E5', 5, 110);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(1105, 'Exerc??cio 5: (SEE-AC 2020)',"
        "'Um resistor de 25 ?? ?? alimentado eletricamente por uma fonte senoidal com tens??o de pico de 250 V."
        "A energia consumida por esse resistor em tr??s horas ??, em Wh, igual a', "
        "'1250', "
        "'1500', "
        "'3550', "
        "'5500', "
        "'7500', "
        "'0xFFABC6E5', 5, 110);";
    await db.execute(sql);

    //uma quest??o para os demais cards
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(211, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 21);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(221, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 22);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(231, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 23);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(241, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 24);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(251, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 25);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(261, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 26);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(271, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 27);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(281, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD',2, 28);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(291, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 29);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(2101, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFFCCA9DD', 2, 210);";
    await db.execute(sql);


    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(311, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 31);";
    await db.execute(sql);

    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(3101, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 310);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(321, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 32);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(331, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 33);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(341, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 34);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(351, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 35);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(361, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 36);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(371, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 37);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(381, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 38);";
    await db.execute(sql);
    sql =
    "INSERT INTO QUESTION (id, institute, question, alt1, alt2, alt3, alt4, alt5,"
        "colorQuestion, alter_correct, id_content) VALUES(391, 'Exerc??cio 2: (UECE 2021)',"
        "'As lavadoras de roupa comp??em um grupo de eletrodom??sticos muito presente nas resid??ncias. O seu funcionamento ocorre de acordo com uma programa????o pr??via combinando diferentes tipos de movimentos de rota????o do cesto. Na etapa final de lavagem (centrifuga????o), a m??quina gira esse cesto a uma frequ??ncia de 1500 rpm. Considerando ?? ??? 3 e que o cesto possui um raio de 20 cm, a velocidade, em m/s, de um ponto pertencente ?? parede deste cesto corresponde a',"
        "'30.', '120.', '90.', '60.', '35.', '0xFF8FB996', 3, 39);";
    await db.execute(sql);

    sql =
    "INSERT INTO RESUME (id, paragraph1, paragraph2, paragraph3, paragraph4, url_image, id_content) "
        "VALUES(1, "
        "'Tema tendenciosamente curioso que pode despertar ao novo. Afinal, ele aparenta retratar sobre o recome??o. E recome??o do qu?? ou de quem? Do Meio Ambiente, claro! Mas principalmente da rela????o do ser humano com a natureza. Um convite para restabelecer esta rela????o atrav??s do gesto de cuidado, respeito, responsabilidade, consci??ncia e principalmente, de reaproxima????o do homem a natureza. O sentido desta curiosa ponte ?? que cabe a Psicologia estudar o homem enquanto ser biopsicossocial. E assumir a responsabilidade em cultivar pr??ticas e a????es que preservem a vida do ser humano, contribuindo para o gesto de autocuidado e de cuidador. E ?? nesta exata tarefa, que a Ecopsicologia retrata sobre a import??ncia em minimizar comportamentos destrutivos e de neglig??ncia, que coloquem a natureza em risco, assim como a vida do homem.',"
        "'E como contraponto, sabe o que tamb??m se amplia? Os problemas de sa??de, transtornos mentais, quest??es como pobreza e desigualdades. A dist??ncia e o descuido com a natureza aumentam, o cuidado com a economia material e financeira se amplia, e a sa??de se coloca em risco. A vida humana sem as outras formas de natureza se aproxima de limites. E esta ?? a uma das mensagens da Ecopsicologia, a fim de fortalecer a conscientiza????o de que o ser humano enquanto homem que se assemelha a sua natureza ao seu redor. E que assim como ela, carece de cuidado, de aten????o, de respeito, de conhecimento e autoconhecimento, de rela????o, de troca e de mudan??as. A natureza muda o tempo todo! E neste momento a perspectiva futura ?? de que ela seguir?? mudando, mas n??o em uma condi????o infinita e control??vel. Mas sim como tudo na vida, finita e carente de cuidado. Neste momento, estudos apontam que ela se encontra desprotegida, amea??ada, isolada e em risco. ?? preciso cuid??-la! Seu boletim m??dico se assemelha muito as estat??sticas da sociedade. Parece que seus quadros s??o um tanto quanto parecidos. ?? preciso cuid??-los!',"
        "'Tema tendenciosamente curioso que pode despertar ao novo. Afinal, ele aparenta retratar sobre o recome??o. E recome??o do qu?? ou de quem? Do Meio Ambiente, claro! Mas principalmente da rela????o do ser humano com a natureza. Um convite para restabelecer esta rela????o atrav??s do gesto de cuidado, respeito, responsabilidade, consci??ncia e principalmente, de reaproxima????o do homem a natureza. O sentido desta curiosa ponte ?? que cabe a Psicologia estudar o homem enquanto ser biopsicossocial. E assumir a responsabilidade em cultivar pr??ticas e a????es que preservem a vida do ser humano, contribuindo para o gesto de autocuidado e de cuidador. E ?? nesta exata tarefa, que a Ecopsicologia retrata sobre a import??ncia em minimizar comportamentos destrutivos e de neglig??ncia, que coloquem a natureza em risco, assim como a vida do homem.',"
        "'E como contraponto, sabe o que tamb??m se amplia? Os problemas de sa??de, transtornos mentais, quest??es como pobreza e desigualdades. A dist??ncia e o descuido com a natureza aumentam, o cuidado com a economia material e financeira se amplia, e a sa??de se coloca em risco. A vida humana sem as outras formas de natureza se aproxima de limites. E esta ?? a uma das mensagens da Ecopsicologia, a fim de fortalecer a conscientiza????o de que o ser humano enquanto homem que se assemelha a sua natureza ao seu redor. E que assim como ela, carece de cuidado, de aten????o, de respeito, de conhecimento e autoconhecimento, de rela????o, de troca e de mudan??as. A natureza muda o tempo todo! E neste momento a perspectiva futura ?? de que ela seguir?? mudando, mas n??o em uma condi????o infinita e control??vel. Mas sim como tudo na vida, finita e carente de cuidado. Neste momento, estudos apontam que ela se encontra desprotegida, amea??ada, isolada e em risco. ?? preciso cuid??-la! Seu boletim m??dico se assemelha muito as estat??sticas da sociedade. Parece que seus quadros s??o um tanto quanto parecidos. ?? preciso cuid??-los!',"
        "'https://sociedadedospsicologos.files.wordpress.com/2021/06/natureza.jpg', 11);";
    await db.execute(sql);
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    if(oldVersion == 1 && newVersion == 2){
      String sql = "CREATE TABLE user (username varchar(100) PRIMARY KEY, password varchar(100))";
      await db.execute(sql);

      sql = "INSERT INTO user (username, password) VALUES ('joao@gmail.com', '123456')";
      await db.execute(sql);
    }
  }
}