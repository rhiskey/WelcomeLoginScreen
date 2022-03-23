#  WelcomeLoginScreen

## Task:

Create an application with two screens.

The first screen LoginViewController should be responsible for user authorization. On the second screen, the WelcomeViewController needs to display its name and logout button.

The username on the second screen must be passed when moving from the authorization screen. To do this, implement the prepare method.

When returning to the first screen, the data in the text fields must be cleared. To do this, use the unwind segway.

Pay attention to the keyboard. When entering a username, you must turn off auto-correction and predictive input. When entering a password, the entered characters must be hidden. Work on hiding the keyboard. You can hide the keyboard by tapping on the screen. To do this, you need to override the touchesBegan method:

```swift
// Hide keyboard on tap
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super .touchesBegan(touches, with: event)
}
```
Also pay attention to the fact that the keyboard does not hide the interface elements.

To show or hide the keyboard in the simulator, use the keyboard shortcut Command + K.

___

## Optional

Work on the keyboard's Return button

The button can be renamed to Next when entering a username, and to Done when entering a password. Program the operation of this button depending on the location of the cursor. When you click on the Next button, move the cursor to the password field. As long as the password field is empty, the Done button should be disabled. The Done button should duplicate the logic of the Log In button.

To work with the Return button, the LoginViewController class must subscribe to the UITextFieldDelegate protocol and implement the corresponding method:

```swift
class LoginViewController: UITextFieldDelegate {
...
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

    }
}
```

Also, the class itself must be assigned as a protocol delegate for text fields:

```swift 
textField.delegate = self
```

This is done in the viewDidLoad method.

A class can also be assigned as a protocol delegate through the storyboard. To do this, the cursor with the Control key pressed must be moved from the text field to the view controller icon:

![Controller icon](https://alfa.swiftbook.ru/system/uploads/ckeditor/pictures/4887/_Users_debash_Library_Mobile_Documents_iCloud_md_obsidian_Documents_Zettelkasten_Images_DraggedImage_5.png)

And select the delegate item from the context menu:

![Context Menu delegate](https://alfa.swiftbook.ru/system/uploads/ckeditor/pictures/4888/_Users_debash_Library_Mobile_Documents_iCloud_md_obsidian_Documents_Zettelkasten_Images_DraggedImage-1_4.png)

In this case, you do not need to assign the class as a delegate in the viewDidLoad method either.
