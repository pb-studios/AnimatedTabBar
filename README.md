# Animated Tab Bar

UI  library for adding animation to iOS tabbar items and icons.

## Usage

1. Create a new UITabBarController in your storyboard or nib.

2. Set the class of the UITabBarController to AnimatedTabBarController in your Storyboard or nib.

3. For each UITabBarItem, set the class to AnimatedTabBarItem.

4. Add a custom image icon for each AnimatedTabBarItem

5. Add animation for each AnimatedTabBarItem :
   * drag and drop an NSObject item into your ViewController
   * set its class to ANIMATION_CLASS (where ANIMATION_CLASS is the class name of the animation you want to use)
   * connect the outlet animation in AnimatedTabBarItem to your ANIMATION_CLASS
   [Demonstration video for step 5](http://vimeo.com/112390386)


## Included Animations

* BounceAnimation

## Creating Custom Animations
1. Create a new class which inherits from ItemAnimation:

  ``` swift
     class NewAnimation : ItemAnimation
  ```
2. Implement the methods in ItemAnimationProtocol:


  ``` swift
    // method call when Tab Bar Item is selected
    override func playAnimation(icon: UIImageView, textLabel: UILabel) {
      // add animation
    }
  ```  
  ``` swift
    // method call when Tab Bar Item is deselected
    override func deselectAnimation(icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
      // add animation
    }
  ```    
  ``` swift
    // method call when TabBarController did load
    override func selectedState(icon: UIImageView, textLabel: UILabel) {
      // set selected state  
    }
  ```

3. Example:

``` swift
import AnimatedTabBarController

class BounceAnimation : ItemAnimation {

    override func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
        playBounceAnimation(icon)
        textLabel.textColor = textSelectedColor
    }

    override func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
        textLabel.textColor = defaultTextColor
    }

    override func selectedState(_ icon: UIImageView, textLabel: UILabel) {
        textLabel.textColor = textSelectedColor
    }

    func playBounceAnimation(_ icon : UIImageView) {

        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic

        icon.layer.add(bounceAnimation, forKey: "bounceAnimation")
    }
}
```

