//
//  ContentView.swift
//  SSE-Xcode15
//
//  Created by Tejas Patelia on 2024-06-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello wRold")
        }
        .onAppear {
            initSSE()
        }
    }
    
    private func initSSE() {
        let serverURL = URL(string: "http://127.0.0.1:8080/stream")!

        let eventSource: EventSource = EventSource(url: serverURL, headers: ["Authorization": "Bearer basic-auth-token"])
        
        eventSource.connect()
        
        eventSource.onOpen {
//            self?.status.backgroundColor = UIColor(red: 166/255, green: 226/255, blue: 46/255, alpha: 1)
//            self?.status.text = "CONNECTED"
            print("CONNECTED")
        }
        
        eventSource.onComplete { statusCode, reconnect, error in
//            self?.status.backgroundColor = UIColor(red: 249/255, green: 38/255, blue: 114/255, alpha: 1)
//            self?.status.text = "DISCONNECTED"
//
//            guard reconnect ?? false else { return }
//
            print("DISCONNECTED")
            let retryTime = eventSource.retryTime ?? 3000
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(retryTime)) {
                eventSource.connect()
                eventSource.disconnect()
            }
        }
        
        eventSource.onMessage { id, event, data in
            print(id, event, data)
        }
        eventSource.addEventListener("counter") { id, event, data in
            print(id, event, data)
        }
        
        eventSource.addEventListener("user-connected") { id, event, data in
            print(id, event, data)
        }
    }
}
