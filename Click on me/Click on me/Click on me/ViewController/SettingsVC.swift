import UIKit


var rgbArray = [[CGFloat(255), CGFloat(255), CGFloat(255)], [CGFloat(0), CGFloat(0), CGFloat(0)], [CGFloat(0), CGFloat(0), CGFloat(0)]]

class SettingsVC: UIViewController {
    
    
    @IBOutlet weak var example: UIButton!
    
    @IBOutlet var sliders: [UISlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<sliders.count {
            if i >= 0 && i <= 2 {
                sliders[i].setValue(Float(rgbArray[0][i]), animated: true)
            }
            if i >= 3 && i <= 5 {
                sliders[i].setValue(Float(rgbArray[1][i-3]), animated: true)
            }
            if i >= 6 && i <= 8 {
                sliders[i].setValue(Float(rgbArray[2][i-6]), animated: true)
            }
        }
        
        self.view.backgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
       
        example.backgroundColor =  UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
        example.layer.cornerRadius = example.bounds.width/2
        example.layer.borderWidth = example.layer.cornerRadius/10
        example.layer.borderColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1).cgColor
    }
    
    
    @IBAction func backgroundColor(_ sender: UISlider) {
        if sender.tag == 1 {
            rgbArray[0][0] = CGFloat(sender.value)
        }
        if sender.tag == 2 {
            rgbArray[0][1] = CGFloat(sender.value)
        }
        if sender.tag == 3 {
            rgbArray[0][2] = CGFloat(sender.value)
        }
        
        self.view.backgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
        menuBackground.backgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
        background.backgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
    }
    
    @IBAction func dotColor(_ sender: UISlider) {
        if sender.tag == 1 {
            rgbArray[1][0] = CGFloat(sender.value)
        }
        if sender.tag == 2 {
            rgbArray[1][1] = CGFloat(sender.value)
        }
        if sender.tag == 3 {
            rgbArray[1][2] = CGFloat(sender.value)
        }
        example.backgroundColor = UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
        start.backgroundColor = UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
        tap.backgroundColor = UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
    }
    
    
    @IBAction func dotCornerColor(_ sender: UISlider) {
        if sender.tag == 1 {
            rgbArray[2][0] = CGFloat(sender.value)
        }
        if sender.tag == 2 {
            rgbArray[2][1] = CGFloat(sender.value)
        }
        if sender.tag == 3 {
            rgbArray[2][2] = CGFloat(sender.value)
        }
        example.layer.borderColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1).cgColor
        start.layer.borderColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1).cgColor
        tap.layer.borderColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1).cgColor
        
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        UserDefaults.standard.set(rgbArray, forKey: "rgb")
        self.dismiss(animated: true, completion: nil)
    }
    
}
