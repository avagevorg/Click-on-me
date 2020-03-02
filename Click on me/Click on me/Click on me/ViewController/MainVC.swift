import UIKit
let screenHeight = UIScreen.main.bounds.height
let screenWidth = UIScreen.main.bounds.width
let defaults = UserDefaults.standard

var menuBackground = UIView()
var start = UIButton()

class MainVC: UIViewController
{
    
    let appLabel = UILabel()
    let lastLabel = UILabel()
    let recordLabel = UILabel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        
        rgbArray = defaults.array(forKey: "rgb")  as? [[CGFloat]] ?? ([[CGFloat(255), CGFloat(255), CGFloat(255)], [CGFloat(0), CGFloat(0), CGFloat(0)], [CGFloat(0), CGFloat(0), CGFloat(0)]])
        
        let aboutButton = UIButton(frame: CGRect(x: 0, y: 30, width: 60, height: 60))
        aboutButton.setTitle("About", for: .normal)
        aboutButton.setTitleColor(.black, for: .normal)
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        aboutButton.addTarget(self, action: #selector(aboutButtonFunc), for: .touchUpInside)
        aboutButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        
        let settingsButton = UIButton(frame: CGRect(x: screenWidth - 90, y: 30, width: 90, height: 60))
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.setTitleColor(.black, for: .normal)
        settingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        settingsButton.addTarget(self, action: #selector(settingsButtonFunc), for: .touchUpInside)
        settingsButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        
        let record = defaults.integer(forKey: "record")
        let last = defaults.integer(forKey: "last")
        
        menuBackground.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        menuBackground.backgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
        
        start.frame = CGRect(x: screenWidth/4, y: screenHeight/2-screenWidth/4, width: screenWidth/2, height: screenWidth/2)
        start.backgroundColor =  UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
        start.layer.cornerRadius = start.bounds.width/2
        start.layer.borderWidth = start.layer.cornerRadius/10
        start.layer.borderColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1).cgColor
        start.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        
        appLabel.frame = CGRect(x: 0, y: 30, width: screenWidth, height: 60)
        appLabel.textAlignment = .center
        appLabel.textColor = .black
        appLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        appLabel.text = "Simple Clicker Game"
        
        lastLabel.frame = CGRect(x: 0, y: screenHeight-140, width: screenWidth, height: 60)
        lastLabel.textAlignment = .center
        lastLabel.textColor = .black
        lastLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        lastLabel.text = "Last result: " + String(last)
        
        recordLabel.frame = CGRect(x: 0, y: screenHeight-60, width: screenWidth, height: 60)
        recordLabel.textAlignment = .center
        recordLabel.textColor = .black
        recordLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        recordLabel.text = "Best result: " + String(record)
        
        self.view.addSubview(menuBackground)
        self.view.addSubview(start)
        self.view.addSubview(appLabel)
        self.view.addSubview(recordLabel)
        self.view.addSubview(lastLabel)
        self.view.addSubview(aboutButton)
        self.view.addSubview(settingsButton)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @objc func aboutButtonFunc() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "aboutVC") as! AboutVC
        self.show(vc, sender: self)
    }
    
    @objc func settingsButtonFunc() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "settingVC") as! SettingsVC
        self.show(vc, sender: self)
    }
    
    @objc func startAction()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameVC
        
        self.show(vc, sender: self)
    }
}
