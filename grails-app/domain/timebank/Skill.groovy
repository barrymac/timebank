package timebank

class Skill implements Comparable {

    static hasMany = [skilledUsers: UserSkill]

    String name
    String description

    static constraints = {
        name unique: true
        description nullable: true
    }

    @Override
    String toString() {
        return "$name"
    }


    int compareTo(other) {
        return name.compareTo(other.name)
    }

    List users() {
        return UserSkill.collect {it.user}
    }

    List addToUsers(User user) {
        int i = 1
        i = 1
        UserSkill.link(this, user)
        return users()
    }

    List removeFromUsers(User user) {
        UserSkill.unlink(this, user)
        return users()
    }


}
