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
        viewModel.delegate = self
        
        inicializaCollectionView()
        inicializaTextField()
        inicializaPickerView()
    }
    
    private func inicializaCollectionView() {
        plataformasCollectionView.dataSource = self
        plataformasCollectionView.delegate = self
        plataformasCollectionView.allowsMultipleSelection = true
    }
    
    private func inicializaTextField() {
        dataDeLancamentoTextField.layer.borderWidth = 1
        dataDeLancamentoTextField.layer.cornerRadius = 8
        dataDeLancamentoTextField.layer.borderColor = UIColor(red: 226.0/255, green: 105.0/255, blue: 64.0/255, alpha: 1.0).cgColor
    }
    
    private func inicializaPickerView() {
        dataLancamentoPickerView.delegate = self
        dataLancamentoPickerView.dataSource = self
        
        let okButton = UIBarButtonItem(title: "OK", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePickerView))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.black
        toolBar.isTranslucent = false
        toolBar.tintColor = UIColor(red: 226.0/255, green: 105.0/255, blue: 64.0/255, alpha: 1.0)
        toolBar.sizeToFit()
        
        toolBar.setItems([spaceButton, okButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        dataDeLancamentoTextField.inputView = dataLancamentoPickerView
        dataDeLancamentoTextField.inputAccessoryView = toolBar
        
        dataLancamentoPickerView.setValue(UIColor(red: 226.0/255, green: 105.0/255, blue: 64.0/255, alpha: 1.0), forKeyPath: "textColor")
        dataLancamentoPickerView.backgroundColor = UIColor.black
    }
    
    @objc private func donePickerView() {
        dataDeLancamentoTextField.resignFirstResponder()
    }
    
    @IBAction func generosBotoesAction(_ sender: UIButton) {
        viewModel.generoPressionado(sender.configuration?.title, alpha: Float(sender.alpha), tag: sender.tag)
    }
    
    @IBAction func estrelaNotaButtonAction(_ sender: UIButton) {
        viewModel.estrelaNotaPressionada(sender.tag)
    }
    
    
    @IBAction func limparAnosButtonAction(_ sender: Any) {
        viewModel.limparAnos()
        dataDeLancamentoTextField.text = ""
        
    }
    
    @IBAction func roletarButtonPressed(_ sender: Any) {
        let filme = viewModel.roletaFilmeFiltrado()
        
        viewModel.adicionarListaFilmesRoletados(filme: filme)
        
        guard let detalhesFilme = storyboard?.instantiateViewController(withIdentifier: "detalhesFilme") as? DetalhesFilmeViewController else { return }
        
        let ehFavorito = viewModel.verificaFavorito(filme: filme)
        let foiAssistido = viewModel.verificaAssistido(filme: filme)
        
        let viewModel = DetalhesFilmeViewModel(filme: filme, ehFavorito: ehFavorito, foiAssistido: foiAssistido)
        
        detalhesFilme.viewModel = viewModel
  
        navigationController?.pushViewController(detalhesFilme, animated: true)
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PlataformasCollectionViewCell else { return }
        viewModel.adicionaPlataformaFiltro(indexPath: indexPath)
        cell.alpha = 0.60
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.orange.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PlataformasCollectionViewCell else { return }
        viewModel.removePlataformaFiltro(indexPath: indexPath)
        cell.alpha = 1
        cell.layer.borderWidth = 0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if cell.isSelected {
            cell.alpha = 0.60
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 3
            cell.layer.borderColor = UIColor.orange.cgColor
        } else {
            cell.alpha = 1
            cell.layer.borderWidth = 0
        }
    }
}

extension RoletaViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewModel.numberComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfRows(component: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.titleForRow(row: row, component: component)
    }
}

extension RoletaViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataDeLancamentoTextField.text = viewModel.getTitleForTextField(row: row, componente: component)
    }
}

extension RoletaViewController: RoletaViewModelDelegate {
    func exibirAlerta() {
        let alerta = UIAlertController(title: "Nenhum filme encontrado com os filtros escolhidos!", message: "Altera os filtros e tente novamente", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alerta.addAction(okAction)
        
        present(alerta, animated: true)
    }
    
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
        UIView.animate(
            withDuration: 2.0,
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
