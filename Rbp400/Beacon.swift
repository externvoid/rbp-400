//
//  Beacon.swift
//  iBeacon4
//
//  Created by appdeveloper on 2016/06/15.
//  Copyright © 2016年 ad. All rights reserved.
//

import Foundation
import CoreLocation
import CoreBluetooth

class BeaconEmitter: NSObject, CBPeripheralManagerDelegate {
  
  var delegatevc:ViewController!
  var myProximityUUID: NSUUID!
  var myPeripheralManager: CBPeripheralManager!
  var myIdentifier: String!
  var myMajor: CLBeaconMajorValue = 1
  var myMinor: CLBeaconMinorValue = 2
  var myBeaconRegion: CLBeaconRegion!
  var myBeaconPeripheralData: NSDictionary!
  
  static let shard = BeaconEmitter()
  
  override init() {
    super.init()
    myProximityUUID = NSUUID(UUIDString: "AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAA")
    myPeripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    
    myIdentifier = "akabeacon"
    myBeaconRegion = CLBeaconRegion(proximityUUID: myProximityUUID, identifier: myIdentifier)
    
   myBeaconPeripheralData = NSDictionary(dictionary: myBeaconRegion.peripheralDataWithMeasuredPower(nil))
  }
  
  /*
  (Delegate) コントロール・センターでBTがonになれば呼び出される
  */
  func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager) {
    myPeripheralManager.startAdvertising(myBeaconPeripheralData as! [String : AnyObject])
//    self.delegatevc.someMethod()
  }
}