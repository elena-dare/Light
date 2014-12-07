//
//  View.swift
//  Light
//
//  Created by Elena Da Re on 12/6/14.
//  Copyright (c) 2014 Elena Da Re. All rights reserved.
//

import UIKit;

class View: UIView {
	
	//Called from the loadView method of the ViewController.
	
	init(viewController: ViewController) {
		// Initialization code
		super.init(frame: CGRectZero);
		backgroundColor = UIColor.whiteColor();
		
		let sizeRect = UIScreen.mainScreen().applicationFrame;
		let w = sizeRect.size.width;
		let h = sizeRect.size.height;
		
		
		//create the fisrt button to turn on
		let button: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
		button.bounds.size = CGSizeMake(w/4.5, w/4.5);
		
		//create the second button to turn off
		let buttonSecond: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
		buttonSecond.bounds.size = CGSizeMake(w/4.5, w/4.5);
		
		//Positioning the buttons
		button.center = CGPoint(x: w*0.3, y: h*0.84);
		buttonSecond.center = CGPoint(x: w*0.7, y: h*0.84);
		
		//images for the buttons
		let buttonOn: UIImage? = UIImage(named: "buttonOn.png");
		button.setBackgroundImage(buttonOn, forState: UIControlState.Normal);
		
		let buttonOff: UIImage? = UIImage(named: "buttonOff.png");
		buttonSecond.setBackgroundImage(buttonOff, forState: UIControlState.Normal);
		
		//Keep the button at the center of this View,
		//even if the size of this View changes.
		
		//button.autoresizingMask = UILayoutConstraintAxis(rawValue: Int)
			//UIViewAutoresizing.FlexibleWidth
			//| UIViewAutoresizing.FlexibleHeight
			//| UIViewAutoresizing.FlexibleTopMargin
			//| UIViewAutoresizing.FlexibleBottomMargin;
		
		//set buttons titles
		button.setTitle("Turn on", forState: UIControlState.Normal);
		button.setTitleColor(UIColor.clearColor(), forState: UIControlState.Normal)
		buttonSecond.setTitle("Turn off", forState: UIControlState.Normal);
		buttonSecond.setTitleColor(UIColor.clearColor(), forState: UIControlState.Normal)
		
		//set button targets
		button.addTarget(viewController, action: "touchUpInsideOn:", forControlEvents: UIControlEvents.TouchUpInside);
		buttonSecond.addTarget(viewController, action: "touchUpInsideOff:", forControlEvents: UIControlEvents.TouchUpInside);
		
		//add buttons
		addSubview(button);
		addSubview(buttonSecond);
		
		
		//add button ON label
		let fOn: CGRect = CGRectMake(w*0.3 - button.bounds.size.width/2, h*0.84 + button.bounds.size.height/2, button.bounds.size.width, 30);
		
		let labelOn: UILabel = UILabel(frame: fOn);
		labelOn.backgroundColor = UIColor.clearColor();
		labelOn.font = UIFont(name: "HelveticaNeue-Bold", size: 16);
		labelOn.textColor = UIColor.grayColor();
		labelOn.textAlignment = NSTextAlignment.Center;
		labelOn.text = "Turn On";
		addSubview(labelOn);
		
		//add button OFF labels
		let fOff: CGRect = CGRectMake(w*0.7 - button.bounds.size.width/2, h*0.84 + button.bounds.size.height/2, button.bounds.size.width, 30);
		
		let labelOff: UILabel = UILabel(frame: fOff);
		labelOff.backgroundColor = UIColor.clearColor();
		labelOff.font = UIFont(name: "HelveticaNeue-Bold", size: 16);
		labelOff.textColor = UIColor.grayColor();
		labelOff.textAlignment = NSTextAlignment.Center;
		labelOff.text = "Turn Off";
		addSubview(labelOff);
		
	}
	
	//Never called.
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
	}
	
	/*
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func drawRect(rect: CGRect)
	{
	// Drawing code
	}
	*/
	
}
