//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var animals: [Animal]! = []
    private var result: Animal? {
        getResult(fromAnswers: animals)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        resultLabel.text = "Вы - \(result?.rawValue ?? "⚠️")!"
        resultDescriptionLabel.text = result?.definition ?? "Не удалось получить результат :("
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    private func getResult(fromAnswers animals: [Animal]) -> Animal? {
        let sortedAnimals = animals.sorted { firstAnimal, secondAnimal in
            let filteredAnimalsOne = animals.filter { $0 == firstAnimal }
            let filteredAnimalsTwo = animals.filter { $0 == secondAnimal }
            return filteredAnimalsOne.count > filteredAnimalsTwo.count
        }
        return sortedAnimals.first
     }
}
