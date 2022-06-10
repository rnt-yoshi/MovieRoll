//
//  Service.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

class Service {
    static var shared = Service()
    
    var filmesLancamentos: [[Filme]] = []
    var filmesFavoritos: [Filme] = []
    var filmesRoletados: [Filme] = []
    var filmesAssistidos: [Filme] = []
    
    init() {
        for genero in generos{
            filmesLancamentos.append(filtraPorGenero(genero: genero))
        }
    }
    
    private func filtraPorGenero(genero: String) -> [Filme] {
        let filmesFiltradosGenero = filmes.filter { filme in
            return filme.genero == genero
        }
        return filmesFiltradosGenero
    }
    
    let plataformas: [String] = [
        "appletv",
        "disneyplus",
        "globoplay",
        "hbomax",
        "netflix",
        "paramont",
        "primevideo",
        "starplus",
        "telecine"
    ]
    
    let generos: [String] = [
        "Ação",
        "Aventura",
        "Comédia",
        "Drama",
        "Documentário",
        "Ficção",
        "Infantil",
        "Romance",
        "Terror",
    ]
    
    func adicionaNaListaFavoritos(filme: Filme) {
        filmesFavoritos.append(filme)
    }
    
    func adicionaNaListaAssistidos(filme: Filme) {
        filmesAssistidos.append(filme)
    }
    
    func removeDaListaFavoritos(filme: Filme) {
        
        filmesFavoritos.removeAll { filmeFavorito in
            return filme.nome == filmeFavorito.nome
        }
    }
    
    func removeDaListaAssistidos(filme: Filme) {
        filmesAssistidos.removeAll { filmeAssistido in
            return filme.nome == filmeAssistido.nome
        }
    }
    
    let filmeNil = Filme(image: "",
                         nome: "",
                         ano: "",
                         genero: "",
                         nota: 0,
                         sinopse: "",
                         classificaIndicativaImage: "",
                         classificacaoIndicativa: "",
                         plataforma: ""
    )
    
