//
//  ReqestViewController.swift
//  Registration of requests
//
//  Created by Master on 21.08.2020.
//  Copyright © 2020 Master. All rights reserved.
//

import UIKit
import AVFoundation
class ReqestViewController: UIViewController,AVAudioPlayerDelegate,AVAudioRecorderDelegate, UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRecords
    }
    @IBOutlet var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        requestTheme.text=textOflabel
        self.requestField.layer.cornerRadius = 8;
        self.requestField.layer.borderColor=UIColor.lightGray.cgColor
        self.requestField.layer.borderWidth=1.5
        recordingSession = AVAudioSession.sharedInstance()
        if let number:Int = UserDefaults.standard.object(forKey: "myNumber") as? Int {
            numberOfRecords = number
        }//if number
        AVAudioSession.sharedInstance().requestRecordPermission{ (hasPermission) in
            if hasPermission
            {
                print ("Accepted")
            }
        }
    }

    
    var recordingSession: AVAudioSession!
    var audioRecorder:AVAudioRecorder!
    var numberOfRecords:Int = 0
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet var playButtonOutlet: UIButton!
    @IBOutlet var recordButtonOutlet: UIButton!
    var textOflabel:String = ""
    @IBOutlet weak var requestTheme: UITextField!
    
    @IBOutlet weak var requestField: UITextView!
        
    @IBAction func backToRequest(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var photoFrame: UIImageView!
    
    @IBAction func recordButtonAction(_ sender: Any) {
        if audioRecorder == nil {
            numberOfRecords += 1
           
            let fileName = getDirectory().appendingPathComponent("\(numberOfRecords).mp3")
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            //start audio recording
            
            do {
                audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
                audioRecorder.delegate=self
                audioRecorder.record()
                recordButtonOutlet.setTitle("Stop", for: .normal)
            }
            catch {
               dispalyAlert(title: "Oops...", message: "Recording failed")
            }//catch
        }//if
        else {
            //stopping current audio record
            audioRecorder.stop()
            audioRecorder=nil
            UserDefaults.standard.set(numberOfRecords, forKey: "myNumber")
            myTableView.reloadData()
            recordButtonOutlet.setTitle("Record", for: .normal)
        }//else
    }
    
    
    @IBAction func playSoundButton(_ sender: Any) {
    }

    
    func getDirectory() -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    func dispalyAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = getDirectory().appendingPathComponent("\(indexPath.row + 1).mp3")
        do{
            audioPlayer = try AVAudioPlayer (contentsOf: path)
            audioPlayer.play()
        }
        catch{
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
