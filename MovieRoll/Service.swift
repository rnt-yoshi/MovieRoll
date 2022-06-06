//
//  Service.swift
//  MovieRoll
//
//  Created by Raul Felippe on 04/06/22.
//

import Foundation

class Service {
    
    let plataformas: [String] = [
        "p1",
        "p2",
        "p3",
        "p4",
        "p5",
        "p7",
        "p6",
        "p8",
        "p9"
    ]
    
    let generos: [String] = [
        "Ação",
        "Infantil",
        "Drama",
        "Ficção Científica",
        "Comédia",
        "Aventura",
        "Documentário",
        "Romance",
        "Terror"
    ]
    
    let filmeNil = Filme(image: "Renato",
                         nome: "Renato",
                         ano: "2000",
                         genero: "",
                         nota: 0,
                         sinopse: "",
                         classificaIndicativaImage: "",
                         classificacaoIndicativa: "",
                         plataforma: ""
    )
    
    
    
    let filmes: [Filme] = [
        Filme(image: "01-projeto",
              nome: "Projeto",
              ano: "2007",
              genero: "Terror",
              nota: 6,
              sinopse: "01-TextoSinopse",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "",
              plataforma: "p1"
             ),
        
        Filme(image: "02-simpsons",
              nome: "Simpsons",
              ano: "1930",
              genero: "Comédia",
              nota: 6,
              sinopse: "02-TextoSinopse",
              classificaIndicativaImage: "16",
              classificacaoIndicativa: "",
              plataforma: "p1"
             ),
        Filme(image: "03-segredos",
              nome: "Segredos",
              ano: "2004",
              genero: "Terror",
              nota: 6,
              sinopse: "03-TextoSinopse",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "",
              plataforma: "p3"
             ),
        Filme(image: "04-red",
              nome: "Red",
              ano: "2003",
              genero: "Drama",
              nota: 9,
              sinopse: "04-TextoSinopse",
              classificaIndicativaImage: "16",
              classificacaoIndicativa: "",
              plataforma: "p2"
             ),
        
        Filme(image: "05-mercenario",
              nome: "Mercenario",
              ano: "2001",
              genero: "Ação",
              nota: 7,
              sinopse: "05-TextoSinopse",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "",
              plataforma: "p4"
             ),
        Filme(image: "06-pleneta",
              nome: "Planeta",
              ano: "2002",
              genero: "Infantil",
              nota: 3,
              sinopse: "06-TextoSinopse",
              classificaIndicativaImage: "16",
              classificacaoIndicativa: "",
              plataforma: "p9"
             ),
        Filme(image: "07-tico",
              nome: "Tico",
              ano: "2005",
              genero: "Comédia",
              nota: 5,
              sinopse: "07-TextoSinopse",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "",
              plataforma: "p7"
             ),
        Filme(image: "08-chamas",
              nome: "Chamas",
              ano: "2006",
              genero: "Aventura",
              nota: 6,
              sinopse: "08-TextoSinopse",
              classificaIndicativaImage: "16",
              classificacaoIndicativa: "",
              plataforma: "p7"
             ),
        Filme(image: "09-matrix",
              nome: "Matrix",
              ano: "2008",
              genero: "Romance",
              nota: 7,
              sinopse: "09-TextoSinopse",
              classificaIndicativaImage: "livre",
              classificacaoIndicativa: "",
              plataforma: "p8"
             ),
    ]
    
}
