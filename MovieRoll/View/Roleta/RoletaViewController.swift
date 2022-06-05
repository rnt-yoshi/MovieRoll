//
//  RoletaViewController.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 26/05/22.
//

import UIKit

class RoletaViewController: UIViewController {
    
    
    var viewModel = RoletaViewModel()
    
    @IBOutlet weak var acaoButton: UIButton!
    @IBOutlet weak var ficcaoButton: UIButton!
    @IBOutlet weak var comediaButton: UIButton!
    @IBOutlet weak var documentarioButton: UIButton!
    @IBOutlet weak var dramaButton: UIButton!
    @IBOutlet weak var aventuraButton: UIButton!
    @IBOutlet weak var infantilButton: UIButton!
    @IBOutlet weak var romanceButton: UIButton!
    @IBOutlet weak var terrorButton: UIButton!
    
    @IBOutlet weak var estrelaNotaUm: UIButton!
    @IBOutlet weak var estrelaNotaDois: UIButton!
    @IBOutlet weak var estrelaNotaTres: UIButton!
    @IBOutlet weak var estrelaNotaQuatro: UIButton!
    @IBOutlet weak var estrelaNotaCinco: UIButton!
    
    @IBOutlet weak var dataDeLancamentoTextField: UITextField!
    
    @IBOutlet weak var plataformasCollectionView: UICollectionView!
    
    var dataLancamentoPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plataformasCollectionView.dataSource = self
        plataformasCollectionView.delegate = self
        
        inicializaPickerView()
        
    }
    
    func inicializaPickerView() {
        dataLancamentoPickerView.delegate = self
        dataLancamentoPickerView.dataSource = self
        
        dataDeLancamentoTextField.inputView = dataLancamentoPickerView
//        anoFinalTextField.inputView = dataLancamentoPickerView
    }
    
    
    @IBAction func acaoButtonPressed(_ sender: Any) {
    }
    
    @IBAction func ficcaoButtonPressed(_ sender: Any) {
    }
    
    @IBAction func comediaButtonPressed(_ sender: Any) {
    }
    
    @IBAction func documentarioButtonPressed(_ sender: Any) {
    }
    
    @IBAction func dramaButtonPressed(_ sender: Any) {
    }
    
    @IBAction func aventuraButtonPressed(_ sender: Any) {
    }
    
    @IBAction func infantilButtonPressed(_ sender: Any) {
    }
    
    @IBAction func romanceButtonPressed(_ sender: Any) {
    }
    
    @IBAction func terrorButtonPressed(_ sender: Any) {
    }
    
    @IBAction func roletarButtonPressed(_ sender: Any) {

            let filme = viewModel.roletaFilmeFiltrado()
            guard let detalhesFilme = storyboard?.instantiateViewController(withIdentifier: "detalhesFilme") as? DetalhesFilmeViewController else { return }
            
            let viewModel = DetalhesFilmeViewModel(filme: filme)
            
            detalhesFilme.viewModel = viewModel
            
            navigationController?.pushViewController(detalhesFilme, animated: true)
        
    }
    
    
    @IBAction func estrelaNotaUmPressed(_ sender: Any) {
        
    }
    
    @IBAction func estrelaNotaDoisPressed(_ sender: Any) {
    }
    
    @IBAction func estrelaNotaTresPressed(_ sender: Any) {
    }
    
    @IBAction func estrelaNotaQuatroPressed(_ sender: Any) {
    }
    
    @IBAction func estrelaNotaCincoPressed(_ sender: Any) {
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

