import UIKit

var background = UIView()
var tap = UIButton()


class GameVC: UIViewController
{
    
    let timerLabel = UILabel()
    let counterLabel = UILabel()
    
    var timer = Timer()
    var counter = 0
    var time = 30
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        
        background.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        background.backgroundColor = UIColor.init(red: rgbArray[0][0], green: rgbArray[0][1], blue: rgbArray[0][2], alpha: 1)
        
        tap.frame = CGRect(x: screenWidth/4, y: screenHeight/2-screenWidth/4, width: screenWidth/2, height: screenWidth/2)
        tap.backgroundColor = UIColor.init(red: rgbArray[1][0], green: rgbArray[1][1], blue: rgbArray[1][2], alpha: 1)
        tap.layer.cornerRadius = tap.bounds.width/2
        tap.layer.borderWidth = tap.layer.cornerRadius/10
        tap.layer.borderColor = UIColor.init(red: rgbArray[2][0], green: rgbArray[2][1], blue: rgbArray[2][2], alpha: 1).cgColor
        tap.addTarget(self, action: #selector(tapAction), for: .touchDown)
        
        timerLabel.frame = CGRect(x: 0, y: 30, width: screenWidth, height: 60)
        timerLabel.textAlignment = .center
        timerLabel.textColor = .black
        timerLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        timerLabel.text = String(time)
        
        counterLabel.frame = CGRect(x: 0, y: screenHeight-110, width: screenWidth, height: 60)
        counterLabel.textAlignment = .center
        counterLabel.textColor = .black
        counterLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        counterLabel.text = String(counter)
        
        self.view.addSubview(background)
        self.view.addSubview(tap)
        self.view.addSubview(counterLabel)
        self.view.addSubview(timerLabel)
        
        if(screenWidth == 375)
        {
            //iPhone X
            counterLabel.frame = CGRect(x: 0, y: screenHeight-110-20, width: screenWidth, height: 60)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        
        timer.invalidate()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.dismiss(animated: true, completion: nil)
    }
    @objc func tapAction()
    {
        
        if(time > 0)
        {
            counter = counter + 1
            counterLabel.text = String(counter)
            
        }
        
    }
    
    @objc func timerCallback()
    {
        time = time - 1
        timerLabel.text = String(time)
        
        let scr = (screenWidth/2) - (screenWidth*CGFloat.init(Double(31 - time))/(2*30))
        let randomX = Double.random(in: 0...Double(screenWidth - scr*2))
        let randomY = Double.random(in: 0...Double(screenHeight - scr*2))
        
        tap.frame = CGRect(x: (CGFloat.init(randomX)), y: (CGFloat.init(randomY)), width:(scr), height: (scr))
        tap.layer.cornerRadius = tap.bounds.width/2
        
        if(time < 1)
        {
            timer.invalidate()
            
            defaults.set(counter, forKey: "last")
            
            if(counter > defaults.integer(forKey: "record"))
            {
                defaults.set(counter, forKey: "record")
            }
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "menuViewController")
            present(vc!, animated: true)
        }
    }
}
