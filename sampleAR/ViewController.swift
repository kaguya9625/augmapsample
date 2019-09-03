//
//  ViewController.swift
//  sampleAR
//
//  Created by kaguya on 2019/08/22.
//  Copyright © 2019 kaguya. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var ARview: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ARview.session = ARSession()
        ARview.showsStatistics = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        ARview.debugOptions = [.showLightExtents,.showPhysicsFields,.showWorldOrigin,.showCameras,.showBoundingBoxes,.renderAsWireframe]
        let configuration = ARWorldTrackingConfiguration()
        configuration.isLightEstimationEnabled = true
        ARview.session.run(configuration)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ARview.session.pause()
    }
    @IBAction func tap(_ sender: Any) {
        let scene = SCNScene(named:"art.scnassets/star.scn")!
        let node = scene.rootNode.childNode(withName:"star",recursively:true)
        node?.scale = SCNVector3(1,1,1)
        node?.position = SCNVector3(x:0.0,y:0.0,z:-10)
       
        ARview.scene.rootNode.addChildNode(node!)
    }
        
    
}

