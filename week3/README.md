# 왜 Cocoa MVC 패턴은 View와 Controller를 분리하기 어려운 것인지, 설명해봅시다.
> A view controller is tightly bound to the views it manages and takes part in handling events in its view hierarchy.   
* viewcontroller는 뷰계층의 이벤트를 처리하거나 관리하기 때문에 뷰와 밀접하게 연관되어 있다.

> View controllers are  [UIResponder](https://developer.apple.com/documentation/uikit/uiresponder)  objects and are inserted into the responder chain between the view controller’s root view and that view’s superview.  
* 뷰 컨트롤러는 UIResponder오브젝트와 뷰의 슈퍼뷰와 뷰 컨트롤러의 루트뷰를 연결하는 책임을 가지고 있다.

> View controllers load their views lazily. Accessing the view property for the first time loads or creates the view controller’s views.  
* 뷰컨트롤러는 뷰를 load한다.
* 뷰 프로퍼티를 접근하기 위해서는 뷰컨트롤러의 뷰가 load되거나 만들어져야한다.

* 결론 -> ViewController은 View의 이벤트를 처리하거나 각각의 View를 연결하는 등 View의 많은부분을 관리해주며, ViewController가 View를 불러와줘야 View의 프로퍼티를 사용하는 등 생성에도 관련이 있기 때문에 View와 Controller는 분리하기가 어렵다.

# StoryBoard는 MVC 패턴의 관점에서 View라고 볼 수 있을까요? 자신만의 근거를 들어 생각해봅시다.
> A view object is an object in an application that users can see.  

* 뷰 객체는 유저가 볼 수 있는 앱 내의 객체

> view objects are typically decoupled from model objects in an MVC application. Because you typically reuse and reconfigure them, view objects provide consistency between applications.  

* 재사용성과 재정의를 위해 뷰와 모델을 분리한다.

* 결론 -> StoryBoard는 유저가 볼 수 있고 파일안에 스토리보드라는 큰 객체 안에 여러개가 있을 수 있는 아이폰이라는 객체 또 아이폰 화면 안에 여러가지 유저가 볼 수 있는 객체가 있기 때문에 View라고 볼 수 있다.
* 또한, 기존에 구현된 버튼이나 라벨을 복사?하여 재사용할 수 있기 때문에 View라고 볼 수 있다.

# Notification활용해보기
* 기존 데이터를 활용하여, 데이터가 중복될 경우 기존유저라는 Alert를 출력하고, 신규 데이터 일 경우 신규유저라는 Alert를 출력한다.
```swift
enum Names {
    case New
    case Old
    
    var name: Notification.Name {
        switch self {
        case .New:
            return Notification.Name("신규")
        case .Old:
            return Notification.Name("기존")
        }
    }
}
```
* Notification Name을 두개를 설정하여 하나는 신규유저를 위한 Name, 기존 유저를 위한 Name으로 나눠주었다.

```swift
NotificationCenter.default.addObserver(self, selector: #selector(checkUser(noti:)), name: Names.New.name, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(checkUser(noti:)), name: Names.Old.name, object: nil)
```
* NotificationCenter에 기존유저의 옵저버, 신규유저의 옵저버 두가지를 설정하였다.

```swift
func postObserver(name: Names) {
    NotificationCenter.default.post(name: name.name, object: nil, userInfo: ["userInfo": name.name.rawValue])
}
```
* 신규유저 혹은 기존유저의 Name열거형을 받아 해당 Notification.Name과 userInfo에 Notification.Name의 rawValue를 userInfo로 주었다.

```swift
@objc func checkUser(noti: Notification) {
    guard let userState = noti.userInfo?["userInfo"] as? String else { return }
        
    showAlert(userState)
}
```
* post를 받을 경우 해당 userInfo의 “userInfo” 키값을 받아 그 값으로 Alert를 출력한다.

![](https://raw.githubusercontent.com/Rhode-park/ss8-sat-study-A/leonFather/week3/image/기존유저.png)
![](https://raw.githubusercontent.com/Rhode-park/ss8-sat-study-A/leonFather/week3/image/신규유저.png)

### 참고 사이트
> [Model-View-Controller](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html)  
> [Apple Developer Documentation-UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller)  
> [iOS/Swift Notification Center, Delegate, KVO??](https://velog.io/@leeyoungwoozz/iOSSwift-Notification-Center-KVO)  
