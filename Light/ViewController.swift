//
//  ViewController.swift
//  Light
//
//  Created by Elena Da Re on 12/6/14.
//  Copyright (c) 2014 Elena Da Re. All rights reserved.
//

import UIKit;
import AudioToolbox;


class ViewController: UIViewController {
	var sid: SystemSoundID = 0;

	
	//create the view containers
	let container: UIView = UIView();
	let viewImageOff = UIImageView();
	let viewImageOn = UIImageView();
	
	//create the images
	let imageLightOff: UIImage? = UIImage(named: "imageLightOff.png");
	let imageLightOn: UIImage? = UIImage (named: "imageLightOn.png");
	
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
		
		//Find the full pathname of the sound file .wav
		let bundle: NSBundle = NSBundle.mainBundle();
		let path: String? = bundle.pathForResource("lightSwitch", ofType: "wav");
		if path == nil {
			println("could not find file lightSwitch.wav");
			return;
		}
		println("path = \(path!)\n");
		
		//Create a URL that refers to the sound file.
		let url: NSURL? = NSURL(fileURLWithPath: path!, isDirectory: false);
		if url == nil {
			println("could not create url");
			return;
		}
		println("url = \(url!)\n");
		
		//Open the sound file.
		let status: OSStatus = AudioServicesCreateSystemSoundID(url!, &sid);
		if status != OSStatus(kAudioServicesNoError) {
			println("could not create system sound ID, status = \(status)");
			return;
		}
		println("sid = \(sid)\n");
		
	}
	
	//Implant a reference to my own self (i.e., the ViewController)
	//into the newborn View.
	
	override func loadView() {
		view = View(viewController: self);
		
		//screen size
		let sizeRect = UIScreen.mainScreen().applicationFrame;
		let w = sizeRect.size.width;
		
		// set container frame and add to the screen
		container.frame = CGRect(x: 0, y: 0, width: w, height: w*1.3)
		view.addSubview(container)
		
		viewImageOff.frame = CGRectMake(0, 0, w, w*1.3);
		viewImageOn.frame = CGRectMake(0, 0, w, w*1.3);
		
		// LIGHT OFF: set view with image
		viewImageOff.image = imageLightOff;
		self.view.addSubview(viewImageOff);
		

		// LIGHT ON: set view with image, but no adding yet
		viewImageOn.image = imageLightOn;
		
		
		// add the light off as default
		container.addSubview(viewImageOff)
		
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad();
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	//button ON
	func touchUpInsideOn(button: UIButton!) {
		var title: String? = button.titleForState(UIControlState.Normal);
		if title == nil {
			title = "untitled";
		}
		println("touchUpInsideOn title = \(title!)");
		
		viewImageOff.removeFromSuperview();
		
		container.addSubview(viewImageOn);
		
		//play the .wav file
		AudioServicesPlaySystemSound(sid);
	}
	
	//button OFF
	func touchUpInsideOff(button: UIButton!) {
		var title: String? = button.titleForState(UIControlState.Normal);
		if title == nil {
			title = "untitled";
		}
		println("thouchUpInsideOff title = \(title!)");
		
		viewImageOn.removeFromSuperview();
		
		container.addSubview(viewImageOff);
		
		//play the .wav file
		AudioServicesPlaySystemSound(sid);
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}



