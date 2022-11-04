# roboflow-ios-sample

This project shows you how you can get started developing computer vision iOS apps with the [Roboflow SDK](https://blog.roboflow.com/roboflow-ios-sdk/). It uses a model trained to recognize whether a user is wearing a mask or not.. 

To get started, you'll need to have [Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) installed, as well as [Cocoapods](Cocoapods). You can install Cocoapods by running either `sudo gem install cocoapods` (if you have Ruby installed) or `brew install cocoapods` (if you have the [Homebrew](https://brew.sh/)package manager installed)

Clone this [repository](https://github.com/roboflow-ai/roboflow-ios-starter), navigate to `roboflow-ios-starter/Roboflow Starter Project` directory and run `pod install`. This instals the Roboflow SDK in the project, ensuring it's ready for use.


## Running the app on your Device
Because the app requires the use of the camera, it has to be run on a physical device to use its functionality; not the simulator. To do this, first make sure your iPhone or iPad has Developer Mode enabled. Once you’ve done that, your device will appear as an option in Xcode:

## SDK Initialization
This project uses an API key generated specifically for this project, but if you have your own model, you can add your own API key in the `var API_KEY` in `ViewController.swift`

The SDK gets initialized in these two lines at the top of the View Controller: 

```
let rf = RoboflowMobile(apiKey: API_KEY)
var roboflowModel: RFObjectDetectionModel!
```  

## Setup Camera Session
In order to perform computer vision inference on the iPhone, we have to initialize a camera session. 

After ensuring that we have permission from the user to access the camera in `checkCameraAuthorization()`, we create our camera session in `setupAVCapture`.

This example uses the front-facing camera so we can detect the masks on a user, but you can easily switch it to using the world-facing camera for your task, too. 

There’s quite a lot of code involved in setting up a camera session that’s beyond the scope of this document, but it’s worth reading this guide by Apple for more information on the topic. 



## Processing Inferences 
Whenever a new frame comes in from the camera, we pass it to the Roboflow SDK for inference. 

Whenever a new camera frame is received from the hardware, 

```
 func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
```

gets called. The frame is then passed to the Roboflow SDK, and inferences returned:


## Displaying Bounding Boxes 
Showing bounding boxes around the objects that have been detected by your ML model can be useful in showing your user context-relevant information. 

When an inference is made by the Roboflow SDK, it returns the information that’s needed to display a bounding box. This is done in this example in the `drawBoundingBoxesFrom(detections: [RFObjectDetectionPrediction])` function. The information for where to display the bounding box, and the confidence level of the inference, is extracted here and displayed to the user. 


## Uploading an Image to Your Model’s Dataset 
If you want to add additional images to your dataset so that you can improve it with later training, you can do that through the SDK. This will allow you to improve your model through getting new data from the real world when users are using your app.  

When the "Upload Incorrect Image" button is pressed, the current camera frame is converted to a `UIImage, and uploaded to your dataset. 

    func upload(image: UIImage) {
        let project = "mask-wearing"
        
        rf.uploadImage(image: image, project: project) { result in
        ...
        }
    }
 
