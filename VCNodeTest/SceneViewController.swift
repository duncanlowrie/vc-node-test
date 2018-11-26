//
//  SceneViewController.swift
//  VCNodeTest
//
//  Created by Duncan Lowrie on 26/11/2018.
//  Copyright © 2018 Duncan Lowrie. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class SceneViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
    }
    
    func setupScene() {
        sceneView.scene = SCNScene()
        sceneView.allowsCameraControl =  true
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
        // add a small plane at the origin...
        let plane = SCNPlane(width: 0.1, height: 0.1)
        let vc = ViewController()
        
        // create a view controller, and add use its view as the plane's material contents...
        vc.view.backgroundColor = UIColor.red
        plane.firstMaterial?.diffuse.contents = vc.view
        
        let node = SCNNode(geometry: plane)
        
        sceneView.scene.rootNode.addChildNode(node)
    }
}
