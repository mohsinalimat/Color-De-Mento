//
//  SharingViewController.swift
//  ColoringBook
//
//  Created by Odyssey Apps on 9/28/17.
//  Copyright © 2017 Odyssey. All rights reserved.
//

import UIKit

class SharingViewController: UIViewController {

    let buttonHeight:CGFloat = 60.0
    let textureButtonHeight:CGFloat = 80.0
    let buttonDistance = {(view:CGFloat,numberOfBtn:CGFloat,btnSize:CGFloat)->CGFloat in
        return (view-(numberOfBtn*btnSize))/(numberOfBtn+1.0)
    }
    /*var buttonDistace:CGFloat {
        return (self.view.frame.size.width-(4*buttonHeight))/(4.0+1.0)
    }*/
    var coloredImage = UIImage()
    var coloredImageView = UIImageView()
    var containerView = UIView()
    var textureView = UIView()
    var contourView = UIView()
    var vignetteView = UIView()
    enum textures {
        case vignette
        case contour
        case texture
    }
    var textureMode = textures.contour
    override func viewDidLoad() {
        super.viewDidLoad()

        createView()
        // Do any additional setup after loading the view.
    }

    func createView(){
        
        coloredImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        coloredImageView.image = coloredImage
        coloredImageView.center = self.view.center
        self.view.addSubview(coloredImageView)
        containerView = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height/2 - buttonHeight/2.0))
        containerView.backgroundColor=UIColor.white
        self.view.addSubview(containerView)
        // sharing Buttons
        let shareButton1 = UIButton(frame: CGRect(x: buttonDistance(self.view.frame.size.width,4.0,buttonHeight), y: -20, width: buttonHeight, height: buttonHeight))
        shareButton1.backgroundColor=UIColor.clear
        shareButton1.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        containerView.addSubview(shareButton1)
        let shareButton2 = UIButton(frame: CGRect(x: 2*buttonDistance(self.view.frame.size.width,4.0,buttonHeight)+buttonHeight, y: -20, width: buttonHeight, height: buttonHeight))
        shareButton2.backgroundColor=UIColor.clear
        shareButton2.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        containerView.addSubview(shareButton2)
        let shareButton3 = UIButton(frame: CGRect(x: 3*buttonDistance(self.view.frame.size.width,4.0,buttonHeight)+2*buttonHeight, y: -20, width: buttonHeight, height: buttonHeight))
        shareButton3.backgroundColor=UIColor.clear
        shareButton3.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        containerView.addSubview(shareButton3)
        let shareButton4 = UIButton(frame: CGRect(x: 4*buttonDistance(self.view.frame.size.width,4.0,buttonHeight)+3*buttonHeight, y: -20, width: buttonHeight, height: buttonHeight))
        shareButton4.backgroundColor=UIColor.clear
        shareButton4.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        containerView.addSubview(shareButton4)
        
        let items = ["Texture", "Contour", "Vignette"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        
        // Set up Frame and SegmentedControl
        let frame = containerView.frame
        customSC.frame = CGRect(x: 0, y: 90, width: frame.width, height: 40)
        
        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = UIColor(red: 240, green: 240, blue: 240, alpha: 1.0)
        customSC.tintColor = UIColor.black
        customSC.layer.borderWidth=2.0
        //customSC.layer.borderColor=UIColor.black as! CGColor
        let font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        customSC.setTitleTextAttributes([NSFontAttributeName: font], for: .normal)
        // Add target action method
        customSC.addTarget(self, action: #selector(changeContainerView(sender:)), for: .valueChanged)
        
        // Add this custom Segmented Control to our view
        self.containerView.addSubview(customSC)
        createTextureCollectionView()
        
        
    }
    func changeContainerView(sender: UISegmentedControl) {
        //println("Change color handler is called.")
        print("Changing Color to ")
        switch sender.selectedSegmentIndex {
        case 0:
            //self.view.backgroundColor = UIColor.green
            createTextureCollectionView()
            //print("Green")
        case 1:
            //self.view.backgroundColor = UIColor.blue
            createContourView()
            //print("Blue")
        default:
            //self.view.backgroundColor = UIColor.purple
            createVignetteView()
            //print("Purple")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.7, animations: {
            self.coloredImageView.transform = self.coloredImageView.transform.scaledBy(x: 0.7, y: 0.7)
            self.coloredImageView.transform = self.coloredImageView.transform.translatedBy(x: 0, y: -self.view.frame.size.height/4)
            self.containerView.transform = self.containerView.transform.translatedBy(x: 0, y: -self.view.frame.size.height/2+self.buttonHeight/2.0)
        }, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.7, animations: {
            self.coloredImageView.transform = self.coloredImageView.transform.scaledBy(x: 1.0/0.7, y: 1.0/0.7)
            self.coloredImageView.transform = self.coloredImageView.transform.translatedBy(x: 0, y: +self.view.frame.size.height/4)
            self.containerView.transform = self.containerView.transform.translatedBy(x: 0, y: self.view.frame.size.height/2-self.buttonHeight/2.0)
        }, completion:{(finished: Bool) in
            
            self.dismiss(animated: false, completion: nil)
        })
        
    }
    @IBAction func bookmarksButton(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.7, animations: {
            self.coloredImageView.transform = self.coloredImageView.transform.scaledBy(x: 1.0/0.7, y: 1.0/0.7)
            self.coloredImageView.transform = self.coloredImageView.transform.translatedBy(x: 0, y: +self.view.frame.size.height/4)
            self.containerView.transform = self.containerView.transform.translatedBy(x: 0, y: self.view.frame.size.height/2-self.buttonHeight/2.0)
        }, completion:{(finished: Bool) in
            //perform segue to root view
            
            //self.dismiss(animated: false, completion: nil)
        })
    }
    func createTextureCollectionView(){
        if textureMode == .contour{
            contourView.removeFromSuperview()
        }
        else if textureMode == .vignette{
            vignetteView.removeFromSuperview()
        }
        if textureMode != .texture{
            textureView = UIView(frame: CGRect(x: 0, y: self.containerView.frame.size.height/2, width: self.view.frame.size.width, height: self.containerView.frame.size.height/2))
            textureView.backgroundColor=UIColor.yellow
            containerView.addSubview(textureView)
        }
        textureMode = .texture
    }

    func createContourView(){
        if textureMode == .texture{
            textureView.removeFromSuperview()
        }
        else if textureMode == .vignette{
            vignetteView.removeFromSuperview()
        }
        if textureMode != .contour{
            contourView = UIView(frame: CGRect(x: 0, y: self.containerView.frame.size.height/2, width: self.view.frame.size.width, height: self.containerView.frame.size.height/2))
            contourView.backgroundColor=UIColor.white
            containerView.addSubview(contourView)
            
            let contourButton1 = UIButton(frame: CGRect(x: buttonDistance(self.view.frame.size.width,3.0,textureButtonHeight), y: buttonDistance(self.contourView.frame.size.height,1.0,textureButtonHeight), width: textureButtonHeight, height: textureButtonHeight))
            contourButton1.backgroundColor=UIColor.red
            contourView.addSubview(contourButton1)
            let contourButton2 = UIButton(frame: CGRect(x: 2*buttonDistance(self.view.frame.size.width,3.0,textureButtonHeight)+textureButtonHeight, y: buttonDistance(self.contourView.frame.size.height,1.0,textureButtonHeight), width: textureButtonHeight, height: textureButtonHeight))
            contourButton2.backgroundColor=UIColor.red
            contourView.addSubview(contourButton2)
            let contourButton3 = UIButton(frame: CGRect(x: 3*buttonDistance(self.view.frame.size.width,3.0,textureButtonHeight)+2*textureButtonHeight, y: buttonDistance(self.contourView.frame.size.height,1.0,textureButtonHeight), width: textureButtonHeight, height: textureButtonHeight))
            contourButton3.backgroundColor=UIColor.red
            contourView.addSubview(contourButton3)
        }
        
        textureMode = .contour
    }
    func createVignetteView(){
        if textureMode == .contour{
            contourView.removeFromSuperview()
        }
        else if textureMode == .texture{
            textureView.removeFromSuperview()
        }
        if textureMode != .vignette{
            vignetteView = UIView(frame: CGRect(x: 0, y: self.containerView.frame.size.height/2, width: self.view.frame.size.width, height: self.containerView.frame.size.height/2))
            vignetteView.backgroundColor=UIColor.blue
            containerView.addSubview(vignetteView)
            
        }
        textureMode = .vignette
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
