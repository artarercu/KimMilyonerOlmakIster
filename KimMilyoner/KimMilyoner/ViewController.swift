//
//  ViewController.swift
//  KimMilyoner
//
//  Created by Er on 28.05.2022.
//

import UIKit

class ViewController: UIViewController {
    var questions : [Question] = []
    var indis = 0
    var maxQuestions = 15
    var toplamPara = 0
    var sorudaYariKullanildiMi = false
    var sorudaYariElenen1 = 0
    var sorudaYariElenen2 = 0
    var sorudaYariKalan1 = 0
    var x2KullanildiMi = false
    var x2TiklandiMi = false
    @IBOutlet weak var soruLabel : UILabel!
    @IBOutlet weak var moneyLabel : UILabel!
    @IBOutlet weak var questionCountLabel : UILabel!
    @IBOutlet weak var butonA : UIButton!
    @IBOutlet weak var butonB : UIButton!
    @IBOutlet weak var butonC : UIButton!
    @IBOutlet weak var butonD : UIButton!
    @IBOutlet weak var telefon : UIButton!
    @IBOutlet weak var x2 : UIButton!

    @IBOutlet weak var butonSeyirci : UIButton!
    @IBOutlet weak var butonYariYariya : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string:"https://raw.githubusercontent.com/artarercu/KimMilyonerOlmakIster/main/Sorular.json")!
        let gelenData = try! Data(contentsOf:url)
        let jsonDecoder = JSONDecoder()
        let veriler = try? jsonDecoder.decode(Questions.self, from: gelenData)
        for tempData in veriler!{
            var tempQuestion = Question(question:tempData.question, content: tempData.content, correct: tempData.correct)
            questions.append(tempQuestion)
        }
        print("SORULAR ÇEKİLMİŞTİR.\nSoru Adedi:\(questions.count)")
        startGame()
       
    }
    func controlAnswer(userAnswer:String){
        let correctIndex = questions[indis].correct
        if(userAnswer == questions[indis].content[correctIndex]){
            print("Dogru")
            x2TiklandiMi=false
            newQuestion()
        }
        else{
            print("Yanlış")
            if(x2TiklandiMi){
                x2TiklandiMi=false
                let alert = UIAlertController(title: "Uyarı", message: "Cevap Yanlış 1 hakkınız daha var!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "Game Over", message: "Answer is wrong", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "New Game", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                startGame()
            }
  
        }
        
    }
    func startGame(){
       
        telefon.isEnabled=true
        
        x2.isEnabled = false
        x2KullanildiMi = false
        
        sorudaYariKullanildiMi = false
        indis = 0
        toplamPara = 0
        questions.shuffle()
        butonYariYariya.isEnabled = true
        butonSeyirci.isEnabled = true
    

        butonA.isEnabled = true
        butonB.isEnabled = true
        butonC.isEnabled = true
        butonD.isEnabled = true
        moneyLabel.text = String(toplamPara)
        questionCountLabel.text = String("Question - \(indis+1)")

        soruLabel.text = questions[indis].question
        butonA.setTitle(questions[indis].content[0] , for: .normal)
        butonB.setTitle(questions[indis].content[1] , for: .normal)
        butonC.setTitle(questions[indis].content[2] , for: .normal)
        butonD.setTitle(questions[indis].content[3] , for: .normal)
        print("CEVAP:\(questions[indis].correct)")
    }
    func newQuestion(){
        sorudaYariKullanildiMi = false
        if(indis+1 < maxQuestions){
            indis = indis + 1
            ParaHesapla()
            moneyLabel.text = String(toplamPara)
            questionCountLabel.text = String("Question - \(indis+1)")
            soruLabel.text = questions[indis].question
            butonA.setTitle(questions[indis].content[0] , for: .normal)
            butonB.setTitle(questions[indis].content[1] , for: .normal)
            butonC.setTitle(questions[indis].content[2] , for: .normal)
            butonD.setTitle(questions[indis].content[3] , for: .normal)
            print("CEVAP:\(questions[indis].correct)")

        }
        else{
            moneyLabel.text = "1000000"
            print("1 milyon kazandın.")
            let alert = UIAlertController(title: "TEBRİKLER", message: "1 milyon kazandın", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Yeni Oyun", style: UIAlertAction.Style.default, handler: { _ in self.startGame()}))
            self.present(alert, animated: true, completion: nil)
            
        }
        butonA.isEnabled = true
        butonB.isEnabled = true
        butonC.isEnabled = true
        butonD.isEnabled = true
        if(indis+1>6 && x2KullanildiMi == false){
            x2.isEnabled = true
            x2KullanildiMi = true
        }
        
    }

    @IBAction func YariYariya(){
        
        sorudaYariKullanildiMi = true
        let correctIndex = questions[indis].correct
        var r1 = 0;
        var r2 = 0;
        var r3 = 0;
        if(correctIndex==0){
            r1 = Int.random(in: 0...3)
            while(r1==correctIndex){
                r1 = Int.random(in: 0...3)
            }
            r2 = Int.random(in: 0...3)
            while(r2==correctIndex || r2==r1){
                r2 = Int.random(in: 0...3)
            }
            r3 = Int.random(in: 0...3)
            while(r3==correctIndex || r3==r1 || r3==r2){
                r3 = Int.random(in: 0...3)
            }
        }
        else if(correctIndex==1){
            r1 = Int.random(in: 0...3)
            while(r1==correctIndex){
                r1 = Int.random(in: 0...3)
            }
            r2 = Int.random(in: 0...3)
            while(r2==correctIndex || r2==r1){
                r2 = Int.random(in: 0...3)
            }
            r3 = Int.random(in: 0...3)
            while(r3==correctIndex || r3==r1 || r3==r2){
                r3 = Int.random(in: 0...3)
            }
        }
        else if(correctIndex==2){
            r1 = Int.random(in: 0...3)
            while(r1==correctIndex){
                r1 = Int.random(in: 0...3)
            }
            r2 = Int.random(in: 0...3)
            while(r2==correctIndex || r2==r1){
                r2 = Int.random(in: 0...3)
            }
            r3 = Int.random(in: 0...3)
            while(r3==correctIndex || r3==r1 || r3==r2){
                r3 = Int.random(in: 0...3)
            }
        }
        else if(correctIndex==3){
            r1 = Int.random(in: 0...3)
            while(r1==correctIndex){
                r1 = Int.random(in: 0...3)
            }
            r2 = Int.random(in: 0...3)
            while(r2==correctIndex || r2==r1){
                r2 = Int.random(in: 0...3)
            }
            r3 = Int.random(in: 0...3)
            while(r3==correctIndex || r3==r1 || r3==r2){
                r3 = Int.random(in: 0...3)
            }
        }
        if(r1==0 || r2==0){
            butonA.isEnabled=false;
        }
        if(r1==1 || r2==1){
            butonB.isEnabled=false;
        }
        if(r1==2 || r2==2){
            butonC.isEnabled=false;
        }
        if(r1==3 || r2==3){
            butonD.isEnabled=false;
        }
        sorudaYariElenen1 = r1
        sorudaYariElenen2 = r2
        sorudaYariKalan1 = r3
        butonYariYariya.isEnabled=false
    }
    @IBAction func SeyirciyeSor(){
        var a = 0
        var b = 0
        var c = 0
        var d = 0
        let correctIndex = questions[indis].correct

        if(sorudaYariKullanildiMi){
            var harf1 = ""
            var harf1Yuzde = 0
            var harf2 = ""
            var harf2Yuzde = 0
            // elenen 0 2   0 3
            if(correctIndex==0){
                harf1 = "A"
                harf1Yuzde = Int.random(in: 70...90)
            }
            else if(correctIndex==1){
                harf1 = "B"
                harf1Yuzde = Int.random(in: 70...90)
            }
            else if(correctIndex==2){
                harf1 = "C"
                harf1Yuzde = Int.random(in: 70...90)
            }
            else if(correctIndex==3){
                harf1 = "D"
                harf1Yuzde = Int.random(in: 70...90)
            }
            if(sorudaYariKalan1==0){
                harf2 = "A"
                harf2Yuzde = 100 - harf1Yuzde
            }
            else if(sorudaYariKalan1==1){
                harf2 = "B"
                harf2Yuzde = 100 - harf1Yuzde
            }
            else if(sorudaYariKalan1==2){
                harf2 = "C"
                harf2Yuzde = 100 - harf1Yuzde
            }
            else if(sorudaYariKalan1==3){
                harf2 = "D"
                harf2Yuzde = 100 - harf1Yuzde
            }
            let text = "\(harf1) -  %\(harf1Yuzde) \n\(harf2) -  %\(harf2Yuzde)"
            let alert = UIAlertController(title: "Seyirci Sonuçları", message: text, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            if(correctIndex==0){
                a = Int.random(in: 70...90)
                b = (100-a)/2
                c = b / 3
                d = 100-a-b-c
            }
            else if(correctIndex==1){
                b = Int.random(in: 70...90)
                a = (100-b)/2
                c = a / 3
                d = 100-a-b-c
            }
            else if(correctIndex==2){
                c = Int.random(in: 70...90)
                b = (100-c)/2
                a = b / 3
                d = 100-a-b-c
            }
            else if(correctIndex==3){
                d = Int.random(in: 70...90)
                b = (100-d)/2
                c = b / 3
                a = 100-d-b-c
            }
            let text = "A -  %\(a) \nB - %\(b) \nC - %\(c) \nD - %\(d)"
            let alert = UIAlertController(title: "Seyirci Sonuçları", message: text, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        butonSeyirci.isEnabled=false
    }
    @IBAction func butonAClicked(){
        if(x2TiklandiMi){
            butonA.isEnabled = false
        }
        let buttonText = butonA.currentTitle!
        controlAnswer(userAnswer: buttonText)
        
    }
    @IBAction func butonBClicked(){
        if(x2TiklandiMi){
            butonB.isEnabled = false
        }
        let buttonText = butonB.currentTitle!
        controlAnswer(userAnswer: buttonText)
       
    }
    @IBAction func butonCClicked(){
        if(x2TiklandiMi){
            butonC.isEnabled = false
        }
        let buttonText = butonC.currentTitle!
        controlAnswer(userAnswer: buttonText)
    }
    @IBAction func butonDClicked(){
        if(x2TiklandiMi){
            butonD.isEnabled = false
        }
        let buttonText = butonD.currentTitle!
        controlAnswer(userAnswer: buttonText)
    }
    @IBAction func X2Clicked(){
        x2.isEnabled=false
        x2TiklandiMi = true
        print("x2 tıklanmıştır 2 hakkınız var")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        telefon.isEnabled=false
        var harf = ""
        let correctIndex = questions[indis].correct
        if(correctIndex==0){
            harf = "a"
        }
        else if(correctIndex==1){
            harf = "b"
        }
        else if(correctIndex==2){
            harf = "c"
        }
        else if(correctIndex==3){
            harf = "d"
        }
        let destinationVC = segue.destination as! ViewController2
        destinationVC.harf = harf
        
    }
    func ParaHesapla(){
        if(indis==1){
            toplamPara = 250
        }
        else if(indis==2){
            toplamPara = 500
        }
        else if(indis==3){
            toplamPara = 1000
        }
        else if(indis==4){
            toplamPara = 2000
        }
        else if(indis==5){
            toplamPara = 3000
        }
        else if(indis==6){
            toplamPara = 5000
        }
        else if(indis==7){
            toplamPara = 7500
        }
        else if(indis==8){
            toplamPara = 10000
        }
        else if(indis==9){
            toplamPara = 15000
        }
        else if(indis==10){
            toplamPara = 30000
        }
        else if(indis==11){
            toplamPara = 45000
        }
        else if(indis==12){
            toplamPara = 60000
        }
        else if(indis==13){
            toplamPara = 125000
        }
        else if(indis==14){
            toplamPara = 250000
        }
        else if(indis==15){
            toplamPara = 1000000
        }
    }
}

