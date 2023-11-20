//
//  ViewController.swift
//  TextViewWithHTMLContent
//
//  Created by ZEUS on 20/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    let htmlText = """
In Dubai, there are plenty of cool things to do. Here are some suggestions for you:<br><br>
    <li class='gad'>1. <b>Burj Khalifa</b>  Visit the world's tallest building and enjoy stunning panoramic views of the city from the observation deck.</li><br>
    <li class='gad'>2. <b>Dubai Mall</b>  Explore one of the largest shopping malls in the world, which also offers a wide range of entertainment options such as an aquarium, ice rink, and indoor theme park.</li><br>
    <li class='gad'>3. <b>Desert Safari</b>  Experience the thrill of dune bashing in a 4x4 vehicle, try sandboarding, and enjoy a traditional Arabian dinner under the stars in the desert.</li><br>
    <li class='gad'>4. <b>Palm Jumeirah</b>  Visit this iconic man-made island and relax at one of the luxurious beach resorts, indulge in water sports, or enjoy a leisurely walk along the Palm's boardwalk.</li><br>
    <li class='gad'>5. <b>Dubai Marina</b>  Take a stroll along the picturesque waterfront promenade, dine at one of the trendy restaurants, or go on a relaxing boat ride to enjoy the stunning skyline views.</li><br>
    <li class='gad'>1. <b>Burj Khalifa</b>  Visit the world's tallest building and enjoy stunning panoramic views of the city from the observation deck.</li><br>
    <li class='gad'>2. <b>Dubai Mall</b>  Explore one of the largest shopping malls in the world, which also offers a wide range of entertainment options such as an aquarium, ice rink, and indoor theme park.</li><br>
    <li class='gad'>3. <b>Desert Safari</b>  Experience the thrill of dune bashing in a 4x4 vehicle, try sandboarding, and enjoy a traditional Arabian dinner under the stars in the desert.</li><br>
    <li class='gad'>4. <b>Palm Jumeirah</b>  Visit this iconic man-made island and relax at one of the luxurious beach resorts, indulge in water sports, or enjoy a leisurely walk along the Palm's boardwalk.</li><br>
    <li class='gad'>5. <b>Dubai Marina</b>  Take a stroll along the picturesque waterfront promenade, dine at one of the trendy restaurants, or go on a relaxing boat ride to enjoy the stunning skyline views.</li>

<br>These are just a few suggestions, and there are many more exciting things to do in Dubai. Enjoy your trip!<br>
"""

    @IBOutlet weak var textVIew: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let attributedString = convertHtmlToAttributedString(htmlText){
            textVIew.attributedText = applyDefaultAttributes(attributedString)
        }
    }
    
    func convertHtmlToAttributedString(_ htmlString: String) -> NSAttributedString? {
        do {
            
            let modifiedHtmlString = "<style>body{font-family: 'AvenirNext-Regular'; font-size: 16px; color: labelColor}</style>" + htmlString
            let data = modifiedHtmlString.data(using: .utf8)
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]

            let attributedString = try NSAttributedString(data: data ?? Data(), options: options, documentAttributes: nil)
            return attributedString
        } catch {
            print("Error converting HTML to NSAttributedString: \(error.localizedDescription)")
            return nil
        }
    }
    
    
    func applyDefaultAttributes(_ attributedString: NSAttributedString) -> NSAttributedString {
            let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
            let fullRange = NSRange(location: 0, length: mutableAttributedString.length)
        
        mutableAttributedString.addAttribute(.foregroundColor, value: UIColor.label, range: fullRange)
        
            return NSAttributedString(attributedString: mutableAttributedString)
    }
}

