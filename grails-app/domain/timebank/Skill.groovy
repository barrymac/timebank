package timebank

class Skill {

    String name
    String description

    static constraints = {
        name unique: true
        description nullable: true
    }
}
