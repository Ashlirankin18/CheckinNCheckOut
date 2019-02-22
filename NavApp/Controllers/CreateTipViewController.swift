//
//  CreateVenueViewController.swift
//  NavApp
//
//  Created by Jeffrey Almonte on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class CreateTipViewController: UIViewController {
  
  private var createTipView = CreateTipView()
  private var userTipFromTextView = String()
  private var addTipButton = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(submitButtonPressed))
  var venueBeingReviewed: String?
  //Todo: get rid of placeholder if not needed
  private var createTipPlaceholder = "Enter tip here"
  override func viewDidLoad() {
    super.viewDidLoad()
    createTipView.createTipTextView.delegate = self
    setupTextView()
    createTipView.createTipTextView.becomeFirstResponder()
    self.view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    
    navigationItem.title = "Create Tip"
    
    view.addSubview(createTipView)
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(CancelButtonPressed))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(submitButtonPressed))
    
  }
  
  private func setupTextView() {
    createTipView.createTipTextView.delegate = self
    createTipView.createTipTextView.text = createTipPlaceholder
    createTipView.createTipTextView.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
  }
  
  
  @objc func CancelButtonPressed() {
    self.dismiss(animated: true, completion: nil)
  }
  
  @objc func submitButtonPressed() {
    guard let tip = createTipView.createTipTextView.text else {
      return
    }
    
    //get venueName
    //Rename venueDescription to userTipForVenue
    let date = Date.getISOTimestamp()
    let id = UUID().uuidString
    let venueName = venueBeingReviewed ?? "no venue name found"
    
    let userTip = TipDetails.init(venueName: venueName, venueDescription: tip, id: id, createdAt: date)
    
    PersistanceHelper.addItemsToDirectory(tip: userTip)
    showAlert(title: "Tip Created", message: "Sucess") { (alertController) in
      let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
        self.dismiss(animated: true, completion: nil)
      })
      alertController.addAction(okAction)
      self.present(alertController, animated: true, completion: nil)
      
    }
  }
  
}

extension CreateTipViewController: UITextViewDelegate {
  //TODO: clear the textview didBegin editing
  //restrict to certain number of character - 200 character
  //if user erase comment - show the placeholder text again
  //this you have it in a previous project
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    if createTipView.createTipTextView.text == createTipPlaceholder {
      textView.text = ""
      textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    userTipFromTextView = textView.text
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text == "" {
      if textView == createTipView.createTipTextView {
        textView.text = createTipPlaceholder
        textView.textColor = .lightGray
      } else if textView == createTipView.createTipTextView {
        textView.text = createTipPlaceholder
        textView.textColor = .lightGray
      }
    }
  }
  
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    let currentText = textView.text ?? ""
    guard let stringRange = Range(range, in: currentText) else { return false }
    
    let changedText = currentText.replacingCharacters(in: stringRange, with: text)
    
    return changedText.count <= 200
  }
  
}
