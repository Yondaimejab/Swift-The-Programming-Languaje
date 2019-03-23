extension Double {
    var absoluteValue :Double {
        get{
            return getAbsoluteValue()
        }
    }

    func getAbsoluteValue() -> Double{
        if(self < 0){
            return -self
        }else{
            return self
        }
    }
}

var number = -10.05
print(number.absoluteValue)