    let filmes: [Filme] = [
        //Ação
        Filme(image: "contratoperigoso",
              nome: "Contrato Perigoso",
              ano: "2022",
              genero: "Ação",
              nota: 6,
              sinopse: "Ao ser dispensado involuntariamente dos fuzileiros navais, James Harper se junta a uma organização paramilitar para sustentar sua família da única maneira que sabe. Juntamente com sua equipe de elite em missões secretas, ele viajará para a Europa para investigar uma ameaça misteriosa, mas plano será comprometido e a equipe eliminada. Harper terá que lutar sozinho para se manter vivo.",
              classificaIndicativaImage: "16",
              classificacaoIndicativa: "Violência extrema, drogas",
              plataforma: "hbomax"
             ),
        Filme(image: "projeto",
              nome: "O Projeto Adam",
              ano: "2022",
              genero: "Ação",
              nota: 7,
              sinopse: "Depois de viajar no tempo e ir parar em 2022 sem querer, o piloto de combate Adam Reed se une à sua versão de 12 anos de idade para salvar o futuro.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "netflix"
             ),
        Filme(image: "doutorestranho",
              nome: "Doutor Estranho",
              ano: "2016",
              genero: "Ação",
              nota: 7,
              sinopse: "Após sua carreira ser destruída, um brilhante, porém arrogante, cirurgião ganha uma nova chance em sua vida quando um feiticeiro o treina para se tornar o Mago Supremo.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "disneyplus"
             ),
        Filme(image: "uncharted",
              nome: "Uncharted: Fora do Mapa",
              ano: "2022",
              genero: "Ação",
              nota: 7,
              sinopse: "Nathan Drake e seu parceiro canastrão Victor Sully Sullivan embarcam em uma perigosa busca para encontrar o maior tesouro jamais encontrado. Enquanto isso, eles também rastreiam pistas que podem levar ao irmão perdido de Nathan.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "paramont"
             ),
        Filme(image: "morbius",
              nome: "Morbius",
              ano: "2022",
              genero: "Ação",
              nota: 6,
              sinopse: "Gravemente doente com um raro distúrbio sanguíneo e determinado a salvar outros sofrendo o mesmo destino, o Dr. Morbius tenta uma aposta desesperada. O que primeiramente parece ser um sucesso radical, libera uma escuridão dentro dele e transforma esse médico em um caçador.",
              classificaIndicativaImage: "14",
              classificacaoIndicativa: "Violência, linguagem sexual",
              plataforma: "hbomax"
             ),
        Filme(image: "sonicdois",
              nome: "Sonic 2: O Filme",
              ano: "2022",
              genero: "Ação",
              nota: 8,
              sinopse: "Depois de se estabelecer em Green Hills, Sonic está pronto para mais liberdade e deixar sua marca como um herói, e Tom e Maddie concordam em deixá-lo em casa enquanto vão de férias. Mas, assim que eles se foram, Dr. Robotnik volta, desta vez com um novo parceiro, Knuckles, em busca de uma esmeralda que tem o poder de construir e destruir civilizações. Sonic se une a um novo companheiro, Tails, e juntos eles embarcam em uma jornada para encontrar a esmeralda antes que ela caia nas mãos erradas.",
              classificaIndicativaImage: "10",
              classificacaoIndicativa: "Linguagem inapropriada",
              plataforma: "starplus"
             ),
        //Aventura
        Filme(image: "ghostbusters",
              nome: "Ghostbusters: Mais Além",
              ano: "2021",
              genero: "Aventura",
              nota: 8,
              sinopse: "Uma mãe solteira resolve se mudar para uma pequena cidade do interior com seus filhos, e acaba descobrindo uma conexão com os Caça-Fantasmas originais e o que o seu avô deixou para trás como legado.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "appletv"
             ),
        Filme(image: "interestelar",
              nome: "Interestelar",
              ano: "2014",
              genero: "Aventura",
              nota: 9,
              sinopse: "As reservas naturais da Terra estão chegando ao fim e um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand, Jenkins e Doyle, ele seguirá em busca de um novo lar.",
              classificaIndicativaImage: "10",
              classificacaoIndicativa: "Linguagem inapropriada",
              plataforma: "hbomax"
             ),
        Filme(image: "finch",
              nome: "Finch",
              ano: "2021",
              genero: "Aventura",
              nota: 8,
              sinopse: "Eu um mundo pós-apocalíptico, um robô construído para proteger o cachorro do seu criado, que está a beira da morte, aprende sobre a vida, amor e amizade, aprendendo o que significa ser humano.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "appletv"
             ),
        Filme(image: "piratasdocaribe",
              nome: "Piratas do Caribe: Navegando em Águas Misteriosas",
              ano: "2011",
              genero: "Aventura",
              nota: 7,
              sinopse: "O passado do capitão Jack Sparrow volta a alcançá-lo quando ele cruza com Angelica, uma bonita pirata que Jack, um dia, amou e depois abandonou. Ela, então, o força a acompanhá-la ao navio Vingança da Rainha Ana, do famoso Barba Negra. Junto com uma tripulação de zumbis, o trio parte em busca da lendária Fonte da Juventude. Mas o rival de Jack, Barbossa, também cobiça a fonte, assim como um navio espanhol.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "primevideo"
             ),
        Filme(image: "junglecruise",
              nome: "Jungle Cruise",
              ano: "2021",
              genero: "Aventura",
              nota: 7,
              sinopse: "O destemido capitão Frank Wolff e a intrépida pesquisadora Lily Houghton se aventuram pela Amazônia a bordo da peculiar embarcação La Quila. Determinados a encontrar uma árvore cujos poderes de cura podem mudar o futuro da medicina, nem mesmo as águas perigosas e as forças sobrenaturais que enfrentam pelo caminho poderão detê-los. Mas os riscos aumentam ainda mais conforme os segredos da árvore se revelam, o destino de Lily e Frank e também de toda a humanidade está em jogo.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "disneyplus"
             ),
        //Comédia
        Filme(image: "cidadeperdida",
              nome: "Cidade Perdida",
              ano: "2022",
              genero: "Comédia",
              nota: 7,
              sinopse: "Uma romancista reclusa acredita que nada seria pior que fazer a turnê do seu livro mais recente com o modelo que ilustra a capa. Tudo muda quando a autora e o modelo sofrem uma tentativa de sequestro, e, com isso, são levados para uma surpreendente aventura na selva.",
              classificaIndicativaImage: "14",
              classificacaoIndicativa: "Violência, linguagem sexual",
              plataforma: "netflix"
             ),
        Filme(image: "spacejam",
              nome: "Space Jam: Um Novo Legado",
              ano: "2021",
              genero: "Comédia",
              nota: 7,
              sinopse: "O superastro do basquete LeBron James se junta à gangue Looney Tunes para derrotar o Goon Squad e salvar seu filho.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "hbomax"
             ),
        Filme(image: "king",
              nome: "King – Meu Melhor Amigo",
              ano: "2022",
              genero: "Comédia",
              nota: 7,
              sinopse: "O que você faria se um filhote de leão aparecesse em seu quarto? Os irmãos Inés e Alex, enfrentam esse dilema quando encontram King, um filhote traficado que foge de um aeroporto e encontra refúgio em sua casa.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "disneyplus"
             ),
        Filme(image: "aeradogelo",
              nome: "A Era do Gelo: As Aventuras de Buck",
              ano: "2022",
              genero: "Comédia",
              nota: 7,
              sinopse: "As peripécias hilárias dos mamíferos pré-históricos favoritos de todo mundo continuam, enquanto os gambás caçadores de emoções Crash e Eddie se juntam ao seu amigo caolho, aventureiro e caçador de dinossauros, a doninha Buck Wild, para enfrentar os dinossauros rebeldes do Mundo Perdido.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "disneyplus"
             ),
        Filme(image: "freeguy",
              nome: "Free Guy: Assumindo o Controle",
              ano: "2021",
              genero: "Comédia",
              nota: 8,
              sinopse: "Um caixa de banco preso a uma entediante rotina tem sua vida virada de cabeça para baixo quando ele descobre que é personagem em um brutalmente realista vídeo game de mundo aberto. Agora ele precisa aceitar sua realidade e lidar com o fato de que é o único que pode salvar o mundo.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "starplus"
             ),
        //Drama
        Filme(image: "chernobyl",
              nome: "Chernobyl: O Filme",
              ano: "2021",
              genero: "Drama",
              nota: 6,
              sinopse: "Três heróis silenciosos prontos para arriscarem suas próprias vidas para evitar uma catástrofe ainda maior na usina nuclear de Chernobyl.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "telecine"
             ),
        Filme(image: "coringa",
              nome: "Coringa",
              ano: "2019",
              genero: "Drama",
              nota: 8,
              sinopse: "Um comediante falido enlouquece e se torna um assassino psicopata.",
              classificaIndicativaImage: "16",
              classificacaoIndicativa: "Violência extrema, drogas",
              plataforma: "telecine"
             ),
        Filme(image: "theoutfit",
              nome: "The Outfit",
              ano: "2022",
              genero: "Drama",
              nota: 7,
              sinopse: "Leonard, um alfaiate inglês costumava fazer ternos na mundialmente famosa Savile Row de Londres. Mas depois de uma tragédia pessoal, ele acabou em Chicago, operando uma pequena alfaiataria em uma parte difícil da cidade, onde ele faz roupas bonitas para as únicas pessoas ao redor que podem pagá-las: uma família de gangsters cruéis.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "hbomax"
             ),
        Filme(image: "ateoultimohomem",
              nome: "Até o Último Homem",
              ano: "2016",
              genero: "Drama",
              nota: 8,
              sinopse: "Desmond T. Doss, foi o médico do Exército Americano da Segunda Guerra Mundial, que serviu durante a Batalha de Okinawa, se recusando a matar pessoas, tornando-se o primeiro homem da história americana a receber a Medalha de Honra sem disparar um tiro.",
              classificaIndicativaImage: "16",
              classificacaoIndicativa: "Violência extrema, drogas",
              plataforma: "primevideo"
             ),
        //Documentário
        Filme(image: "cozinhasdeemergencia",
              nome: "Cozinhas de Emergência",
              ano: "2022",
              genero: "Documentário",
              nota: 7,
              sinopse: "Acompanhe o chef José Andrés e a evolução de sua organização sem fins lucrativos, World Central Kitchen, ao longo de doze anos ̶ passando de um desconexo grupo de voluntários a uma das organizações de ajuda humanitária mais conceituadas no setor de assistência em catástrofes. Devido ao aumento sem precedentes dos desastres naturais causados pela mudança climática, essa história é mais importante do que nunca.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "disneyplus"
             ),
        Filme(image: "messi",
              nome: "Messi",
              ano: "2014",
              genero: "Documentário",
              nota: 7,
              sinopse: "Seus professores, treinadores, amigos de infância e companheiros de equipe do Barça, junto com jornalistas, escritores e figuras de destaque da história do futebol, se reúnem em um restaurante para analisar e distinguir a personalidade de Messi dentro e fora de campo, e relembrar alguns dos momentos mais significativos de sua vida. Visto da perspectiva única de Álex de la Iglesia, Messi recria a infância e a adolescência do jogador, desde os primeiros passos, com uma bola de futebol sempre aos pés, até a decisão de deixar o Rosário pelo Barcelona, a separação da família e a papel desempenhado em sua carreira por indivíduos como Ronaldinho, Rijkaard, Rexach e Guardiola.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "telecine"
             ),
        Filme(image: "planeta",
              nome: "Planeta Pré-Histórico",
              ano: "2022",
              genero: "Documentário",
              nota: 6,
              sinopse: "Experimente como nunca antes as maravilhas do nosso mundo nesta série documental épica de Jon Favreau e dos produtores de Planeta Terra. Viaje 66 milhões de anos para quando dinossauros majestosos e criaturas extraordinárias habitavam terras, mares e céus.",
              classificaIndicativaImage: "10",
              classificacaoIndicativa: "Linguagem inapropriada",
              plataforma: "netflix"
             ),
        Filme(image: "harry",
              nome: "Comemoração de 20 anos de Harry Potter: De Volta a Hogwarts",
              ano: "2022",
              genero: "Documentário",
              nota: 7,
              sinopse: "Uma encantadora história de making-of contada por meio de novas entrevistas em profundidade e conversas com o elenco, convidando os fãs a uma jornada mágica em primeira pessoa através de uma das franquias de filmes mais amadas de todos os tempos.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "primevideo"
             ),
        //Ficção
        Filme(image: "avatar",
              nome: "Avatar",
              ano: "2009",
              genero: "Ficção",
              nota: 8,
              sinopse: "Apesar de não ter mais os movimentos da perna, o ex-fuzileiro naval Jake Sully ainda sente que pode ser um guerreiro. Sua intuição começa a se tornar realidade quando ele viaja anos-luz até a estação espacial montada no Planeta Pandora. Habitado por grandes seres azuis, os Na´vi, o local tem uma atmosfera fatal para qualquer terrestre. Por isso, oficiais criaram o programa Avatar, em que um corpo biológico, híbrido de humano e Na´vi, pode ser comandado a distância.",
              classificaIndicativaImage: "10",
              classificacaoIndicativa: "Linguagem inapropriada",
              plataforma: "disneyplus"
             ),
        Filme(image: "jurassicworld",
              nome: "Jurassic World: Reino Ameaçado",
              ano: "2018",
              genero: "Ficção",
              nota: 7,
              sinopse: "Quatro anos após o fechamento do Jurassic World, um vulcão prestes a entrar em erupção põe em risco a vida na ilha Nublar. No local não há mais qualquer presença humana, com os dinossauros vivendo livremente. Diante da situação, é preciso tomar uma decisão: deve-se retornar à ilha para salvar os animais ou abandoná-los para uma nova extinção? Decidida a resgatá-los, Claire convoca Owen a retornar à ilha com ela.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "globoplay"
             ),
        Filme(image: "animaisfantasticos",
              nome: "Animais Fantásticos: Os Segredos de Dumbledore",
              ano: "2022",
              genero: "Ficção",
              nota: 7,
              sinopse: "O professor Alvo Dumbledore sabe que o poderoso mago das trevas Gellert Grindelwald está se movimentando para assumir o controle do mundo mágico. Incapaz de detê-lo sozinho, ele pede ao magizoologista Newt Scamander para liderar uma intrépida equipe de bruxos, bruxas e um corajoso padeiro trouxa em uma missão perigosa, em que eles encontram velhos e novos animais fantásticos e entram em conflito com a crescente legião de seguidores de Grindelwald. Mas com tantas ameaças, quanto tempo poderá Dumbledore permanecer à margem do embate?",
              classificaIndicativaImage: "10",
              classificacaoIndicativa: "Linguagem inapropriada",
              plataforma: "hbomax"
             ),
        Filme(image: "moonfall",
              nome: "Moonfall: Ameaça Lunar",
              ano: "2022",
              genero: "Ficção",
              nota: 7,
              sinopse: "Poucas semanas antes do impacto e com a humanidade à beira da aniquilação, a ex-astronauta da NASA Jo Fowler está convencida de que tem a resposta para salvar o planeta, mas apenas um colega do passado, o astronauta Brian Harper, e o teorista K.C. Houseman, acreditam nela. Os improváveis heróis correm contra o tempo para montar uma missão ao espaço, mas lá descobrem que a Lua não é o que parece.",
              classificaIndicativaImage: "14",
              classificacaoIndicativa: "Violência, linguagem sexual",
              plataforma: "hbomax"
             ),
        Filme(image: "therequin",
              nome: "The Requin",
              ano: "2022",
              genero: "Ficção",
              nota: 5,
              sinopse: "Um casal de férias no Vietnã se encontram presos em mar aberto após uma enorme tempestade tropical levar sua casa à beira-mar. Com o marido machucado e morrendo, a esposa precisa lutar contra os elementos sozinha, enquanto são cercado por tubarões brancos abaixo.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "hbomax"
             ),
        //Infantil
        Filme(image: "coracaodefogo",
              nome: "Coração de Fogo",
              ano: "2022",
              genero: "Infantil",
              nota: 7,
              sinopse: "Desde criança, Georgia Nolan só tinha um sonho: se tornar bombeira, como seu pai. Infelizmente, no ano de 1932 em Nova York, as mulheres não podiam atuar nessa profissão. Quando os bombeiros da cidade desapareceram um a um misteriosamente em incêndio que queimou o teatro da Broadway, Georgia viu a grande chance! Ela disfarçou-se de “Joe”, um homem magro e esquisito, e entrou para o time improvisado de bombeiros que tem a missão de acabar com o incêndio e solucionar o mistério. Georgia precisa manter sua falsa identidade a qualquer custo, especialmente porque é seu pai quem está no comando dessa operação.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "paramont"
             ),
        Filme(image: "red",
              nome: "Red",
              ano: "2022",
              genero: "Infantil",
              nota: 8,
              sinopse: "Mei, de treze anos, está experimentando a estranheza de ser uma adolescente com uma reviravolta – quando ela fica muito animada, ela se transforma em um panda vermelho gigante.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "disneyplus"
             ),
        Filme(image: "simpsons",
              nome: "Os Simpsons",
              ano: "2022",
              genero: "Infantil",
              nota: 7,
              sinopse: "Os Simpsons moram na cidade de Springfield, uma cidade americana como qualquer outra. Homer trabalha como inspetor de segurança em uma usina de energia nuclear, Marge tenta manter a paz em sua família, Bart é um travesso garoto de 10 anos, Lisa, de 8 anos, é a inteligente da família que adora tocar saxofone e é vegetariana e a pequena Maggie conquista todos enquanto não larga sua chupeta. E a série tem um rico, e muitas vezes estranho, universo de personagens que também habitam Springfield. Com roteiros inteligentes, humor subversivo e divertidamente genial, a série faz piadas de si mesma e de todo mundo que aparecer em seu caminho.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "disneyplus"
             ),
        Filme(image: "ticoeteco",
              nome: "Tico e Teco: Defensores da Lei",
              ano: "2022",
              genero: "Infantil",
              nota: 7,
              sinopse: "Tico e Teco vivem entre desenhos animados e humanos em Los Angeles nos dias de hoje, mas agora suas vidas são bem diferentes. Já se passaram décadas desde que a série de sucesso da dupla foi cancelada, e Tico se rendeu a uma vida doméstica suburbana como um vendedor de seguros. Enquanto isso, Teco passou por uma harmonização facial em CGI e trabalha no circuito de convenções nostálgicas, desesperado para reviver seus dias de glória. Quando um ex-colega de elenco desaparece misteriosamente, Tico e Teco devem consertar a amizade rompida e assumir mais uma vez suas personalidades de Defensores da Lei para salvar a vida do amigo.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "disneyplus"
             ),
        //Romance
        Filme(image: "culpa",
              nome: "A Culpa é das Estrelas",
              ano: "2022",
              genero: "Romance",
              nota: 8,
              sinopse: "Hazel e Gus dividem um senso de humor sarcástico, um desgosto por convenções sociais e, por fim uma amor que vai levá-lo para uma jornada transformadora e inesquecível. Embora os dois adolescentes enfrentem desafios extraordinários, sua coragem e dedicação ao outro provam que a vida pode não ser perfeita, mas o amor é.",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "Conteúdo livre",
              plataforma: "hbomax"
             ),
        Filme(image: "aproposta",
              nome: "A Proposta",
              ano: "2009",
              genero: "Romance",
              nota: 7,
              sinopse: "Margaret Tate é uma poderosa editora de livros, que se vê em apuros ao ser comunicada de sua deportação para o país-natal, o Canadá. Para evitar que isto ocorra ela declara estar noiva de Andrew Paxton, seu assistente. Perseguido por Margaret há anos, ele aceita participar da farsa mas impõe algumas condições.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "starplus"
             ),
        Filme(image: "combinacaoperfeita",
              nome: "Combinação Perfeita",
              ano: "2022",
              genero: "Romance",
              nota: 7,
              sinopse: "Para conquistar uma cliente, a ambiciosa Lola viaja de Los Angeles até uma fazenda na Austrália, onde se interessa por um homem rústico e intrigante.x",
              classificaIndicativaImage: "10",
              classificacaoIndicativa: "Linguagem inapropriada",
              plataforma: "netflix"
             ),
        Filme(image: "casecomigo",
              nome: "Case Comigo",
              ano: "2022",
              genero: "Romance",
              nota: 7,
              sinopse: "A superstar musical Kat Valdez e o professor de matemática Charlie Gilbert são estranhos que concordam em se casar e depois se conhecerem. Um romance improvável sobre duas pessoas diferentes em busca de algo real em um mundo onde o valor é baseado em gostos e seguidores.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "paramont"
             ),
        //Terror
        Filme(image: "rogaipornos",
              nome: "Rogai por Nós",
              ano: "2021",
              genero: "Terror",
              nota: 7,
              sinopse: "Conheça Alice, uma jovem com deficiência auditiva que, após uma suposta visita da Virgem Maria, é inexplicavelmente capaz de ouvir, falar e curar os enfermos. À medida que a notícia se espalha e pessoas de perto e de longe se reúnem para testemunhar seus milagres, um jornalista decadente (Jeffrey Dean Morgan), que espera reviver sua carreira, visita a pequena cidade da Nova Inglaterra para investigar o fenômeno. Quando eventos terríveis começam a acontecer por toda parte, ele começa a questionar se esses fenômenos são obras da Virgem Maria ou algo muito mais sinistro.",
              classificaIndicativaImage: "14",
              classificacaoIndicativa: "Violência, linguagem sexual",
              plataforma: "hbomax"
             ),
        Filme(image: "amedium",
              nome: "A Médium",
              ano: "2021",
              genero: "Terror",
              nota: 7,
              sinopse: "Uma história horripilante sobre a herança de um xamã na região de Isan, na Tailândia, onde a Deusa que parece ter possuído um membro da família acaba não sendo tão benevolente quanto pensavam ser.",
              classificaIndicativaImage: "16",
              classificacaoIndicativa: "Violência extrema, drogas",
              plataforma: "netflix"
             ),
        Filme(image: "exorcismosagrado",
              nome: "Exorcismo Sagrado",
              ano: "2022",
              genero: "Terror",
              nota: 7,
              sinopse: "Ao ser possuído durante um ritual de exorcismo, o padre Peter Williams acabou cometendo um terrível sacrilégio. Dezoito anos depois, as consequências de seu pecado voltam para assombrá-lo e acabam desencadeando uma batalha ainda maior entre o bem e o mal.",
              classificaIndicativaImage: "16",
              classificacaoIndicativa: "Violência extrema, drogas",
              plataforma: "netflix"
             ),
        Filme(image: "thehouse",
              nome: "The House",
              ano: "2022",
              genero: "Terror",
              nota: 7,
              sinopse: "Nesta comédia de animação de humor ácido, uma família humilde, um arquiteto ansioso e uma senhoria cansada ficam presos à mesma casa misteriosa em épocas diferentes.",
              classificaIndicativaImage: "12",
              classificacaoIndicativa: "Agressão, consumo de drogas",
              plataforma: "netflix"
             )
    ]
    
}
