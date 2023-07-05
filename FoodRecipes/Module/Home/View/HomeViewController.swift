//
//  HomeViewController.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import UIKit
import Kingfisher
import Reachability

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var dessertView: UIView!
  @IBOutlet weak var dessertStackView: UIStackView!
  @IBOutlet weak var dinnerView: UIView!
  @IBOutlet weak var dinnerStackView: UIStackView!
  @IBOutlet weak var launchView: UIView!
  @IBOutlet weak var launchStackView: UIStackView!
  @IBOutlet weak var breakfastView: UIView!
  @IBOutlet weak var breakfastStackView: UIStackView!
  @IBOutlet weak var popularView: UIView!
  @IBOutlet weak var popularStackView: UIStackView!
  @IBOutlet weak var homeTableView: UITableView!
  @IBOutlet weak var noInternetImage: UIImageView!

  var categoriesArray: [UIView?] = []
  var indicator: UIActivityIndicatorView!
  var viewModel: HomeViewModel!
  var result: Result?

  override func viewDidLoad() {
    super.viewDidLoad()
    categoriesArray = [popularView, breakfastView, launchView, dinnerView, dessertView]

    noInternetImage.isHidden = true

    addGestures()

    let cellNib = UINib(nibName: "recipeCell", bundle: nil)
    homeTableView.register(cellNib, forCellReuseIdentifier: "recipecell")

    setupIndicator()

//    setLoading(isLoading: true)

    viewModel = HomeViewModel(netWorkingDataSource: Network(), locaDataSource: RecipeRepo.instance) // ok
    setupBindingDataToVC()
    viewModel.loadAllFavRecipes()
    changeColor1()

  }

  func getItemsAfterCheckingConnection(categoryName: String){
    do {
      if try Reachability().connection != .unavailable {
        self.noInternetImage.isHidden = true
        self.viewModel.getItems(categoryName: categoryName)
      }
      else {
        self.homeTableView.isHidden = true
        self.noInternetImage.isHidden = false
        setLoading(isLoading: false)
      }
    } catch {

    }
  }


  private func setLoading(isLoading: Bool) {
    if isLoading {
      self.view.isUserInteractionEnabled = false
      indicator.startAnimating()
    } else {
      self.view.isUserInteractionEnabled = true
      indicator.stopAnimating()
    }
  }

  func setupBindingDataToVC(){
    viewModel.bindResultToViewController = {[weak self] in
      DispatchQueue.main.async {
        self?.homeTableView.reloadData()
        self?.setLoading(isLoading: false)
        self?.homeTableView.isHidden = false
      }
    }
  }



  func setupIndicator(){
    indicator = UIActivityIndicatorView(style: .large)
    indicator.center = self.view.center
    self.view.addSubview(indicator)
    indicator.color = UIColor(named: orangeColor)
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.result?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "recipecell", for: indexPath) as! RecipeCell

    result = viewModel.result?[indexPath.row]
      cell.setupCell(item: result!)
      
      if viewModel.checkIsItemInFav(id: result?.id ?? -1){
          cell.setFavUI(isFav: true)

      } else {
          cell.setFavUI(isFav: false)
      }
      
      cell.bindResultToView = { [weak self] in
          
          if ((self?.viewModel.checkIsItemInFav(id: self?.result?.id ?? -1)) == true){
              AlertType.confirmRemove(deleteHandler: {
                  self?.viewModel.removeFavItem(id: self?.result?.id ?? -1)
                  cell.setFavUI(isFav: true)
              }).showAlert(in: self!)
             
          }else{
              self?.viewModel.addToFav(item: (self?.result!)!)
              cell.setFavUI(isFav: false)
          }
          
      }

    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat(CellConstants.CELL_HEIGHT)
  }


  func addGestures(){

    let gesture1 = UITapGestureRecognizer(target: self, action: #selector(changeColor1))
    popularStackView?.addGestureRecognizer(gesture1)

    let gesture2 = UITapGestureRecognizer(target: self, action: #selector(changeColor2))
    breakfastView?.addGestureRecognizer(gesture2)

    let gesture3 = UITapGestureRecognizer(target: self, action: #selector(changeColor3))
    launchStackView?.addGestureRecognizer(gesture3)

    let gesture4 = UITapGestureRecognizer(target: self, action: #selector(changeColor4))
    dinnerStackView?.addGestureRecognizer(gesture4)

    let gesture5 = UITapGestureRecognizer(target: self, action: #selector(changeColor5))
    dessertStackView?.addGestureRecognizer(gesture5)

  }

  func resetAllColors(){
    setLoading(isLoading: true)

    homeTableView.isHidden = true
    for i in categoriesArray{
      resetColor(categoryView: i!)
    }
  }

  @objc func changeColor1(){
    resetAllColors()
    popularView.backgroundColor = UIColor(named: orangeColor)
    getItemsAfterCheckingConnection(categoryName: popular)
  }

  @objc func changeColor2(){
    resetAllColors()
    breakfastView.backgroundColor = UIColor(named: orangeColor)
    getItemsAfterCheckingConnection(categoryName: breakfast)
  }

  @objc func changeColor3(){
    resetAllColors()
    launchView.backgroundColor = UIColor(named: orangeColor)
    getItemsAfterCheckingConnection(categoryName: launch)
  }

  @objc func changeColor4(){
    resetAllColors()
    dinnerView.backgroundColor = UIColor(named: orangeColor)
    getItemsAfterCheckingConnection(categoryName: dinner)
  }

  @objc func changeColor5(){
    resetAllColors()
    dessertView.backgroundColor = UIColor(named: orangeColor)
    getItemsAfterCheckingConnection(categoryName: dessert)
  }

  @objc func resetColor(categoryView: UIView){
    categoryView.backgroundColor = UIColor(named: grayColor)
  }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        
        let recipeDetails = storyboard.instantiateViewController(withIdentifier: "recipeDetails") as! DetailsViewController
        recipeDetails.modalPresentationStyle = .fullScreen
      
        recipeDetails.recipe = viewModel.result?[indexPath.row]

        present(recipeDetails, animated: true)
    }
}
