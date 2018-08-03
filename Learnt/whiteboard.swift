//
//  whiteboard.swift
//  Learnt
//
//  Created by Caleb Scott on 7/29/18.
//  Copyright © 2018 FloatMe. All rights reserved.
//

import Firebase
import FirebaseDatabase
import AgoraAudioKit
var channel_id: String!
class whiteboard: UIViewController, AgoraRtcEngineDelegate {
    var agoraKit: AgoraRtcEngineKit!
    func initializeAgoraEngine() {
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "86af5a6e67ba4c6e8532688a658ea99d", delegate: self)
    }
    func setChannelProfile() {
        agoraKit.setChannelProfile(.communication)
    }
    func joinChannel() {
        agoraKit.joinChannel(byToken: nil, channelId: channel_id, info:nil, uid:UInt(arc4random())){[weak self] (sid, uid, elapsed) -> Void in
            // Join channel "demoChannel1"
        }
    }
    func leaveChannel() {
        agoraKit.leaveChannel(nil)
    }
    private lazy var drawRef: DatabaseReference = Database.database().reference(withPath: "Drawing")
    private var drawRefHandle: DatabaseHandle?

var lastPoint = CGPoint.zero
var swiped = false

var red:CGFloat = 44/255
var green:CGFloat = 62/255
var blue:CGFloat = 80/255

var currentColor:NSNumber = 7;


@IBOutlet weak var imageView: UIImageView!
@IBOutlet var colorView: UIView!
//let screenWidth = UIScreen.main.bounds.size.width //The screen's width
//let screenHeight = UIScreen.main.bounds.size.height //The screen's height

var timer: Timer?

let colorsBarView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
    
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()

let redColor: UIButton = {
    let red = UIButton()
    red.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    red.backgroundColor = UIColor.red
    red.translatesAutoresizingMaskIntoConstraints = false
    red.layer.cornerRadius = 20
    red.layer.masksToBounds = true
    return red
}()

let blueColor: UIButton = {
    let red = UIButton()
    red.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    red.backgroundColor = UIColor.blue
    red.translatesAutoresizingMaskIntoConstraints = false
    red.layer.cornerRadius = 20
    red.layer.masksToBounds = true
    return red
}()

let yellowColor: UIButton = {
    let red = UIButton()
    red.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    red.backgroundColor = UIColor.yellow
    red.translatesAutoresizingMaskIntoConstraints = false
    red.layer.cornerRadius = 20
    red.layer.masksToBounds = true
    return red
}()

let orangeColor: UIButton = {
    let red = UIButton()
    red.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    red.backgroundColor = UIColor.orange
    red.translatesAutoresizingMaskIntoConstraints = false
    red.layer.cornerRadius = 20
    red.layer.masksToBounds = true
    return red
}()

let greenColor: UIButton = {
    let red = UIButton()
    red.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    red.backgroundColor = UIColor.green
    red.translatesAutoresizingMaskIntoConstraints = false
    red.layer.cornerRadius = 20
    red.layer.masksToBounds = true
    return red
}()

let lightBlueColor: UIButton = {
    let red = UIButton()
    red.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    red.backgroundColor = UIColor(red: 129/255, green: 207/255, blue: 224/255, alpha: 1)
    red.translatesAutoresizingMaskIntoConstraints = false
    red.layer.cornerRadius = 20
    red.layer.masksToBounds = true
    return red
}()

let blackColor: UIButton = {
    let red = UIButton()
    red.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    red.backgroundColor = UIColor.black
    red.translatesAutoresizingMaskIntoConstraints = false
    red.layer.cornerRadius = 20
    red.layer.masksToBounds = true
    return red
}()


