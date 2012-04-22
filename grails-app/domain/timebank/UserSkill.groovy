package timebank

class UserSkill {

    static belongsTo = [user: User, skill: Skill]
//    User user = null
//    Skill skill

    static UserSkill link(user, skill) {
        def m = UserSkill.findByUserAndSkill(user, skill)
        if (!m) {
            m = new UserSkill(user: user, skill: skill)
            user?.addToUserSkills(m)
            skill?.addToSkilledUsers(m)
            m.save()
        }
        return m
    }

    static void unlink(user, skill) {
        def m = UserSkill.findByUserAndSkill(user, skill)
        if (m) {
            user?.removeFromUserSkills(m)
            skill?.removeFromSkilledUsers(m)
            m.delete()
        }
    }

//    static constraints = {
//        unique: true
//    }

}
