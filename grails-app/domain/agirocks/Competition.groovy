package agirocks

class Competition {

    String name

    static hasMany = [days: Day, teams: Team, registrations: Registration]

    static constraints = {
        name maxSize: 200, blank: false, nullable: false
    }

    static mapping = {
        days sort: 'date', order: "asc"
    }

    @Override
    String toString() {
        return name
    }
}
