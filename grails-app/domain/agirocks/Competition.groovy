package agirocks

class Competition {

    String name

    static hasMany = [days: Day, teams: Team]

    static constraints = {
    }
}
