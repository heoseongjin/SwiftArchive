import Foundation

func isValidEmail(testStr: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

func isValidPassword(testStr: String) -> Bool {
    // 영문, 숫자, 특수문자(~ ! @ # $ % ^ & * - _ ,)를 혼합하여 8~16자
    let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[~!@#$%^&*,_-])[A-Za-z0-9~!@#$%^&*,_-].{8,16}"
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
    return passwordTest.evaluate(with: testStr)
}

func isValidName(testStr: String) -> Bool {
    // 한국어(초성 제외) 2~10자
    let nameRegEx = "[가-힣]{2,10}"
    let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
    return nameTest.evaluate(with: testStr)
}
