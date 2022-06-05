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
        "p6",
        "p7",
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
    
    let filmes: [Filme] = [
        Filme(image: "01-projeto",
              nome: "projeto",
              ano: 2007,
              genero: "Documentário",
              nota: 9,
              sinopse: "01-TextoSinopse",
              classificaIndicativaImage: "",
              classificacaoIndicativa: "",
              plataforma: ""
             ),
        
        Filme(image: "02-simpsons",
              nome: "simpsons",
              ano: 2009,
              genero: "Terror",
              nota: 7,
              sinopse: "02-TextoSinopse",
              classificaIndicativaImage: "",
              classificacaoIndicativa: "",
              plataforma: ""
             ),
        Filme(image: "03-segredos",
              nome: "segredos",
              ano: 2004,
              genero: "Ficção Científica",
              nota: 10,
              sinopse: "03-TextoSinopse",
              classificaIndicativaImage: "",
              classificacaoIndicativa: "",
              plataforma: ""
             ),
        Filme(image: "04-red",
              nome: "red",
              ano: 2003,
              genero: "Drama",
              nota: 9,
              sinopse: "04-TextoSinopse",
              classificaIndicativaImage: "",
              classificacaoIndicativa: "",
              plataforma: ""
             ),
        
        Filme(image: "05-mercenario",
              nome: "mercenario",
              ano: 2001,
              genero: "Ação",
              nota: 7,
              sinopse: "05-TextoSinopse",
              classificaIndicativaImage: "",
              classificacaoIndicativa: "",
              plataforma: ""
             ),
        Filme(image: "06-pleneta",
              nome: "planeta",
              ano: 2002,
              genero: "Infantil",
              nota: 8,
              sinopse: "06-TextoSinopse",
              classificaIndicativaImage: "",
              classificacaoIndicativa: "",
              plataforma: ""
             ),
        Filme(image: "07-tico",
              nome: "tico",
              ano: 2005,
              genero: "Comédia",
              nota: 7,
              sinopse: "07-TextoSinopse",
              classificaIndicativaImage: "",
              classificacaoIndicativa: "",
              plataforma: ""
             ),
        Filme(image: "08-chamas",
              nome: "chamas",
              ano: 2006,
              genero: "Aventura",
              nota: 8,
              sinopse: "08-TextoSinopse",
              classificaIndicativaImage: "",
              classificacaoIndicativa: "",
              plataforma: ""
             ),
        Filme(image: "09-matrix",
              nome: "matrix",
              ano: 2008,
              genero: "Romance",
              nota: 10,
              sinopse: "09-TextoSinopse",
              classificaIndicativaImage: "",
              classificacaoIndicativa: "",
              plataforma: ""
             ),
    ]
    
}
