Scroll View
---

App Development with Swift 교재 [Lesson 4.4 - Scroll View] 요약 정리 by [(HyunSikWon)](https://github.com/HyunSikWon)

---

### Vocabulary


**bounds**

A view's visible layer should be confined to the bounds or limits of the view

**content inset**

The content inset property specifies a buffer area around the content of the scroll view, so that controllers, toolbars,
or keyboards don't interfere with the user's experience of the content.

**content view**

A content view is a view object at the top of a view hierarchy, serving as a container for the subview below it.

**frame**

A view's frame describes its location as a rectangle a certain distance from the top and certain distance 
from the left of its parent view

---

### UIScrollView

UIScrollView는 두가지 정보를 필요로 한다.

1. scroll view의 위치와 크기.
2. 표시되는 content의 크기.

이 값들은 scroll view의 'frame' property와 contentSize property에 각각 저장되어 있다. 

두 값들은 Auto Layout과 Interface Builder에 의해 관리될 수 있다.

scroll 하기 원하는 모든 view들은 scroll view의 subview여야 한다.

---

### Related Resources

- [UIScrollView Programming Guide](https://developer.apple.com/library/archive/documentation/WindowsViews/Conceptual/UIScrollView_pg/Introduction/Introduction.html)
- [Auto Layout Giude : Working with Scroll Views](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithScrollViews.html)
- [iOS Human interface Guidelines: Scroll Views](https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/)
- [API Reference : UIScrollView](https://developer.apple.com/reference/uikit/uiscrollview)
- [API Reference : UIStackView](https://developer.apple.com/documentation/uikit/uistackview)
- [Technical Note TN2154: UIScrollView and Autolayout](https://developer.apple.com/library/archive/technotes/tn2154/_index.html)












