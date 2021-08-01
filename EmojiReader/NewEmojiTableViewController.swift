//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by M on 30.07.2021.
//  Copyright © 2021 Алексей Пархоменко. All rights reserved.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    var emoji = Emoji(emoji: "", name: "", description: "", isFavourite: false)
    
    @IBOutlet weak var emojiTexField: UITextField!
    
    @IBOutlet weak var nameTexField: UITextField!
    
    @IBOutlet weak var descriptionTexField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSabeButtonState ()
    }
    
    private func updateSabeButtonState (){
        let emojiText = emojiTexField.text ?? ""
        let nameText = nameTexField.text ?? ""
        let descriptionText = descriptionTexField.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty

    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSabeButtonState ()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let emoji = emojiTexField.text ?? ""
        let name = nameTexField.text ?? ""
        let description = descriptionTexField.text ?? ""
        
        self .emoji = Emoji(emoji: emoji, name: name , description: description, isFavourite: self.emoji.isFavourite)
    }
 
}
