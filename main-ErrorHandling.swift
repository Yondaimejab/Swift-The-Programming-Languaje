
enum PrinterError:  Error{
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int,toPrinter printerName: String) throws -> String{
    if printerName == "never has toner" {
        throw PrinterError.noToner
    }else if printerName == "out of paper"{
        throw PrinterError.outOfPaper
    }else if printerName == "on fire" {
        throw PrinterError.onFire
    } 
    return "Job Sent"
}

do{
    
    var answer = try send(job: 1000,toPrinter: "out of paper")
    print(answer)

}catch PrinterError.onFire {
    print("Printer is on fire get out of the building")
}catch PrinterError.outOfPaper {
    print("the printer has no paper, please get some")
}catch {
    print(error)
}


