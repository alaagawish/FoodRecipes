//
//  DetailsViewController.swift
//  FoodRecipes
//
//  Created by Alaa on 27/05/2023.
//

import UIKit

class DetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    var detailsVM: DetailsViewModel!
    var ingredients: [Credit] = []
    var instructions: [Instruction] = []
    var similars: [Result] = []
    var recipe:Result!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsVM = DetailsViewModel(network: Network())
        detailsVM.bindRecipeDetails = {[weak self] in
            self?.instructions = self?.detailsVM.recipeDetails.instructions ?? []
            //            ingredients = detailsVM.recipeDetails
            self?.detailsCollectionView.reloadData()
        }
        detailsVM.bindRecipeDetails = {[weak self] in
            self?.similars = self?.detailsVM.similarRecipe ?? []
            self?.detailsCollectionView.reloadData()
        }
        detailsVM.getRecipeDetails(id: recipe.id ?? 0)
        detailsVM.getSimilarRecipe(id: recipe.id ?? 0)
        // Do any additional setup after loading the view.
    }
    func initSections()   {
        let layout = UICollectionViewCompositionalLayout{index, environment in
            if index == 0{
                print("header")
                return self.drawTitleSection()
            }else if index == 1 {
                print("ingredients")
                return self.drawIngredientsSection()
                
            }else if index == 2{
                print("instructions")
                return self.drawInstructionsSection()
            }else if index == 3{
                print("similars")
                return self.drawSimilarRecipesSection()
            }
            return self.drawTitleSection()
        }
        
        detailsCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let   cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleCell", for: indexPath) as! TitleDetailsCollectionViewCell
            return cell
        }else if indexPath.section == 1 {
            let   cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ingredientCell", for: indexPath) as! IngredientCollectionViewCell
            return cell
        }else if indexPath.section == 2 {
            let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "instructionCell", for: indexPath) as! InstructionsCollectionViewCell
            cell.setDetails(instruction: recipe.instructions?[indexPath.row].displayText ?? "")
            return cell
            
        }else if indexPath.section == 3 {
            let    cell = collectionView.dequeueReusableCell(withReuseIdentifier: "similarCell", for: indexPath) as! SimilarRecipeCollectionViewCell
            
            cell.setDetails(recipe: recipe)
            return cell
        }
        
        
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 3
        }else if section == 2 {
            return instructions.count
        }else if section == 3 {
            return similars.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerDetails", for: indexPath) as! HeaderCollectionReusableView
            let section = DetailSection(rawValue: indexPath.section)
            switch(section){
            case .header:
                header.headerLabel.isHidden = true
            case .ingredient:
                header.headerLabel.text = "Ingredients"
            case .instruction:
                header.headerLabel.text = "Instructions"
            case .similarRecipe:
                header.headerLabel.text = "Similar Recipes"
                
            case .none:
                header.headerLabel.isHidden = true
            }
            
            
            return header
        }
        return UICollectionReusableView()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 3{
            
        }
    }
    
    
}
extension DetailsViewController{
    func drawTitleSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:  .absolute(UIScreen.main.bounds.height/5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 32)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 0)
        
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30)) // Set the header size
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [headerSupplementary]
        
        return section
    }
    
    func drawIngredientsSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:  .absolute(UIScreen.main.bounds.height/4))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
    
        return section
    }
    
    func drawInstructionsSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:  .absolute(UIScreen.main.bounds.height/4))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        //section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(25))
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [headerSupplementary]
        return section
    }
    
    func drawSimilarRecipesSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension:  .absolute(UIScreen.main.bounds.height/6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 32)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 0)
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [headerSupplementary]
        
        return section
    }
}
enum DetailSection: Int {
    case header = 0
    case ingredient = 1
    case instruction = 2
    case similarRecipe = 3
}
