
import UIKit

class SignInViewController: UIViewController {
    
    let login = "evgeny"
    let password = "qwerty"
    
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
}

// MARK: Credentials
extension SignInViewController {
    private func checkCredentials() -> String {
        var result = "Wrong username or password"
        
        if login == loginField.text && password == passwordField.text {
            result = "Welcome \(login)"
        }
        
        return result
    }
}

// MARK: Navigation
extension SignInViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let buttonTitle = sender as? UIButton else { return }
        let text = buttonTitle.titleLabel?.text ?? "nil"
        
        let message: String
        
        switch text {
        case "Forgot login":
            message = "Your login: \(login)"
        case "Forgot password":
            message = "Your password: \(password)"
        default:
            message = checkCredentials()
        }
        
        let informationVC = segue.destination as! InformationViewController
        informationVC.textOfLabel = message
    }
}

// MARK: Работа с клавиатурой
extension SignInViewController: UITextFieldDelegate {
    
    // Скрываем клавиатуру нажатием на "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Скрытие клавиатуры по тапу за пределами Text View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
}


