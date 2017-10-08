//
//  InputViewController.swift
//  youtube-kadai
//
//  Created by 堀　和人 on 2017/10/08.
//  Copyright © 2017 kazuto.hori. All rights reserved.
//

import UIKit
import RealmSwift
import YouTubePlayer_Swift

class InputViewController: UIViewController {

    @IBOutlet weak var videoView: YouTubePlayerView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentsTextView: UITextView!
    
    let realm = try! Realm()
    
    var task: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        titleTextField.text = task.title
        contentsTextView.text = task.contents
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write{
            self.task.title = self.titleTextField.text!
            self.task.contents = self.contentsTextView.text
            self.realm.add(self.task, update: true)
        }
        
        super.viewWillDisappear(animated)
    }
    
    @IBAction func onBtnPrevious(_ sender: UIButton) {
        videoView.previousVideo()
    }
    
    @IBAction func onBtnPlay(_ sender: UIButton) {
        if sender.isSelected{
            sender.setTitle("Pause", for: UIControlState.selected)
            videoView.pause()
        }else{
            sender.setTitle("Play", for: UIControlState.normal)
            videoView.play()
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func onBtnNext(_ sender: UIButton) {
        videoView.nextVideo()
    }
    
    @IBAction func onBtnLoadVideo(_ sender: UIButton) {
        videoView.playerVars = ["playsinline" : 1 as AnyObject,
                                "showinfo" : 0 as AnyObject,
                                "controls" : 0 as AnyObject
                                ]
    
        videoView.loadVideoID("CQU14VakLtc")
    }
    
    @IBAction func onBtnLoadPlaylist(_ sender: UIButton) {
        
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
