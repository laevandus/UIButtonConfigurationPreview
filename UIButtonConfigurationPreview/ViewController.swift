//
//  ViewController.swift
//  UIButtonConfigurationPreview
//
//  Created by Toomas Vahter on 18.10.2021.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = .systemRed
        configurations(forStyleIndex: 0)
            .map({ UIButton(configuration: $0, primaryAction: nil) })
            .forEach({ stackView.addArrangedSubview($0) })
    }
    
    @IBAction func updateStyle(_ sender: UIStepper) {
        let configurations = configurations(forStyleIndex: Int(sender.value))
        let buttons = stackView.arrangedSubviews.compactMap({ $0 as? UIButton })
        zip(buttons, configurations).forEach { button, configuration in
            button.configuration = configuration
        }
    }
    
    private func configurations(forStyleIndex index: Int) -> [UIButton.Configuration] {
        var configuration1 = UIButton.Configuration.filled()
        configuration1.title = "Filled"
        
        var configuration2 = UIButton.Configuration.tinted()
        configuration2.title = "Tinted"
        
        var configuration3 = UIButton.Configuration.gray()
        configuration3.title = "Gray"
        
        var configuration4 = UIButton.Configuration.plain()
        configuration4.title = "Plain"
        
        var configuration5 = UIButton.Configuration.bordered()
        configuration5.title = "Bordered"
        
        var configuration6 = UIButton.Configuration.borderedProminent()
        configuration6.title = "Bordered Prominent"
        
        var configuration7 = UIButton.Configuration.borderedTinted()
        configuration7.title = "Bordered Tinted"
        
        var configuration8 = UIButton.Configuration.borderless()
        configuration8.title = "Borderless"
        
        let all: [UIButton.Configuration] = [configuration1, configuration2, configuration3, configuration4, configuration5, configuration6, configuration7, configuration8]
            .map({ original in
                var configuration = original
                switch index {
                case 0:
                    break
                case 1:
                    configuration.subtitle = "Subtitle"
                case 2:
                    configuration.image = UIImage(systemName: "pencil")
                case 3:
                    configuration.buttonSize = .large
                case 4:
                    configuration.image = UIImage(systemName: "pencil")
                    configuration.imagePlacement = .trailing
                case 5:
                    configuration.baseBackgroundColor = .systemBlue
                case 6:
                    configuration.buttonSize = .mini
                case 7:
                    configuration.showsActivityIndicator = true
                case 8:
                    configuration.baseBackgroundColor = .systemCyan
                    configuration.buttonSize = .large
                    configuration.cornerStyle = .dynamic
                    configuration.showsActivityIndicator = false
                    configuration.image = UIImage(systemName: "pencil")
                    configuration.imagePlacement = .trailing
                    configuration.imagePadding = 6
                    //updated.title = "Title"
                    configuration.titleAlignment = .leading
                    configuration.titlePadding = 10
                    configuration.subtitle = "Subtitle"
                default:
                    fatalError("Implement")
                }
                return configuration
            })
        
        return all
    }
}
