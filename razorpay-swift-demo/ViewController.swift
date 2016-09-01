//
//  ViewController.swift
//  razorpay-swift-demo
//
//  Created by Pradeep Chauhan on 9/1/16.
//  Copyright © 2016 Pradeep Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RazorpayPaymentCompletionProtocol {

    private var razorpay : Razorpay!
    let KEY_ID = "rzp_live_ILgsfZCZoFIKMb"
    // @"rzp_test_1DP5mmOlF5G5ag";
    let SUCCESS_TITLE = "Yay!"
    let SUCCESS_MESSAGE = "Your payment was successful. The payment ID is %@"
    let FAILURE_TITLE = "Uh-Oh!"
    let FAILURE_MESSAGE = "Your payment failed due to an error.\nCode: %d\nDescription: %@"
    let OK_BUTTON_TITLE = "OK"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        razorpay = Razorpay.initWithKey(KEY_ID, andDelegate: self, forViewController: self)
        // Do any additional setup after loading the view, typically from a nib.
        showPaymentForm()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showPaymentForm() {
//        let options = [
//            "amount" : "2000" // and all other options
//        ]
        let logo = UIImage(named: "logo")!
        let options = ["amount": "100", "currency": "INR", "description": "Fine T-shirt", "image": logo, "name": "Razorpay", "prefill": ["email": "contact@razorpay.com", "contact": "18002700323"], "theme": ["color": "#3594E2"]]

        razorpay.open(options)
    }
    
    func onPaymentSuccess(payment_id: String) {
        UIAlertView.init(title: SUCCESS_TITLE, message: SUCCESS_MESSAGE + "\(payment_id)", delegate: self, cancelButtonTitle: "OK")
    }
    
    func onPaymentError(code: Int32, description str: String) {
        UIAlertView.init(title: FAILURE_TITLE, message: FAILURE_MESSAGE + "\(description)", delegate: self, cancelButtonTitle: "OK").show()
    }
}

