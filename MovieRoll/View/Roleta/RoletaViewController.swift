//
//  RoletaViewController.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 26/05/22.
//

import UIKit

class RoletaViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var roletarButton: UIButton!
    @IBOutlet private var generosBotoes: [UIButton]!
    @IBOutlet private weak var dataDeLancamentoTextField: UITextField!
    @IBOutlet private weak var plataformasCollectionView: UICollectionView!
    @IBOutlet private var estrelasNotaBotao: [UIButton]!
    @IBOutlet weak var rollActivityIndicator: UIActivityIndicatorView!
    
    //MARK: - Private Properties
    
    private var viewModel = RoletaViewModel()
    private var dataLancamentoPickerView = UIPickerView()
    
    //MARK: - Public Properties
    
    //MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        inicializaCollectionView()
        inicializaTextField()
        inicializaPickerView()
        
        rollActivityIndicator.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        roletarButton.isEnabled = true
        roletarButton.isHidden = false
        
        rollActivityIndicator.isHidden = true
        rollActivityIndicator.stopAnimating()
        
    }
    
    //MARK: - Private Methods
    
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
        
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.donePickerView))
        self.view.addGestureRecognizer(tap)
        
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
        self.view.endEditing(true)
    }
    
    //MARK: - Actions
    
    @IBAction private func generosBotoesAction(_ sender: UIButton) {
        viewModel.generoPressionado(sender.configuration?.title, alpha: Float(sender.alpha), tag: sender.tag)
    }
    
    @IBAction private func estrelaNotaButtonAction(_ sender: UIButton) {
        viewModel.estrelaNotaPressionada(sender.tag)
    }
    
    @IBAction private func limparAnosButtonAction(_ sender: Any) {
        viewModel.limparFiltroDaData()
        dataDeLancamentoTextField.text = ""
    }
    
    @IBAction private func roletarButtonPressed(_ sender: Any) {
        viewModel.botaoRoletarMovie()
    }

}

//MARK: - RoletaViewModel Delegate

extension RoletaViewController: RoletaViewModelDelegate {
    func reloadPickerView() {
        dataLancamentoPickerView.reloadAllComponents()
    }
    
    func desabilitarBotaoRoletar() {
        roletarButton.isEnabled = false
        roletarButton.isHidden = true
        rollActivityIndicator.isHidden = false
        rollActivityIndicator.startAnimating()
    }
    
    func carregaFilme(movie: Movie) {
        guard let detalhesFilme = storyboard?.instantiateViewController(withIdentifier: "detalhesFilme") as? DetalhesFilmeViewController else { return }
        
        let ehFavorito = viewModel.verificaFavorito(movie: movie)
        let foiAssistido = viewModel.verificaAssistido(movie: movie)
        
        let viewModel = DetalhesFilmeViewModel(movie: movie, ehFavorito: ehFavorito, foiAssistido: foiAssistido)
        
        detalhesFilme.viewModel = viewModel
        
        navigationController?.pushViewController(detalhesFilme, animated: true)
    }
    
    func exibirAlertaEHabilitarBotao() {
        let alerta = UIAlertController(title: "Nenhum filme encontrado com os filtros escolhidos!", message: "Altere os filtros e tente novamente", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alerta.addAction(okAction)
        
        present(alerta, animated: true)
        
        roletarButton.isEnabled = true
        roletarButton.isHidden = false
        rollActivityIndicator.stopAnimating()
        rollActivityIndicator.isHidden = true
    }
    
    func botaoGeneroSelecionado(tag: Int) {
        generosBotoes[tag].alpha = 0.60
        generosBotoes[tag].layer.cornerRadius = 10
        generosBotoes[tag].layer.borderWidth = 3
        generosBotoes[tag].layer.borderColor = UIColor.orange.cgColor
    }
    
    func botaoGeneroSemSelecao(tag: Int) {
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

//MARK: - RELEASE DATE: PickerView DataSource & Delegate

extension RoletaViewController: UIPickerViewDataSource, UIPickerViewDelegate  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewModel.numberComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfRows(component: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.titleForRow(row: row, component: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataDeLancamentoTextField.text = viewModel.getTitleForTextField(row: row, componente: component)
    }
}

//MARK: - PROVIDERS: CollectionView DataSource & Delegate

extension RoletaViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = plataformasCollectionView.dequeueReusableCell(withReuseIdentifier: "plataformasCollectionViewCell", for: indexPath) as? PlataformasCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configuraCell(viewModel: viewModel, index: indexPath.item)
        
        return cell
    }
    
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