override func viewDidLoad() {
    super.viewDidLoad()
    channel_id = "4939awieasdfdofh38"

    view.addSubview(colorsBarView)
    setupColorBarView()
    observeNewPoints()
    observeReset()
    let notificationCenter = NotificationCenter.default
    initializeAgoraEngine()
    setChannelProfile()
    joinChannel()
    startTimer()
    UIView.animate(withDuration: 0.5, animations: {
        self.resetColors()
    })
    tutorOpen().newSession(user: "4939awieasdfdofh38")
    tutorOpen().startQuery()
    }

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  //  let appdelegate = UIApplication.shared.delegate as! AppDelegate
 //   appdelegate.shouldSupportAllOrientation = false
}

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    //let red = UIButton(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#><#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    
}

func setupColorBarView(){
    /*
     //Constraints Set Up for the colors tab
     let colorBarHeight = self.view.frame.width/9 + 20
     colorsBarView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
     colorsBarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
     colorsBarView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
     colorsBarView.heightAnchor.constraint(equalToConstant: self.view.frame.width/9 + 20).isActive = true
     
     colorsBarView.addSubview(redColor)
     colorsBarView.addSubview(blueColor)
     colorsBarView.addSubview(yellowColor)
     colorsBarView.addSubview(orangeColor)
     colorsBarView.addSubview(greenColor)
     colorsBarView.addSubview(lightBlueColor)
     colorsBarView.addSubview(blackColor)
     
     let spacing = (view.frame.width * 2)/72
     
     redColor.leftAnchor.constraint(equalTo: colorsBarView.leftAnchor, constant: (self.view.frame.width * 2)/92).isActive = true
     redColor.centerYAnchor.constraint(equalTo: colorsBarView.centerYAnchor).isActive = true
     redColor.widthAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     redColor.heightAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     
     orangeColor.leftAnchor.constraint(equalTo: redColor.rightAnchor, constant: spacing).isActive = true
     orangeColor.centerYAnchor.constraint(equalTo: colorsBarView.centerYAnchor).isActive = true
     orangeColor.widthAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     orangeColor.heightAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     
     yellowColor.leftAnchor.constraint(equalTo: colorsBarView.leftAnchor, constant: 110).isActive = true
     yellowColor.centerYAnchor.constraint(equalTo: colorsBarView.centerYAnchor).isActive = true
     yellowColor.widthAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     yellowColor.heightAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     
     greenColor.leftAnchor.constraint(equalTo: colorsBarView.leftAnchor, constant: 160).isActive = true
     greenColor.centerYAnchor.constraint(equalTo: colorsBarView.centerYAnchor).isActive = true
     greenColor.widthAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     greenColor.heightAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     
     lightBlueColor.leftAnchor.constraint(equalTo: colorsBarView.leftAnchor, constant: 210).isActive = true
     lightBlueColor.centerYAnchor.constraint(equalTo: colorsBarView.centerYAnchor).isActive = true
     lightBlueColor.widthAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     lightBlueColor.heightAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     
     blueColor.leftAnchor.constraint(equalTo: colorsBarView.leftAnchor, constant: 260).isActive = true
     blueColor.centerYAnchor.constraint(equalTo: colorsBarView.centerYAnchor).isActive = true
     blueColor.widthAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     blueColor.heightAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     
     blackColor.leftAnchor.constraint(equalTo: colorsBarView.leftAnchor, constant: 310).isActive = true
     blackColor.centerYAnchor.constraint(equalTo: colorsBarView.centerYAnchor).isActive = true
     blackColor.widthAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     blackColor.heightAnchor.constraint(equalTo: colorsBarView.widthAnchor, multiplier: 1/9).isActive = true
     */
}



override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    swiped = false
    if let touch = touches.first {
        lastPoint = touch.location(in: self.view)
    }
}

func drawLine(fromPoint: CGPoint, toPoint: CGPoint) {
    UIGraphicsBeginImageContext(self.view.frame.size)
    imageView?.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
    var context = UIGraphicsGetCurrentContext()
    context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
    context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
    context?.setBlendMode(CGBlendMode.normal)
    context?.setLineCap(CGLineCap.round)
    context?.setLineWidth(5)
    context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor)
    
    context?.strokePath()
    
    imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    let newDrawRef = drawRef.childByAutoId()
    let fromPointX = NSNumber(value: Float(fromPoint.x))
    let fromPointY = NSNumber(value: Float(fromPoint.y))
    let toPointX = NSNumber(value: Float(toPoint.x))
    let toPointY = NSNumber(value: Float(toPoint.y))
    let drawInfo = Draw(fromPointX: fromPointX, fromPointY: fromPointY, toPointX: toPointX, toPointY: toPointY, color: currentColor)
    
    
    newDrawRef.setValue(drawInfo.toAnyObject())
}

