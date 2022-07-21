//
//  ServiceAuth.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 14/07/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FacebookLogin

class ServiceAuth: UIViewController {
    
    static var userPerfil = User(
        name: "",
        email: "",
        image: Data()
    )
    
    func informacoesDoUsuario() {
        let currentUser = Auth.auth().currentUser
        
        ServiceAuth.userPerfil.image = Data()
        if let photo = currentUser?.photoURL {
            guard let imageData =  try? Data(contentsOf: photo) else { return }
            ServiceAuth.userPerfil.image = imageData
        }
        ServiceAuth.userPerfil.name = currentUser?.displayName ?? currentUser?.email ?? "Desconectado"
        ServiceAuth.userPerfil.email = currentUser?.email ?? ""
    }
    
    func salvarNoFirebase(com credencial: AuthCredential) {
        Auth.auth().signIn(with: credencial) { authResult, error in
            if let error = error {
                print(error)
            }
            // ...
            return
        }
    }
    
    func pegarCredencialGoogle(de user: GIDGoogleUser?) -> AuthCredential? {
        guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
        else {
            return nil
        }
        
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: authentication.accessToken
        )
        
        return credential
    }
    
    func pegarConfiguracaoGoogle() -> GIDConfiguration? {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return nil }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        return config
    }
    
    func tratarResultadoLoginFacebook(result: LoginManagerLoginResult?, error: Error?) {
        switch result {
            
        case .none:
            print("Um erro aconteceu")
        case .some(let loginResult):
            
            guard let token = loginResult.token?.tokenString else {
                return
            }
            
            let credencial = pegarConfiguracaoFacebook(
                token: token
            )
            
            salvarNoFirebase(com: credencial)
        }
    }
    
    private func pegarConfiguracaoFacebook(token: String) -> AuthCredential {
            return FacebookAuthProvider.credential(
                withAccessToken: token
            )
        }
}
