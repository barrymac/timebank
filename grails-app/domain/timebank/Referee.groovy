package timebank

class Referee {

    static belongsTo = [user: User]

    static constraints = {
        uid unique: true
    }
}