func drawLineObserve(fromPoint: CGPoint, toPoint: CGPoint, color: NSNumber) {
    
    setRGB(color: color)
    UIGraphicsBeginImageContext(self.view.frame.size)
    imageView?.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
    var context = UIGraphicsGetCurrentContext()
    context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
    context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
    context?.setBlendMode(CGBlendMode.normal)
    context?.setLineCap(CGLineCap.round)
    context?.setLineWidth(5)
    context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor)
    
    context?.strokePath()
    
    imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
}

override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    swiped = true
    if let touch = touches.first{
        var currentPoint = touch.location(in: self.view)
        drawLine(fromPoint: lastPoint, toPoint: currentPoint)
        
        lastPoint = currentPoint
    }
}
    @IBOutlet var redButton: UIButton!
    @IBOutlet var goldButton: UIButton!
    @IBOutlet var yellowButton: UIButton!
    @IBOutlet var tealButton: UIButton!
    @IBOutlet var greenButton: UIButton!
    @IBOutlet var purpleButton: UIButton!
    @IBOutlet var greyButton: UIButton!
    @IBOutlet var blackButton: UIButton!
    @IBOutlet var clear: UIButton!
    @IBAction func clickRed() {
        currentColor = 0;
        red = 231/255
        green = 76/255
        blue = 60/255
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColors()
            self.redButton.layer.cornerRadius = self.redButton.frame.width / 2
            self.redButton.clipsToBounds = true
        })
    }
    @IBAction func clickGold() {
        currentColor = 1;
        red = 230/255
        green = 136/255
        blue = 34/255
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColors()
            self.goldButton.layer.cornerRadius = self.goldButton.frame.width / 2
            self.goldButton.clipsToBounds = true
        })
    }
    @IBAction func clickYellow() {
        currentColor = 2;
        red = 241/255
        green = 196/255
        blue = 15/255
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColors()
            self.yellowButton.layer.cornerRadius = self.yellowButton.frame.width / 2
            self.yellowButton.clipsToBounds = true
        })
    }
    @IBAction func pickTeal() {
        currentColor = 3;
        red = 52/255
        green = 152/255
        blue = 219/255
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColors()
            self.tealButton.layer.cornerRadius = self.tealButton.frame.width / 2
            self.tealButton.clipsToBounds = true
        })
    }
    @IBAction func pickGreen() {
        currentColor = 4;
        red = 46/255
        green = 204/255
        blue = 113/255
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColors()
            self.greenButton.layer.cornerRadius = self.greenButton.frame.width / 2
            self.greenButton.clipsToBounds = true
        })
    }
    @IBAction func pickPurple() {
        currentColor = 5;
        red = 155/255
        green = 89/255
        blue = 182/255
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColors()
            self.purpleButton.layer.cornerRadius = self.purpleButton.frame.width / 2
            self.purpleButton.clipsToBounds = true
        })
    }
    @IBAction func pickGrey() {
        currentColor = 6;
        red = 149/255
        green = 165/255
        blue = 166/255
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColors()
            self.greyButton.layer.cornerRadius = self.greyButton.frame.width / 2
            self.greyButton.clipsToBounds = true
        })
    }
    @IBAction func pickBlack() {
        currentColor = 7;
        red = 44/255
        green = 62/255
        blue = 80/255
        UIView.animate(withDuration: 0.5, animations: {
        self.resetColors()
        self.blackButton.layer.cornerRadius = self.blackButton.frame.width / 2
        self.blackButton.clipsToBounds = true
        })
    }
    func resetColors(){
         var objectArray = [redButton, goldButton, yellowButton, tealButton, greenButton, purpleButton, greyButton, blackButton, clear]
       
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.colorView.frame
        rectShape.position = self.colorView.center
        rectShape.path = UIBezierPath(roundedRect: self.colorView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        
     //   self.colorView.layer.backgroundColor = UIColor.green.cgColor
        //Here I'm masking the textView's layer with rectShape layer
        self.colorView.layer.mask = rectShape
        
        for i in 0...objectArray.count - 1 {
            let object = objectArray[i]
            object!.layer.cornerRadius = 10
            object!.clipsToBounds = true
        }
    }
@IBAction func pickAColor(sender: AnyObject){
    if sender.tag == 0{
        currentColor = 0;
        red = 231/255
        green = 76/255
        blue = 60/255
    }
    if sender.tag == 1{
        currentColor = 1;
        red = 230/255
        green = 136/255
        blue = 34/255
    }
    if sender.tag == 2{
        currentColor = 2;
        red = 241/255
        green = 196/255
        blue = 15/255
    }
    if (sender as AnyObject).tag == 3{
        currentColor = 3;
        red = 52/255
        green = 152/255
        blue = 219/255
    }
    if (sender as AnyObject).tag == 4{
        currentColor = 4;
        red = 46/255
        green = 204/255
        blue = 113/255
    }
    if (sender as AnyObject).tag == 5{
        currentColor = 5;
        red = 155/255
        green = 89/255
        blue = 182/255
    }
    if (sender as AnyObject).tag == 6{
        currentColor = 6;
        red = 149/255
        green = 165/255
        blue = 166/255
    }
    if (sender as AnyObject).tag == 7{
        currentColor = 7;
        red = 44/255
        green = 62/255
        blue = 80/255
    }
}

func setRGB(color: NSNumber){
    if (color == 0){
        red = 231/255
        green = 76/255
        blue = 60/255
    }
    if (color == 1){
        red = 230/255
        green = 136/255
        blue = 34/255
    }
    if (color == 2){
        red = 241/255
        green = 196/255
        blue = 15/255
    }
    if (color == 3){
        red = 52/255
        green = 152/255
        blue = 219/255
    }
    if (color == 4){
        red = 46/255
        green = 204/255
        blue = 113/255
    }
    if (color == 5){
        red = 155/255
        green = 89/255
        blue = 182/255
    }
    if (color == 6){
        red = 149/255
        green = 165/255
        blue = 166/255
    }
    if (color == 7){
        red = 44/255
        green = 62/255
        blue = 80/255
    }
}

@IBAction func reset(){
    UIView.animate(withDuration: 1.5, animations: {

    self.imageView.image = nil
    self.drawRef.removeValue()
    })
}


override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if !swiped{
        drawLine(fromPoint: lastPoint, toPoint: lastPoint)
    }
}

private func observeNewPoints(){
    drawRefHandle = drawRef.observe(.childAdded, with: { snapshot in
        let drawData = snapshot.value as! Dictionary<String, Double>
        
        let id = snapshot.key
        let fromPointX = drawData["fromPointX"]
        let fromPointY = drawData["fromPointY"]
        let toPointX = drawData["toPointX"]
        let toPointY = drawData["toPointY"]
        let fromPoint = CGPoint(x: fromPointX!, y: fromPointY!)
        let toPoint = CGPoint(x: toPointX!, y: toPointY!)
        let colorFromData = drawData["color"]
        let nsColor = NSNumber(value: colorFromData!)
        
        self.drawLineObserve(fromPoint: fromPoint, toPoint: toPoint, color: nsColor)
    })
}

private func observeReset(){
    drawRefHandle = drawRef.observe(.childRemoved, with: { snapshot in
        self.imageView.image = nil
    })
}

func startTimer(){
    timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true, block: {[weak self] _ in
    })
}

func stopTimer(){
    timer?.invalidate()
}




}
