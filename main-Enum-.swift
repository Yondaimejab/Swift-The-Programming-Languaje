enum ServerResponse{
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6.00 AM","8:09 pm")
let failure = ServerResponse.failure("out of cheese")

switch success {
    case  let .result(sunrise, sunset):
        print("sunrise is at \(sunrise) and sun set is at \(sunset).")
    case let .failure(message):
        print("failure.. \(failure)")
   
    
}