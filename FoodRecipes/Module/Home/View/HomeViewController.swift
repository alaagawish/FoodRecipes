//
//  HomeViewController.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import UIKit

class HomeViewController: UIViewController {

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

  var categoriesArray: [UIView?] = []
  var categoriesStackArray: [UIStackView?] = []
//  var selectedStack:

  override func viewDidLoad() {
    super.viewDidLoad()
    categoriesArray = [popularView, breakfastView, launchView, dinnerView, dessertView]
    categoriesStackArray = [popularStackView, breakfastStackView, launchStackView, dinnerStackView, dessertStackView]

    addGestures()

  }


  func addGestures(){
//    for (index, element) in categoriesArray.enumerate() {
//
//      let gesture = UITapGestureRecognizer(target: self, action: #selector(changeColor1))
//
//      popularStackView?.addGestureRecognizer(gesture)
//    }

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
    for i in categoriesArray{
      resetColor(categoryView: i!)
    }
  }

  @objc func changeColor1(){
    resetAllColors()
    popularView.backgroundColor = UIColor(named: "CategoryColor")
  }

  @objc func changeColor2(categoryView: UIView){
    resetAllColors()
    breakfastView.backgroundColor = UIColor(named: "CategoryColor")
  }

  @objc func changeColor3(categoryView: UIView){
    resetAllColors()
    launchView.backgroundColor = UIColor(named: "CategoryColor")
  }


  @objc func changeColor4(categoryView: UIView){
    resetAllColors()
    dinnerView.backgroundColor = UIColor(named: "CategoryColor")
  }

  @objc func changeColor5(categoryView: UIView){
    resetAllColors()
    dessertView.backgroundColor = UIColor(named: "CategoryColor")
  }



  @objc func resetColor(categoryView: UIView){
    categoryView.backgroundColor = UIColor(named: "grayBG")
  }

}
