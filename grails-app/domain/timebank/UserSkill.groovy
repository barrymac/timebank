package timebank

class UserSkill {

    static belongsTo = [user: User, skill: Skill]

    static UserSkill link(user, skill) {
        def m = UserSkill.findByUserAndSkill(user, skill)
        if (!m) {
            m = new UserSkill(user: user, skill: skill)
            user?.addToOfferedSkills(m)
            skill?.addToSkilledUsers(m)
            m.save()
        }
        return m
    }

    static void unlink(user, skill) {
        def m = UserSkill.findByUserAndSkill(user, skill)
        if (m) {
            user?.removeFromOfferedSkills(m)
            skill?.removeFromSkilledUsers(m)
            m.delete()
        }
    }

    static constraints = {
        unique: true
    }
}
