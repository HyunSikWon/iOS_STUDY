//
//  main.swift
//  DispatchQueue
//
//  Created by 원현식 on 2020/09/14.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import Foundation

// Serial vs Concurrent
/*
 
 SerialQueue는 Queue의 작업들이 순차적으로 수행된다.
 ConcurrentQueue는 Queue의 작업들이 동시에 수행된다.
 
*/


// Sync vs Async
/*

 Synchronous는 전달한 작업의 실행 후 종료까지 기다린다.
 Asynchronous는 전달한 작업의 실행 후 종료까지 기다리지 않는다.
 
*/



// Serial
let serialQueue = DispatchQueue(label: "serailQ") // Queue의 작업들이 순차적으로 수행

// Serial - Sync
serialQueue.sync {print("1", terminator: " ")} // 작업 요청 후 기다림
print("A", terminator: " ") // 위의 코드 완료된 후 수행
serialQueue.sync {print("2", terminator: " ")}
print("B", terminator: " ")
serialQueue.sync {print("3", terminator: " ")}
print("C", terminator: " ")
print()
// 언제나 1 A 2 B 3 C

// Serial - Async
serialQueue.async {print("1", terminator: " ")} // 작업 요청 후 다음 코드로
print("A", terminator: " ") // 위의 코드 완료 전에 수행될 수도 있다.
serialQueue.async {print("2", terminator: " ")}
print("B", terminator: " ")
serialQueue.async {print("3", terminator: " ")}
print("C", terminator: " ")
// 큐의 작업들이 요청한 순서대로 진행되기 때문에 A B C, 1 2 3의 순서는 유지되지만 뒤죽박죽. A B C 1 2 3 도 가능



// Concorrent
let concurrentQueue = DispatchQueue(label: "concurrentQ", attributes: .concurrent) // Queue의 작업들이 동시에 수행

// Concurrent - Sync
concurrentQueue.sync {print("1", terminator: " ")}
print("A", terminator: " ")
concurrentQueue.sync {print("2", terminator: " ")}
print("B", terminator: " ")
concurrentQueue.sync {print("3", terminator: " ")}
print("C", terminator: " ")
// 큐의 작업들이 동시에 수행되지만 sync기 때문에 1 A 2 B 3 C 의 순서가 항상 유지된다. 큐의 작업이 끝난 후에 다음 코드로 넘어가기 때문에

// Concurrent - Async
concurrentQueue.async {print("1", terminator: " ")}
print("A", terminator: " ")
concurrentQueue.async {print("2", terminator: " ")}
print("B", terminator: " ")
concurrentQueue.async {print("3", terminator: " ")}
print("C", terminator: " ")



