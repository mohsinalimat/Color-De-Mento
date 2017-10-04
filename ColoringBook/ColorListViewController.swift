//
//  ColorListViewController.swift
//  ColoringBook
//
//  Created by MacBook Pro on 1/2/17.
//  Copyright © 2017 Odyssey. All rights reserved.
//

import UIKit
import CoreData
var appLaunched = true
class ColorListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    let defaults = UserDefaults.standard
    //@IBOutlet weak var colorView: ColorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if appLaunched==true{
            DatabaseController.fetchDataFromDataBase()
            appLaunched=false
        }
        print("asdf\(generatedWheels.count)")
        /*if !defaults.bool(forKey: "firstTime")
         {
         DatabaseController().setValueToDataBase()
         defaults.set(true, forKey: "firstTime")
         }
         
         DatabaseController().fetchDataFromDataBase()*/
        
        createView()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    func createView(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        //layout.itemSize = CGSize(width: 10, height: 10)
        layout.scrollDirection = .vertical
        if (UIDevice.current.userInterfaceIdiom == .phone)
        {
            collectionView = UICollectionView(frame: CGRect(x: 0,y: 72, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-72), collectionViewLayout: layout)
        }
        else{
            collectionView = UICollectionView(frame: CGRect(x: 0,y: 72, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-72), collectionViewLayout: layout)
        }
        collectionView.center.x = view.center.x
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView)
        
        /*for i in 0..<3
         {
         let palette = Palette(frame: self.view.frame, name: "asdf")
         palette.frame = CGRect(x: Int(self.view.center.x), y: i * 225, width: 225, height: 225)
         palette.backgroundColor = UIColor.clear
         self.view.addSubview(palette)
         }*/
    }
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        
        //palette=0
        self.dismiss(animated: true, completion: nil)
        
        
    }
    @IBAction func addPalette(_ sender: UIBarButtonItem) {
        
        /*DatabaseController().setValueToDataBase(no: Int64(43+generatedWheels.count), name: "summer", col1: "#26284b", col2: "#00545b", col3: "#00c481", col4: "#a9db5a", col5: "#fcc035", col6: "#f16a25", col7: "#f02540", col8: "#a3275f")*/
        //self.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "CustomWhellViewController", sender: self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        palette = indexPath.row+1
        self.dismiss(animated: true, completion: nil)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 80+generatedWheels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        for view in cell.subviews {
            view.removeFromSuperview()
        }
        
        if indexPath.row==0{
            let paletteCell = Palette(frame: self.view.frame, a: "#655f47", b: "#d74958", c: "#b5dcb9", d: "#6bbd99", e: "#7b8977", f: "#f9e393", g: "#c3aa5b", h: "#b89a2d")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
            
        }
        else if indexPath.row==1{
            let paletteCell = Palette(frame: self.view.frame, a: "#83ddff", b: "#3aa952", c: "#46d255", d: "#62f471", e: "#baffc1", f: "#414643", g: "#08658b", h: "#64c0e6")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
            
        }
        else if indexPath.row==2{
            let paletteCell = Palette(frame: self.view.frame, a: "#ffffff", b: "#f3f3f3", c: "#dadada", d: "#c9c9c9", e: "#b0b0b0", f: "#878787", g: "#5a5a5a", h: "#000000")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==3{
            let paletteCell = Palette(frame: self.view.frame, a: "#b44221", b: "#f3673e", c: "#ffc752", d: "#ccc75e", e: "#78c9a3", f: "#43b7db", g: "#408bcd", h: "#94638e")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==4{
            let paletteCell = Palette(frame: self.view.frame, a: "#f6e784", b: "#f02970", c: "#bd258e", d: "#ffdc00", e: "#ef8b49", f: "#e2e7e8", g: "#a21d6d", h: "#2f0f4b")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==5{
            let paletteCell = Palette(frame: self.view.frame, a: "#8ebdb6", b: "#ffe7e4", c: "#f8a8b8", d: "#2e4473", e: "#ade8e3", f: "#fc708c", g: "#27a7d6", h: "#e6dbe1")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==6{
            let paletteCell = Palette(frame: self.view.frame, a: "#bdf6ff", b: "#76f2ff", c: "#54bcff", d: "#3a91ff", e: "#4a90e2", f: "#11a9bd", g: "#0058be", h: "#0e298b")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==7{
            let paletteCell = Palette(frame: self.view.frame, a: "#ece9e2", b: "#770810", c: "#bcaf9e", d: "#e67238", e: "#7f4632", f: "#403b35", g: "#c3343e", h: "#a32029")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==8{
            let paletteCell = Palette(frame: self.view.frame, a: "#fce8c5", b: "#fffedd", c: "#fc9998", d: "#ffdabd", e: "#ffa900", f: "#9fd6cc", g: "#4d4f4e", h: "#a3997f")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==9{
            let paletteCell = Palette(frame: self.view.frame, a: "#930862", b: "#228bff", c: "#a5e22f", d: "#d643f9", e: "#ffcd18", f: "#047f91", g: "#28e3ff", h: "#ff6ecc")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==10{
            let paletteCell = Palette(frame: self.view.frame, a: "#d7dbde", b: "#dbb99d", c: "#a8a3aa", d: "#71666c", e: "#a48b84", f: "#c7c0ba", g: "#b2a9a0", h: "#d9c9ba")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==11{
            let paletteCell = Palette(frame: self.view.frame, a: "#417d69", b: "#71c592", c: "#ead889", d: "#5397c6", e: "#f3966c", f: "#c05067", g: "#9260b8", h: "#e477a3")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==12{
            let paletteCell = Palette(frame: self.view.frame, a: "#a2ae18", b: "#556270", c: "#4ecdc4", d: "#c7f464", e: "#ff6b6b", f: "#c44d58", g: "#a1212a", h: "#dfff99")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==13{
            let paletteCell = Palette(frame: self.view.frame, a: "#d0a86a", b: "#b18c75", c: "#987252", d: "#865436", e: "#917534", f: "#854200", g: "#5d1913", h: "#401d09")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==14{
            let paletteCell = Palette(frame: self.view.frame, a: "#ea848b", b: "#774f38", c: "#e08e79", d: "#f1d4af", e: "#ece5ce", f: "#c5e0dc", g: "#9cd6ce", h: "#ffa8ae")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==15{
            let paletteCell = Palette(frame: self.view.frame, a: "#222548", b: "#bfac9d", c: "#c7d969", d: "#ddee86", e: "#548798", f: "#6db9d1", g: "#4a4c61", h: "#383a51")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==16{
            let paletteCell = Palette(frame: self.view.frame, a: "#fac8bf", b: "#90c5a9", c: "#f8e1b5", d: "#f98a5f", e: "#cccccc", f: "#698d9d", g: "#466675", h: "#775ca3")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==17{
            let paletteCell = Palette(frame: self.view.frame, a: "#ddded9", b: "#4b8c88", c: "#aca9a2", d: "#86a599", e: "#677c71", f: "#b0cfcd", g: "#6b8a88", h: "#4e6a68")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==18{
            let paletteCell = Palette(frame: self.view.frame, a: "#e05a47", b: "#f9be44", c: "#e478a4", d: "#d53049", e: "#1daadf", f: "#72503e", g: "#165830", h: "#c1d979")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==19{
            let paletteCell = Palette(frame: self.view.frame, a: "#ffe1b5", b: "#ff9800", c: "#ff7700", d: "#ce2153", e: "#aaa8ff", f: "#f8bee8", g: "#ce6499", h: "#9b3166")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==20{
            let paletteCell = Palette(frame: self.view.frame, a: "#8dc9e5", b: "#ceefff", c: "#658879", d: "#97a88f", e: "#7ba395", f: "#6b969d", g: "#cadadd", h: "#a7c0c8")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==21{
            let paletteCell = Palette(frame: self.view.frame, a: "#6a0c33", b: "#ff5a39", c: "#f3412f", d: "#d53825", e: "#682421", f: "#fb2b75", g: "#b91d55", h: "#a01044")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==22{
            let paletteCell = Palette(frame: self.view.frame, a: "#d9d9d9", b: "#ff642f", c: "#ffe100", d: "#38c5ea", e: "#2f81de", f: "#c32a00", g: "#000000", h: "#535353")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==23{
            let paletteCell = Palette(frame: self.view.frame, a: "#e94c6f", b: "#aa2159", c: "#56102c", d: "#5a6962", e: "#009c98", f: "#7ec2ab", g: "#c6d6cc", h: "#fdf300")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==24{
            let paletteCell = Palette(frame: self.view.frame, a: "#f9fbba", b: "#ccc51b", c: "#fee600", d: "#ffac00", e: "#ef5a28", f: "#ff432e", g: "#b9206f", h: "#3a0c55")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==25{
            let paletteCell = Palette(frame: self.view.frame, a: "#265d1d", b: "#69d2e7", c: "#a7dbd8", d: "#e0e4cc", e: "#f38630", f: "#fa6900", g: "#7ec941", h: "#aee085")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==26{
            let paletteCell = Palette(frame: self.view.frame, a: "#801144", b: "#ff2288", c: "#8d55ad", d: "#59376d", e: "#cf7bff", f: "#188c9f", g: "#12616c", h: "#22e1ff")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==27{
            let paletteCell = Palette(frame: self.view.frame, a: "#d1ecb2", b: "#b4ed76", c: "#a5ca7f", d: "#80f500", e: "#63c500", f: "#559f00", g: "#457515", h: "#2a440c")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==28{
            let paletteCell = Palette(frame: self.view.frame, a: "#987c7e", b: "#8d8c8d", c: "#544c4f", d: "#bcc1cd", e: "#000505", f: "#f8f8f8", g: "#d5c8c9", h: "#b6a3a6")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==29{
            let paletteCell = Palette(frame: self.view.frame, a: "#ffee4a", b: "#ffc501", c: "#fe9600", d: "#ff4605", e: "#c91414", f: "#aee72c", g: "#77477e", h: "#03001c")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==30{
            let paletteCell = Palette(frame: self.view.frame, a: "#fcebb7", b: "#f0a830", c: "#f07818", d: "#d65c37", e: "#5e412f", f: "#68727b", g: "#6991ab", h: "#78c0a8")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==31{
            let paletteCell = Palette(frame: self.view.frame, a: "#b04cbc", b: "#8c867a", c: "#ab9f77", d: "#8b628a", e: "#a879af", f: "#b4a3cf", g: "#6822d1", h: "#4101a1")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==32{
            let paletteCell = Palette(frame: self.view.frame, a: "#ffeca7", b: "#cb964f", c: "#da6339", d: "#7e301e", e: "#5a2338", f: "#928744", g: "#f29933", h: "#a77872")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==33{
            let paletteCell = Palette(frame: self.view.frame, a: "#ffd9f3", b: "#322e7d", c: "#d2aac5", d: "#d9d2e1", e: "#7a647e", f: "#9e7ae7", g: "#7a65d8", h: "#545098")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==34{
            let paletteCell = Palette(frame: self.view.frame, a: "#fffee4", b: "#f7fdb6", c: "#d9f19f", d: "#acde8a", e: "#75c776", f: "#3dac5a", g: "#1c8540", h: "#004628")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==35{
            let paletteCell = Palette(frame: self.view.frame, a: "#99d200", b: "#00c0ff", c: "#80e0ff", d: "#809eff", e: "#285bff", f: "#ff9ff5", g: "#ff14a1", h: "#adff81")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==36{
            let paletteCell = Palette(frame: self.view.frame, a: "#f9f2de", b: "#4f4132", c: "#e96574", d: "#d64834", e: "#a43f3d", f: "#826447", g: "#a69481", h: "#756655")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==37{
            let paletteCell = Palette(frame: self.view.frame, a: "#8f9283", b: "#ead889", c: "#f3966c", d: "#e3644e", e: "#9ac086", f: "#7b9fb1", g: "#5397c6", h: "#417d69")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==38{
            let paletteCell = Palette(frame: self.view.frame, a: "#c85dec", b: "#d1f2a5", c: "#effab4", d: "#ffc48c", e: "#ff9f80", f: "#f56991", g: "#de4770", h: "#e9a8ff")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==39{
            let paletteCell = Palette(frame: self.view.frame, a: "#e0c572", b: "#bda53b", c: "#b0856d", d: "#ad6531", e: "#9d9d93", f: "#878f9d", g: "#6c6747", h: "#342f2b")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==40{
            let paletteCell = Palette(frame: self.view.frame, a: "#fdf4d1", b: "#ff0134", c: "#ff6701", d: "#ff8000", e: "#ffa601", f: "#fbce11", g: "#ffe601", h: "#fce691")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==41{
            let paletteCell = Palette(frame: self.view.frame, a: "#f2fdd9", b: "#cfeabf", c: "#f7e7d2", d: "#f8bab4", e: "#aad198", f: "#005557", g: "#004e7f", h: "#004d9a")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==42{
            let paletteCell = Palette(frame: self.view.frame, a: "#00c4e9", b: "#5eff63", c: "#00dd00", d: "#ffea00", e: "#ff9b14", f: "#ff5058", g: "#ff00aa", h: "#9b03fc")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==43{
            let paletteCell = Palette(frame: self.view.frame, a: "#f7fcef", b: "#cbecc4", c: "#a6deb4", d: "#78ccc4", e: "#48b3d5", f: "#238bc0", g: "#0066ae", h: "#023e83")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==44{
            let paletteCell = Palette(frame: self.view.frame, a: "#f7d286", b: "#f99d37", c: "#f67b29", d: "#fcc74b", e: "#ef9c2d", f: "#eb7a35", g: "#f25218", h: "#cb561f")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==45{
            let paletteCell = Palette(frame: self.view.frame, a: "#7e1f5b", b: "#2a0c44", c: "#633669", d: "#f6d58a", e: "#fae6bd", f: "#e88d85", g: "#dc437d", h: "#a04e6b")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==46{
            let paletteCell = Palette(frame: self.view.frame, a: "#3075ff", b: "#c7daff", c: "#96b9ff", d: "#f7cbc9", e: "#ffadd2", f: "#b2869a", g: "#542c3c", h: "#35111f")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==47{
            let paletteCell = Palette(frame: self.view.frame, a: "#9dded4", b: "#ffa979", c: "#f48fa1", d: "#d792e1", e: "#f45576", f: "#ffcd6c", g: "#ffe384", h: "#8b95cb")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==48{
            let paletteCell = Palette(frame: self.view.frame, a: "#b31227", b: "#014a89", c: "#f5f3ee", d: "#2372e8", e: "#fe573d", f: "#878da3", g: "#b8c6dd", h: "#dddadd")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==49{
            let paletteCell = Palette(frame: self.view.frame, a: "#f68581", b: "#7dffc0", c: "#0c9674", d: "#d11b5f", e: "#fcad32", f: "#ffffa0", g: "#ffde96", h: "#ffb996")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==50{
            let paletteCell = Palette(frame: self.view.frame, a: "#d4d4d4", b: "#68dbdc", c: "#549ed7", d: "#d1b2e0", e: "#fcb9c5", f: "#adc4aa", g: "#e7faa5", h: "#c3d680")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==51{
            let paletteCell = Palette(frame: self.view.frame, a: "#0480ff", b: "#00fcec", c: "#10a9a9", d: "#01535b", e: "#ffc24e", f: "#ef4102", g: "#0042bd", h: "#022b90")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==52{
            let paletteCell = Palette(frame: self.view.frame, a: "#fff7f3", b: "#fee0dd", c: "#fdc5bf", d: "#fc9eb5", e: "#f965a1", f: "#df2d98", g: "#b0217f", h: "#7b1978")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==53{
            let paletteCell = Palette(frame: self.view.frame, a: "#24ae68", b: "#ecd078", c: "#d95b43", d: "#c02942", e: "#542437", f: "#53777a", g: "#0c5b63", h: "#29b5c3")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==54{
            let paletteCell = Palette(frame: self.view.frame, a: "#d9dfe9", b: "#503373", c: "#f9d946", d: "#fc9f0e", e: "#7085c6", f: "#6675b4", g: "#604fe1", h: "#783cc0")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==55{
            let paletteCell = Palette(frame: self.view.frame, a: "#feb0ff", b: "#cd8ae3", c: "#b725ff", d: "#6b01c9", e: "#f873ee", f: "#e46098", g: "#a80abf", h: "#9d1072")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==56{
            let paletteCell = Palette(frame: self.view.frame, a: "#bd10e0", b: "#4a90e2", c: "#50e3c2", d: "#b8e986", e: "#61f848", f: "#fff200", g: "#ffa900", h: "#ff7000")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==57{
            let paletteCell = Palette(frame: self.view.frame, a: "#f76834", b: "#f05e57", c: "#483620", d: "#363636", e: "#83683b", f: "#a68f59", g: "#84bf17", h: "#b8be1c")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==58{
            let paletteCell = Palette(frame: self.view.frame, a: "#857f81", b: "#90ba6d", c: "#70a8ff", d: "#8c58ad", e: "#fdce41", f: "#fe9458", g: "#eb6050", h: "#f298bb")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==59{
            let paletteCell = Palette(frame: self.view.frame, a: "#f3e3e9", b: "#e92734", c: "#f3a3b3", d: "#e4394a", e: "#ff6f8c", f: "#e65662", g: "#b28450", h: "#d6ac7d")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==60{
            let paletteCell = Palette(frame: self.view.frame, a: "#ffadad", b: "#ff6399", c: "#e26161", d: "#e01e59", e: "#f81c51", f: "#ff0000", g: "#dc003f", h: "#bd2d2d")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==61{
            let paletteCell = Palette(frame: self.view.frame, a: "#26284b", b: "#00545b", c: "#00c481", d: "#a9db5a", e: "#fcc035", f: "#f16a25", g: "#f02540", h: "#a3275f")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==62{
            let paletteCell = Palette(frame: self.view.frame, a: "#e0ffb3", b: "#00bfbf", c: "#31797d", d: "#2a2f36", e: "#fcbd7c", f: "#f09965", g: "#4aba8a", h: "#420e3b")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==63{
            let paletteCell = Palette(frame: self.view.frame, a: "#715031", b: "#feebdd", c: "#f8d7c4", d: "#f5c7a5", e: "#eab186", f: "#e0ac7d", g: "#cb8c56", h: "#845437")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==64{
            let paletteCell = Palette(frame: self.view.frame, a: "#7595bf", b: "#9cbcd9", c: "#d2a97d", d: "#ffaa5c", e: "#da727e", f: "#ac6c82", g: "#685c79", h: "#455c7b")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==65{
            let paletteCell = Palette(frame: self.view.frame, a: "#e8b81a", b: "#ffa200", c: "#db3440", d: "#982395", e: "#0187cb", f: "#28abe3", g: "#25a8ac", h: "#20da9b")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==66{
            let paletteCell = Palette(frame: self.view.frame, a: "#802829", b: "#20b1ff", c: "#78a306", d: "#546f09", e: "#c2ff0a", f: "#6c551d", g: "#fec53a", h: "#fd9f09")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==67{
            let paletteCell = Palette(frame: self.view.frame, a: "#ff4084", b: "#f63327", c: "#f59d21", d: "#ffe100", e: "#27b320", f: "#38c5ea", g: "#2f81de", h: "#712fde")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==68{
            let paletteCell = Palette(frame: self.view.frame, a: "#69d2e7", b: "#a1d7d9", c: "#a8dbdc", d: "#bfe1bf", e: "#e0e4cc", f: "#fdd059", g: "#f48631", h: "#f96900")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==69{
            let paletteCell = Palette(frame: self.view.frame, a: "#c8e18d", b: "#af608e", c: "#d384af", d: "#ffa962", e: "#ffde78", f: "#cec9ba", g: "#7f7f7f", h: "#e3f3be")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==70{
            let paletteCell = Palette(frame: self.view.frame, a: "#e2d893", b: "#a79e65", c: "#73afb7", d: "#609da0", e: "#a68572", f: "#73503c", g: "#591e22", h: "#2c2302")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==71{
            let paletteCell = Palette(frame: self.view.frame, a: "#d79c8c", b: "#ef9950", c: "#f17d80", d: "#747496", e: "#6d8671", f: "#69a8ad", g: "#28bd9b", h: "#92dbdf")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==72{
            let paletteCell = Palette(frame: self.view.frame, a: "#1f312e", b: "#fd9118", c: "#ffae22", d: "#ffc800", e: "#f7e88e", f: "#007966", g: "#009979", h: "#3a4a47")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==73{
            let paletteCell = Palette(frame: self.view.frame, a: "#3c2e28", b: "#785c50", c: "#967264", d: "#b48a78", e: "#d2a18c", f: "#f0b8a0", g: "#ffceb4", h: "#ffe5c8")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==74{
            let paletteCell = Palette(frame: self.view.frame, a: "#bff073", b: "#82aa30", c: "#0dc9f8", d: "#4d6684", e: "#7f7f7f", f: "#3d3d3d", g: "#ef5b47", h: "#e74701")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==75{
            let paletteCell = Palette(frame: self.view.frame, a: "#e46559", b: "#d2ebe6", c: "#7dc4c4", d: "#50a7b4", e: "#59506e", f: "#c6c9a0", g: "#6e5c50", h: "#e48759")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==76{
            let paletteCell = Palette(frame: self.view.frame, a: "#e0c378", b: "#c08220", c: "#8d5100", d: "#553000", e: "#cbeac6", f: "#95ce7d", g: "#3c972f", h: "#006604")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==77{
            let paletteCell = Palette(frame: self.view.frame, a: "#fed59a", b: "#ffbc80", c: "#f16441", d: "#fe8d52", e: "#d6c75b", f: "#9d9d7e", g: "#b50000", h: "#800000")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==78{
            let paletteCell = Palette(frame: self.view.frame, a: "#f1f1f1", b: "#c3cad4", c: "#7cbfd0", d: "#0f7c7f", e: "#b48954", f: "#e80d0b", g: "#980106", h: "#519e02")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
        else if indexPath.row==79{
            let paletteCell = Palette(frame: self.view.frame, a: "#f4ffad", b: "#f8ff54", c: "#ffc000", d: "#fef29b", e: "#fff250", f: "#f8e71c", g: "#ceda47", h: "#daca00")
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
        }
            
        else{
            
            
            
            print(indexPath.row)
            //custom generated wheels
            //for i in 0..<generatedWheels.count
            //{
            
            //if (Int64)(indexPath.row) == generatedWheels[i].number
            //{
            let wheel = generatedWheels[indexPath.row-80]     //i
            let paletteCell = Palette(frame: self.view.frame, a: wheel.col1, b: wheel.col2, c: wheel.col3, d: wheel.col4, e: wheel.col5, f: wheel.col6, g: wheel.col7, h: wheel.col8)
            paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
            paletteCell.backgroundColor = UIColor.clear
            cell.addSubview(paletteCell)
            let editButton = UIButton(frame: CGRect(x: cell.frame.size.width-40, y: 20, width: 40, height: 40))
            editButton.backgroundColor = UIColor.clear
            editButton.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
            editButton.tag = indexPath.row-80        //i
            editButton.addTarget(self, action: #selector(self.editPalette), for: UIControlEvents.touchUpInside)
            editButton.layer.cornerRadius = 20
            cell.addSubview(editButton)
            
            //cell.backgroundColor = UIColor.green
            //}
            
            //}
            
            
            /*let paletteCell = Palette(frame: self.view.frame, a: "#801144", b: "#ff2288", c: "#8d55ad", d: "#59376d", e: "#cf7bff", f: "#188c9f", g: "#12616c", h: "#22e1ff")
             paletteCell.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
             paletteCell.backgroundColor = UIColor.clear
             cell.addSubview(paletteCell)*/
            //palette=xtra
        }
        
        let paletteNo = UILabel(frame: CGRect(x: cell.frame.size.width/2 - 80/2, y: cell.frame.size.height/2 - 80/2, width: 80, height: 80))
        paletteNo.text = "\(indexPath.row+1)"
        paletteNo.textAlignment = .center
        paletteNo.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        paletteNo.font = UIFont(name: "Baskerville-Bold", size: 60)
        cell.addSubview(paletteNo)
        
        let paletteName = UILabel(frame: CGRect(x: cell.frame.size.width/2 - 80/2, y: cell.frame.size.height/2 - 80/2, width: 80, height: 80))
        //------------------Reading Palette Name---------------
        if indexPath.row<=79{
            let text = try! String(contentsOfFile: Bundle.main.path(forResource: "Color_Palette_Name", ofType: "txt")!) // Reading File
            let lineArray = text.components(separatedBy: "\n") // Separating Lines
            paletteName.text = "\(lineArray[indexPath.row])"
            
        }
        else{
            paletteName.text = "\(generatedWheels[indexPath.row-80].name)"
        }
        if (paletteName.text?.characters.count)!<=9{
            paletteName.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        }
        else{
            paletteName.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        }
        paletteName.textColor=UIColor.init(hexString: "#211117")
        paletteName.textAlignment = .center
        cell.addSubview(paletteName)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 225, height: 225)
        
    }
    func editPalette(sender: UIButton!){
        let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "CustomWhellViewController") as! CustomWhellViewController
        //print(generatedWheels[sender.tag].col1)
        secondViewController.customColorArray = [UIColor.init(hexString: generatedWheels[sender.tag].col1)!, UIColor.init(hexString: generatedWheels[sender.tag].col2)!, UIColor.init(hexString: generatedWheels[sender.tag].col3)!, UIColor.init(hexString: generatedWheels[sender.tag].col4)!, UIColor.init(hexString: generatedWheels[sender.tag].col5)!, UIColor.init(hexString: generatedWheels[sender.tag].col6)!, UIColor.init(hexString: generatedWheels[sender.tag].col7)!, UIColor.init(hexString: generatedWheels[sender.tag].col8)!]
        secondViewController.Palettemode = .editMode
        secondViewController.activePalette = 80+Int64(sender.tag)
        self.present(secondViewController, animated: true, completion: nil)
    }
    
}
