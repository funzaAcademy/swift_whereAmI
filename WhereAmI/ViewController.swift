
import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    let locMgr = CLLocationManager()
    
    @IBOutlet var myLat: UILabel!
    
    @IBOutlet var myLong: UILabel!
    
    @IBOutlet var myCourse: UILabel!
    
    @IBOutlet var mySpeed: UILabel!
   
    
    @IBOutlet var myAddress: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locMgr.desiredAccuracy = kCLLocationAccuracyBest
        locMgr.requestWhenInUseAuthorization()
        locMgr.startUpdatingLocation()
        locMgr.delegate = self //important

    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
       let myCurrentLoc = locations[locations.count - 1]
        
        myLat.text =  "\(myCurrentLoc.coordinate.latitude)"
        myLong.text =  "\(myCurrentLoc.coordinate.longitude)"
        myCourse.text = "\(myCurrentLoc.course)"
        mySpeed.text = "\(myCurrentLoc.speed)"
        
        //geo coder 
        CLGeocoder().reverseGeocodeLocation(myCurrentLoc) { (myPlacements, myError) -> Void in
            
            if myError != nil
            {
             // handle error
            }
            
            if let myPlacement = myPlacements?.first
            {
             
                let myAddress = " \(myPlacement.locality!) \(myPlacement.country!) \(myPlacement.postalCode!)"
                
                self.myAddress.text  = myAddress
                
            }
        }
        
        
        
    }
    

    
    
}


