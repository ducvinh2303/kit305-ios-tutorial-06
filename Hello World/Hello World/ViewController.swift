//
//  ViewController.swift
//  Hello World
//
//  Created by Lindsay Wells on 2/1/18.
//  Copyright © 2018 University of Tasmania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        // create an alert view
        let alert = UIAlertController(
            title: "Hello World!",
            message: "You just made your first iOS app!",
            preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { evt in
            print("got to part 2")
            print("some more things")
            print(evt)
        }))

        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        print("got to this part")
    }
}
