import UIKit
import Lottie

class SplashViewController: UIViewController {

    private let animationView = LottieAnimationView(name: "splash_animation")
    private let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAnimation()
        setupLabel()
        playAnimation()
    }

    private func setupAnimation() {
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            animationView.widthAnchor.constraint(equalToConstant: 200),
            animationView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    private func setupLabel() {
        titleLabel.text = "Welcome to Sports App"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func playAnimation() {
        animationView.play { [weak self] _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self?.goToNextScreen()
            }
        }
    }

    private func goToNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: "HideOnBoarding")
        let nextVC: UIViewController

        if hasSeenOnboarding {
            nextVC = storyboard.instantiateViewController(withIdentifier: "tab")
        } else {
            nextVC = storyboard.instantiateViewController(withIdentifier: "OnboardingPageViewController") as! UIPageViewController
        }

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = UINavigationController(rootViewController: nextVC)
            window.makeKeyAndVisible()
        }
    }
}
