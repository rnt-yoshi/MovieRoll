//
//  RoletaViewController.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 26/05/22.
//

import UIKit

class RoletaViewController: UIViewController {
    
    
    var viewModel = RoletaViewModel()
    
    @IBOutlet var generosBotoes: [UIButton]!
    
    @IBOutlet weak var dataDeLancamentoTextField: UITextField!
    
    @IBOutlet weak var plataformasCollectionView: UICollectionView!
    
    @IBOutlet var estrelasNotaBotao: [UIButton]!
    
    var dataLancamentoPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plataformasCollectionView.dataSource = self
        plataformasCollectionView.delegate = self
        viewModel.delegate = self
        
        inicializaPickerView()
    }
    
    func inicializaPickerView() {
        dataLancamentoPickerView.delegate = self
        dataLancamentoPickerView.dataSource = self
        
        dataDeLancamentoTextField.inputView = dataLancamentoPickerView
        //        anoFinalTextField.inputView = dataLancamentoPickerView
    }
    
    @IBAction func generosBotoesAction(_ sender: UIButton) {
        viewModel.generoPressionado(sender.configuration?.title, alpha: Float(sender.alpha), tag: sender.tag)
    }
    
    @IBAction func roletarButtonPressed(_ sender: Any) {
        
        let filme = viewModel.roletaFilmeFiltrado()
        guard let detalhesFilme = storyboard?.instantiateViewController(withIdentifier: "detalhesFilme") as? DetalhesFilmeViewController else { return }
        
        let viewModel = DetalhesFilmeViewModel(filme: filme)
        
        detalhesFilme.viewModel = viewModel
        
        navigationController?.pushViewController(detalhesFilme, animated: true)
        
    }
    
    
    @IBAction func estrelaNotaButtonAction(_ sender: UIButton) {
        viewModel.estrelaNotaPressionada(sender.tag)
    }
    
}

extension RoletaViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = plataformasCollectionView.dequeueReusableCell(withReuseIdentifier: "plataformasCollectionViewCell", for: indexPath) as? PlataformasCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configuraCell(viewModel: viewModel, index: indexPath.item)
        
        return cell
    }
}


extension RoletaViewController: UICollectionViewDelegate {
    
}

extension RoletaViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewModel.numberComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.titleForRow(row: row)
    }
}


extension RoletaViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataDeLancamentoTextField.text = viewModel.getTitleForTextField(row: row, componente: component)
        dataDeLancamentoTextField.resignFirstResponder()
    }
}

extension RoletaViewController: RoletaViewModelDelegate {
    func botaoSelecionado(tag: Int) {
        generosBotoes[tag].alpha = 0.60
        generosBotoes[tag].layer.cornerRadius = 10
        generosBotoes[tag].layer.borderWidth = 3
        generosBotoes[tag].layer.borderColor = UIColor.orange.cgColor
    }
    
    func botaoSemSelecao(tag: Int) {
        generosBotoes[tag].alpha = 1
        generosBotoes[tag].layer.borderWidth = 0
        
    }
    
    func estrelaVazia(tag: Int) {
        estrelasNotaBotao[tag].configuration?.image = UIImage(systemName: "star")
        estrelasNotaBotao[tag].configuration?.baseForegroundColor = .systemYellow
        estrelasNotaBotao[tag].transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
            self.estrelasNotaBotao[tag].transform = CGAffineTransform.identity
        },
                       completion: { Void in()  }
        )
        
    }
    
    func estrelaCheia(tag: Int) {
        estrelasNotaBotao[tag].configuration?.image = UIImage(systemName: "star.fill")
        estrelasNotaBotao[tag].configuration?.baseForegroundColor = .systemYellow
        estrelasNotaBotao[tag].transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
            self.estrelasNotaBotao[tag].transform = CGAffineTransform.identity
        },
                       completion: { Void in()  }
        )
        
    }
    
}
