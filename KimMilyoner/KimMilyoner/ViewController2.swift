//
//  ViewController2.swift
//  KimMilyoner
//
//  Created by Emre on 29.05.2022.
//

import UIKit
class ViewController2: UIViewController {
    var harf : String = ""
    @IBOutlet weak var buton1 : UIButton!
    @IBOutlet weak var buton2 : UIButton!
    @IBOutlet weak var buton3 : UIButton!
    @IBOutlet weak var buton4 : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(harf)
    }
    @IBAction func butonClick(){
        butonPasif()
        playSound(soundName: "ring")
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            playSound(soundName: self.harf)
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                playSound(soundName: "disconnect")
                self.dismiss(animated: true)
            }
        }
    }
    func butonPasif(){
        buton1.isEnabled=false
        buton2.isEnabled=false
        buton3.isEnabled=false
        buton4.isEnabled=false
    }
}
