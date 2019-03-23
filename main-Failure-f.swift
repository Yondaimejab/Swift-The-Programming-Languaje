class Document {
    var name: String?

    init(){}

    init?(name: String){
        if name.isEmpty {
            return nil
        }

        self.name = name
    }
}

class AutomaticllyNamedDocument : Document {
    override init(){
        super.init()
        self.name = "[Untitled]"
    }

    override init(name: String){
        super.init()
        if name.isEmpty {
            self.name = "[UnTitle]"
        }else {
            self.name = name
        }        
    }
}

class untitledDocument: Document {
    override init(){
        super.init(name: "[UnTitle]")
    }
 }

 