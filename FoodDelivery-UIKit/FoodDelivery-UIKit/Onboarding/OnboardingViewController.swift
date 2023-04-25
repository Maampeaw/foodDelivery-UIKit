//
//  OnboardingViewController.swift
//  FoodDelivery-UIKit
//
//  Created by Mark Amoah on 4/25/23.
//

import UIKit
enum OnboardState{
    case begin
    case continueOnboard
    case gotoSignIn
}

class OnboardingViewController: BottomButtonVC {
    
    var onboardState: OnboardState = .begin {
        didSet{
            switch onboardState{
            case .continueOnboard:
                beginOnboarding()
            case .gotoSignIn:
                print("sign in here")
            default:
                print("here I am")
            }
        }
    }
    
    let heroImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let heroTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.text = Strings.onboardingTitle1
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let heroDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = Strings.onboardingDescription1
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubviews(heroImage, heroTitleLabel, heroDescriptionLabel)
        setupConstraints()
        heroImage.image = UIImage(named: self.setDynamicImage(darkMode: "darkHeroImage1", lightMode: "heroImage1"))
    }
    
    func setupConstraints(){
        let views = ["heroImage": heroImage, "heroTitleLabel": heroTitleLabel, "heroDescriptionLabel": heroDescriptionLabel]
        let heroImageConstraints = [heroImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30), heroTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), heroDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)]
        NSLayoutConstraint.activate(
            [heroImageConstraints,
             NSLayoutConstraint.constraints(withVisualFormat: "H:|-[heroImage]-|", metrics: nil, views: views),
             NSLayoutConstraint.constraints(withVisualFormat: "V:[heroImage]-20-[heroTitleLabel]", metrics: nil, views: views),
             NSLayoutConstraint.constraints(withVisualFormat: "V:[heroTitleLabel]-10-[heroDescriptionLabel]", metrics: nil, views: views)].flatMap({$0})
        )
    }
    
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        switch previousTraitCollection?.userInterfaceStyle{
        case .light:
            self.heroImage.image = UIImage(named: "darkHeroImage1")
        case .dark:
            self.heroImage.image = UIImage(named: "heroImage1")
        default:
            break
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        switch traitCollection.userInterfaceStyle{
        case .dark:
            return .lightContent
        case .light:
            return .darkContent
        default:
            return .lightContent
        }
    }
    
    override var buttonTitle: String{
        return "Next"
    }
    
    override var verticalInset: CGFloat{
        return 18
    }
    
    override var horizontalInset: CGFloat{
        return 60
    }
    
    override func buttonAction() {
        self.onboardState = onboardState == .begin ? .continueOnboard : .gotoSignIn
    }
    
    
    

    

}


extension OnboardingViewController{
    func beginOnboarding(){
        UIView.transition(with: self.heroImage, duration: 0.1) {
            self.heroImage.alpha = 0
            self.heroTitleLabel.alpha = 0
            self.heroDescriptionLabel.alpha = 0
        }completion:{completed in
            self.heroImage.image = UIImage(named: self.setDynamicImage(darkMode: "darkHeroImage2", lightMode: "heroImage2"))
            self.heroTitleLabel.text = Strings.onboardingTitle2
            self.heroDescriptionLabel.text = Strings.enjoyFood
            UIView.transition(with: self.heroImage, duration: 0.1) {
                self.heroImage.alpha = 1
                self.heroTitleLabel.alpha = 1
                self.heroDescriptionLabel.alpha = 1
            }
        }
    }
}
