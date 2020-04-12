## Working with the web

App Development with Swift 교재 [Lesson 5 - Working with the web] 요약 정리. [(HyunSikWon)](https://github.com/HyunSikWon)

---

URLSession은 network 요청을 관리하고, 요청이 끝나면 코드를 수행할 수 있도록 하는 instance이다.

~~~swift

dataTask(with: URL, completionHandler @escaping (Data?, URLResponse? ,Error?) -> Void)

~~~

Data? 는 response의 body이거나 서버로부터 요청해서 받은 data를 나타낸다.
URLResponse?는 response자체에 대한 정보를 나타낸다.
Error?는 network request 중 일어난 모든 에러를 나타낸다.

~~~swift
PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://www.apple.com")!
let task = URLSession.shared.dataTask(with: url) { (data, response, error) int 

  if let data = data {
    print(data)
  }

 PlaygroundPage.current.finishExecution()

} 

task.resume()
~~~

---
request를 생성해서 보내기 위해서 resume() 메소드를 사용한다.

playgrounds는 비동기 코드를 지원하지 않는다. 즉 코드를 single queue에서 수행되도록(위에서 아래로) 디자인 되어있다.

playground에서 network request를 처리하기 위해서는 다음과 같은 작업을 해야한다.
1. import PlaygroundSupport
2. PlaygroundPage.current.needsIndefiniteExecution = true
3. PlaygroundPage.current.finishExecution()

---

  






