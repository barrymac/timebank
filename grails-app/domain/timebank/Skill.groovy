package timebank

class Skill implements Comparable {

    static hasMany = [skilledUsers: UserSkill]

    User user = null

    String name
    String description

    static constraints = {
        name unique: true
        description nullable: true
        user display: false, nullable: true
    }

    @Override
    String toString() {
        return "$name"
    }

    static searchable = [
            only: ['name', 'description'],
            spellCheck: ['name']
    ]

    List skilledUsers() {
        return UserSkill.collect {it.user}
    }

    List addToSkilledUsers(User user) {
        UserSkill.link(this, user)
        return skilledUsers()
    }

    List removeFromSkilledUsers(User user) {
        UserSkill.unlink(this, user)
        return skilledUsers()
    }

    int compareTo(other) {
        return name.compareTo(other.name)
    }


}
