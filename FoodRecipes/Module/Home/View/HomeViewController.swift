//
//  HomeViewController.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import UIKit
import Kingfisher

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

  var categoriesArray: [UIView?] = []
  var indicator: UIActivityIndicatorView!
  var viewModel: HomeViewModel!
  var result: Result?

  override func viewDidLoad() {
    super.viewDidLoad()
    categoriesArray = [popularView, breakfastView, launchView, dinnerView, dessertView]

    addGestures()

    let cellNib = UINib(nibName: "recipeCell", bundle: nil)
    homeTableView.register(cellNib, forCellReuseIdentifier: "recipecell")

    setupIndicator()
    viewModel = HomeViewModel()

    viewModel.getItems(categoryName: "breakfast")
    viewModel.bindResultToViewController = {[weak self] in
      DispatchQueue.main.async {
        self?.homeTableView.reloadData()
        self?.indicator.stopAnimating()
      }
    }
  }

  func setupIndicator(){
    indicator = UIActivityIndicatorView(style: .large)
    indicator.center = self.view.center
    self.view.addSubview(indicator)
    indicator.color = UIColor(named: orangeColor)
//    indicator.backgroundColor = UIColor(named: gray53)
    indicator.startAnimating()
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
    cell.lblChefName.text = result?.credits?[0].name
    cell.lblRecipeName.text = result?.slug?.replacingOccurrences(of: "-", with: " ")
    cell.lblServings.text = "\(result?.numServings ?? 0)"
    cell.lblFoodType.text = result?.show?.name

//    var imgUrl = result?.thumbnailUrl
//    let processor = DownsamplingImageProcessor(size: cell.imgRecipe.bounds.size)
//    |> RoundCornerImageProcessor(cornerRadius: (cell.imgRecipe.bounds.size.width)/2)

//    cell.imgRecipe.kf.setImage(
//      with: imgUrl,
//      placeholder: UIImage(named: "recipe"),
//      options: [
//          .processor(processor),
//          .scaleFactor(UIScreen.main.scale),
//          .transition(.fade(1)),
//          .cacheOriginalImage
//      ])
    
//    cell.imgRecipe.kf.setImage(with: imgUrl, placeholder: UIImage(named: "recipe"))


    return cell
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
    indicator.startAnimating()
    for i in categoriesArray{
      resetColor(categoryView: i!)
    }
  }

  @objc func changeColor1(){
    resetAllColors()
    popularView.backgroundColor = UIColor(named: orangeColor)
    viewModel.getItems(categoryName: popular)
  }

  @objc func changeColor2(categoryView: UIView){
    resetAllColors()
    breakfastView.backgroundColor = UIColor(named: orangeColor)
    viewModel.getItems(categoryName: breakfast)
  }

  @objc func changeColor3(categoryView: UIView){
    resetAllColors()
    launchView.backgroundColor = UIColor(named: orangeColor)
    viewModel.getItems(categoryName: launch)
  }


  @objc func changeColor4(categoryView: UIView){
    resetAllColors()
    dinnerView.backgroundColor = UIColor(named: orangeColor)
    viewModel.getItems(categoryName: dinner)
  }

  @objc func changeColor5(categoryView: UIView){
    resetAllColors()
    dessertView.backgroundColor = UIColor(named: orangeColor)
    viewModel.getItems(categoryName: dessert)
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
