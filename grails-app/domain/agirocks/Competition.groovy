package agirocks

class Competition {

    String name

    static hasMany = [days: Day, teams: Team]

    static constraints = {
        name maxSize: 200, blank: false, nullable: false
    }

    @Override
    String toString() {
        return name
    }
}
