//
//  MasterViewController.swift
//  Project5
//
//  Created by Ivan Zemlyaniy on 08.05.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit
import GameplayKit

class MasterViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()

    func startGame() {
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
        title = allWords[0]
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    func wordIsPossible(word: String) -> Bool {
        var tempWord = title!.lowercased()
        
        if tempWord == word.lowercased() {
            return false
        } else {
            for letter in word.characters {
                if let pos = tempWord.range(of: String(letter)) {
                    tempWord.remove(at: pos.lowerBound)
                } else {
                    return false
                }
            }
            return true
        }
    }
    
    func wordIsOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func wordIsReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSMakeRange(0, word.characters.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        if misspelledRange.location == NSNotFound && word.characters.count >= 3 {
            return true
        } else {
            return false
        }
    }
    
    func showErrorMessage(errorTitle: String, errorMessage: String) {
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    func submitAnswer(answer: String) {
        let lowAnswer = answer.lowercased()
        
        if wordIsPossible(word: lowAnswer) {
            if wordIsOriginal(word: lowAnswer) {
                if wordIsReal(word: lowAnswer) {
                    usedWords.insert(answer, at: 0)
                    
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    
                    return
                } else {
                showErrorMessage(errorTitle: "Word not recognized", errorMessage: "You can't spell that word from '\(title!.lowercased())'")
                }
            } else {
                showErrorMessage(errorTitle: "Word used already", errorMessage: "Be more original!")
            }
        } else {
            showErrorMessage(errorTitle: "Word not possible", errorMessage: "You can't just make them up, you know!")
        }
    }
    
    func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField(configurationHandler: nil)
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [unowned self, ac] (action: UIAlertAction!) in
            let answer = ac.textFields![0]
            self.submitAnswer(answer: answer.text!)
        }
        ac.addAction(submitAction)
        
        present(ac, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt") {
            if let startWords = try? String(contentsOfFile: startWordsPath) {
                allWords = startWords.components(separatedBy: "\n")
            }
        } else {
            allWords = ["silkworm"]
        }
        
        startGame()
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = usedWords[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }
}

